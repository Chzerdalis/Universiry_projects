import random
import paho.mqtt.client as mqtt
from os import getenv
from dotenv import load_dotenv
import base64
import cv2
import numpy as np
from ultralytics import YOLO
import sounddevice as sd 

load_dotenv()

MY_TEAM = "team8"

frame_count = 0
N = 2

broker_address = "194.177.207.38" #"10.64.44.156" # Public IP: 194.177.207.38
broker_port = 1883
topic = f"iot/{MY_TEAM}/frames/#"
topic_2 = f"iot/{MY_TEAM}/human_detected"
client_id = f"client_{random.randint(0, 1000)}"

client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, client_id)
client.username_pw_set(MY_TEAM, getenv("MQTT_PASSWORD"))

model_fire = YOLO("best80.pt") #our trained model for fire detection
model_human = YOLO("yolov8n.pt")  

human_detected = 0 
fire_detected = 0  # Global variable

def play_beep(frequency=1000, duration_ms=300, volume=0.5, sample_rate=44100):
    """
    Play a short sine-wave beep without blocking the video / MQTT loop.
    """
    # Generate the tone (float32 in −1.0 … 1.0 as sounddevice expects)
    t = np.linspace(
        0,
        duration_ms / 1000,
        int(sample_rate * duration_ms / 1000),
        endpoint=False,
        dtype=np.float32,
    )
    tone = volume * np.sin(2 * np.pi * frequency * t)

    # Fire-and-forget playback on PortAudio’s internal thread
    sd.play(tone, sample_rate, blocking=False)

def detect_fire(img, model=model_fire):
    global fire_detected
    fire_detected = 0  

    results = model.predict(source=img, conf=0.50, device="cuda:0", verbose=False)
    for result in results:
        for box in result.boxes:
            coords = box.xyxy[0]
            x1, y1, x2, y2 = map(int, coords.tolist())
            cv2.rectangle(img, (x1, y1), (x2, y2), color=(0, 0, 255), thickness=2)
            fire_detected = 1

    return img

def detect_human(img, model=model_human):
  global human_detected
  human_detected = 0  

  results = model.predict(source=img, conf=0.5, device="cuda:0", verbose=False)  # or device="cpu"
  for result in results:
    for box in result.boxes:
      class_id = int(box.cls[0])
      label = model.names[class_id]
      if label == "person":
        coords = box.xyxy[0]
        x1, y1, x2, y2 = map(int, coords.tolist())
        cv2.rectangle(img, (x1, y1), (x2, y2), color=(0, 255, 0), thickness=2)
        human_detected = 1

  return img

def on_message(_client, _userdata, msg):
  #global frame_count
  global human_detected
  global fire_detected
  human_detected = 0
  fire_detected = 0 
  #frame_count += 1

  data = base64.b64decode(msg.payload.decode())
  arr = np.frombuffer(data, dtype=np.uint8) 
  img = cv2.imdecode(arr, cv2.IMREAD_COLOR)

  img = detect_fire(img)
  img = detect_human(img)

  if fire_detected:
    play_beep()

  height = img.shape[0]
  scale = 720 / height
  new_width = int(img.shape[1] * scale)
  img = cv2.resize(img, (new_width, 720))

  cv2.imshow("Live Human/fire Detection", img)
  cv2.waitKey(1)

  print(f"Frame received. Human detected: {human_detected}, Fire detected: {fire_detected}")

  if(human_detected == 1 and fire_detected == 1):
    client.publish(f"{topic_2}", 3, qos=1)
  elif(fire_detected == 1):
    client.publish(f"{topic_2}", 2, qos=1)
  elif(human_detected == 1 ):
    client.publish(f"{topic_2}", 1, qos=1)
  else:
    client.publish(f"{topic_2}", 0, qos=1)

def main():
  try:
    client.on_message = on_message

    client.connect(broker_address, broker_port)
    client.subscribe(topic)

    print(f"Subscribing to `{topic}`. Waiting for messages...")
    client.loop_forever()
  except KeyboardInterrupt:
    print("Receive Ctrl+C signal! Bye")
    client.loop_stop()
    client.disconnect()

if __name__ == "__main__":
  main()

  exit(0)
