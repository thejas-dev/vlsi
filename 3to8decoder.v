`timescale 1ns/ps


module 3_to8_decoder_tb;
    reg D[2:0];
    wire Y[7:0];
    
    3_to_8_decoder DUT(.D(D),.Y(Y));

    initial begin
        D = 3'b001;
        #10 $display("D=%b,Y=%b",D,Y);
         
        D = 3'b101;
        #10 $display("D=%b,Y=%b",D,Y);
        $finish
    end
endmodule