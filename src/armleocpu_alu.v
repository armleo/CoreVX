`include "armleocpu_includes.vh"

module armleocpu_alu(
    input [`ARMLEOCPU_ALU_SELECT_WIDTH-1:0] select_result, // selects output mux
    input               shamt_sel, // Selects SHAMT as shift amount
    
    input      [4:0]    shamt,
    input      [31:0]   op1,
    input      [31:0]   op2,

    output reg [31:0]   result
);

/* verilator lint_off WIDTH */
wire [4:0] internal_shamt   = shamt_sel ? shamt: op2[4:0];
/* verilator lint_on WIDTH */

wire [31:0] internal_adder_op2 = (select_result == `ARMLEOCPU_ALU_SELECT_SUB) ? -op2 : op2;

wire [31:0] add_result = op1 + op2;

always @* begin
    case(select_result)
        `ARMLEOCPU_ALU_SELECT_ADD:        result = add_result;
        `ARMLEOCPU_ALU_SELECT_SUB:        result = add_result;
        /* verilator lint_off WIDTH */
        `ARMLEOCPU_ALU_SELECT_SLT:        result = ($signed(op1) < $signed(op2));
        `ARMLEOCPU_ALU_SELECT_SLTU:       result = ($unsigned(op1) < $unsigned(op2));
        /* verilator lint_on WIDTH */
        `ARMLEOCPU_ALU_SELECT_SLL:        result = op1 << internal_shamt;
        /* verilator lint_off WIDTH */
        `ARMLEOCPU_ALU_SELECT_SRA:        result = {{32{op1[31]}}, op1} >> internal_shamt;
        /* verilator lint_on WIDTH */
        `ARMLEOCPU_ALU_SELECT_SRL:        result = op1 >> internal_shamt;
        
        `ARMLEOCPU_ALU_SELECT_XOR:        result = op1 ^ op2;
        `ARMLEOCPU_ALU_SELECT_OR:         result = op1 | op2;
        `ARMLEOCPU_ALU_SELECT_AND:        result = op1 & op2;
        default: begin
            result = add_result;
        end
    endcase
end

endmodule