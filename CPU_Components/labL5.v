`timescale 1ps/1ps
`include "yAdder1.v"

module labl5;
    
    wire z, cout;
    integer i, j, k;
    reg a, b, cin;
    reg [1:0] expect;


    yAdder1 UUT(z, cout, a, b, cin);
    initial begin
        $dumpfile("labL5.vcd");
        $dumpvars(0, labl5);

        for (i = 0; i < 4; i = i + 1)
        begin
            for (j = 0; j < 4; j++)
            begin
                for(k = 0; k < 4; k++)
                begin
                    a = i;
                    b = j;
                    cin = k;
                    #20;

                    if (cin == 0 && a == 0 && b == 0 && z == 0 && cout == 0)
                        $display("Pass\n");
                    else if (cin == 0 && a == 0 && b == 1 && z == 1 && cout == 0)
                        $display("Pass\n");
                    else if (cin == 0 && a == 1 && b == 0 && z == 1 && cout == 0)
                        $display("Pass\n");
                    else if (cin == 0 && a == 1 && b == 1 && z == 0 && cout == 1)
                        $display("Pass\n");
                    else if (cin == 1 && a == 0 && b == 0 && z == 1 && cout == 0)
                        $display("Pass\n");
                    else if (cin == 1 && a == 1 && b == 0 && z == 0 && cout == 1)
                        $display("Pass\n");
                    else if (cin == 1 && a == 0 && b == 1 && z == 0 && cout == 1)
                        $display("Pass\n");
                    else if (cin == 1 && a == 1 && b == 1 && z == 1 && cout == 1)
                        $display("Pass\n");
                    else
                        $display("Fail! a=%d b=%d cin=%d z=%d cout=%d\n", a, b, cin, z, cout);                    
                end            
            end 
        end
        $finish;
    end



endmodule