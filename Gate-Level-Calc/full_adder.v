module full_adder(
    input A,
    input B,
    input Cin,
    output result,
    output carry
);

    wire s1,c1,c2;

    xor(s1,A,B);
    xor(result,s1,Cin);


    and(c1,A,B);
    and(c2,s1,Cin);

    or(carry,c2,c1);

endmodule