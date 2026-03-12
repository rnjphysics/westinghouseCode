#include "vesc_can.hpp"
#include <iostream>

int main() {

    VescCAN vesc("can0");

    while(true) {

        vesc.sendRPM(2000, 20);

        struct can_frame frame;

        if(vesc.receiveFrame(frame)) {

            VescStatus1 s;

            if(VescCAN::parseStatus1(frame, s)) {

                std::cout
                    << "RPM: " << s.erpm
                    << " Current: " << s.current
                    << " Duty: " << s.duty
                    << std::endl;
            }
        }
    }
}