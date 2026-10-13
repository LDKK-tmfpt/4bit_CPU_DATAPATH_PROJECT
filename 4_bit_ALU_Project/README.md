# 4-Bit Arithmetic Logic Unit (ALU)

A fully functional, purely combinational 4-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL. This project demonstrates modular hardware design, supporting 10 different operations including arithmetic, bitwise logic, shifting, multiplication, and division, along with accurate status flag generation.

## 📁 Repository Structure

Following standard hardware design practices, the repository is structured as follows:

- **`rtl/`**: Contains the Register Transfer Level (RTL) Verilog source files (the core design modules).
- **`tb/`**: Contains the self-checking testbench files used for behavioral simulation.
- **`sw/`**: (Optional) Reserved for software scripts, memory files, or automated test vector generators.

## ⚙️ Features & Supported Operations

The ALU is controlled by a 4-bit `opcode` and processes two 4-bit inputs (`a` and `b`), yielding an 8-bit `result` and 4 status flags.

### Supported Instructions
| Opcode | Operation | Description |
| :---: | :--- | :--- |
| `0000` | **ADD** | Addition (`a + b`) |
| `0001` | **SUB** | Subtraction via 2's Complement (`a - b`) |
| `0010` | **AND** | Bitwise AND (`a & b`) |
| `0011` | **OR** | Bitwise OR (`a | b`) |
| `0100` | **XOR** | Bitwise XOR (`a ^ b`) |
| `0101` | **NOT** | Bitwise NOT (`~a`) |
| `0110` | **SHL** | Logical Shift Left (`a << 1`) |
| `0111` | **SHR** | Logical Shift Right (`a >> 1`) |
| `1000` | **MUL** | 8-bit Multiplication (`a * b`) |
| `1001` | **DIV** | Division (Quotient & Remainder) |

### Status Flags
- **`Zero (Z)`**: Set if the 8-bit result is strictly `0`.
- **`Negative (N)`**: Set if the most significant bit of the 4-bit signed result is `1`.
- **`Carry (C)`**: Set upon unsigned arithmetic overflow or shifted-out bits.
- **`Overflow (V)`**: Set upon signed arithmetic overflow (using two's complement).

## 🚀 Simulation & Verification

The project includes a robust **Self-Checking Testbench** (`alu_4bit_tb.v`). 
To simulate the project:
1. Open Xilinx Vivado (or any Verilog simulator like ModelSim / Icarus Verilog).
2. Add all `.v` files from the `rtl/` folder as Design Sources.
3. Add the `alu_4bit_tb.v` from the `tb/` folder as the Simulation Source.
4. Set the testbench as the Top Module and Run Behavioral Simulation.
5. The Tcl Console will display `>>> TEST RESULT: PASS` if no logical errors are found.

---
*Designed by Hoang Ngoc Long (SE204586)*