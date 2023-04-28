`include "yAdder.v"


module anArth(z, cout, a, b, r);

   output [31:0] z;
   output cout;
   input [31:0] a, b;
   input r;
   wire [31:0]  tmp;
   wire cin;
   wire [31:0] notB;
   
   xor my_xor[31:0](notB, b, r);
   anAdder mine(z, cout, a, notB, r);
   

   
  
   
endmodule