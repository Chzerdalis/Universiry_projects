# ECE333 Digital Systems Laboratory Portfolio (2024-2025)

[cite_start]This repository contains the hardware design and implementation files for the **ECE333 - Digital Systems Laboratory** course at the **University of Thessaly**[cite: 8, 155]. [cite_start]All projects are implemented in **Verilog HDL** and deployed on the **Nexys A7-100T FPGA** board[cite: 35, 105, 586].

---

## 📋 Course Overview
[cite_start]The laboratory curriculum focuses on RTL design, simulation, and hardware verification using the Xilinx Vivado suite[cite: 114, 703]. The projects progress from basic peripheral driving to complex system-on-chip communication protocols.

---

## 🛠️ Project Summaries

### 1. 7-Segment Display Driver (Lab 1)
[cite_start]**Objective:** Implement a driver for four 7-segment LED displays to show a rotating 16-character message[cite: 578].
* [cite_start]**Decoding:** A combinational decoder converts 4-bit characters into 7-segment cathode signals[cite: 623, 624].
* [cite_start]**Multiplexing:** Rapidly cycles through four anodes with a 0.20µs delay to create a stable image via persistence of vision[cite: 605, 606, 620].
* [cite_start]**Message Control:** Message rotation is handled via a manual button (**BTNR**) or an automatic 23-bit counter for a ~1.67s delay[cite: 718, 727].
* [cite_start]**Clocking:** Utilizes the **MMCM** (Mixed-Mode Clock Manager) primitive to divide the 100MHz system clock[cite: 642, 657].

### 2. UART Serial Communication (Lab 2)
[cite_start]**Objective:** Design a **Universal Asynchronous Receiver Transmitter** for serial data transfer[cite: 349].
* [cite_start]**Baud Rate Generator:** A programmable controller supporting speeds from 300 up to 115,200 bps[cite: 399, 400].
* [cite_start]**Transmitter (TX):** Logic to frame 8-bit symbols with Start, Parity, and Stop bits[cite: 465, 495].
* [cite_start]**Receiver (RX):** Features an oversampling mechanism ($16\times$ baud rate) to sample data at the center of each bit period for maximum reliability[cite: 402, 528].
* [cite_start]**Error Handling:** Hardware flags for **Parity Errors** (integrity) and **Framing Errors** (alignment)[cite: 442, 503].

### 3. VGA Controller Implementation (Lab 3)
[cite_start]**Objective:** Create a VGA driver to output images to a monitor at 640x480 resolution at 60Hz[cite: 17, 26, 27].
* [cite_start]**Synchronization:** Precise generation of **HSYNC** and **VSYNC** signals[cite: 41, 125, 133].
* [cite_start]**VRAM Design:** Uses FPGA **Block RAM** (BRAM) to store a $128 \times 96$ image, which is then scaled to fill the standard display[cite: 30, 98, 101].
* [cite_start]**Color Output:** Digital mapping of 8 basic colors using 3-bit RGB output signals[cite: 38, 39, 97].

### 4. ADXL362 Accelerometer Driver (Lab 4)
[cite_start]**Objective:** Integrate the on-board ADXL362 accelerometer to read 3-axis acceleration and temperature[cite: 167, 172].
* [cite_start]**SPI Master:** An FSM-based controller managing **SCLK**, **MOSI**, **MISO**, and **CS** signals at 1-8 MHz [cite: 196-206, 221].
* [cite_start]**Register Management:** Automated configuration including Soft Reset, Filter Control (2g range, 200Hz ODR), and Measurement Enable [cite: 267-270].
* [cite_start]**System Integration:** Raw binary sensor data is converted to BCD/ASCII and transmitted via the Lab 2 UART to a PC terminal (PuTTY)[cite: 174, 183, 305].
* [cite_start]**Data Processing:** Optional data averaging to minimize sensor noise for stable real-time display[cite: 307, 309].

---

## 📁 System Requirements
* [cite_start]**Hardware:** Nexys A7-100T FPGA (Artix-7)[cite: 105, 586].
* [cite_start]**Software:** Xilinx Vivado Design Suite[cite: 114].
* [cite_start]**Terminal Setup (PuTTY):** 57600 baud, 8 data bits, 1 stop bit, Odd parity[cite: 179].
