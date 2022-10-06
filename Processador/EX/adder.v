module Somador(clock, entrada1, entrada2, resultado);
    input clock;
    input [15:0]entrada1;
    input [15:0]entrada2;

    output reg [15:0]resultado;

    always @ (posedge clock or negedge clock)begin
      resultado = entrada1 + entrada2;
    end 
endmodule