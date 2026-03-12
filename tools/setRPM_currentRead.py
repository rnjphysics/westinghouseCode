import can
import struct
import time

# ===== CONFIG =====

VESC_ID = 20          # Change for each motor
TARGET_RPM = 2000
TEST_DURATION = 10    # seconds

CAN_PACKET_SET_RPM = 3
CAN_PACKET_STATUS = 9

# ==================

def send_rpm(bus, rpm):
    data = struct.pack(">i", rpm)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_RPM << 8) | VESC_ID,
        data=data,
        is_extended_id=True
    )

    bus.send(msg)


def parse_status(data):

    erpm = struct.unpack(">i", data[0:4])[0]
    current_raw = struct.unpack(">h", data[4:6])[0]
    duty_raw = struct.unpack(">h", data[6:8])[0]

    current = current_raw / 10.0
    duty = duty_raw / 1000.0

    return erpm, current, duty


def main():

    print("Starting test")
    print("Target RPM:", TARGET_RPM)

    with can.interface.Bus(channel="can0", bustype="socketcan") as bus:

        start_time = time.time()

        while time.time() - start_time < TEST_DURATION:

            # send command repeatedly (VESC requires continuous commands)
            send_rpm(bus, TARGET_RPM)

            msg = bus.recv(timeout=0.1)

            if msg is None:
                continue

            cmd = msg.arbitration_id >> 8
            motor_id = msg.arbitration_id & 0xFF

            if cmd == CAN_PACKET_STATUS and motor_id == VESC_ID:

                erpm, current, duty = parse_status(msg.data)

                print(
                    f"RPM: {erpm:6d} | "
                    f"Current: {current:6.2f} A | "
                    f"Duty: {duty:.3f}"
                )

    print("Test finished")


if __name__ == "__main__":
    main()