` timescale 1ns/1ps

module 4_to_2_encoder(
    D,
    Y
);
    input [3:0] D;
    output [1:0] Y;

    always @(*) begin
        assign Y = 2'b00;

        for (int i =0; i<4;i=i+1) begin
            if(D[i] == 1) begin
                Y[0] = 1;
                Y[1] = i
            end
        end
    end
endmodule

module 4_to_2_encoder_tb;
    reg [3:0] D;
    wire [1:0] Y;

    4_to_2_encoder DUT(.D(D),.Y(.Y));
    initial begin
        D = 4'b0011;
        #10 $display("D=%b,Y=%b",D,Y);

        D = 4'b1100;
        #10 $display("D=%b,Y=%b",D,Y);
        
        $finish
    end
endmodule
