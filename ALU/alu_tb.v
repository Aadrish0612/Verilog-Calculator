`timescale 1ns/1ps

module alu_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] CTRL;

    wire [7:0] result;
    wire Z;
    wire C;
    wire N;
    wire E;

    // Unit Under Test
    alu uut (
        .A(A),
        .B(B),
        .CTRL(CTRL),
        .result(result),
        .Z(Z),
        .C(C),
        .N(N),
        .E(E)
    );

    initial begin
      
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        $display("----------------------------------------------------");
        $display("CTRL\tA\tB\tRESULT\tZ\tC\tN\tE");
        $display("----------------------------------------------------");

        // Addition
        A = 4'd8;  B = 4'd7;  CTRL = 3'b000; #10;

        // Addition with carry
        A = 4'd15; B = 4'd15; CTRL = 3'b000; #10;

        // Subtraction (positive)
        A = 4'd10; B = 4'd4;  CTRL = 3'b001; #10;

        // Subtraction (negative flag)
        A = 4'd3;  B = 4'd7;  CTRL = 3'b001; #10;

        // Multiplication
        A = 4'd5;  B = 4'd3;  CTRL = 3'b010; #10;

        // Multiplication max case
        A = 4'd15; B = 4'd15; CTRL = 3'b010; #10;

        // Division
        A = 4'd8;  B = 4'd2;  CTRL = 3'b011; #10;

        // Divide by zero
        A = 4'd8;  B = 4'd0;  CTRL = 3'b011; #10;

        // AND
        A = 4'd12; B = 4'd10; CTRL = 3'b100; #10;

        // OR
        A = 4'd12; B = 4'd10; CTRL = 3'b101; #10;

        // XOR
        A = 4'd12; B = 4'd10; CTRL = 3'b110; #10;

        // NOT
        A = 4'd12; B = 4'd0;  CTRL = 3'b111; #10;

        $finish;

    end

    initial begin
        $monitor("%b\t%d\t%d\t%d\t%b\t%b\t%b\t%b",
                 CTRL, A, B, result, Z, C, N, E);
    end

endmodule