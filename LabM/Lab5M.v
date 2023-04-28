`include "mem.v"

module Lab5M;

reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;

mem mine(memOut, address, memIn, clk, read, write);

initial
begin
    write = 0; read = 1; address = 0;
    repeat (11)
    begin 
        
        #20 $display("memOut=%h", memOut);
        address += 4;
        

      
    end 
    
   
   
end
    always begin 
        #5 clk = ~clk;
    end 

endmodule 
