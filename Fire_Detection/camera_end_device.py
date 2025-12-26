import io
import time
import random
import socket
import logging
import base64
from PIL import Image
import paho.mqtt.client as mqtt
from os import getenv
from dotenv import load_dotenv
from datetime import datetime
from picamera2 import Picamera2
from gpiozero import MotionSensor

LOGGING: str = "console"
LOG_FILE: str = "stats.log"

load_dotenv()

MY_TEAM = "team8"
PUBLISH_INTERVAL = 0.04

# broker_address = "10.64.44.156"
broker_address = "194.177.207.38" # Public IP: 194.177.207.38
broker_port = 1883
topic = f"iot/{MY_TEAM}/frames"
client_id = f"client_{random.randint(0, 1000)}"

client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, client_id)
client.username_pw_set(MY_TEAM, getenv("MQTT_PASSWORD"))

client.connect(broker_address, broker_port)
client.loop_start()

camera = Picamera2()
cfg = camera.create_still_configuration(main={"size": (1980, 1080)})
camera.configure(cfg)
camera.start()

pir = MotionSensor(23)

def config_logging() -> None:
  logging.basicConfig(
    filename=LOG_FILE,
    filemode='w',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
  )

# Load or capture the image
def load_image():
    buffered = io.BytesIO()
    image_array = camera.capture_array()

    #scale the resolytion down
    pil_img = Image.fromarray(image_array)
    original_width, original_height = pil_img.size
    new_height = 240
    new_width = int(original_width * new_height / original_height)
    pil_resized = pil_img.resize((new_width, new_height), Image.ANTIALIAS)
    pil_resized.save(buffered, format="JPEG")
    buffered.seek(0)    

    return buffered.getvalue()

def encode_image(image_bytes):
  return base64.b64encode(image_bytes).decode('utf-8')

def publishImage():
  timestamp = int(datetime.now().timestamp())
  
  image_bytes = load_image()
  encoded_image = encode_image(image_bytes)

  result = client.publish(f"{topic}/{timestamp}/image", encoded_image, qos=1)

  if result.rc == 0:
    print("Publish successful")
  else:
    print(f"Publish failed with code {result.rc}")

def main() -> None:
  config_logging()

  try:
    while(pir.wait_for_motion()):
      print("You moved")
      publishImage()

      time.sleep(PUBLISH_INTERVAL)

  except KeyboardInterrupt:
    if LOGGING == "console":
      print("Received Ctrl+C signal! Bye")
    else:
      logging.info("Received Ctrl+C signal! Bye")

  finally:
    client.loop_stop()
    client.disconnect()

if __name__ == "__main__":
  main()
  
  exit(0)
