// See LICENSE file for details
// Copyright 2016 Florian Link (at) gmx.de
#ifndef LASER_H
#define LASER_H

#include "Arduino.h"

/****************************** 2 Single DACs ***************************/
#include <SPI.h>

typedef long FIXPT;
#define PRES             16384
#define PSHIFT           14
#define PROUNDBIT        (1 << (PSHIFT-1))
#define FROM_FLOAT(a) (long(a*PRES))
#define FROM_INT(a) (a << PSHIFT)
#define TO_INT(a) ((a + PROUNDBIT)>> PSHIFT)

#define MAX_DIST 100
#define MIN_DIST 10

#define PLAN_BUFFER_SIZE 2048

// 7 bytes per block
typedef struct {
  uint16_t x;
  uint16_t y;
  uint8_t r;
#ifdef LASER_RGB
  uint8_t g;
  uint8_t b;
#endif
} plan_block_t;


/************************************************************************/


// -- The following flags can be used to fine tune the laser timing

// quality 25, kpps 30, toggle 300 gives 12K horse, 10k barney, 16k budda, but lose some fine detail
// quality 50, kpps 15, toggle 300       10k         9k         10k        good fine detail
// quality 100      15         300       12k        11k         12k
//         100      20         300       15k        14k         15k
// defines the granularity of the line interpolation. 64 means that each line is split into steps of 64 pixels in the longer direction.
// setting smaller values will slow down the rendering but will cause more linearity in the galvo movement,
// setting bigger values will cause faster rendering, but lines will not be straight anymore.

//#define LASER_QUALITY 4096
//extern int SCANNER_KPPS;
//extern int LASER_TOGGLE_DELAY;

// Defines how long the galvos wait for the on/off toggling of the laser pointer (in microseconds), this will depend on your laser pointer.
// ...wait for the galvos to finish executing last move, before toggling laser.
// ...so it's galvos movement time, plus laser on/off time
// ...50 usec should be enough for galvo to move at 20KPPS
// ...if time is too long, will see bright dots at ends of segments
//#define LASER_TOGGLE_DELAY 500
//#define LASER_TOGGLE_DELAY 200
// Defines how long the galvos wait at the end of a line (currently only used for the 3D cube rendering, in microseconds).
//#define LASER_LINE_END_DELAY 200
#define LASER_LINE_END_DELAY 1
// Defines the delay the laser waits after reaching a given position (in microseconds).
#define LASER_END_DELAY 1
// Defines the delay after each laser movement (used when interpolating lines, in microseconds), if not defines, 0 is used
#define LASER_MOVE_DELAY 100

// -- The following flags can be used to rotate/flip the output without changing the DAC wiring, just uncomment the desired swap/flip
// define this to swap X and Y on the DAC
//#define LASER_SWAP_XY
// define this to flip along the x axis
// #define LASER_FLIP_X
// define this to flip along the y axis
#define LASER_FLIP_Y

//! Encapsulates the laser movement and on/off state.
class Laser
{
public:
  //! The laser is initialized with the laserPin,
  //! which selects the digital pin that turns the laser pointer on/off.
  Laser(int laserPin);

  
  void init();

  //! send the laser to the given position, scaled and translated and line clipped.
  void sendto(long x, long y);
  //! sends the laser to the raw position (the movement is always linearly interpolated depending on the quality,
  //! to avoid too fast movements.
  void sendtoRaw(long x, long y);

  //! draws a line by turning the laser off, going to x1,y1, turning it on and going to x2,y2.
  void drawline(long x1, long y1, long x2, long y2);

  void wait(long length);

  void on();
  void off();
  
  void setScale(float scale);
  void setOffset(long offsetX, long offsetY);
  
  void resetClipArea(); 
  void setClipArea(long x, long y, long x1, long y1);

  void setOptions(int kpps, int ltd, int lq);
  void getOptions(int &kpps, int &ltd, int &lq) { kpps = SCANNER_KPPS; ltd = LASER_TOGGLE_DELAY; lq = LASER_QUALITY; }
  
  //! send X/Y to DAC
  void sendToDAC(int x, int y);
  
  void push_plan_block(plan_block_t block)
  {
    if(plan_tail >= PLAN_BUFFER_SIZE) plan_tail = 0;
    else plan_tail++;
    plan_buffer[plan_tail] = block;
    plan_empty = false;
  }
  
  plan_block_t get_plan_block()
  {
    if(plan_empty) return NULL;
    return plan_buffer[plan_head];
    if(plan_head >= PLAN_BUFFER_SIZE) plan_head = 0;
    else plan_head++;
    plan_empty = (plan_head == plan_tail)
  }

private:

  // plan ring buffer
  plan_block_t plan_buffer[PLAN_BUFFER_SIZE];
  uint16_t plan_head = 0;
  uint16_t plan_tail = 0;
  bool plan_empty;

  int ttlNow = 0;
  int ttlThen = 0;
  int ttlQueue[16];

  int ttlCourse;
  int ttlFine;

  int SCANNER_KPPS = 20;
  int LASER_TOGGLE_DELAY = 120;
  int LASER_QUALITY = 400;

  //! computes the out code for line clipping
  int computeOutCode(long x, long y);
  //! returns if the line should be drawn, clips line to clip area
  bool clipLine(long& x0, long& y0, long& x1, long& y1);

  void scanner_throttle();
  unsigned long _last_scan;

  int _laserPin;

  FIXPT _quality;

  long _x;
  long _y;
  int  _state;

  FIXPT _scale;
  long _offsetX;
  long _offsetY;
  
  long _oldX;
  long _oldY;

  long _clipXMin;
  long _clipYMin;
  long _clipXMax;
  long _clipYMax;
};

#endif
