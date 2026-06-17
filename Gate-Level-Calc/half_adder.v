module half_adder(
    input A,
    input B,
    output result,
    output carry
);

    xor(result,A,B);
    and(carry,A,B);


endmodule