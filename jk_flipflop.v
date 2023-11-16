`timescale 1ns/1ps

module jk_flipflop(
    J,K,rst,clk,Q,Qn
)
    input J;
    input K;
    input rst;
    input clk;
    output reg Q;
    output reg Qn;

    always @(posedge rst or posedge clk) begin
        if(rst) begin
            Q <= 1'b0;
            Qn <= 1'b0;
        end else begin
            case ({J,K})
                2'b00 : begin
                    Q <= Q;
                    Qn <= Qn;
                end
                2'b01 : begin
                    Q <= 1'b0;
                    Qn <= 1'b1;
                end
                2'b10 : begin
                    Q <= 1'b0;
                    Qn <= 1'b1;
                end 
                2'b11 : begin
                    Q <= ~Q;
                    Qn <= ~Qn;
                end
            endcase
        end
    end
endmodule

module jk_flipflop_tb;
    reg clk;
    reg rst;
    reg J;
    reg K;
    wire Q;
    wire Qn;

    jk_flipflop DUT(.J(J),.K(K),.clk(clk),.rst(rst),.Q(Q),.Qn(Qn));

    initial begin
        J=0;
        K=0;
        clk = 0;
        rst = 0;

        // apply reset
        #5 rst = 1;
        #5 rst = 0;
        
        //repeat for 20 cycles
        repeat (20) begin
            #5 clk=~clk;
            #5 J=~J;
            #5 K=~K;
            #5 $display("At time %t,Q=%b,Qn=%b",$time,Q,Qn);
        end
                
        $finish
    end
endmodule