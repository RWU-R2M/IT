import can
import time

def send_can_message():
    try:
        # Initialize the CAN bus on interface 'can0' using SocketCAN
        bus = can.interface.Bus(channel='can0', bustype='socketcan')

        # Construct the CAN message (adjust CAN ID and payload as needed)
        message = can.Message(arbitration_id=0x123,
                              data=[0xFF, 0x39],
                              is_extended_id=False)
        
        print("Starting to send messages every 500 ms. Press Ctrl+C to stop.")
        
        while True:
            try:
                # Send the CAN message with a timeout (in seconds)
                bus.send(message, timeout=0.2)
                print("CAN message sent successfully on channel:", bus.channel_info)
            except can.CanError as e:
                print("Failed to send CAN message:", e)
            # Increase the interval if the error persists (try 1 second instead of 0.5)
            time.sleep(0.5)
    except Exception as e:
        print("Error initializing CAN bus:", e)

if __name__ == '__main__':
    send_can_message()
