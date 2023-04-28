`include "cpu.v"
`include "rf.v"
module yID(rd1,rd2,immOut,jTarget,branch,ins,wd,RegWrite,clk);
output[31:0] rd1, rd2, immOut, jTarget;
input[31:0] ins,wd;
input RegWrite,clk;
wire[19:0] zeros,ones;
wire[11:0] zerosj,onesj;
wire[31:0] imm,saveImm;


rf myRF(rd1,rd2,ins[19:15],ins[24:20],ins[11:7],wd,clk,RegWrite);


assign imm[11:0]= ins[31:20];
assign zeros = 20'h00000;
assign ones = 20'hFFFFF;


yMux #(20) sumName(imm[31:12],zeros,ones,ins[31]);


assign saveImm[11:5] =ins[31:25];
assign saveImm[4:0] =ins[11:7];


yMux #(20) (saveImm[31:12],zeros,ones,ins[31]);
yMux #(32) immSelection(immOut,imm,saveImm,ins[5]);


assign branch[11] =ins[31];
assign branch[10]= ins[7];
assign branch[9:4] = ins[11:8];


yMux #(20) bra(branch[31:12],zeros,ones,ins[31]);


assign zerosj = 20'h000;
assign onesj = 20'hFFF;
assign jTarget [19] = ins[31];
assign jTarget [18:11] = ins[19:12];
assign jTarget[10] =ins[20];
assign jTarget[9:0] =ins[30:21];


yMux #(12) jum(jTarget[31:20],zerosj,onesj, jTarget[19]);


endmodule
 