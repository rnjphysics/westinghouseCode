import struct
import can

# ================================
# VESC CAN COMMAND IDS
# ================================

CAN_PACKET_SET_DUTY = 0
CAN_PACKET_SET_CURRENT = 1
CAN_PACKET_SET_CURRENT_BRAKE = 2
CAN_PACKET_SET_RPM = 3
CAN_PACKET_SET_POS = 4

CAN_PACKET_FILL_RX_BUFFER = 5
CAN_PACKET_FILL_RX_BUFFER_LONG = 6
CAN_PACKET_PROCESS_RX_BUFFER = 7
CAN_PACKET_PROCESS_SHORT_BUFFER = 8

CAN_PACKET_STATUS = 9
CAN_PACKET_SET_CURRENT_REL = 10
CAN_PACKET_SET_CURRENT_BRAKE_REL = 11
CAN_PACKET_SET_CURRENT_HANDBRAKE = 12
CAN_PACKET_SET_CURRENT_HANDBRAKE_REL = 13

CAN_PACKET_STATUS_2 = 14
CAN_PACKET_STATUS_3 = 15
CAN_PACKET_STATUS_4 = 16
CAN_PACKET_STATUS_5 = 27


# ================================
# MOTOR COMMAND FUNCTIONS
# ================================

def send_duty(bus, duty, vesc_id):

    duty_int = int(duty * 100000)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_DUTY << 8) | vesc_id,
        data=struct.pack(">i", duty_int),
        is_extended_id=True
    )

    bus.send(msg)


def send_current(bus, current, vesc_id):

    current_int = int(current * 1000)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_CURRENT << 8) | vesc_id,
        data=struct.pack(">i", current_int),
        is_extended_id=True
    )

    bus.send(msg)


def send_current_brake(bus, current, vesc_id):

    current_int = int(current * 1000)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_CURRENT_BRAKE << 8) | vesc_id,
        data=struct.pack(">i", current_int),
        is_extended_id=True
    )

    bus.send(msg)


def send_rpm(bus, rpm, vesc_id):

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_RPM << 8) | vesc_id,
        data=struct.pack(">i", int(rpm)),
        is_extended_id=True
    )

    bus.send(msg)


def send_position(bus, pos, vesc_id):

    pos_int = int(pos * 1000000)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_POS << 8) | vesc_id,
        data=struct.pack(">i", pos_int),
        is_extended_id=True
    )

    bus.send(msg)


# ================================
# STATUS PARSERS
# ================================

def parse_status_1(data):

    erpm = struct.unpack(">i", data[0:4])[0]
    current = struct.unpack(">h", data[4:6])[0] / 10.0
    duty = struct.unpack(">h", data[6:8])[0] / 1000.0

    return {
        "erpm": erpm,
        "current": current,
        "duty": duty
    }


def parse_status_2(data):

    amp_hours = struct.unpack(">i", data[0:4])[0] / 10000.0
    amp_hours_charged = struct.unpack(">i", data[4:8])[0] / 10000.0

    return {
        "amp_hours": amp_hours,
        "amp_hours_charged": amp_hours_charged
    }


def parse_status_3(data):

    watt_hours = struct.unpack(">i", data[0:4])[0] / 10000.0
    watt_hours_charged = struct.unpack(">i", data[4:8])[0] / 10000.0

    return {
        "watt_hours": watt_hours,
        "watt_hours_charged": watt_hours_charged
    }


def parse_status_4(data):

    temp_fet = struct.unpack(">h", data[0:2])[0] / 10.0
    temp_motor = struct.unpack(">h", data[2:4])[0] / 10.0
    current_in = struct.unpack(">h", data[4:6])[0] / 10.0
    pid_pos = struct.unpack(">h", data[6:8])[0] / 50.0

    return {
        "temp_fet": temp_fet,
        "temp_motor": temp_motor,
        "current_in": current_in,
        "pid_pos": pid_pos
    }


def parse_status_5(data):

    tachometer = struct.unpack(">i", data[0:4])[0]
    voltage = struct.unpack(">h", data[4:6])[0] / 10.0
    reserved = struct.unpack(">h", data[6:8])[0]

    return {
        "tachometer": tachometer,
        "input_voltage": voltage
    }


# ================================
# CAN MESSAGE DECODER
# ================================

def decode_can_message(msg):

    cmd = msg.arbitration_id >> 8
    vesc_id = msg.arbitration_id & 0xFF

    if cmd == CAN_PACKET_STATUS:
        return {
            "vesc_id": vesc_id,
            "type": "status_1",
            "data": parse_status_1(msg.data)
        }

    if cmd == CAN_PACKET_STATUS_2:
        return {
            "vesc_id": vesc_id,
            "type": "status_2",
            "data": parse_status_2(msg.data)
        }

    if cmd == CAN_PACKET_STATUS_3:
        return {
            "vesc_id": vesc_id,
            "type": "status_3",
            "data": parse_status_3(msg.data)
        }

    if cmd == CAN_PACKET_STATUS_4:
        return {
            "vesc_id": vesc_id,
            "type": "status_4",
            "data": parse_status_4(msg.data)
        }

    if cmd == CAN_PACKET_STATUS_5:
        return {
            "vesc_id": vesc_id,
            "type": "status_5",
            "data": parse_status_5(msg.data)
        }

    return None