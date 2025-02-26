# Seven-Segment Display Decoder Using System Verilog
## Project Overview:
This project implements a Seven-Segment Display Decoder using Verilog HDL. The design takes a 4-bit binary input (a0-a3) and converts it into a hexadecimal digit (0-F), which is displayed on a seven-segment display. Additionally, a 3-bit select signal (sel_0, sel_1, sel_2) determines which of the eight available displays is active.

The decoder follows active-low logic, meaning segments are turned ON when assigned a logic 0. The design is tested and implemented on an FPGA using Vivado or QuestaSim for simulation.

## Hardware & Software Requirements:
- Hardware:

  FPGA Board (e.g., Nexys A7 or equivalent),
Seven-Segment Display
Switches for input selection
- Software:

   Vivado (for synthesis, implementation, and bitstream generation)
QuestaSim (for simulation and verification)
## Project Files:
- project5.sv → structural system verilog coding
 - project5_behave.sv → Behavioral system Verilog code
 - tb_project5.sv → Testbench for simulation
 - constraints.xdc → FPGA pin mapping
 ## Outcomes:
 The project correctly displays hexadecimal digits on a seven-segment display with proper anode selection.