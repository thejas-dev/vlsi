`timescale 1ns/1ps

module 2_bit_complement_adder(
    A,B,D,D,Sum
)
    input signed [7:0] A;
    input signed [7:0] B;
    input signed [7:0] C;
    input signed [7:0] D;
    output signed [7:0] Sum;

    assign Sum = A + B + C + D;
endmodule

module 2_bit_complement_adder_tb;
    reg signed [7:0] A;
    reg signed [7:0] B;
    reg signed [7:0] C;
    reg signed [7:0] D;
    wire signed [7:0] Sum;

    2_bit_complement_adder DUT(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .SumO(Sum)
    );

    initial begin

        A = 8'b10010010;
        B = 8'b10111111;
        C = 8'b11010101;
        D = 8'b11100000;
        #10 $display("A=%h,B=%h,C=%h,D=%h,Sum=%h",A,B,C,D,Sum);

        A = 8'b11010101;
        B = 8'b10111111;
        C = 8'b11100000;
        D = 8'b10010010;
        #10 $display("A=%h,B=%h,C=%h,D=%h,Sum=%h",A,B,C,D,Sum);

        $finish
    end
endmodule
