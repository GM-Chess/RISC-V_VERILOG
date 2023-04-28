`timescale 1ps/1ps
`include "yArth.v"

module labl8;
    
    wire signed [31:0]z;
    wire cout;
    integer i, j, k;
    reg signed [31:0]a, b;
    reg r, ok;
    reg signed  [31:0] expect;


    anArth UUT(z, cout, a, b, r);

    initial begin
        
        repeat(10) begin
            a = $random;
            b = $random;
            r = $random%2;
            ok = 0;
            #200

            //expect = a + b;
            $display("a=%b",b);
            if(r === 1)begin

                expect = a - b;
                if(expect === z)
                $display("pass");
                else $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n r=%b ok=%b\n This is a new line.\n", expect, z, a, b, r, ok);

               
                
            end
             else  begin
                expect = a + b;
                if ( expect === z )
                $display("pass");
                else $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n r=%b ok=%b\n This is a new line.\n", expect, z, a, b, r, ok);

             end


        end
        
        $finish;
    end

endmodule