
`include "yIF.v"

module labM7;
    reg [31:0] PCin; 
    reg clk;
    wire [31:0] ins, PCp4;

    yIF my_IF(ins, PCp4, PCin, clk);

    initial begin
        
        PCin = 28;
        
        repeat (11)     
        begin
            
             $display("Instruction=%h", ins);
            
            PCin = PCin + 4;
        end
  
  
    end
    always begin
         clk = ~clk;
        
    end
endmodule