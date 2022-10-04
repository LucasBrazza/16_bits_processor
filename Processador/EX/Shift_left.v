module Shift_left(clock, sinal, sinal_deslocado);

    input clock;
    input [31:0]sinal;
    output reg [31:0]sinal_deslocado;

    always @ (posedge clock)begin
      sinal_deslocado = sinal<<2;
    end
endmodule