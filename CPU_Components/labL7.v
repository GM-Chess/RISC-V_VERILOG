`timescale 1ps/1ps
`include "yAdder.v"

module labl7;
    
    wire signed [31:0]z;
    wire cout;
    integer i, j, k;
    reg signed [31:0]a, b;
    reg cin;
    reg signed [31:0] expect;


    anAdder UUT(z, cout, a, b, cin);

    initial begin
        
        repeat(10) begin
            a = $random;
            b = $random;
            cin = 0;
            
            #200

            expect = a + b;
            $display("a=%b",b);
            if(expect === z)begin
               
                $display(z); // this issues are trying to get the bits to alline there is overflow how can i get rid of overflow.
                
            end
             else $display("Fail!!  expect=%d\n z=%b\n a=%b\n b=%b\n cin=%b \n This is a new line.\n", expect, z, a, b, cin);

        end
        
        $finish;
    end

endmodule