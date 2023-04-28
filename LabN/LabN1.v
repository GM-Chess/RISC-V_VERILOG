`include "cpu.v"

module LabN1;
reg[31:0] Point, isbranch, isjump, mem2Reg, memRead, memWrite, wb, ins,  rd1, rd2, ALUSrc;
reg clk, INT, zero;
reg[2:0] op;
wire[31:0] z;

// controls ALUSrc, regwrite, mem2reg, memread, memwrite, isjump, isbranch


yPC pCmInE( z[31:0], rd1[31:0], rd2[31:0], INT, Point[31:0], branchImm[31:0], jImm[31:0], zero[31:0], isbranch[31:0],isjump[31:0]);

initial begin
    Point = 32'h28;
    INT = 1; #1;
    repeat (43) begin 
        clk = 1; #1;
        INT = 0;

        isjump = 0;
        isbranch = 0;
        //regWrite = 0;
        ALUSrc = 1; 
        op = 3'b010;
        memRead = 0;
        memWrite = 0;
        mem2Reg = 0;
        clk = 0; #1;

        $display("%h:  rd1=%2d rd2=%2d z=%3d zero=%b wb=%2d\n", ins, rd1, rd2, z, zero, wb);
    end 
    $finish;
end
endmodule