module Shift_left(clock, sinal, sinal_deslocado);

    input clock;
    input [15:0]sinal;
    output reg [15:0]sinal_deslocado;

    always @ (posedge clock)begin
      sinal_deslocado = sinal<<2;
    end
endmodule