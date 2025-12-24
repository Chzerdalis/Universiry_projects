This repository contains the hardware design and implementation files for the **ECE333 - Digital Systems Laboratory** course at the **University of Thessaly**. All projects are implemented in **Verilog HDL** and deployed on the **Nexys A7-100T FPGA**.

---

## 📋 Course Overview
The laboratory curriculum focuses on RTL design, simulation, and hardware verification using the Xilinx Vivado suite. The projects progress from basic peripheral driving to complex system-on-chip communication protocols.

---

## 🛠️ Project Summaries

### 1. 7-Segment Display Driver (Lab 1)
**Objective:** Implement a driver for four 7-segment LED displays to show a rotating 16-character message.
* **Decoding:** A combinational decoder converts 4-bit characters into 7-segment cathode signals.
* **Multiplexing:** Rapidly cycles through four anodes with a 0.20µs delay to create a stable image via persistence of vision.
* **Message Control:** Message rotation is handled via a manual button (**BTNR**) or an automatic 23-bit counter for a ~1.67s delay.
* **Clocking:** Utilizes the **MMCM** (Mixed-Mode Clock Manager) primitive to divide the 100MHz system clock.

### 2. UART Serial Communication (Lab 2)
**Objective:** Design a **Universal Asynchronous Receiver Transmitter** for serial data transfer.
* **Baud Rate Generator:** A programmable controller supporting speeds from 300 up to 115,200 bps.
* **Transmitter (TX):** Logic to frame 8-bit symbols with Start, Parity, and Stop bits.
* **Receiver (RX):** Features an oversampling mechanism ($16\times$ baud rate) to sample data at the center of each bit period for maximum reliability.
* **Error Handling:** Hardware flags for **Parity Errors** (integrity) and **Framing Errors** (alignment).

### 3. VGA Controller Implementation (Lab 3)
**Objective:** Create a VGA driver to output images to a monitor at 640x480 resolution at 60Hz.
* **Synchronization:** Precise generation of **HSYNC** and **VSYNC** signals.
* **VRAM Design:** Uses FPGA **Block RAM** (BRAM) to store a $128 \times 96$ image, which is then scaled to fill the standard display.
* **Color Output:** Digital mapping of 8 basic colors using 3-bit RGB output signals.

### 4. ADXL362 Accelerometer Driver (Lab 4)
**Objective:** Integrate the on-board ADXL362 accelerometer to read 3-axis acceleration and temperature.
* **SPI Master:** An FSM-based controller managing **SCLK**, **MOSI**, **MISO**, and **CS** signals at 1-8 MHz.
* **Register Management:** Automated configuration including Soft Reset, Filter Control (2g range, 200Hz ODR), and Measurement Enable.
* **System Integration:** Raw binary sensor data is converted to BCD/ASCII and transmitted via the Lab 2 UART to a PC terminal (PuTTY).
* **Data Processing:** Optional data averaging to minimize sensor noise for stable real-time display.

---

## 📁 System Requirements
* **Hardware:** Nexys A7-100T FPGA (Artix-7).
* **Software:** Xilinx Vivado Design Suite.
* **Terminal Setup (PuTTY):** 57600 baud, 8 data bits, 1 stop bit, Odd parity.
