module yMux1;
    integer i, j, k;
    output z;
    reg a, b, c;
    wire notC, upper, lower;
    not (notC, c);    // C is the input not is the wire output connecting to the first AND 
    and first_and(upper, a, notC);
    and sec_and(lower, b, c);
    or ( z, upper, lower); // this will or togther the results
     initial begin
        for (i = 0; i < 2; i = i + 1)
        begin
            for (j = 0; j < 2; j++)
            begin
                for(k = 0; k < 2; k++)
                begin
                a = i;
                b = j;
                c = k;
                #1 $display("a=%2b b=%2b c=%2b z=%b \n", a, b, c, z);
                #2 $display("i=%5d j=%5d k=%5d\n", i, j, k);
                end            
            end 
        end
        $finish;
     end
endmodule