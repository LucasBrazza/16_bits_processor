`include "muxWB.v"
//`include "banco_registradores.v"

module WB(clock, dadoLidoWB, resultadoALUWB, memToRegWB, RD, regWrite, saidaMUX, RD_out_WB, regWrite_out);

input clock;
input [31:0]dadoLidoWB;
input [31:0]resultadoALUWB;
input memToRegWB;
input [4:0]RD;
input regWrite; 

output [31:0]saidaMUX;
output reg [4:0]RD_out_WB;
output reg regWrite_out;

//reg [4:0]r1;  //wire
//reg [4:0]r2;  //wire
//wire [31:0]dado_lido1; //wire
//wire [31:0]dado_lido2; //wire

always @(posedge clock or negedge clock)begin
  regWrite_out = regWrite;
  RD_out_WB = RD;
end

/*initial begin
  $monitor("clock = %b\nresultadoAlu = %b\ndadoLido = %b\nresposta = %b\nmemtoreg = %b\nregWrite = %b\nr1 = %b\nr2 = %b\nrd = %b\ndado1 = %b\ndado2 = %b\n", clock, resultadoALUWB, dadoLidoWB, saidaMUX, memToRegWB, regWrite, r1, r2, RD,  dado_lido1, dado_lido2);
    clock = 0;
    #5 resultadoALUWB = 1;
    dadoLidoWB = 2;
    memToRegWB = 0;
    regWrite = 1;
    r1 = 1;
    r2 = 2;
    RD = 3;
    #15 r1 = 3;
    r2 = 3;
    #20 $finish;
end 

always begin
  #5 clock = ~clock;
end*/

muxWB mux(
 .clock(clock), 
 .resultadoALU(resultadoALUWB), 
 .dadoLido(dadoLidoWB),
 .resposta(saidaMUX), 
 .MemtoReg(memToRegWB));


endmodule