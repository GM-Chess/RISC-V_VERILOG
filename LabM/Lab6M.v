`include "mem.v"

module Lab6M;

reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;

mem mine(memOut, address, memIn, clk, read, write);

initial
begin
    write = 0; read = 1; address = 44;
    repeat (11)
    begin 
        
        #20 $display("memOut=%h \naddress=%d", memOut, address);
        address += 4;
    
        #5 if (memOut[6:0] === 7'h6f)
        $display("UJ-Type");

        #5 if (memOut[6:0] === 7'h3  || memOut === 7'h13)
        $display("I-Type");
        
        #5 if (memOut[6:0] === 7'h23)
        $display("S-Type");

        #5 if (memOut[6:0] === 7'h63) 
        $display("SB-Type");

        
      
    end 
    
   
   
end
    always begin 
        #5 clk = ~clk;
    end 

endmodule 
