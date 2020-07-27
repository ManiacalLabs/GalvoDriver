#ifndef MCP48XX_LIB_MCP48XX_H
#define MCP48XX_LIB_MCP48XX_H

#include <Arduino.h>
#include <SPI.h>


template<uint8_t BITS_RES>
class MCP48xx {


private:
    const uint8_t cs;
    uint16_t command[2] = {0};
    bool isAActive = false;
    bool isBActive = false;

public:

    enum Channel : uint8_t {
        A = 0u, B = 1u
    };

    enum Gain : uint8_t {
        High = 0u, Low = 1u
    };

    explicit MCP48xx(uint8_t cs);

    ~MCP48xx();

    void init();

    void setVoltage(uint16_t value, Channel channel);

    void setVoltageA(uint16_t value);

    void setVoltageB(uint16_t value);

    void shutdownChannel(Channel channel);

    void shutdownChannelA();

    void shutdownChannelB();

    void turnOnChannel(Channel channel);

    void turnOnChannelA();

    void turnOnChannelB();

    void setGain(Gain gain, Channel channel);

    void setGainA(Gain gain);

    void setGainB(Gain gain);

    void updateDAC();

};

typedef MCP48xx<12> MCP4822;
typedef MCP48xx<10> MCP4812;
typedef MCP48xx<8> MCP4802;


/* Implementation */

template<uint8_t BITS_RES>
MCP48xx<BITS_RES>::MCP48xx(uint8_t cs) : cs(cs) {
    /* Setting channel bits*/
    command[Channel::A] = command[Channel::A] | (0u << 15u);
    command[Channel::B] = command[Channel::B] | (1u << 15u);

    SPI.begin();
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::init() {
    pinMode(cs, OUTPUT);
    digitalWrite(cs, HIGH);
}

template<uint8_t BITS_RES>
MCP48xx<BITS_RES>::~MCP48xx() {
    SPI.end();
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setVoltage(uint16_t value, Channel channel) {
    if (value > (1u << BITS_RES) - 1) {
        value = (1u << BITS_RES) - 1;
    } else {
        value = value >> (12u - BITS_RES);
    }
    command[channel] = command[channel] & 0xF000u;
    command[channel] = command[channel] | value;
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setVoltageA(uint16_t value) {
    setVoltage(value, Channel::A);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setVoltageB(uint16_t value) {
    setVoltage(value, Channel::B);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::shutdownChannel(Channel channel) {
    command[channel] = command[channel] | (0u << 12u);
    if (channel == Channel::A) {
        isAActive = false;
    } else {
        isBActive = false;
    }
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::shutdownChannelA() {
    shutdownChannel(Channel::A);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::shutdownChannelB() {
    shutdownChannel(Channel::B);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::turnOnChannel(Channel channel) {
    command[channel] = command[channel] | (1u << 12u);
    if (channel == Channel::A) {
        isAActive = true;
    } else {
        isBActive = true;
    }
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::turnOnChannelA() {
    turnOnChannel(Channel::A);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::turnOnChannelB() {
    turnOnChannel(Channel::B);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setGain(Gain gain, Channel channel) {
    command[channel] = command[channel] | (gain << 13u);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setGainA(Gain gain) {
    setGain(gain, Channel::A);
}

template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::setGainB(Gain gain) {
    setGain(gain, Channel::B);
}


template<uint8_t BITS_RES>
void MCP48xx<BITS_RES>::updateDAC() {

    /* begin transaction using maximum clock frequency of 20MHz */
    SPI.beginTransaction(SPISettings(20000000, MSBFIRST, SPI_MODE0));

    if (isAActive) {
        digitalWrite(cs, LOW); //select device
        SPI.transfer16(command[Channel::A]); // sent command for the A channel
        digitalWrite(cs, HIGH); //deselect device
    }
    if (isBActive) {
        digitalWrite(cs, LOW);
        SPI.transfer16(command[Channel::B]); // sent command for the B channel
        digitalWrite(cs, HIGH);
    }

    SPI.endTransaction();
}

#endif //MCP48XX_LIB_MCP48XX_H