`include "yAlu.v"

module labl9;
    
    wire signed [31:0]z;
    integer i, j, k;
    reg signed [31:0]a, b;
    reg [2:0]op, flag;
    reg signed  [31:0] expect;


    yAlu UUT(z, ex, a, b, op);

    initial begin
        
        repeat(10) begin
            a = $random;
            b = $random;
            op = $random%7;
            //flag = $value$plusargs("op=%d", op);
            #1

            
            
            if(op === 0 || op === 4 )begin

                expect = a & b;

                if(expect === z)

                    $display("pass");

                else 

                    $display("Fail!!   expect=%b\n z=%b\n a=%b\n b=%b\n op=%b\n This is a new line.\n", expect, z, a, b, op);

               
                
            end
             else if (op === 1 || op === 5)  begin

                expect = a | b;

                if ( expect === z )

                    $display("pass");

                else 

                    $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n op=%b\n This is a new line.\n", expect, z, a, b, op);

             end
             else if (op === 2 || op === 6) begin 

                if (op === 2) begin
                    
                    expect = a + b;

                    if (expect === z) 

                        $display("pass");

                    else 
                        $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n op=%b\n This is a new line.\n", expect, z, a, b, op);

                    

                end 
                else begin
                    
                    expect = a - b;

                    if(expect === z)

                        $display("pass");

                    else
                    
                        $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n op=%b\n This is a new line.\n", expect, z, a, b, op);
 


                end
             end
                else if ( z === 0 )

                    $display("pass");

                else 
                    
                    $display("Fail!!  expect=%b\n z=%b\n a=%b\n b=%b\n op=%b\n This is a new line.\n", expect, z, a, b, op);



                



             end 

             $finish;

        end
        
       
    

endmodule