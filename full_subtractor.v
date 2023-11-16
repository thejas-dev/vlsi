`timescale 1ns/1ps

module full_subtractor(
    A,B,Bin,Bout,Diff
)

    input A;
    input B;
    input Bin;
    output Bout;
    output Diff;

    assign Diff = a ^ b ^ Bin;
    assign Bout = ((!A & B) | (Bin & (A ^ B)));
endmodule

//testbench


module full_subtractor_tb;
    reg A;
    reg B;
    reg Bin;
    wire Bout;
    wire Diff;

    full_subtractor DUT(.A(A),.B(.B),.Bin(.Bin),.Bout(.Bout),.Diff(.Diff));

    initial begin
        A=1'b0;
        B=1'b1;
        Cin=1'b0;
        #10 $display("A=%b,B=%b,Cin=%b,Diff=%b,Bout=%b",A,B,Cin,Diff,Bout);

        A=1'b1;
        B=1'b0;
        Cin=1'b0;
        #10 $display("A=%b,B=%b,Cin=%b,Diff=%b,Bout=%b",A,B,Cin,Diff,Bout);

        $finish
    end
endmodule