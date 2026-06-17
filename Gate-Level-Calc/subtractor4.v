module subtractor4(
    input[3:0] A,
    input[3:0] B,
    output[3:0] result,
    output borrow
);

    wire[3:0] B_comp;

    not(B_comp[0], B[0]);
    not(B_comp[1], B[1]);
    not(B_comp[2], B[2]);   
    not(B_comp[3], B[3]);

    full_adder fa0(A[0], B_comp[0], 1'b1, result[0], c1);
    full_adder fa1(A[1], B_comp[1], c1,   result[1], c2);
    full_adder fa2(A[2], B_comp[2], c2,   result[2], c3);
    full_adder fa3(A[3], B_comp[3], c3,   result[3], c4);

    not(borrow, c4);

endmodule