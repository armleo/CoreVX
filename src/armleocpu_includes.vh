// ALU_OUTPUT_SELECT
`define ALU_SELECT_ADD 4'd0
`define ALU_SELECT_SUB 4'd1
`define ALU_SELECT_SLT 4'd2
`define ALU_SELECT_SLTU 4'd3
`define ALU_SELECT_SLL 4'd4
`define ALU_SELECT_SRA 4'd5
`define ALU_SELECT_SRL 4'd6
`define ALU_SELECT_XOR 4'd7
`define ALU_SELECT_OR 4'd8
`define ALU_SELECT_AND 4'd9

`define ALU_SELECT_WIDTH 4

// LD_TYPE
`define LOAD_BYTE (3'b000)
`define LOAD_BYTE_UNSIGNED (3'b100)
`define LOAD_HALF (3'b001)
`define LOAD_HALF_UNSIGNED (3'b101)
`define LOAD_WORD (3'b010)

// ST_TYPE
`define STORE_BYTE (2'b00)
`define STORE_HALF (2'b01)
`define STORE_WORD (2'b10)

// CSR CMD
`define ARMLEOCPU_CSR_CMD_NONE (4'd0)
`define ARMLEOCPU_CSR_CMD_READ (4'd1)
`define ARMLEOCPU_CSR_CMD_WRITE (4'd2)
`define ARMLEOCPU_CSR_CMD_READ_WRITE (4'd3)
`define ARMLEOCPU_CSR_CMD_READ_SET (4'd4)
`define ARMLEOCPU_CSR_CMD_READ_CLEAR (4'd5)
`define ARMLEOCPU_CSR_CMD_MRET (4'd6)
`define ARMLEOCPU_CSR_CMD_SRET (4'd7)
`define ARMLEOCPU_CSR_CMD_INTERRUPT_BEGIN (4'd8)


// Exceptions and interrupts
`define EXCEPTION_CODE_INTERRUPT (32'h8000_0000)
`define INTERRUPT_CODE_SOFTWATE_INTERRUPT (3)
`define INTERRUPT_CODE_TIMER_INTERRUPT (7)
`define INTERRUPT_CODE_EXTERNAL_INTERRUPT (11)

`define EXCEPTION_CODE_SOFTWATE_INTERRUPT (`INTERRUPT_CODE_SOFTWATE_INTERRUPT | `EXCEPTION_CODE_INTERRUPT)
`define EXCEPTION_CODE_TIMER_INTERRUPT (`INTERRUPT_CODE_TIMER_INTERRUPT | `EXCEPTION_CODE_INTERRUPT)
`define EXCEPTION_CODE_EXTERNAL_INTERRUPT (`INTERRUPT_CODE_EXTERNAL_INTERRUPT | `EXCEPTION_CODE_INTERRUPT)

`define EXCEPTION_CODE_INSTRUCTION_ADDRESS_MISSALIGNED (0)
`define EXCEPTION_CODE_INSTRUCTION_ACCESS_FAULT (1)
`define EXCEPTION_CODE_ILLEGAL_INSTRUCTION (2)
`define EXCEPTION_CODE_BREAKPOINT (3)
`define EXCEPTION_CODE_LOAD_ADDRESS_MISSALIGNED (4)
`define EXCEPTION_CODE_LOAD_ACCESS_FAULT (5)
`define EXCEPTION_CODE_STORE_ADDRESS_MISSALIGNED (6)
`define EXCEPTION_CODE_STORE_ACCESS_FAULT (7)

// Calls from x privilege
`define EXCEPTION_CODE_UCALL (8)
`define EXCEPTION_CODE_SCALL (9)
`define EXCEPTION_CODE_MCALL (11)
`define EXCEPTION_CODE_INSTRUCTION_PAGE_FAULT (12)
`define EXCEPTION_CODE_LOAD_PAGE_FAULT (13)
`define EXCEPTION_CODE_STORE_PAGE_FAULT (15)

// Privilege modes
// Sv means supervisor, because spp can only hold one bit
`define ARMLEOCPU_PRIVILEGE_USER (2'b00)
`define ARMLEOCPU_PRIVILEGE_USER_SV (1'b0)
`define ARMLEOCPU_PRIVILEGE_SUPERVISOR (2'b01)
`define ARMLEOCPU_PRIVILEGE_SUPERVISOR_SV (1'b1)
`define ARMLEOCPU_PRIVILEGE_MACHINE (2'b11)



// Decode output bits, semi-one-hot
// Multiple bits can be high at the same time

`define DECODE_IS_OP_IMM 0
`define DECODE_IS_OP 1
`define DECODE_IS_JALR 2
`define DECODE_IS_JAL 3
`define DECODE_IS_LUI 4
`define DECODE_IS_AUIPC 5
`define DECODE_IS_BRANCH 6
`define DECODE_IS_STORE 7
`define DECODE_IS_LOAD 8


`define DECODE_IS_MUL 9
`define DECODE_IS_MULH 10
`define DECODE_IS_MULHSU 11
`define DECODE_IS_MULHU 12

`define DECODE_IS_DIV 13
`define DECODE_IS_DIVU 14

`define DECODE_IS_REM 15
`define DECODE_IS_REMU 16

`define DECODE_IS_EBREAK 17

`define DECODE_IS_ECALL 18
`define DECODE_IS_WFI 19
`define DECODE_IS_MRET 20
`define DECODE_IS_SRET 21

`define DECODE_CACHE_FLUSH 22

`define DECODE_IS_CSRRW_CSRRWI 23
`define DECODE_IS_CSRS_CSRSI 24
`define DECODE_IS_CSRC_CSRCI 25

`define DECODE_IS_CSR 26

`define DECODE_LOAD_RESERVE 27
`define DECODE_STORE_CONDITIONAL 28

// contains decode's output length
`define DECODE_IS_WIDTH 29



`define OPCODE_LUI (7'b0110111)
`define OPCODE_AUIPC (7'b0010111)
`define OPCODE_JAL (7'b1101111)
`define OPCODE_JALR (7'b1100111)
`define OPCODE_BRANCH (7'b1100011)
`define OPCODE_LOAD (7'b0000011)
`define OPCODE_STORE (7'b0100011)
`define OPCODE_OP_IMM (7'b0010011)
`define OPCODE_OP (7'b0110011)
`define OPCODE_FENCE (7'b0001111)
`define OPCODE_SYSTEM (7'b1110011)



