//4 bit ripple carry adder
//`include "half_adder.v"
//`include "full_adder.v"

module adder4(
    input [3:0] A,
    input [3:0] B,
    output [3:0] result,
    output carry
);
    wire c1,c2,c3;
    

    half_adder ha0(A[0],B[0],result[0],c1);
    full_adder fa1(A[1],B[1],c1,result[1],c2);
    full_adder fa2(A[2], B[2], c2, result[2],c3);
    full_adder fa3(A[3], B[3], c3, result[3], carry);

endmodule