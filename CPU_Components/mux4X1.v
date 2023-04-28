`include "ReMux.v"

module yMux4x1(z, a0, a1, a2, a3, c);
    parameter SIZE = 32;
    output [SIZE - 1 : 0] z;
    input [SIZE - 1 : 0] a0, a1, a2, a3;
    input [1 : 0] c;
    wire [SIZE -1 : 0] zLo, zHigh ;
    yyMux #(SIZE) lo(zLo, a0, a1, c[0]);
    yyMux #(SIZE) hi(zHigh, a2, a3, c[0]);
    yyMux #(SIZE) final(z, zLo, zHigh, c[1]);
endmodule