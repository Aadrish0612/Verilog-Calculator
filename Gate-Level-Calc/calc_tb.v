`timescale 1ns/1ps

module calc_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] CTRL;

    wire [7:0] result;
    wire carry;
    wire borrow;

    calc uut(
        .A(A),
        .B(B),
        .CTRL(CTRL),
        .result(result),
        .carry(carry),
        .borrow(borrow)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, calc_tb);

        $display("---------------------------------------------------------");
        $display("CTRL\tA\tB\tRESULT\tCARRY\tBORROW");
        $display("---------------------------------------------------------");

        // =====================================
        // ADDITION TESTS
        // CTRL = 00
        // =====================================

        CTRL = 2'b00;

        A = 4'd2;   B = 4'd3;   #10;
        A = 4'd7;   B = 4'd8;   #10;
        A = 4'd15;  B = 4'd15;  #10;

        // =====================================
        // SUBTRACTION TESTS
        // CTRL = 01
        // =====================================

        CTRL = 2'b01;

        A = 4'd7;   B = 4'd3;   #10;
        A = 4'd15;  B = 4'd5;   #10;
        A = 4'd3;   B = 4'd7;   #10;

        // =====================================
        // MULTIPLICATION TESTS
        // CTRL = 10
        // =====================================

        CTRL = 2'b10;

        A = 4'd2;   B = 4'd3;   #10;
        A = 4'd5;   B = 4'd3;   #10;
        A = 4'd15;  B = 4'd15;  #10;

        $finish;

    end

    initial begin
        $monitor("%b\t%d\t%d\t%d\t%b\t%b",
                 CTRL,
                 A,
                 B,
                 result,
                 carry,
                 borrow);
    end

endmodule