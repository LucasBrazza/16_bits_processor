`include "Somador.v"

module Somador_TB;
    reg clock;
    reg [31:0]entrada1;
    reg [31:0]entrada2;

    wire [31:0]resultado;

    initial begin
        $monitor("clock = %b, entrada 1 = %b, entrada 2 = %b, saida = %b", clock, entrada1, entrada2, resultado);
        clock = 0;
        #5 entrada1 = 32'b00000000000000000000000000000001;
        entrada2 = 32'b00000000000000000000000000000011;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    Somador UO(clock, entrada1, entrada2, resultado);

endmodule