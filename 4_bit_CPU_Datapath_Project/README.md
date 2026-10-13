# 4-Bit CPU Datapath Project

**Author:** Hoang Ngoc Long (Roll Number: SE204586)

**Institution:** FPT University

**Project Type:** Computer Architecture / FPGA IC Design

## Project Overview

This project implements a fully functional **4-bit CPU Datapath** using a **3-Stage Pipeline Architecture** (Fetch -> Decode -> Execute). Written entirely in Verilog, the design focuses on cycle-by-cycle hardware efficiency, featuring synchronous memory components, asynchronous computational logic, and a robust control hazard prevention system.

## Key Architectural Features

* **3-Stage Pipeline:** Overlaps instruction execution to maximize throughput without wasting clock cycles.

* **Hardware Complexity:** Successfully synthesized in Xilinx Vivado resulting in exactly **96 Logic Cells** and **424 internal nets**.

* **Advanced Control Hazard Handling:** Implements a hardware **Flush Mechanism** via the Branch Unit. When a Jump is detected, it forces pipeline registers to zero (generating a NOP bubble) to safely discard incorrect instructions.

* **Synchronous Write-Back:** Registers update strictly on the positive edge of the clock to prevent data collisions and race conditions.

* **Negative Testing & Verification:** The testbench is designed to monitor boundary limits, verifying Carry (Overflow), Zero flags, and Two's Complement arithmetic accurately.

## Directory Structure

The repository strictly follows industry-standard IC design structures:

```text
4_bit_CPU_Datapath_Project
 ┣ rtl/                   # Register Transfer Level (Hardware source code)
 ┃ ┣ topmodule.v          # Main CPU integration
 ┃ ┣ alu.v                # Arithmetic Logic Unit
 ┃ ┣ contrlu.v            # Control Unit / Instruction Decoder
 ┃ ┣ memory.v             # Instruction Memory (ROM)
 ┃ ┣ datamem.v            # Data Memory (RAM)
 ┃ ┣ regis.v              # Register File
 ┃ ┣ counter.v            # Program Counter (PC)
 ┃ ┣ pipereg.v, insreg.v  # Pipeline Buffer Registers
 ┃ ┣ flagreg.v            # Zero & Carry Flag Registers
 ┃ ┗ mux.v                # Multiplexers
 ┣ tb/                    # Testbench files
 ┃ ┗ datapath_fourbit_tb.v# Cycle-by-cycle verification testbench
 ┣ sw/                    # Software & Assembly
 ┃ ┗ program.s            # Assembly test code with instructions mapped to Hex
 ┣ files.f                # File list for automated compilation
 ┣ program.hex            # 12-bit Machine Code loaded into ROM
 ┣ run_sim.bat            # Windows script for Icarus Verilog execution
 ┣ run_sim.sh             # Linux/Mac script for Icarus Verilog execution
 ┣ sim_log.txt            # Cycle-by-cycle truth table output log
 ┗ README.md              # Project documentation
```

## Instruction Set Architecture (ISA)

The CPU processes 12-bit machine code and executes the following core instructions:

| Instruction | Type | Description | 
| ----- | ----- | ----- | 
| **LDI** | Data Transfer | Load Immediate (Directly loads 4-bit constant into Register) | 
| **ADD** | Arithmetic | Full binary addition with Carry out detection | 
| **SUB** | Arithmetic | Subtraction using Two's Complement logic | 
| **AND** | Logical | Bitwise AND | 
| **OR** | Logical | Bitwise OR | 
| **XOR** | Logical | Bitwise XOR (Sets Zero flag if inputs are equal) | 
| **NOT** | Logical | Bitwise Invert | 
| **JMP/JZ** | Control | Branching (Triggers the Flush mechanism for safety) | 
| **NOP** | Control | No Operation (Pipeline bubble padding) | 

## How to Run the Simulation

To verify the cycle-by-cycle correctness of the datapath, you can run the automated simulation script using **Icarus Verilog**.

**For Windows:**

1. Open Command Prompt or PowerShell in the root directory.

2. Run the batch file:

   ```bash
   run_sim.bat
   ```

**For Linux / Mac:**

1. Open Terminal in the root directory.

2. Grant execution permission (first time only): `chmod +x run_sim.sh`

3. Execute the script:

   ```bash
   ./run_sim.sh
   ```

The script will compile all files listed in `files.f`, execute the testbench, and output the tracking table to `sim_log.txt`.
*Alternatively, the `.v` files can be directly imported into **Xilinx Vivado** to view the RTL Schematic and Simulation Waveforms.*

## Lessons Learned

Building this datapath successfully shifted my perspective from sequential software programming to concurrent hardware design. I gained deep, practical knowledge about managing Control Hazards via flushing, synchronizing asynchronous logic (ALU) with synchronous storage (Registers), and the critical importance of rigorous testbenches in verifying absolute hardware reliability.