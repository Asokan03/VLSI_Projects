# ALU_16op – Verilog Implementation

This project implements a **16-operation Arithmetic Logic Unit (ALU)** in Verilog. The ALU supports a wide range of **arithmetic** and **logic** operations, designed with parameterized input/output widths for flexibility and scalability.

---

## 🔧 Features

- Parameterized:
  - `IN_WIDTH`: Width of operands (default: 8-bit)
  - `OUT_WIDTH`: Width of result (default: 16-bit)

- Supports **16 operations**:  
  - 8 Arithmetic  
  - 8 Logic

- Output Enable (`oe`) signal support  
- High impedance output when `oe = 0`

---

## 📥 Inputs & 📤 Outputs

| Signal       | Width         | Direction | Description                     |
|--------------|---------------|-----------|---------------------------------|
| `a_in`       | IN_WIDTH      | Input     | First operand                   |
| `b_in`       | IN_WIDTH      | Input     | Second operand                  |
| `command_in` | 8 bits        | Input     | Operation selector              |
| `oe`         | 1 bit         | Input     | Output Enable (active high)     |
| `alu_out`    | OUT_WIDTH     | Output    | Result of selected operation    |

---

## 🧮 Operation Codes

### Arithmetic Operations (command_in MSB = 0):

| Operation      | Code (8-bit) | Description                |
|----------------|-------------|----------------------------|
| ADD            | `00000000`  | a + b                      |
| SUB            | `00000001`  | a - b                      |
| MUL            | `00000010`  | a * b                      |
| DIV            | `00000011`  | a / b (b ≠ 0)              |
| INC            | `00000100`  | a + 1                      |
| DEC            | `00000101`  | a - 1                      |
| MOD            | `00000110`  | a % b                      |
| LT             | `00000111`  | (a < b) ? 1 : 0            |

### Logic Operations (command_in MSB = 1):

| Operation      | Code (8-bit) | Description                |
|----------------|-------------|----------------------------|
| AND            | `10000000`  | a & b                      |
| OR             | `10000001`  | a \| b                     |
| XOR            | `10000010`  | a ^ b                      |
| NOT            | `10000011`  | ~a                         |
| LSH            | `10000100`  | a << 1                     |
| RSH            | `10000101`  | a >> 1                     |
| EQ             | `10000110`  | (a == b) ? 1 : 0           |
| NEQ            | `10000111`  | (a != b) ? 1 : 0           |

---

## 🧪 Simulation

- **Simulated using**: Xilinx ISim  
- **Waveforms verified** using testbench  
- Proper handling of divide-by-zero and disabled output (high impedance)

---

## 📁 Files Included

- `alu_16op.v` – RTL module with all 16 operations
- `tb_alu_16op.v` – Testbench file
- `waveform.png` – Simulated waveform snapshot

---

## 🚀 How to Simulate

1. Open your project in **Xilinx ISE**
2. Add `alu_16op.v` and `tb_alu_16op.v`
3. Set `tb_alu_16op.v` as top module for simulation
4. Run Behavioral Simulation and verify output

---

## 📌 Notes

- Handles undefined behavior (`alu_out = 16'hXXXX`) for invalid operations or divide-by-zero
- Outputs high impedance (`Z`) when `oe = 0`
- Extendable design for additional operations via `case` block

---

## 👨‍💻 Author

**Asokan**  
- BE in Electrical and Electronics Engineering (EEE)  
- Currently pursuing M.Tech in VLSI Design at SRM Institute of Science and Technology  
- [LinkedIn](https://www.linkedin.com/in/asokan12)  
- 📧 asokankarunanidhi06@gmail.com

