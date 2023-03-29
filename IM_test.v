`timescale 1ns / 1ps


module IM_test();

reg [7:0] A;
wire [31:0] RD;
Instruction_mem tested(.A(A),.RD(RD));


task t(
input [7:0] a
);
    begin
        #10
        A = a;
    end
endtask


initial begin
    #1
    t(00000000);
    #1
    t(00000000);
    #1
    t(00000000);
    #1
    t(00000001);
end

endmodule
