# Combinational Circuit Design: RGB LED using K-Maps:
## overview:
This project involves designing a combinational circuit to control an RGB LED based on two 2-bit inputs (a and b). The output color is determined as follows:

- Purple when a > b
- Yellow when a = b
- Cyan when a < b

The circuit is implemented using Karnaugh Maps (K-Maps) for logic minimization and is programmed onto an FPGA (Nexys A7) using SystemVerilog.
## Implementation Steps
- ### Truth Table Formation:
Define inputs: a[1], a[0], b[1], b[0]
Define outputs: r, g, b
Construct a truth table based on the given conditions
- ### K-Map Minimization

Use K-Maps to derive minimized Boolean expressions for r, g, and b
Identify prime implicants and essential prime implicants.

- ### RTL Code:
Write SystemVerilog code to implement the logic
Map inputs to FPGA switches and output to RGB LED

- ### Synthesis and Resource Utilization

Generate the synthesis report in Vivado
Analyze resource utilization (LUTs, IOs, etc.)
Identify maximum combinational delay in the circuit
Simulation and Testing
- ### Simulation:

Simulate the circuit using testbench. Verify the truth table on questasim by analyzing the waves of input and outpuys.

## Files Uploaded:
- RTL : containing the design code of circuit.
- constraints file: containing the constrains names assigned to input and output pins 
- test bench : containing the test bench file of the circuit.
- docs : containg the diagrams of k-maps and LUTS.

## Outcomes:
The circuit is successifly implemented on the FPGA  file.