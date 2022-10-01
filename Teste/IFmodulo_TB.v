`include "IFModulo.v"

module IFModulo_TB;

    reg clk;
    reg PCSrc;
    reg [31:0]branch;


    wire [31:0]saidaPC4;
    wire [31:0]instrucaoMemIn;
    wire [31:0]entradaPC4;
    wire [31:0]PC;
    wire [31:0]PC4;
    wire [31:0]entrada;
    wire [31:0]saida;
    wire [31:0] entradaPC4_mux;
    wire [31:0] sinal_deslocado;

    initial begin
      $monitor("clock = %b, instrucao = %b, PC4 = %b", clk, instrucaoMemIn, saidaPC4);
      clk = 0;
        #5 PCSrc = 1;
          branch = 32'b0000000000000000000000000000011;
        #20 $finish;
    end

    always begin
      #5 clk = !clk;
    end

    IFModulo UTB(clk, saidaPC4, instrucaoMemIn, PCSrc, branch);
endmodule