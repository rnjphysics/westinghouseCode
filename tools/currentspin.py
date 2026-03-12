import can
import struct

VESC_ID = 20
CAN_PACKET_SET_CURRENT = 1

with can.interface.Bus(channel='can0', bustype='socketcan') as bus:

    current = 2.0
    current_int = int(current * 1000)

    data = struct.pack('>i', current_int)

    msg = can.Message(
        arbitration_id=(CAN_PACKET_SET_CURRENT << 8) | VESC_ID,
        data=data,
        is_extended_id=True
    )

    bus.send(msg)
    print("Sent 2A command")