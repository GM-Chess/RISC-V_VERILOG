`timescale 1ps/1ps
`include "yMux.v"
//`include "yMux1.v"
// to display this use sudo apt install gtkwave
// open with $gtkwave 
// run this file from 
module labL3_;
    wire [63:0] z;
    //integer i, j, k;

    reg[63:0] a, b ;
    reg c;

    yMuxx UUT(z, a, b, c);
    
    initial begin
        $dumpfile("labL3_R.vcd");
        $dumpvars(0, labL3_);
        
        repeat(15) begin
            

            a = $random;
            b = $random;
            c = $random %2;
            #200
            //$display("a=%b\n b=%b\n c=%b\n z=%b\n", a, b, c, z);
            
            if( c == 1 && z == a) $display("pass .\n");
            
            else if(c == 0 && z == b ) $display("pass.\n");

            else $display("fail.\n");
            
            // for this to work we need to be able to use the gates from 
            // from other modules. These gates are called gate primitives
                        
            // if((a && notC) == upper) $display("first AND ok.\n");

            // if((a && b) == sec_and) $display("second AND ok.\n");

            // if( ( ( a && !c ) || ( c && b ) ) == z ) $display(" Mux is good.\n");
            
        end
        $finish;

        
             
    end



endmodule