`include "register.v"

module labM;
    reg [31:0] d;
    reg clk, enable, flag;
    wire [31:0] z;

     register #(32) mine(z, d, clk, enable);
    
    initial begin

        repeat(10) begin
        #2; d = $random; clk = 0; enable = 1;  
        $display("clk=%b, d=%d, z=%d,", clk, d, z);
        
        end
        $finish;
    end 

    always begin 
        #5 clk = ~clk;
    end 

    

endmodule