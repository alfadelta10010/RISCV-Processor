# Control logic tables

#### ALU:
|`alu_op`| Inst | Opcode | f3 | f7 |
|:---:|:----:|:-----:|:-:|:----:|
| 0000 | ADD | 0110011/0010011 | 000 | 0000000 |
| 0001 | SLL | 0110011/0010011 | 001 | 0000000 |
| 0010 | SLT* | 0110011/0010011 | 010 | 0000000 |
| 0011 | SLTU | 0110011/0010011 | 011 | 0000000 |
| 0100 | XOR | 0110011/0010011 | 100 | 0000000 |
| 0101 | SRL | 0110011/0010011 | 101 | 0000000 |
| 0110 | OR | 0110011/0010011 | 110 | 0000000 |
| 0111 | AND | 0110011/0010011 | 111 | 0000000 |
| 1000 | SUB | 0110011 | 000 | 0100000 |
| 1001 | UNUSED | - | - | - | 
| 1010 | UNUSED | - | - | - | 
| 1011 | UNUSED | - | - | - |
| 1100 | UNUSED | - | - | - |
| 1101 | SRA | 0110011/0010011 | 101 | 0100000 |
| 1110 | UNUSED | - | - | - | 
| 1111 | UNUSED | - | - | - |

#### Branch Controller:
|`branch_ctrl`| Inst | Opcode | f3 | f7 |
|:---:|:----:|:-----:|:-:|:----:|
| 000 | BEQ | 1100011 | 000 | N/A |
| 001 | BNE | 1100011 | 001 | N/A |
| 011 | UNUSED | - | - | - |
| 100 | BLT* | 1100011 | 100 | N/A |
| 110 | BLTU | 1100011 | 110 | N/A |
| 101 | BGE* | 1100011 | 101 | N/A |
| 111 | BGEU | 1100011 | 111 | N/A |

#### Control Signals:
| `reg_wr` | `mem_rd` | `mem_wr` | `alu_s1` | `alu_s2` | `wb_ctrl` | Operation | Opcode | `alu_op` |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|1|0|0|1|1|01|R-type| 0110011 | `alu_op` |
|1|0|0|1|0|01|IR-Type| 0010011 | `alu_op` |
|1|1|0|1|0|00|IL-Type| 0000011 | 0000 |
|0|0|1|1|0|XX/00/01|S-Type| 0100011 | 0000 |
|0|0|0|0|0|XX/00/01|Branch-type| 1100011 | XXXX |
|1|0|0|1|0|01|LUI| 0110111 | 0000 |
|1|0|0|0|0|01|AUIPC| 0010111 | 0000 |
|1|0|0|0|0|10|JAL| 1101111 | 0000 |
|1|0|0|1|0|10|JALR| 1100111 | 0000 |
