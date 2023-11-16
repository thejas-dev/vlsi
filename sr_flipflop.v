`timescale 1ns/1ps

module sr_flipflop(
    S,R,clk,Q
)
    input S;
    input R;
    input clk;
    output reg Q;

    always @(posedge clk) begin
        if(S && ~R) begin
            Q <= 1'b1;
        end else if(~S && R) begin
            Q <= 1'b0;
        end else if(S && R) begin
            Q <= Q;
        end else begin
            Q <= Q;
        end
    end
endmodule

module sr_flipflop_tb;
    reg S;
    reg R;
    reg clk;
    wire Q;

    sr_flipflop DUT(.S(S),.R(R),.clk(clk),.Q(Q));

    initial begin
        S=0;
        R=0;
        clk=0;
        
        //Apply set
        #5 S=1;
        #5 clk=~clk;
        #5 clk=~clk;
        #5 $display("At time %t: Set is active, Q=%b",$time,Q);

        //Apply reset
        #5 R=1;
        #5 clk=~clk;
        #5 clk=~clk;
        #5 $display("At time %t: Reset is active, Q=%b",$time,Q);
        
        //Release set & reset
        #5 S=0;R=0;
        #5 clk=~clk;
        #5 clk=~clk;
        #5 $display("At time %t: Both Set & Reset is released, Q=%b",$time,Q);
        
        $finish
    end
endmodule