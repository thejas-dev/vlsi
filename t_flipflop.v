`timescale 1nd/1ps

module t_flipflop(
    clk,T,Q
)

    input clk;
    input T;
    output Q;

    always @(posedge clk) begin
        if(T) begin
            Q <= ~Q;
        end
    end
endmodule

module t_flipflop_tb;
    reg clk;
    reg T;
    wire reg Q;

    t_flipflop DUT(.T(T),.clk(clk),.Q(Q));

    initial begin
        T = 0;
        clk = 0;

        //apply toogle
        T = 1;
        clk = ~clk;
        clk = ~clk;
        #5 $display("At time %t, Toggle is active Q=%b",$time,Q);

        
        //release toogle
        T = 0;
        clk = ~clk;
        clk = ~clk;
        #5 $display("At time %t, Toggle is released Q=%b",$time,Q);

        
        //apply toogle for multiple time
        T = 1;
        clk = ~clk;
        clk = ~clk;
        #5 $display("At time %t, Toggle is active Q=%b",$time,Q);

        T = 0;
        clk = ~clk;
        clk = ~clk;
        #5 $display("At time %t, Toggle is released Q=%b",$time,Q);
        
        $finish
    end
endmodule