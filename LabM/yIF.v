`include "cpu.v"
`include "mem.v"


module yIF(ins, PCp4, PCin, clk);
    output [31:0] ins, PCp4;
    input [31:0] PCin;
    input clk;
    wire zero;
    reg[2:0] op;
    wire [31:0]  memIn;
    reg read, write, enable;
    wire[1:0] d;
    wire[31:0] q;
    reg[31:0] a;
    


    yAlu mine(PCp4[31:0], zero, a[31:0], q[31:0], op[2:0]);
    mem memes(ins[31:0], q[31:0], memIn[31:0], clk, 1'b1, 1'b0  );
    register #(32) PCreg(q, PCin, clk, 1'b1);

    always begin 
        //assign zero = 0; 
        #2 assign a = 4;
        #2 assign enable = 1;
        
        $finish;

    end 

endmodule
`include "ff.v"

module register(q, d, clk, enable);
/****************************
An Edge-Triggerred Register.
Written by H. Roumani, 2008.
****************************/

parameter SIZE = 32;
output [SIZE-1:0] q;
input [SIZE-1:0] d;
input clk, enable;

ff myFF[SIZE-1:0](q, d, clk, enable);

endmodule
