module mux1(z, a, b, c);
    output z;
    input a, b, c;
    wire notC, upper, lower;
    not (notC, c);    // C is the input not is the wire output connecting to the first AND 
    and first_and(upper, b, c);
    and sec_and(lower, a, notC);
    or ( z, upper, lower); // this will or togther the results//and (T1, D1, S), (T2, D0, Sbar);
//not (Sbar, S);
//or (Y, T1, T2);
endmodule