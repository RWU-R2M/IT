### Important note about CAN

 the CAN ground should be connected to the power ground, or at least the USB ground, because the CAN interface is isolated!!! if it is not connected, the bus will not work!!!

To start CAN communication with the Odrive, turn on the Odrive, make sure that the can configuration is right (that you are using can protocol CAN simple, and that the baud rate is correct)

Following the instructions in the Odrive website, setup the can network interface in the host machine 

sudo ip link set can0 up type can bitrate 250000

After that, the CAN interface is up and running, and will receive CAN frames. It is a good idea to test the bus by sending a simple frame and seeing if the Odrives acks it.

The next step is to run can_enumerate.py script to assign node IDs to the Odrives. Take note of the ID's, you will need them for future commands. If the script does not find any Odrives in the bus, they are either not on, or you have the wrong bus physical layer, or your can interface is not configured properly. It could also be that the ODrive is configured for a different CAN protocol

After loading the configuration, you can run the can_calibration script that will calibrate the odrive via CAN. THe Odrive should beep, and then the motor should start turning, first one way then the other.

Having the calibration done sucessully, you can then proceed to put the Odrive in closed loop velocity control. There is a script for that too. The script is executd on the host machine, and the commands are sent over the can interface to the odrives 
