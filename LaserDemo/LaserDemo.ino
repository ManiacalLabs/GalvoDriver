// heavily based on https://github.com/obstruse/LaserDemo
const uint32_t* objectAddress[20];
const char* objectName[20];
int objectSize[20];
int objectCount = 0;
int objectIndex = 1;

void (*genAddress[10])(int);
const char* genName[10];
int genCount = 0;
int genIndex = 1;

// #include "wifi.h"

// #include "Drawing.h"
#include "Laser.h"

#include <TimeLib.h>

int objectNumber = 0;
int objectStart = 0;
int objectTime = 0;
int objectCalls = 0;


// objects
// #include "p_horse10.h"
// #include "p_barney10.h"
// #include "p_ilda12k.h"
// #include "p_gear1.h"
// #include "p_gear2.h"
// #include "p_spiral1.h"
// #include "p_spiral1a.h"
// #include "p_spiral2.h"
// #include "p_spiral2a.h"
// #include "p_spiral3.h"
// #include "p_obama.h"
// #include "p_test.h"


//--------------------------------------------
// void genAlphabet(int init) {
//   if (init) {
//     genCount++;
//     genAddress[genCount] = genAlphabet;
//     genName[genCount] = "Alphabet";
//   } else {
//     laser.setScale(0.4);
//     Drawing::drawString(String("abcdefghijklm"), 500, 3500, 1);
//     Drawing::drawString(String("nopqrstuvwxyz"), 500, 1000, 1);    
//   }
//   laser.setScale(1);
// }


#define L_KPPS 20
#define L_TOGGLE_DELAY 120
#define L_QUALITY 315
  
//--------------------------------------------
void setup()
{ 
  Serial.begin(!15200);
  // initialize object array 
  // ilda12k();
  // test();
  // barney10();
  // gear1();
  // gear2();
  // horse10();
  // obama();
  // spiral1();
  // spiral1a();
  // spiral2();
  // spiral2a();
  // spiral3();
    
  // initialize generator array
  // genAlphabet(1);
  
  Laser.init(4);
  Laser.setScale(1);
  Laser.setOffset(0,0);
  Laser.setOptions(L_KPPS, L_TOGGLE_DELAY, L_QUALITY);
}

#define L 0
#define H 4000
#define MID 2000
#define DELAY 5000
long step = MID;
long last_start = 0;
bool state = true;
//--------------------------------------------
void loop() {
  // if (objectIndex > 0 && objectIndex <= objectCount) {
  //   Drawing::drawObject(objectAddress[objectIndex], objectSize[objectIndex]);
  // }
  // else
  // {
  //   objectIndex = 1;
  // }
  
  // if((millis() - last_start) > 5000)
  // {
  //   last_start = millis();
  //   objectIndex++;
  //   if(objectIndex >= objectCount) objectIndex = 1;
  // }
  

  // if (genIndex > 0 && genIndex <= genCount) {
  //   (*genAddress[genIndex])(0);
  // }
  static long l, h;
  if(state)
  {
    l = MID - step;
    h = MID + step;
    Laser.add_point(l, l, false);
    Laser.add_point(l, h, true);
    Laser.add_point(h, h, true);
    Laser.add_point(h, l, true);
    Laser.add_point(l, l, true);
    // state = !state;
  }
  else
  {
    l = MID - step/2;
    h = MID + step/2;
    Laser.add_point(l, l, false);
    Laser.add_point(l, h, true);
    Laser.add_point(h, h, true);
    Laser.add_point(h, l, true);
    Laser.add_point(l, l, true);
    state = !state;
  }
  
 
  
  // Laser.add_point(l+500, l+500, false);
  // Laser.add_point(l+500, l+500, true);
  // Laser.add_point(l+500, h+500, true);
  // Laser.add_point(h+500, h+500, true);
  // Laser.add_point(h+500, l+500, true);
  // Laser.add_point(l+500, l+500, true);
  
  // Laser.add_point(L, L, false);
  // Laser.add_point(L, H, true);
  // Laser.add_point(H, H, true);
  // Laser.add_point(H, L, true);
  // Laser.add_point(L, L, true);
  Laser.swap();
  
  // step += 25;
  // if (step > MID) step = 0;
  delay(500);
  // for(uint8_t i=0; i<2; i++)
  // {
  //   while(!Laser.move_next()){
  //     delayMicroseconds(DELAY);
  //   }
  // }
}

