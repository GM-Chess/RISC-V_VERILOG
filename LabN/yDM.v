`include "mem.v"
module yDM( memOut, exeOut, rd2, clk, memRead, memWrite);
output[31:0] memOut;
input[31:0] exeOut, rd2;
input clk, memRead, memWrite;

mem mine(memOut[31:0], exeOut[31:0], memIn[31:0], clk, read, write);

endmodule