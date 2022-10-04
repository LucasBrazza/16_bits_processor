`include "PC.v"
`include "SomadorPC4.v"
`include "memoria_instrucao.v"
`include "muxIF.v"

module IFModulo(clk, saidaPC4, instrucaoMemIn, PCSrcIF, branch);
    output [31:0]saidaPC4;
    output [31:0]instrucaoMemIn;
    
    input clk;
    input PCSrcIF;
    input [31:0]branch;
    
    wire PCSrc;
    wire [31:0]entradaPC4;
    wire [31:0]PC;
    wire [31:0]PC4;
    wire [31:0]entrada;
    wire [31:0]saida;
    wire [31:0]entradaPC4_mux;
    wire [31:0]resposta;
    wire [31:0]sinal_deslocado;

    PC UO(.clock(clk), .entrada(resposta), .saida(saida));
    SomadorPC4 U1(.clock(clk), .PC(saida), .PC4(saidaPC4));
    muxIF U2(.clock(clk), .PCSrc(PCSrcIF), .entradaPC4_mux(saidaPC4), .sinal_deslocado(branch), .resposta(resposta));
    memoria_instrucao U3(.clock(clk), .endereco(saida), .instrucaoOut(instrucaoMemIn));
    

endmodule 