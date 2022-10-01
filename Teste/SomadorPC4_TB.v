`include "SomadorPC4.v"
module SomadorPC4_TB;
    reg clock;
    reg [31:0]PC;
    wire [31:0]PC4;

    initial begin
      $monitor("clock=%b, PC=%b, PC4=%b", clock, PC, PC4);
      clock = 0;
      #5 PC = 32'b00000000000000000000000000000100;
      #5 PC = 32'b00000000000000000000000000001000;
      #5 PC = 32'b00000000000000000000000000001100;
      #5 PC = 32'b00000000000000000000000000010000;
      #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    SomadorPC4 UO(clock,PC,PC4);

endmodule