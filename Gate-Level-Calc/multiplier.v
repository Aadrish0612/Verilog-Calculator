module multiplier4(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] product
);

    // Partial Products
    wire p00,p01,p02,p03;
    wire p10,p11,p12,p13;
    wire p20,p21,p22,p23;
    wire p30,p31,p32,p33;

    and(p00,A[0],B[0]);
    and(p01,A[0],B[1]);
    and(p02,A[0],B[2]);
    and(p03,A[0],B[3]);

    and(p10,A[1],B[0]);
    and(p11,A[1],B[1]);
    and(p12,A[1],B[2]);
    and(p13,A[1],B[3]);

    and(p20,A[2],B[0]);
    and(p21,A[2],B[1]);
    and(p22,A[2],B[2]);
    and(p23,A[2],B[3]);

    and(p30,A[3],B[0]);
    and(p31,A[3],B[1]);
    and(p32,A[3],B[2]);
    and(p33,A[3],B[3]);

    // Internal wires
    wire s1,c1;
    wire s2,c2,s3,c3;
    wire s4,c4,s5,c5,s6,c6;
    wire s7,c7,s8,c8,s9,c9;
    wire s10,c10,s11,c11;

    // Product bit 0
    assign product[0] = p00;

    // Column 1
    half_adder HA1(
        p01,
        p10,
        s1,
        c1
    );

    assign product[1] = s1;

    // Column 2
    full_adder FA1(
        p02,
        p11,
        p20,
        s2,
        c2
    );

    half_adder HA2(
        s2,
        c1,
        s3,
        c3
    );

    assign product[2] = s3;

    // Column 3
    full_adder FA2(
        p03,
        p12,
        p21,
        s4,
        c4
    );

    full_adder FA3(
        s4,
        p30,
        c2,
        s5,
        c5
    );

    half_adder HA3(
        s5,
        c3,
        s6,
        c6
    );

    assign product[3] = s6;

    // Column 4
    full_adder FA4(
        p13,
        p22,
        p31,
        s7,
        c7
    );

    full_adder FA5(
        s7,
        c4,
        c5,
        s8,
        c8
    );

    half_adder HA4(
        s8,
        c6,
        s9,
        c9
    );

    assign product[4] = s9;

    // Column 5
    full_adder FA6(
        p23,
        p32,
        c7,
        s10,
        c10
    );

    full_adder FA7(
        s10,
        c8,
        c9,
        s11,
        c11
    );

    assign product[5] = s11;

    // Column 6
    full_adder FA8(
        p33,
        c10,
        c11,
        product[6],
        product[7]
    );

endmodule