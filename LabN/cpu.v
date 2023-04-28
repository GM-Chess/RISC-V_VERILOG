module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodule

module yMux(z, a, b, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a, b;
input c;

yMux1 mux1[SIZE-1:0](z, a, b, c);

endmodule

module yMux4to1(z, a0,a1,a2,a3, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] zLo, zHi;

yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);

endmodule

module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;

xor left_xor(tmp, a, b);
xor right_xor(z, cin, tmp);
and left_and(outL, a, b);
and right_and(outR, tmp, cin);
or my_or(cout, outR, outL);

endmodule


module yAdder(z, cout, a, b, cin);
output [31:0] z;
output cout;
input cin;
input [31:0] a, b;
wire[31:0] in, out;

yAdder1 mine[31:0](z, out, a, b, in);
assign in[0] = cin;
assign in[31:1] = out[30:0];
assign cout = out[31];

endmodule

module yArith(z, cout, a, b, ctrl);
// add if ctrl=0, subtract if ctrl=1 
output [31:0] z;
output cout;
input [31:0] a, b;
input ctrl;
wire[31:0] B;
wire cin;

xor b_comp[31:0](B, b,ctrl);
assign cin = ctrl;
yAdder add(z, cout, a, B, cin);

endmodule

module yAlu(z, zero, a, b, op);
// op=000: z=a&b, op=001: z=a|b, op=010: z=a+b, op=110: z=a-b, op=111: z=a<b?1:0
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output zero;
wire [31:0] zAnd, zOr, zArith, slt;
wire condition;

assign slt[31:1] = 0;
xor (condition, a[31], b[31]);
yMux #(1) sltMux(slt[0], zArith[31], a[31], condition);

and myAnd[31:0] (zAnd, a, b);
or myOr[31:0] (zOr, a, b);
yArith myArith (zArith, cout, a, b, op[2]);
yMux4to1 #(32) myMux(z, zAnd, zOr, zArith, slt, op[1:0]);

wire [7:0] z8; wire [1:0] z2; wire z1;
or or8[7:0] (z8, z[31:24], z[23:16], z[15:8], z[7:0]);
or or2[1:0] (z2, z8[7:6], z8[5:4], z8[3:2], z8[1:0]);
or or1[0:0] (z1, z2[1], z2[0]);
not last(zero, z1);

endmodule


`include "mem.v"
module yDM( memOut, exeOut, rd2, clk, memRead, memWrite);
output[31:0] memOut;
input[31:0] exeOut, rd2;
input clk, memRead, memWrite;

mem mine(memOut[31:0], exeOut[31:0], rd2[31:0], clk, read, write);

endmodule

module yWB(wb, exeOut, memOut, mem2reg);
output[31:0] wb;
input[31:0] exeOut, memOut;
input mem2reg;

yMux #(32) aMUX(wb, exeOut, memOut, mem2reg);

endmodule

`include "register.v"
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

module yPC(PCin, PC, PCp4,INT, entryPoint,branchImm,jImm,zero,isbranch,isjump);
output [31:0] PCin;
input [31: 0] PC, PCp4, entryPoint, branchImm;
input [31:0] jImm;
input INT, zero, isbranch, isjump;
wire [31:0] branchImmX4, jImmX4, jImmX4PPCp4, bTarget, choiceA, choiceB;
wire doBranch, zf;
// Shifting left branchImm twice
assign branchImmX4[31:2] = branchImm[29:0];
assign branchImmX4[1:0] = 2'b00;
// Shifting left jump twice
assign jImmX4[31:2] = jImm[29:0];
assign jImmX4[1:0] = 2'b00;
// adding PC to shifted twice,
//Replace ? in the yPC module with proper entries
yAlu bALU(bTarget, zf, PC, branchImmX4, 3'b010);
// adding PC to shifted twice, jImm
//Replace ? in the yPC module with proper entries.
yAlu jALU(jImmX4PPCp4, zf, PCp4, jImmX4, 3'b010);
// deciding to do branch
and (doBranch, isbranch, zero) ;
yMux # (32) mux1 (choiceA, PCp4, bTarget, doBranch);
yMux #(32) mux2 (choiceB, choiceA, jImmX4PPCp4, isjump);
yMux # (32) mux3(PCin, choiceB, entryPoint, INT);
endmodule
