`timescale 1ns/1ns
`include "yMux1.v"
// to display this use sudo apt install gtkwave
// open with $gtkwave 
// run this file from 
module labL1;
    wire z;
    integer i, j, k;

    reg a, b, c;
    mux1 UUT(z, a, b, c);
    
    initial begin
        $dumpfile("labL1.vcd");
        $dumpvars(0, labL1);

        for (i = 0; i < 2; i = i + 1)
        begin
            for (j = 0; j < 2; j++)
            begin
                for(k = 0; k < 2; k++)
                begin
                    a = i;
                    b = j;
                    c = k;
                    #20;
                    //$display("i=%5d j=%5d k=%5d\n", i, j, k);

                    if( c === 0 && z === a) $display("pass c0");
                    else if( c === 1 && z === b) $display("pass c1");
                    else $display("fail a=%1b b=%1b c=%1b z=%b", i, j, k, z);

                
                end            
            end 
        end
        $finish;
    end



endmodule