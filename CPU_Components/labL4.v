`timescale 1ps/1ps
`include "mux4X1.v"
//`include "yMux1.v"
// to display this use sudo apt install gtkwave
// open with $gtkwave 
// run this file from 
module labL4;
    wire [31:0] z;
    
    reg[31:0] a0, a1, a2, a3 ;
    reg [1:0]c;

    yMux4x1 UUT(z, a0, a1, a2, a3, c);
    
    initial begin
        $dumpfile("labL4.vcd");
        $dumpvars(0, labL4);
        
        repeat(15) begin
            

            a0 = $random;
            a1 = $random;
            a2 = $random;
            a3 = $random;
            c = $random %2;
            #200
            
            
            if( c[0] == 0 && c[1] == 0 && z == a0) $display("pass.\n");
            else if( c[0] == 0 && c[1] == 1 && z == a1) $display("pass.\n");
            else if( c[0] == 1 && c[1] == 0 && z == a2) $display("pass.\n");
            if( c[0] == 1 && c[1] == 1 && z == a3) $display("pass.\n"); // for this to work we need to be able to use the gates from 
            //else if( c == 1 && z == a1 ) $display(" pass.\n");
            //else if( c == cd)
            else $display("Fail !! a0=%h a1=%h a2=%h a3=%h c=%h z=%h", a0, a1, a2, a3, c, z);
            
            // from other modules. These gates are called gate primitives
                        
            // if((a && notC) == upper) $display("first AND ok.\n");

            // if((a && b) == sec_and) $display("second AND ok.\n");

            // if( ( ( a && !c ) || ( c && b ) ) == z ) $display(" Mux is good.\n");
            
        end
        $finish;

        
             
    end



endmodule