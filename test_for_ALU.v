`timescale 1ns / 1ps
`include "defines.vh"


module test_for_ALU();
reg[0:4]ALUOp;
reg[31:0]A,B;
wire flag;
wire[31:0] result;
ALU_main tested(.ALUOp(ALUOp),.A(A),.B(B),.flag(flag),.result(result));

task check(
    input[31:0] a,b,
    input[4:0] kod
    );
    begin
        A = a;
        B = b;
        ALUOp = kod;
        #100
        $display("RESULT:",result,"FLAG:",flag);
    end
endtask

initial begin
    check( 0 , 0 ,`ALU_ADD );
    check( 0 , 1 ,`ALU_ADD );
    check( 1 , 0 ,`ALU_ADD );
    check( 1 , 1 ,`ALU_ADD );
    check( 0 , 0 ,`ALU_SUB );
    check( 0 , 1 ,`ALU_SUB );
    check( 1 , 0 ,`ALU_SUB );
    check( 1 , 1 ,`ALU_SUB );
    check( 0 , 0 ,`ALU_XOR );
    check( 0 , 1 ,`ALU_XOR );
    check( 1 , 0 ,`ALU_XOR );
    check( 1 , 1 ,`ALU_XOR );
    check( 0 , 0 ,`ALU_OR );
    check( 0 , 1 ,`ALU_OR );
    check( 1 , 0 ,`ALU_OR );
    check( 1 , 1 ,`ALU_OR );
    check( 0 , 0 ,`ALU_AND );
    check( 0 , 1 ,`ALU_AND );
    check( 1 , 0 ,`ALU_AND );
    check( 1 , 1 ,`ALU_AND );
    check( 0 , 0 ,`ALU_SRA );
    check( 0 , 1 ,`ALU_SRA );
    check( 1 , 0 ,`ALU_SRA );
    check( 1 , 1 ,`ALU_SRA );
    check( 0 , 0 ,`ALU_SRL );
    check( 0 , 1 ,`ALU_SRL );
    check( 1 , 0 ,`ALU_SRL );
    check( 1 , 1 ,`ALU_SRL );
    check( 0 , 0 ,`ALU_SLL );
    check( 0 , 1 ,`ALU_SLL );
    check( 1 , 0 ,`ALU_SLL );
    check( 1 , 1 ,`ALU_SLL );
    check( 0 , 0 ,`ALU_LTS );
    check( 0 , 1 ,`ALU_LTS );
    check( 1 , 0 ,`ALU_LTS );
    check( 1 , 1 ,`ALU_LTS );
    check( 0 , 0 ,`ALU_LTU );
    check( 0 , 1 ,`ALU_LTU );
    check( 1 , 0 ,`ALU_LTU );
    check( 1 , 1 ,`ALU_LTU );
    check( 0 , 0 ,`ALU_GES );
    check( 0 , 1 ,`ALU_GES );
    check( 1 , 0 ,`ALU_GES );
    check( 1 , 1 ,`ALU_GES );
    check( 0 , 0 ,`ALU_GEU );
    check( 0 , 1 ,`ALU_GEU );
    check( 1 , 0 ,`ALU_GEU );
    check( 1 , 1 ,`ALU_GEU );
    check( 0 , 0 ,`ALU_EQ );
    check( 0 , 1 ,`ALU_EQ );
    check( 1 , 0 ,`ALU_EQ );
    check( 1 , 1 ,`ALU_EQ );
    check( 0 , 0 ,`ALU_NE );
    check( 0 , 1 ,`ALU_NE );
    check( 1 , 0 ,`ALU_NE );
    check( 1 , 1 ,`ALU_NE );
    check( 0 , 0 ,`ALU_SLTS );
    check( 0 , 1 ,`ALU_SLTS );
    check( 1 , 0 ,`ALU_SLTS );
    check( 1 , 1 ,`ALU_SLTS );
    check( 0 , 0 ,`ALU_SLTU );
    check( 0 , 1 ,`ALU_SLTU );
    check( 1 , 0 ,`ALU_SLTU );
    check( 1 , 1 ,`ALU_SLTU );   
    end
    
    endmodule
