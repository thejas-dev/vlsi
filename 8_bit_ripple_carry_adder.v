`timescale 1ns/1ps

module 8_bit_ripple_carry_adder(
    A,B,Sum,Cout
)
    input [7:0] A;
    input [7:0] B;
    output [7:0] Sum;
    output Cout;

    wire [7:0] Cin;

    genvar i;
    generate
        for(int i =0 ; i<8; i=i+1) begin:adder_loop
            full_adder full_adder_instance(
                .A(A[i]),.B(B[i]),.Cin(carry[i]),.Sum(Sum[i]),.Cout(carry[i+1])
            )
        end
    endgenerate
    assign carry [0] = 1'b0;
    assign Cout = carry[8];
endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout,
);
    assign Sum = A^B^Cin;
    assign Cout = (A&B) | (B&Cin) | (A&Cin);
endmodule

module 8_bit_ripple_carry_adder_tb;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] Sum;
    wire Cout;

    8_bit_ripple_carry_adder DUT(.A(A),.B(.B),.Sum(.Sum),.Cout(.Cout));

    initial begin
        A=8'b10011000;
        B=8'b10101010;
        #10 $display("A=%h,B=%h,Sum=%h,Cout=%h",A,B,Sum,Cout);

        A=8'b10101010;
        B=8'b10011111;
        #10 $display("A=%h,B=%h,Sum=%h,Cout=%h",A,B,Sum,Cout);

        $finish
    end
endmodule