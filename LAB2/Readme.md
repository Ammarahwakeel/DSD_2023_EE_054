## combinational logic circuit implementation in vivado.
**overview**:
This repository contains the System Verilog implementation of a combinational logic circuit using Vivado software. The circuit consists of logic gates, including AND, OR, XOR, and NOT gates, to produce two outputs: x and y. 

**Circuit Description**:
There are three input listed as (a,b,c).then we have two outputs named as x and y. we pass c signal into not gate and perform or operation on a and b signals , which are input of output signal x.

Then output signal y has two inputs. one input is the output of OR gate .and other input is the output of XOR gate.again the inputs of XOR gate are outputs of nand operation on and OR opertion on signals a and b

**Logic gates used**:

- NOT gate (~)
- AND gate (&)
- OR gate (|)
- XOR gate (^)

**Project Files**:
This repository contains following files.

- rtl file( containg the code which implements the circuit in system verilog)

- constraints file( containg information about the assigned inputs and outputs ports of FPGA)
- docs (containing the schemetic of the circuit and look up tables of circuit)

**Tools and Requirement**:
- Vivado Design Suite (2019.2 Edition)
- FPGA Board: Nexys A7 100T 
- System Verilog Programming Knowledge

**Expected Outcomes**:
 after generating bitstream file load it on FPGA and it should produce output x and y according to the truth table of this circuit