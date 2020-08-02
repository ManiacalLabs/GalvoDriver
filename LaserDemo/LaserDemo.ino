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

#include "Drawing.h"
#include "Laser.h"

#include <TimeLib.h>

// Create laser instance (with laser pointer connected to digital pin 4)
Laser laser(4);

int objectNumber = 0;
int objectStart = 0;
int objectTime = 0;
int objectCalls = 0;


// objects
#include "p_horse10.h"
#include "p_barney10.h"
#include "p_ilda12k.h"
#include "p_gear1.h"
#include "p_gear2.h"
#include "p_spiral1.h"
#include "p_spiral1a.h"
#include "p_spiral2.h"
#include "p_spiral2a.h"
#include "p_spiral3.h"
#include "p_obama.h"
#include "p_test.h"


//--------------------------------------------
void genAlphabet(int init) {
  if (init) {
    genCount++;
    genAddress[genCount] = genAlphabet;
    genName[genCount] = "Alphabet";
  } else {
    laser.setScale(0.4);
    Drawing::drawString(String("abcdefghijklm"), 500, 3500, 1);
    Drawing::drawString(String("nopqrstuvwxyz"), 500, 1000, 1);    
  }
  laser.setScale(1);
}


#define L_KPPS 20
#define L_TOGGLE_DELAY 120
#define L_QUALITY 315
  
//--------------------------------------------
void setup()
{ 
  // initialize object array 
  ilda12k();
  test();
  barney10();
  gear1();
  gear2();
  horse10();
  obama();
  spiral1();
  spiral1a();
  spiral2();
  spiral2a();
  spiral3();
    
  // initialize generator array
  genAlphabet(1);
  
  laser.init();
  laser.setScale(1);
  laser.setOffset(0,0);
  
  
  laser.setOptions(L_KPPS, L_TOGGLE_DELAY, L_QUALITY);
}

#define L 100
#define H 4000
#define DELAY 5000
long last_start = 0;
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
  
  laser.on();
  laser.sendto(L, L);
  delayMicroseconds(DELAY);
  // laser.sendto(L, H);
  //  delayMicroseconds(DELAY);
  laser.sendto(H/2, H);
   delayMicroseconds(DELAY);
  laser.sendto(H, L);
   delayMicroseconds(DELAY);
}

