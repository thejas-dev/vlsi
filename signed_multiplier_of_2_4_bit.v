`timescale 1ns/1ps

module signed_multiplier_4_bit(
    A,B,P
)
    input signed [3:0] A;
    input signed [3:0] B;
    output signed [7:0] P;

    assign P = A * B;
endmodule 

module signed_multiplier_4_bit_tb;
    reg signed [3:0] A;
    reg signed [3:0] B;
    wire signed [7:0] P;

    signed_multiplier_4_bit DUT(
        .A(A),.B(B),.P(P)
    )

    initial begin
        A = 8'b0001;
        B = 8'b0000;
        #10 $display("A=%h,B=%h,P=%h",A,B,P);

        A = 8'b1001;
        B = 8'b1111;
        #10 $display("A=%h,B=%h,P=%h",A,B,P);

        $finish
    end
endmodule
