`timescale 1ps/1ps
`include "yMux.v"
// to display this use sudo apt install gtkwave
// open with $gtkwave 
// run this file from 
module labL3;
    wire [63:0] z;
    integer i, j, k;

    reg[63:0] a, b ;
    reg c;

    yMuxx UUT(z, a, b, c);
    
    initial begin
        $dumpfile("labL3.vcd");
        $dumpvars(0, labL3);

        for (i = 0; i < 31; i = i + 1)
        begin
            for (j = 0; j < 31; j++)
            begin
                for(k = 0; k < 31; k++)
                begin
                    a = i;
                    b = j;
                    c = k;
                    #20000; // for this i adjusted the clk this is to help veiwer experiance inside gtkwave 
                    // when you open gtkwave use the minus symbol to zoom out it will help with the graph
                    $display("i=%5d j=%5d k=%5d\n", i, j, k);
                end            
            end 
        end
        $finish;
    end



endmodule