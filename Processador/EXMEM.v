module EXMEM(clock, resultadoSL2, resultadoALU, dadoR2, rd, regWrite,
            branch, memRead, memWrite, memtoReg, zero, resultadoSL2_out, 
            resultadoALU_out, dadoR2_out, rd_out, regWrite_out, branch_out, 
            memRead_out, memWrite_out, memtoReg_out, zero_out);
    
    input clock;

    input [31:0] resultadoSL2;
    input [31:0] resultadoALU;
    input [31:0] dadoR2;
    input [4:0] rd; //resultadomuxEX
    //input PCSrc;
    input branch;
    input memRead;
    input memWrite;
    input memtoReg;
    input zero;
    input regWrite;

    output reg [31:0] resultadoSL2_out;
    output reg [31:0] resultadoALU_out;
    output reg [31:0] dadoR2_out;
    output reg [4:0] rd_out;
    //output reg PCSrc_out;
    output reg branch_out;
    output reg memRead_out;
    output reg memWrite_out;
    output reg memtoReg_out;
    output reg zero_out;
    output reg regWrite_out;

    always @ (posedge clock)begin
      resultadoSL2_out = resultadoSL2;
      resultadoALU_out = resultadoALU;
      dadoR2_out = dadoR2;
      rd_out = rd;
      branch_out = branch;
      memRead_out = memRead;
      memWrite_out = memWrite;
      memtoReg_out = memtoReg;
      zero_out = zero;
      regWrite_out = regWrite;
    end


endmodule