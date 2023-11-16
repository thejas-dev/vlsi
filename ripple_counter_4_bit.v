`timescale 1ns/1ps

module ripple_counter_4_bit(
    clk,
    Q
);
    input wire clk;
    output wire [3:0] Q;

    reg [3:0] count;
    count = 4'b0000;
    always @(posedge clk) begin
        if(count == 4'b1111) begin
            count = 4'b0000;
        end else begin
            count = count + 1'b1;
        end
    end

    assign Q = count;
endmodule

module ripple_counter_4_bit_tb;
    reg clk;
    wire [3:0] Q;

    ripple_counter_4_bit DUT(
        .clk(clk),
        .Q(Q)
    )

    initial begin
        clk = 0;

        repeat (16) begin
            #clk = ~clk;
        end
        $finish
    end
endmodule
    

