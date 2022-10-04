`include "PC.v"
`include "SomadorPC4.v"
`include "memoria_instrucao.v"
`include "muxIF.v"

module IF(clock, endereco_desvio, PCSrc, saidaPC4, saidaMem);

input clock;
input [31:0]endereco_desvio;
input PCSrc;


wire [31:0]saidaPC;
output wire [31:0]saidaPC4;
output wire [31:0]saidaMem;
wire [31:0]saidaMux;

/*initial begin
  $monitor("clock = %b \n saida mux = %b \n saida PC = %b \n saida PC4 = %b \n Instrucao = %b", clock, saidaMux,
  saidaPC, saidaPC4, saidaMem);
  clock = 0;
  PCSrc = 0;
  endereco_desvio = 0;
  #10 PCSrc = 0;
  #35 clock = 0;
  $finish;
end

always begin
  #5 clock = ~clock;
end*/

muxIF mux(
	.clock(clock),
	.PCSrc(PCSrc),
	.entradaPC4_mux(saidaPC4),
	.sinal_deslocado(endereco_desvio),
	.resposta(saidaMux));

PC pc(
 .clock(clock),
 .entrada(saidaMux), 
 .saida(saidaPC));

SomadorPC4 pc4(	
 .clock(clock), 
 .PC(saidaPC), 
 .PC4(saidaPC4));

memoria_instrucao memIn(
 .clock(clock),
 .endereco(saidaPC4),
 .instrucaoOut(saidaMem));

endmodule