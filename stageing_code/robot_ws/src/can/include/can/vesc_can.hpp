#pragma once

#include <cstdint>
#include <linux/can.h>
#include <string>

struct VescStatus1 {
    int32_t erpm;
    float current;
    float duty;
};

struct VescStatus2 {
    float amp_hours;
    float amp_hours_charged;
};

struct VescStatus3 {
    float watt_hours;
    float watt_hours_charged;
};

struct VescStatus4 {
    float temp_fet;
    float temp_motor;
    float current_in;
    float pid_pos;
};

struct VescStatus5 {
    int32_t tachometer;
    float input_voltage;
};

class VescCAN {

public:

    explicit VescCAN(const std::string& interface);
    ~VescCAN();

    bool sendRPM(int rpm, uint8_t vesc_id);
    bool sendCurrent(float current, uint8_t vesc_id);
    bool sendDuty(float duty, uint8_t vesc_id);
    bool sendPosition(float pos, uint8_t vesc_id);

    bool receiveFrame(struct can_frame &frame);

    static bool parseStatus1(const struct can_frame &frame, VescStatus1 &out);
    static bool parseStatus2(const struct can_frame &frame, VescStatus2 &out);
    static bool parseStatus3(const struct can_frame &frame, VescStatus3 &out);
    static bool parseStatus4(const struct can_frame &frame, VescStatus4 &out);
    static bool parseStatus5(const struct can_frame &frame, VescStatus5 &out);

private:

    int socket_fd;

    bool sendFrame(uint32_t id, uint8_t *data, uint8_t len);

    static int32_t unpackInt32(const uint8_t *data);
    static int16_t unpackInt16(const uint8_t *data);

};