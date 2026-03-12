import can
import time

from vesc_can.vesc import send_rpm, decode_can_message

bus = can.interface.Bus(channel="can0", bustype="socketcan")

VESCS = [20,21,22,23,24,25]

try:

    while True:

        for vid in VESCS:
            send_rpm(bus, 2000, vid)

        msg = bus.recv(timeout=0.1)

        if msg:

            decoded = decode_can_message(msg)

            if decoded:

                print(decoded)

        time.sleep(0.05)

finally:

    bus.shutdown()