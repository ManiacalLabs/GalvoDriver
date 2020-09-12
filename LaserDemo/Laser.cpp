// See LICENSE file for details
// Copyright 2016 Florian Link (at) gmx.de
#include "Laser.h"
#include "MCP48xx.h"
#include "TimerThree.h"

LaserGalvo Laser; // static instance

static void move()
{
  if(Laser.move_next() && Laser.do_swap)
  {
    Laser.swap_buffers();
  }
}

MCP4822 dac(10);

LaserGalvo::LaserGalvo()
{
  _last_scan = 0;
  _quality = FROM_FLOAT(1./(LASER_QUALITY));

  _x = 0;
  _y = 0;
  _oldX = 0;
  _oldY = 0;

  _state = 0;
  
  _scale = 1;
  _offsetX = 0;
  _offsetY = 0;
  
  memset(block_buffers[0], 0, PLAN_BUFFER_SIZE * sizeof(plan_block_t));
  memset(block_buffers[1], 0, PLAN_BUFFER_SIZE * sizeof(plan_block_t));

  resetClipArea();

  setOptions(SCANNER_KPPS, LASER_TOGGLE_DELAY, LASER_QUALITY);

}

void LaserGalvo::init(int laserPin)
{
  _laserPin = laserPin;
  do_swap = false;
  dac.init();
  dac.turnOnChannelA();
  dac.turnOnChannelB();

  dac.setGainA(MCP4822::High);
  dac.setGainB(MCP4822::High);

  pinMode(_laserPin, OUTPUT);
  
  Timer3.initialize(1000); // 50uS = 20khz
  Timer3.attachInterrupt(move);
}

void LaserGalvo::sendToDAC(int x, int y)
{
  #ifdef LASER_SWAP_XY
  int x1 = y;
  int y1 = x;
  #else
  int x1 = x;
  int y1 = y;
  #endif
  #ifdef LASER_FLIP_X
  x1 = 4095 - x1;
  #endif
  #ifdef LASER_FLIP_Y
  y1 = 4095 - y1;
  #endif
  
  dac.setValueA(x1);
  dac.setValueB(y1);
  dac.updateDAC();  
}

void LaserGalvo::resetClipArea()
{
  _clipXMin = 0;
  _clipYMin = 0;
  _clipXMax = 4095;
  _clipYMax = 4095;
}

void LaserGalvo::setClipArea(long x, long y, long x1, long y1)
{
  _clipXMin = x;
  _clipYMin = y;
  _clipXMax = x1;
  _clipYMax = y1;
}

const int INSIDE = 0; // 0000
const int LEFT = 1;   // 0001
const int RIGHT = 2;  // 0010
const int BOTTOM = 4; // 0100
const int TOP = 8;    // 1000

int LaserGalvo::computeOutCode(long x, long y)
{
  int code = INSIDE;          // initialised as being inside of [[clip window]]

  if (x < _clipXMin)           // to the left of clip window
    code |= LEFT;
  else if (x > _clipXMax)      // to the right of clip window
    code |= RIGHT;
  if (y < _clipYMin)           // below the clip window
    code |= BOTTOM;
  else if (y > _clipYMax)      // above the clip window
    code |= TOP;

  return code;
}

// Cohen–Sutherland clipping algorithm clips a line from
// P0 = (x0, y0) to P1 = (x1, y1) against a rectangle with 
// diagonal from (_clipXMin, _clipYMin) to (_clipXMax, _clipYMax).
bool LaserGalvo::clipLine(long& x0, long& y0, long& x1, long& y1)
{
  // compute outcodes for P0, P1, and whatever point lies outside the clip rectangle
  int outcode0 = computeOutCode(x0, y0);
  int outcode1 = computeOutCode(x1, y1);
  bool accept = false;
  
  while (true) {
    if (!(outcode0 | outcode1)) { // Bitwise OR is 0. Trivially accept and get out of loop
      accept = true;
      break;
    } else if (outcode0 & outcode1) { // Bitwise AND is not 0. Trivially reject and get out of loop
      break;
    } else {
      // failed both tests, so calculate the line segment to clip
      // from an outside point to an intersection with clip edge
      long x, y;

      // At least one endpoint is outside the clip rectangle; pick it.
      int outcodeOut = outcode0 ? outcode0 : outcode1;

      // Now find the intersection point;
      // use formulas y = y0 + slope * (x - x0), x = x0 + (1 / slope) * (y - y0)
      if (outcodeOut & TOP) {           // point is above the clip rectangle
        x = x0 + (x1 - x0) * float(_clipYMax - y0) / float(y1 - y0);
        y = _clipYMax;
      } else if (outcodeOut & BOTTOM) { // point is below the clip rectangle
        x = x0 + (x1 - x0) * float(_clipYMin - y0) / float(y1 - y0);
        y = _clipYMin;
      } else if (outcodeOut & RIGHT) {  // point is to the right of clip rectangle
        y = y0 + (y1 - y0) * float(_clipXMax - x0) / float(x1 - x0);
        x = _clipXMax;
      } else if (outcodeOut & LEFT) {   // point is to the left of clip rectangle
        y = y0 + (y1 - y0) * float(_clipXMin - x0) / float(x1 - x0);
        x = _clipXMin;
      }

      // Now we move outside point to intersection point to clip
      // and get ready for next pass.
      if (outcodeOut == outcode0) {
        x0 = x;
        y0 = y;
        outcode0 = computeOutCode(x0, y0);
      } else {
        x1 = x;
        y1 = y;
        outcode1 = computeOutCode(x1, y1);
      }
    }
  }
  return accept;
}

void LaserGalvo::sendto (long xpos, long ypos)
{
  // Float was too slow on Arduino, so I used
  // fixed point precision here:
  long xNew = TO_INT(xpos * _scale) + _offsetX;
  long yNew = TO_INT(ypos * _scale) + _offsetY;
  long clipX = xNew;
  long clipY = yNew;
  long oldX = _oldX;
  long oldY = _oldY;
  if (clipLine(oldX,oldY, clipX,clipY)) {
    if (oldX != _oldX || oldY != _oldY) {
      sendtoRaw(oldX, oldY);
    }
    sendtoRaw(clipX, clipY);
  }
  _oldX = xNew;
  _oldY = yNew;
}


void LaserGalvo::sendtoRaw (long xNew, long yNew)
{
  // divide into equal parts, using _quality
  long fdiffx = xNew - _x;
  long fdiffy = yNew - _y;
  long diffx = TO_INT(abs(fdiffx) * _quality); 
  long diffy = TO_INT(abs(fdiffy) * _quality);

  // use the bigger direction
  if (diffx < diffy) 
  {
    diffx = diffy;     
  }

  if (diffx == 0 ) {
    fdiffx = 0;
    fdiffy = 0;
  } else {
    fdiffx = FROM_INT(fdiffx) / diffx;
    fdiffy = FROM_INT(fdiffy) / diffx;
  }
  // interpolate in FIXPT
  FIXPT tmpx = 0;
  FIXPT tmpy = 0;
  for (int i = 0; i<diffx-1;i++) 
  {
    tmpx += fdiffx;
    tmpy += fdiffy;
    sendToDAC(_x + TO_INT(tmpx), _y + TO_INT(tmpy));
    #ifdef LASER_MOVE_DELAY
    wait(LASER_MOVE_DELAY);
    #endif
  }

  _x = xNew;
  _y = yNew;
  sendToDAC(_x, _y);
  #ifdef LASER_MOVE_DELAY
  wait(LASER_MOVE_DELAY);
  #endif
}

void LaserGalvo::drawline(long x1, long y1, long x2, long y2)
{
  if (_x != x1 or _y != y1) 
  {
    off();
    sendto(x1,y1);
  }
  on();
  sendto(x2,y2);
  wait(LASER_LINE_END_DELAY);
}

void LaserGalvo::on()
{
  digitalWrite(_laserPin, HIGH);
}

void LaserGalvo::off()
{
  digitalWrite(_laserPin, LOW);
}

void LaserGalvo::scanner_throttle() {

  int ttlAction;
  int ttlThen;

  ttlThen = (ttlNow 
            - ttlCourse
            + 16) & 0xf;

  ttlAction = ttlQueue[ttlThen];

  if (ttlAction >= 0) {
      delayMicroseconds(ttlFine);
      digitalWrite(_laserPin, ttlAction);
      ttlAction = -1;
      yield();
    } 
  
  while (_last_scan + (1000/SCANNER_KPPS) > micros() );

  ttlNow = ++ttlNow & 0xf;
  ttlQueue[ttlNow] = -1;
  
  _last_scan = micros();

}

void LaserGalvo::setOptions(int kpps, int ltd, int lq) {

  if ( kpps ) { SCANNER_KPPS = kpps; }
  if ( ltd )  { LASER_TOGGLE_DELAY = ltd; }
  if ( lq )   { LASER_QUALITY = lq; }

  ttlCourse = ceil(LASER_TOGGLE_DELAY * SCANNER_KPPS / 1000.0);
  ttlFine   = LASER_TOGGLE_DELAY - (ttlCourse - 1) * 1000.0 / SCANNER_KPPS;

  _quality = FROM_FLOAT(1./(LASER_QUALITY));

}

void LaserGalvo::wait(long length)
{
  delayMicroseconds(length);
}

void LaserGalvo::setScale(float scale)
{ 
  _scale = FROM_FLOAT(scale);
}

void LaserGalvo::setOffset(long offsetX, long offsetY)
{ 
  _offsetX = offsetX;
  _offsetY = offsetY;
}

// void LaserGalvo::get_buffer_lock()
// {
//   while(buffer_lock){delay(0);} // delay(0) so interrupts can still happen
//   buffer_lock = true;
// }

// void LaserGalvo::release_buffer_lock()
// {
//   buffer_lock = false;
// }

void LaserGalvo::set_block(long index, uint16_t x, uint16_t y, uint8_t r, uint8_t g, uint8_t b)
{
  if(index >= PLAN_BUFFER_SIZE-1) return;

  // Serial.print("sb: ");
  // Serial.print(index, DEC);
  // Serial.print(", ");
  // Serial.print(x, DEC);
  // Serial.print(", ");
  // Serial.print(y, DEC);
  // Serial.print(", ");
  // Serial.println(r, DEC);
  
  plan_block_t * block = &block_buffers[plan_buffer][index];
  block->x = x;
  block->y = y;
  block->r = r;
  #ifdef LASER_RGB
  block->g = g;
  block->b = b;
  #endif
}

bool LaserGalvo::add_point(uint16_t x, uint16_t y, uint8_t r, uint8_t g, uint8_t b)
{
  static long tail;
  // get_buffer_lock();
  
  tail = buffer_tail[plan_buffer];
  if(tail >= PLAN_BUFFER_SIZE-1)
  {
    // release_buffer_lock();
    return false; // reached max size, bail out
  }
  tail++;
  set_block(tail, x, y, r, g, b);
  
  buffer_tail[plan_buffer] = tail;
  
  // release_buffer_lock();
}

void LaserGalvo::swap_buffers()
{
  // get_buffer_lock();
  if(play_buffer == 0){ play_buffer = 1; plan_buffer = 0; }
  else{ play_buffer = 0; plan_buffer = 1; }
  play_index = 0;
  buffer_tail[plan_buffer] = -1;
  do_swap = false;
  // release_buffer_lock();
}

bool LaserGalvo::move_next()
{
  static bool res;

  // get_buffer_lock();
  plan_block_t * block = &block_buffers[play_buffer][play_index];
  // release_buffer_lock();
  
  // Serial.print("mn: ");
  // Serial.print(play_index, DEC);
  // Serial.print(", ");
  // Serial.print(block->x, DEC);
  // Serial.print(", ");
  // Serial.print(block->y, DEC);
  // Serial.print(", ");
  // Serial.println(block->r, DEC);

  //TODO: Support PWM output
  if(block->r > 0) on();
  else off();
  
  #ifdef LASER_RGB
  // TODO g & b support
  #endif
  
  sendToDAC(block->x, block->y);
  
  play_index++;
  res = false;
  if(play_index > buffer_tail[play_buffer])
  {
    play_index = 0; //loop back around
    res = true;
  }
  
  return res;
}