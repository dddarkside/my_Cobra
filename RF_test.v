`timescale 1ns / 1ps


module RF_test();
    
    
reg CLK = 0;
reg [31:0] WD;
reg        WE;
reg [4:0] A1;
reg [4:0] A2;
reg [4:0] WA;

wire [31:0] RD1;
wire [31:0] RD2;



//Clock clock(.clk(CLK));
reg_file tested(.clk(CLK),.WA(WA),.RA1(A1),.RA2(A2),.WD(WD),.WE(WE),.RD1(RD1),.RD2(RD2));



initial begin
    forever begin
    #10 CLK = ~CLK;
    end
end

initial begin
    t(0,1,1,1,10);//записываем в 1 - 10
    #20
    t(0,1,2,1,9);//записываем в 2 - 9
    #20
    t(1,2,0,1,10);// смотрим 1 и 2
    #20
    t(0,1,0,1,11);//пытаемся записатьв 0
    #20
    t(0,1,0,0,0);// смоьтри 0
end

task t(
input [4:0]  a1,
input [4:0]  a2,
input [4:0]  wa,
input        we,
input [31:0] wd
);
    begin
        A1 = a1;
        A2 = a2;
        WA = wa;
        WE = we;
        WD = wd;
    end
endtask

endmodule
