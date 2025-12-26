# IoT Fire & Human Detection System

This project is a distributed IoT application designed to monitor physical spaces for human presence and fire hazards. It leverages **Raspberry Pi 4** hardware, **MQTT** for real-time communication, and **YOLOv8** computer vision models for intelligent detection and alerting.

---

## 🏗️ System Architecture

The system is composed of three primary modules:

1.  **The Edge Camera (Producer):** A Raspberry Pi that captures and transmits frames only when motion is detected.
2.  **The AI Processing Server (Consumer/Producer):** A workstation that receives image frames, runs object detection for humans and fire, and publishes the results.
3.  **The Notification Unit (Consumer):** A Raspberry Pi with an LED that provides visual alerts based on the detection results.

---

## 📂 Component Breakdown

### 1. Camera End Device (`camera_end_device.py`)
* **Purpose:** Monitors for motion and captures video frames.
* **Hardware:** Raspberry Pi, Camera Module, PIR Motion Sensor (GPIO 23).
* **Logic:** * Waits for the PIR sensor to trigger motion.
    * Captures a high-resolution image and resizes it to a 240p height to reduce latency.
    * Encodes the image to **Base64** and publishes it to `iot/team8/frames/{timestamp}/image`.

### 2. AI Client Receiver (`client_receiver.py`)
* **Purpose:** The central processing hub for image analysis.
* **Models:** * `yolov8n.pt`: Standard model for human detection.
    * `best80.pt`: Custom-trained model for fire detection.
* **Logic:**
    * Decodes the Base64 stream back into an image array.
    * Runs inference for both fire and humans.
    * Plays an audible **beep** via `sounddevice` if fire is detected.
    * Publishes a numeric status code (0-3) to the `human_detected` topic.

### 3. LED Notification Device (`led_human.py`)
* **Purpose:** Physical alert system using visual signals.
* **Hardware:** Raspberry Pi, LED (GPIO 24).
* **Alert Logic:** * **0:** No detection (LED Off).
    * **1 (Human):** Constant LED On.
    * **2 (Fire):** Slow blinking (0.1s intervals).
    * **3 (Both):** Rapid blinking (0.025s intervals).
