`timescale 1ns / 1ps
`include "defines.vh"


module ALU
(
    input[4:0] ALUOp,
    input[31:0] A,
    input[31:0] B,
    output flag,
    output[31:0] result
);


    reg[31:0] result_reg;
    reg flag_reg;
    

always @(*) begin
    case(ALUOp)
        `ALU_ADD : result_reg = A+B;
        `ALU_SUB : result_reg = A-B;
        `ALU_XOR : result_reg = A^B;
        `ALU_SRA : result_reg = $signed(A)>>>$signed(B);
        `ALU_SRL : result_reg = A>>B;
        `ALU_SLL : result_reg = A<<B;
        `ALU_LTS : result_reg = 0;
        `ALU_LTU : result_reg = 0;
        `ALU_GES : result_reg = 0;
        `ALU_GEU : result_reg = 0;
        `ALU_EQ : result_reg = 0;
        `ALU_NE : result_reg = 0;
        `ALU_SLTS : result_reg = $signed(A)<$signed(B);
        `ALU_SLTU : result_reg = A<B;
        `ALU_OR : result_reg = A|B;
        `ALU_AND : result_reg = A&B;
    endcase
end

always @(*) begin
    case(ALUOp)
        `ALU_ADD : flag_reg = 0;
        `ALU_SUB : flag_reg = 0;
        `ALU_XOR : flag_reg = 0;
        `ALU_SRA : flag_reg = 0;
        `ALU_SRL : flag_reg = 0;
        `ALU_SLL : flag_reg = 0;
        `ALU_LTS : flag_reg = $signed(A)<$signed(B);
        `ALU_LTU : flag_reg = A<B;
        `ALU_GES : flag_reg = $signed(A)>= $signed(B);
        `ALU_GEU : flag_reg = A>=B;
        `ALU_EQ : flag_reg = A==B;
        `ALU_NE : flag_reg = A!=B;
        `ALU_SLTS : flag_reg = 0;
        `ALU_SLTU : flag_reg = 0;
        `ALU_OR : flag_reg = 0;
        `ALU_AND : flag_reg = 0;
    endcase
end

assign flag = flag_reg;
assign result = result_reg;

endmodule
