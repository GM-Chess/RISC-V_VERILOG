
`include "yAdder.v"

module labl6;
    
    wire [31:0]z;
    wire cout;
    integer i, j, k;
    reg [31:0]a, b;
    reg cin, ok;
    reg [31:0] expect;


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
                ok = 1 ;
                $display(ok, z); // this issues are trying to get the bits to alline there is overflow how can i get rid of overflow.
                
            end
             else $display("Fail!!\n e=%b\n z=%b\n a=%b\n b=%b\n cin=%b ok=%b\n This is a new line.\n", expect, z, a, b, cin, ok);

        end
        
        $finish;
    end

endmodule