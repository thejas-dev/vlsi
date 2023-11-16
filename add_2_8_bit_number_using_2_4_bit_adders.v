`timescale 1ns/1ps

module adder_2_4_adder(
    A,B,Sum,Cout
);

    input [7:0] A;
    input [7:0] B;
    input [7:0] Sum;
    output Cout;

    wire [3:0] carry;

    assign carry[0] = 1'b0;

    genvar i;
    generate
        for(i=0;i<4;i=i+1) begin:adder_loop
            full_adder full_adder_instance(
                .A(A[i]),
                .B(B[i]),
                .Cin(carry[i]),
                .Sum(Sum[i]),
                .Cout(carry[i+1])
            )
        end
    endgenerate

    assign Cout = carry[4];
endmodule

//testbench

module adder_2_4_adder_tb;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] Sum;
    wire Cout;

    adder_2_4_adder DUT(
        .A(A),
        .B(B),
        .Sum(.Sum),
        .Cout(.Cout)
    )

    initial begin
        A = 8'b10010010;
        B = 8'b10101100;
        #10 $display("A=%h, B=%h, Sum=%h, Cout=%b",A,B,Sum,Cout);;

        A = 8'b11101010;
        B = 8'b10010010;
        #10 $display("A=%h, B=%h, Sum=%h, Cout=%b",A,B,Sum,Cout);;


        $finish         
    end
endmodule
