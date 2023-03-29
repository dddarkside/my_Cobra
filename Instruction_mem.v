`timescale 1ns / 1ps

module Instruction_mem
(
    input   [7:0]   A,     // ������ 8-������ �������� ����
    output [31:0]   RD    // 32-������ ����� ��������� ������
);

    reg [31:0] RAM [0:255];   // ������� ������ � 256-� 32-������� ��������

    initial $readmemb("mem.mem", RAM);  // ��������� ��� ������� ���������� �
                                        // ������ RAM ���������� ����� mem.mem
                                        
    assign RD = RAM[A];   // ���������� ����� �� ������

endmodule