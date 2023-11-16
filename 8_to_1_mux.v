`timescale 1ns/1ps

module 8_to_1_mux(
    D,S,Y
)
    input [7:0] D;
    input [2:0] S;
    output Y;

    assign Y = D[S];

endmodule

module 8_to_1_mux_tb;
    reg [7:0] D;
    reg [2:0] S;
    wire Y;

    initial begin
        D = 8'b10010111;
        S = 3'101;
        #5 $display("D=%h,S=%b",D,S);

        D = 8'b10011000;
        S = 3'b111;
        # $display("D=%h,S=%b",D,S);

        $finish
    end
endmodule