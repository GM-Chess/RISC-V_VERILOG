`include "mem.v"

module Lab3M;

reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;

mem mine(memOut, address, memIn, clk, read, write);

initial
begin
    clk = 0;
    write = 1;
    memIn = 32'h12345678;
    address = 16;
    clk = 1;
    #1;
    
    clk = 0;
    write = 1;
    memIn = 32'h89abcdef;
    address = 24;
    clk = 1;
    #1;
    
    write = 0; read = 1;
    address = 16;
    repeat (3)
    begin
        #1 $display("address=%d, contains=%d read=%d write=%d clk=%d\n", address, memOut, read, write, clk);
        address += 4;
    end
    $finish;
end


endmodule 