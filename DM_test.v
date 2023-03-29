`timescale 1ns / 1ps
//`include "E:/Programming/verilog/just_comp/project_1/project_1.srcs/sources_1/new/Clock.v"

module DM_test();

reg CLK = 0;
reg [31:0] WD;
reg        WE;
reg [31:0] A;
wire [31:0] RD;



//Clock clock(.clk(CLK));
Data_mem tested(.CLK(CLK),.A(A),.WD(WD),.WE(WE),.RD(RD));



initial begin
    forever begin
    #10 CLK = ~CLK;
    end
end

initial begin
    t(1*4,0,0);
    #20
    t(0,1,32'b11111111111111111111111111111111);
    #20
    t(0,0,0);
    #20
    t(2*4,0,0);
end

task t(
input [31:0] a,
input        we,
input [31:0] wd
);
    begin
        A = a;
        WE = we;
        WD = wd;
        $display(RD,WD,"\n");
    end
endtask

endmodule
