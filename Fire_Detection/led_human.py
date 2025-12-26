import random
import paho.mqtt.client as mqtt
from os import getenv
from dotenv import load_dotenv
from gpiozero import LED 
import time

load_dotenv()

MY_TEAM = "team8"

broker_address = "194.177.207.38" #"10.64.44.156" # Public IP: 194.177.207.38
broker_port = 1883
topic = f"iot/{MY_TEAM}/human_detected"
client_id = f"client_{random.randint(0, 1000)}"

client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, client_id)
client.username_pw_set(MY_TEAM, getenv("MQTT_PASSWORD"))

led = LED(24)

def on_message(_client, _userdata, msg):
  if(msg.payload.decode() == "3"):
    print("Both detected!")
    for _ in range(2):
      led.on()
      time.sleep(0.025)
      led.off()
      time.sleep(0.025)
  elif(msg.payload.decode() == "2"):
    print("fire detected!")
    for _ in range(2):
      led.on()
      time.sleep(0.1)
      led.off()
      time.sleep(0.1)
  elif(msg.payload.decode() == "1"):
    print("Human detected!")
    led.on()
  else:
    print("No human detected!")
    led.off()
  
def main():
  try:
    client.on_message = on_message

    client.connect(broker_address, broker_port)
    client.subscribe(topic)

    print(f"Waiting for human")
    client.loop_forever()

  except KeyboardInterrupt:
    print("Receive Ctrl+C signal! Bye")
    client.loop_stop()
    client.disconnect()

if __name__ == "__main__":
  main()

  exit(0)
