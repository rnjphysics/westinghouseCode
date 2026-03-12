#include "vesc_can.hpp"

#include <cstring>
#include <unistd.h>
#include <sys/socket.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <linux/can/raw.h>

#define CAN_PACKET_SET_DUTY 0
#define CAN_PACKET_SET_CURRENT 1
#define CAN_PACKET_SET_RPM 3
#define CAN_PACKET_SET_POS 4

#define CAN_PACKET_STATUS 9
#define CAN_PACKET_STATUS_2 14
#define CAN_PACKET_STATUS_3 15
#define CAN_PACKET_STATUS_4 16
#define CAN_PACKET_STATUS_5 27


VescCAN::VescCAN(const std::string& interface) {

    socket_fd = socket(PF_CAN, SOCK_RAW, CAN_RAW);

    struct ifreq ifr{};
    strcpy(ifr.ifr_name, interface.c_str());
    ioctl(socket_fd, SIOCGIFINDEX, &ifr);

    struct sockaddr_can addr{};
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;

    bind(socket_fd, (struct sockaddr *)&addr, sizeof(addr));
}

VescCAN::~VescCAN() {
    close(socket_fd);
}

bool VescCAN::sendFrame(uint32_t id, uint8_t *data, uint8_t len) {

    struct can_frame frame{};
    frame.can_id = id | CAN_EFF_FLAG;
    frame.can_dlc = len;

    memcpy(frame.data, data, len);

    return write(socket_fd, &frame, sizeof(frame)) == sizeof(frame);
}

bool VescCAN::sendRPM(int rpm, uint8_t id) {

    uint8_t data[4];

    data[0] = rpm >> 24;
    data[1] = rpm >> 16;
    data[2] = rpm >> 8;
    data[3] = rpm;

    uint32_t can_id = (CAN_PACKET_SET_RPM << 8) | id;

    return sendFrame(can_id, data, 4);
}

bool VescCAN::sendCurrent(float current, uint8_t id) {

    int32_t value = current * 1000;

    uint8_t data[4];

    data[0] = value >> 24;
    data[1] = value >> 16;
    data[2] = value >> 8;
    data[3] = value;

    uint32_t can_id = (CAN_PACKET_SET_CURRENT << 8) | id;

    return sendFrame(can_id, data, 4);
}

bool VescCAN::sendDuty(float duty, uint8_t id) {

    int32_t value = duty * 100000;

    uint8_t data[4];

    data[0] = value >> 24;
    data[1] = value >> 16;
    data[2] = value >> 8;
    data[3] = value;

    uint32_t can_id = (CAN_PACKET_SET_DUTY << 8) | id;

    return sendFrame(can_id, data, 4);
}

bool VescCAN::sendPosition(float pos, uint8_t id) {

    int32_t value = pos * 1000000;

    uint8_t data[4];

    data[0] = value >> 24;
    data[1] = value >> 16;
    data[2] = value >> 8;
    data[3] = value;

    uint32_t can_id = (CAN_PACKET_SET_POS << 8) | id;

    return sendFrame(can_id, data, 4);
}

bool VescCAN::receiveFrame(struct can_frame &frame) {

    return read(socket_fd, &frame, sizeof(frame)) > 0;
}

int32_t VescCAN::unpackInt32(const uint8_t *data) {

    return (data[0] << 24) |
           (data[1] << 16) |
           (data[2] << 8) |
           data[3];
}

int16_t VescCAN::unpackInt16(const uint8_t *data) {

    return (data[0] << 8) | data[1];
}

bool VescCAN::parseStatus1(const struct can_frame &f, VescStatus1 &out) {

    uint32_t cmd = (f.can_id & CAN_EFF_MASK) >> 8;

    if (cmd != CAN_PACKET_STATUS)
        return false;

    out.erpm = unpackInt32(f.data);
    out.current = unpackInt16(&f.data[4]) / 10.0;
    out.duty = unpackInt16(&f.data[6]) / 1000.0;

    return true;
}

bool VescCAN::parseStatus2(const struct can_frame &f, VescStatus2 &out) {

    uint32_t cmd = (f.can_id & CAN_EFF_MASK) >> 8;

    if (cmd != CAN_PACKET_STATUS_2)
        return false;

    out.amp_hours = unpackInt32(f.data) / 10000.0;
    out.amp_hours_charged = unpackInt32(&f.data[4]) / 10000.0;

    return true;
}

bool VescCAN::parseStatus3(const struct can_frame &f, VescStatus3 &out) {

    uint32_t cmd = (f.can_id & CAN_EFF_MASK) >> 8;

    if (cmd != CAN_PACKET_STATUS_3)
        return false;

    out.watt_hours = unpackInt32(f.data) / 10000.0;
    out.watt_hours_charged = unpackInt32(&f.data[4]) / 10000.0;

    return true;
}

bool VescCAN::parseStatus4(const struct can_frame &f, VescStatus4 &out) {

    uint32_t cmd = (f.can_id & CAN_EFF_MASK) >> 8;

    if (cmd != CAN_PACKET_STATUS_4)
        return false;

    out.temp_fet = unpackInt16(f.data) / 10.0;
    out.temp_motor = unpackInt16(&f.data[2]) / 10.0;
    out.current_in = unpackInt16(&f.data[4]) / 10.0;
    out.pid_pos = unpackInt16(&f.data[6]) / 50.0;

    return true;
}

bool VescCAN::parseStatus5(const struct can_frame &f, VescStatus5 &out) {

    uint32_t cmd = (f.can_id & CAN_EFF_MASK) >> 8;

    if (cmd != CAN_PACKET_STATUS_5)
        return false;

    out.tachometer = unpackInt32(f.data);
    out.input_voltage = unpackInt16(&f.data[4]) / 10.0;

    return true;
}