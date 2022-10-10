`include "MuxWB.v"
//`include "banco_registradores.v"

module WB(clock, dataReadMEM, resultULAEXE, MemtoReg, RegDst, RegWrite, outputMUX, outputRegDst, outputRegWrite);

input clock;
input [15:0]dataReadMEM;
input [15:0]resultULAEXE;
input MemtoReg;
input [2:0]RegDst;
input RegWrite; 

output [15:0]outputMUX;
output reg [2:0]outputRegDst;
output reg outputRegWrite;

//reg [4:0]r1;  //wire
//reg [4:0]r2;  //wire
//wire [31:0]dado_lido1; //wire
//wire [31:0]dado_lido2; //wire

always @(posedge clock or negedge clock)begin
    outputRegWrite = RegWrite;
    outputRegDst = RegDst;
end

/*initial begin
  $monitor("clock = %b\nresultadoAlu = %b\ndadoLido = %b\nresposta = %b\nmemtoreg = %b\nregWrite = %b\nr1 = %b\nr2 = %b\nrd = %b\ndado1 = %b\ndado2 = %b\n", clock, resultULAEXE, dataReadMEM, outputMUX, MemtoReg, RegWrite, r1, r2, RegDst,  dado_lido1, dado_lido2);
    clock = 0;
    #5 resultULAEXE = 1;
    dataReadMEM = 2;
    MemtoReg = 0;
    RegWrite = 1;
    r1 = 1;
    r2 = 2;
    RegDst = 3;
    #15 r1 = 3;
    r2 = 3;
    #20 $finish;
end 

always begin
  #5 clock = ~clock;
end*/

MuxWB mux(
    .clock(clock), 
    .resultadoALU(resultULAEXE), 
    .dadoLido(dataReadMEM),
    .resposta(outputMUX), 
    .MemtoReg(MemtoReg));

endmodule