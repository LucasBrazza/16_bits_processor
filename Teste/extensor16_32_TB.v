`include "extensor16_32.v"

module extensor16_32_TB;
    reg clock;
    reg [15:0]sinal16;
    wire [31:0]sinal32;

    initial begin
      $monitor("clock=%b, sinal 32=%b, sinal 16=%b", clock, sinal32, sinal16);
      clock = 0;
      #5 sinal16 = 16'b0101010101010101;
      #5 sinal16 = 16'b1111110101010101;
      #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    extensor16_32 UO(clock, sinal16, sinal32);

endmodule


