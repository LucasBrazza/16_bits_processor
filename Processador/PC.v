module PC(clock, entrada, saida);

input clock;
input [31:0]entrada;

output reg [31:0]saida = 0;

always @ (posedge clock or negedge clock)begin
  saida = entrada;
end

endmodule