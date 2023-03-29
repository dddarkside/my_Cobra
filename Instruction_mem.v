`timescale 1ns / 1ps

module Instruction_mem
(
    input   [7:0]   A,     // первый 8-битный адресный вход
    output [31:0]   RD    // 32-битный выход считанных данных
);

    reg [31:0] RAM [0:255];   // создать пам€ть с 256-ю 32-битными €чейками

    initial $readmemb("mem.mem", RAM);  // поместить при запуске микросхемы в
                                        // пам€ть RAM содержимое файла mem.mem
                                        
    assign RD = RAM[A];   // реализаци€ порта на чтение

endmodule