`timescale 1ns/1ns
`include "yMux2.v"
// to display this use sudo apt install gtkwave
// open with $gtkwave 
// run this file from 
module labL2;
    wire [1:0] z;
    integer i, j, k;

    reg[1:0] a, b ;
    reg c;

    yMux2 UUT(z, a, b, c);
    
    initial begin
        $dumpfile("labL2.vcd");
        $dumpvars(0, labL2);

        for (i = 0; i < 4; i = i + 1)
        begin
            for (j = 0; j < 4; j++)
            begin
                for(k = 0; k < 2; k++)
                begin
                    a = i;
                    b = j;
                    c = k;
                    #20;
                    
                    if(c == 0 && z == b) $display("pass c0");
                    else if( c == 1 && z == a) $display("pass c1");
                    else $display("fail a=%d b=%d c=%d z=%b", i, j, k, z);
                end            
            end 
        end
        $finish;
    end



endmodule