`include "muxALUSrc.v"
`include "muxRegDest.v"
`include "adder.v"
`include "Shift_left.v"
`include "ALUControl.v"
`include "ULA.v"
`include "muxForwardA.v"
`include "muxForwardB.v"

module EX(clock, PC4, dado1ALU, dado2ALU, endereco, reg2, reg3, ALUSrc_EX, ALUOpEx, regDestEx, RD, 
          saidaSomador, saidaULA, zeroEx, dado2ALU_out, resultadoALU_MEM, resultadoMux_WB, saidaAfw, saidaBfw);

input  clock;
//entradas do módulo
input [15:0]PC2;
input [15:0]dado1ALU;
input [15:0]dado2ALU;
input [15:0]endereco;
input [2:0]reg2;
input [2:0]reg3;
input ALUSrc_EX;
input [1:0]ALUOpEx;
input regDestEx;
input [15:0]resultadoALU_MEM;
input [15:0]resultadoMux_WB;
input [1:0]saidaAfw;
input [1:0]saidaBfw;

reg [2:0]functEx;


//saidas dos modulos internos

wire [15:0]enderecoSHIFT;
wire [15:0]saidaMuxALUSrc;
wire [2:0]saidaULAControl;
//wire [1:0]saidaAfw;
//wire [1:0]saidaBfw;
wire [15:0]saidaMuxA;
wire [15:0]saidaMuxB;

output [2:0]RD;
output [15:0]saidaSomador;
output [15:0]saidaULA;
output zeroEx;
output reg [15:0]dado2ALU_out;

always @(*)begin
  functEx = endereco[2:0];
  dado2ALU_out = dado2ALU;
end

/*initial begin
  $monitor("clock = %b \n dado1 = %b \n dado2 = %b \n endereco = %b \n endereco deslocado = %b \n reg2 = %b \n reg3 = %b \n ALUSrc = %b \n funct = %b \n ALUOp = %b \n regDest = %b \n PC2 = %b \n saida somador = %b \n saida ULA = %b \n saida reg dest = %b \n", clock, dado1ALU, dado2ALU, endereco, enderecoSHIFT, reg2, reg3, ALUSrc_EX, functEx, ALUOpEx, regDestEx, PC2, saidaSomador, saidaULA, RD);
          clock = 0;
          #5 PC2 =  32'b00000000000000000000000001010101;
          ALUSrc_EX = 0;
          ALUOpEx = 2'b00;
          regDestEx = 0;
          reg2 = 5'b00010;
          reg3 = 5'b00011;
          dado1ALU = 32'b00000000000000000000000000000001;
          dado2ALU = 32'b00000000000000000000000000000001;
          endereco = 32'b00000000000000000000000000100000;
          functEx = endereco[5:0];
          #20 clock = 0;
          $finish;
end

initial begin
  #5 clock = ~clock;
end*/

Shift_left desloca(
	.clock(clock), 
	.sinal(endereco), 
	.sinal_deslocado(enderecoSHIFT));

Somador soma(
	.clock(clock), 
	.entrada1(PC2), 
	.entrada2(enderecoSHIFT), 
	.resultado(saidaSomador));

muxALUSrc muxALUSrcEx(
	.clock(clock), 
	.dado1(dado2ALU),
	.dado2(endereco), 
	.ALUSrc(ALUSrc_EX), 
	.saida(saidaMuxALUSrc));

ALUControl ALUCtrl(
	.clock(clock), 
	.funct(functEx), 
	.ALUOp(ALUOpEx), 
	.saida(saidaULAControl));

muxRegDest muxRD(
	.clock(clock), 
	.r1(reg2), 
	.r2(reg3), 
	.regDest(regDestEx), 
	.saida(RD));

ULA ulaEx(
	.clock(clock), 
	.entrada1(saidaMuxA), 
	.entrada2(saidaMuxB), 
	.ALUControl(saidaULAControl), 
	.zero(zeroEx), 
	.resultado(saidaULA));

muxForwardA fwA(
	.clock(clock), 
	.outputALU(resultadoALU_MEM), 
	.resultadoMuxWB(resultadoMux_WB), 
	.dadoR1(dado1ALU), 
	.forwardA(saidaAfw), 
	.resposta(saidaMuxA));

muxForwardB fwB(
	.clock(clock), 
	.outputALU(resultadoALU_MEM), 
	.resultadoMuxWB(resultadoMux_WB), 
	.dataRegBank2(dado2ALU), 
	.forwardB(saidaBfw), 
	.resposta(saidaMuxB));
endmodule
