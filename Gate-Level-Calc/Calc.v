module calc(
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] CTRL,

    output reg [7:0] result,
    output reg carry,
    output reg borrow
);

    wire [3:0] add_result;
    wire add_carry;

    wire [3:0] sub_result;
    wire sub_borrow;

    wire [7:0] mul_result;

    // Addition Module
    adder4 ADD(
        .A(A),
        .B(B),
        .result(add_result),
        .carry(add_carry)
    );

    // Subtraction Module
    subtractor4 SUB(
        .A(A),
        .B(B),
        .result(sub_result),
        .borrow(sub_borrow)
    );

    // Multiplication Module
    multiplier4 MUL(
        .A(A),
        .B(B),
        .product(mul_result)
    );

    always @(*) begin

        result = 8'b0;

        carry  = 1'bx;
        borrow = 1'bx;

        case(CTRL)

            // Addition
            2'b00: begin
                result = {4'b0000, add_result};
                carry  = add_carry;
            end

            // Subtraction
            2'b01: begin
                result = {4'b0000, sub_result};
                borrow = sub_borrow;
            end

            // Multiplication
            2'b10: begin
                result = mul_result;
            end

            default: begin
                result = 8'b0;
            end

        endcase

    end

endmodule