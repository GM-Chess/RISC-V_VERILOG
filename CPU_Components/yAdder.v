`include "yAdder1.v"

module anAdder(z, cout, a, b, cin);
    
    output [31:0] z;
    output cout;

    input [31:0] a, b;
    input cin;

    wire [31:0] in, out;

    assign in[0]= cin;
    assign in[31:1]= out[30:0];

    yAdder1 mine[31:0](z, out, a, b, in);

    //assign z[31] = out[31]

  
endmodule