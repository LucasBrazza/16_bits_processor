`include "memoria_dados.v"
`include "branch.v"

module MEM(clock, saidaULAMem, dadoEscritaMem, RD, PCdesvio, memReadMem, memWriteMem, zero, branch, dadoLidoMem_out, PCSrc, saidaULAMem_out, RD_out, PCdesvio_out);

    input clock;
    input [31:0]saidaULAMem;
    input [31:0]dadoEscritaMem;
    input [4:0]RD;
    input [31:0]PCdesvio;
    input memReadMem;
    input memWriteMem;
    input zero;
    input branch;


    output [31:0]dadoLidoMem_out;
    output PCSrc;
    output reg [31:0]saidaULAMem_out;
    output reg [4:0]RD_out;
    output reg [31:0]PCdesvio_out;

    always @(posedge clock or negedge clock)begin
      saidaULAMem_out = saidaULAMem;
      RD_out = RD;
      PCdesvio_out = PCdesvio;
    end

    /*initial begin
      $monitor("clock = %b \nendereco = %b \ndado escrita = %b \nRD = %b \nPC desvio = %b\nmemRead = %b \nmemWrite = %b \nzero = %b \nM = %b \ndado lido = %b \nbranch = %b\n\n",
      clock, saidaULAMem, dadoEscritaMem, RD, PCdesvio, memReadMem, memWriteMem, zero, M, dadoLidoMem, branchMem);
      clock = 0;
      #5 saidaULAMem = 0;
      memWriteMem = 1;
      dadoEscritaMem = 0;
      RD = 5'b00001;
      PCdesvio = 4;
      memReadMem = 0;
      zero = 1;
      M = 0;
      #10 saidaULAMem = 0;
      memReadMem = 1;
      memWriteMem = 0;
      dadoEscritaMem = 1;
      RD = 5'b00010;
      PCdesvio = 8;
      zero = 1; 
      M = 1;
      #10 $finish;

    end

    always begin
        #5 clock = !clock;
    end*/

    memoria_dados memData(
	  .clock(clock),
	  .memRead(memReadMem),
	  .memWrite(memWriteMem),
	  .endereco(saidaULAMem),
	  .dadoEscrita(dadoEscritaMem),
	  .dadoLido(dadoLidoMem_out));

    branch brnch(
	  .clock(clock),
	  .s1(M),
	  .s2(zero),
	  .r(PCSrc));

endmodule