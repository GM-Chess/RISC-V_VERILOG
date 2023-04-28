`include "yMux1.v"
module yyMux(z, a, b, c);
parameter SIZE = 64;
output [SIZE-1:0] z;
input [ SIZE-1 : 0] a, b;
input c;
mux1 mine[SIZE - 1 : 0](z, a, b, c);
endmodule