`timescale 1ns / 1ps
//`include "E:/Programming/verilog/just_comp/project_1/project_1.srcs/sources_1/new/Clock.v"

module gen_test();

reg CLK = 0;
reg RST = 0;
reg[31:0] IN = 0;
wire[31:0] OUT;

wire [7:0] PC;
wire [31:0] INSTR;
wire [31:0] ALU;
wire [31:0] A;
wire [31:0] B;
wire [31:0] WD;


//Clock clock(.clk(CLK));
Cobra tested(.CLK(CLK),.RST(RST),.IN(IN),.OUT(OUT),.PC_test(PC),.INSTR_test(INSTR),.ALU_test(ALU),.A_test(A),.B_test(B),.WD_test(WD));



initial begin
    forever begin
    #10 CLK = ~CLK;
    end
end

initial begin
    t(10, 0);
end

task t(
input [31:0] in,
input        rst
);
    begin
        IN = in;
        RST = rst;
        $display(OUT);
    end
endtask

endmodule
