module Somador(clock, entrada1, entrada2, resultado);
    input clock;
    input [31:0]entrada1;
    input [31:0]entrada2;

    output reg [31:0]resultado;

    always @ (posedge clock or negedge clock)begin
      resultado = entrada1 + entrada2;
    end 
endmodule