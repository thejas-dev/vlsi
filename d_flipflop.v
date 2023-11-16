`timescale 1ns/1ps

module d_flipflop(
    D,clk,rst,Q
)
    input D;
    input clk;
    input rst;
    output reg Q;

    always @(posedge rst or posedge clk) begin
        if(rst) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end
endmodule

module d_flipflop_tb;
    reg D;
    reg clk;
    reg rst;
    wire Q;

    d_flipflop DUT(.D(D),.clk(clk),.rst(rsr),.Q(Q));

    initial begin
        D = 1'b0;
        rst = 0;
        clk = 1;

        //D=1 rising clock edge
        #5 D = 1'b1;
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        //D=0 rising clock edge with reset
        # D = 1'b0;
        #5 clk = ~clk; 
        #5 clk = ~clk; 
        #5 rst = 0;

        $finish
    end
endmodule