#include "MCP48xx.h"

// Define the MCP4822 instance, giving it the SS (Slave Select) pin
// The constructor will also initialize the SPI library
// We can also define a MCP4812 or MCP4802
MCP4822 dac(10);

// We define an int variable to store the voltage in mV so 100mV = 0.1V
int voltage = 100;

void setup() {
    // We call the init() method to initialize the instance

    dac.init();

    // The channels are turned off at startup so we need to turn the channel we need on
    dac.turnOnChannelA();
    dac.turnOnChannelB();

    // We configure the channels in High gain
    // It is also the default value so it is not really needed
    dac.setGainA(MCP4822::High);
    dac.setGainB(MCP4822::High);
}

#define MAX 2048
#define DELAY 5

// We loop from 100mV to 2000mV for channel A and 4000mV for channel B
void loop() {
    dac.setVoltageA(0);
    dac.setVoltageB(0);
    dac.updateDAC();
    delay(DELAY);
    
    dac.setVoltageA(MAX);
    dac.setVoltageB(0);
    dac.updateDAC();
    delay(DELAY);
    
    dac.setVoltageA(MAX);
    dac.setVoltageB(MAX);
    dac.updateDAC();
    delay(DELAY);
    
    dac.setVoltageA(0);
    dac.setVoltageB(MAX);
    dac.updateDAC();
    delay(DELAY);
}

