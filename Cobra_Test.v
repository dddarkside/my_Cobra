`timescale 1ns / 1ps


module Cobra(input             CLK,
             input             RST,
             input [31:0]      IN, 
             output [31:0]     OUT,
             
             output [7:0]      PC_test,
             output [31:0]     INSTR_test,
             output [31:0]     ALU_test,
             output [31:0]     B_test,
             output [31:0]     A_test,
             output [31:0]     WD_test); 

wire [31:0] INSTR;
wire [31:0] RD12ALU;
wire [31:0] RD22ALU;
reg [31:0] to_wd;
wire [31:0] from_ALU;
wire flag;
reg[7:0] PC = 8'b00000000;
wire[7:0] afterPC = PC;


assign OUT = RD12ALU;
//assign to_wd = INSTR[29]? from_ALU : (INSTR[28] ? (32'b0 + INSTR[27:5]):IN);//0 - IN, 1 - const, 2 - ALU// 0? - right, 1? - left // with SE
always @(*)begin
case( INSTR[29:28])
    0 :  to_wd <= 0;
    1 :  to_wd <= IN;
    2 :  to_wd <= 32'b0 + INSTR[27:5];
    3 :  to_wd <= from_ALU;
endcase
end

always @(posedge CLK) begin
    PC = RST ? 8'b00000000 : (afterPC +      ( (INSTR[31] | (INSTR[30] & flag))?  INSTR[12:5] : 8'b00000001 ));
end


Instruction_mem IM(.A(afterPC),
                   .RD(INSTR));


reg_file RF(.RA1( INSTR[22:18] ),
            .RA2( INSTR[17:13] ),
            .WA( INSTR[4:0] ), 
            .WE( INSTR[29]|INSTR[28] ), 
            .WD( to_wd ), 
            .RD1( RD12ALU ), 
            .RD2( RD22ALU ), 
            .clk(CLK));


ALU ALU(.ALUOp(INSTR[27:23]), 
        .A(RD12ALU), 
        .B(RD22ALU), 
        .flag(flag), 
        .result(from_ALU));

assign PC_test = afterPC;
assign INSTR_test = INSTR;
assign ALU_test = from_ALU;
assign A_test = RD12ALU;
assign B_test = RD22ALU;
assign WD_test = to_wd;
endmodule

// Содержание инструкций

//0010 10101010101010101010101 00001    // Загрузили константу в 1 рег 
//0001 00000000000000000000000 00010    // Приняои извне число во 2 рег
//0011 00101 00001 00010 00000000 00011 // Выполнили сдвиг и сохранинили в рег 3
//0011 00000 00011 00000 00000000 00000 // Вывод(сумма с 0)

