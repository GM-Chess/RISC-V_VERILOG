`include "yArth.v"
`include "mux4X1.v"

module yAlu(z, ex, a, b, op);

    input signed[31:0] a, b;
    input [2:0] op;
    output signed [31:0] z;
    output ex;    
    wire condition;

    wire signed [31:0] zAnd, zOr, zArth;
    wire [31:0] slt; 

    assign slt[31:1] = 0;
    assign ex = 0;    
    xor (condition, a[31], b[31]);

    and aluAND[31:0](zAnd, a, b);
    or aluOR[31:0](zOr, a, b);
    anArth aluARTH(zArth[31:0], ex, a[31:0], b[31:0], op[2]);
    yMux4x1 aluMUX(z[31:0], zAnd[31:0], zOr[31:0], zArth[31:0], slt[31:0], op[1:0]);

    initial begin 
        if(condition === 1) begin
           a[31] = slt[0];
        end
        else begin
           // slt = a[31]-b[31];
        end 
    end
   

endmodule