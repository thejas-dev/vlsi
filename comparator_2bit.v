`timescale 1ns/1ps

module comparator_2bit(
    A,B,GT,LT,EQ
)
    input [1:0] A;
    input [1:0] B;
    output GT;
    output EQ;
    output LT;

    assign GT = (A>B);
    assign LT = (A<B);
    assign EQ = (A==B);
endmodule

module comparator_2bit_tb;
    reg [1:0] A;
    reg [1:0] B;
    wire GT;
    wire EQ;
    wire LT;

    comparator_2bit DUT(.A(.A),.B(.B),.GT(.GT),.EQ(.EQ),.LT(.LT));

    initial begin
        A = 2'b01;
        B = 2'b10;
        #10 $display("A=%b,B=%b,GT=%b,EQ=%b,LT=%b",A,B,GT,EQ,LT);

        A = 2'b10;
        B = 2'b11;
        #10 $display("A=%b,B=%b,GT=%b,EQ=%b,LT=%b",A,B,GT,EQ,LT);

        $finish
    end
endmodule