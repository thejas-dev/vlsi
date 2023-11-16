`timescale 1ns/1ps

module multiplier_4bit(
    A,B,P
)
    input [3:0] A;
    input [3:0] B;
    output [7:0] P;

    assign P = A*B;
endmodule

module multiplier_4bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] P;

    multiplier_4bit DUT(
        .A(.A),
        .B(.B),
        .P(.P)
    )

    initial begin
        A = 4'b0010;
        B = 4'b0100;

        #10 A = 4'b1010;
        #10 B = 4'b1011;

        #10 A = 4'b1111;
        #10 B = 4'1101
        $finish
    end
endmodule
