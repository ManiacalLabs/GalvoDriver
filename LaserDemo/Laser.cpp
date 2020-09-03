// See LICENSE file for details
// Copyright 2016 Florian Link (at) gmx.de
#include "Laser.h"
#include "MCP48xx.h"

// these values can be adapted to fine tune sendto:

MCP4822 dac(10);

Laser::Laser(int laserPin)
{
  _last_scan = 0;
  
  _laserPin = laserPin;
  _quality = FROM_FLOAT(1./(LASER_QUALITY));

  _x = 0;
  _y = 0;
  _oldX = 0;
  _oldY = 0;

  _state = 0;
  
  _scale = 1;
  _offsetX = 0;
  _offsetY = 0;

  resetClipArea();

  setOptions(SCANNER_KPPS, LASER_TOGGLE_DELAY, LASER_QUALITY);

}

void Laser::init()
{
  dac.init();
  dac.turnOnChannelA();
  dac.turnOnChannelB();

  dac.setGainA(MCP4822::High);
  dac.setGainB(MCP4822::High);

  pinMode(_laserPin, OUTPUT);
}

void Laser::sendToDAC(int x, int y)
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

  scanner_throttle();
  
  dac.setValueA(x1);
  dac.setValueB(y1);
  dac.updateDAC();  
}

void Laser::resetClipArea()
{
  _clipXMin = 0;
  _clipYMin = 0;
  _clipXMax = 4095;
  _clipYMax = 4095;
}

void Laser::setClipArea(long x, long y, long x1, long y1)
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

int Laser::computeOutCode(long x, long y)
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
bool Laser::clipLine(long& x0, long& y0, long& x1, long& y1)
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

void Laser::sendto (long xpos, long ypos)
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

void Laser::sendtoRaw (long xNew, long yNew)
{
  long fdiffx = xNew - _x;
  long fdiffy = yNew - _y;
  if(fdiffx >= fdiffy)
  {
    
  }
  else
  {
    
  }
  
}

void Laser::sendtoRaw (long xNew, long yNew)
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

void Laser::drawline(long x1, long y1, long x2, long y2)
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

void Laser::on()
{
  if (!_state) 
  {
    _state = 1;
    ttlQueue[ttlNow] = 1;
  }
}

void Laser::off()
{
  if (_state) 
  {
    _state = 0;
    ttlQueue[ttlNow] = 0;
  }
}

void Laser::scanner_throttle() {

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

void Laser::setOptions(int kpps, int ltd, int lq) {

  if ( kpps ) { SCANNER_KPPS = kpps; }
  if ( ltd )  { LASER_TOGGLE_DELAY = ltd; }
  if ( lq )   { LASER_QUALITY = lq; }

  ttlCourse = ceil(LASER_TOGGLE_DELAY * SCANNER_KPPS / 1000.0);
  ttlFine   = LASER_TOGGLE_DELAY - (ttlCourse - 1) * 1000.0 / SCANNER_KPPS;

  _quality = FROM_FLOAT(1./(LASER_QUALITY));

}

void Laser::wait(long length)
{
  delayMicroseconds(length);
}

void Laser::setScale(float scale)
{ 
  _scale = FROM_FLOAT(scale);
}

void Laser::setOffset(long offsetX, long offsetY)
{ 
  _offsetX = offsetX;
  _offsetY = offsetY;
}
