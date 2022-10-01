`include "modulo.v"


module modulo_tb;

    wire [31:0]PC4;
    reg clock;
    wire [31:0]PC;
    wire [31:0]saida;
    reg [31:0]entrada;

    initial begin
      $monitor("clock = %b, PC4 = %b", clock, PC4);
      clock = 0;
      #5 entrada = 32'b00000000000000000000000000000100;
      #20 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    modulo U3(clock, PC, PC4);
endmodule