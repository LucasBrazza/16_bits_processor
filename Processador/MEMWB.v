module MEMWB(clock, dadoMemoria, resultadoALU, rd, memtoReg, regWrite, dadoMemoria_out, resultadoALU_out, rd_out, memtoReg_out, regWrite_out);

    input clock;

    input [31:0] dadoMemoria;
    input [31:0] resultadoALU;
    input [4:0] rd;
    input memtoReg;
    input regWrite;

    output reg [31:0] dadoMemoria_out;
    output reg [31:0] resultadoALU_out;
    output reg [4:0] rd_out;
    output reg memtoReg_out;
    output reg regWrite_out;

    always @(negedge clock)begin
        dadoMemoria_out = dadoMemoria;
        resultadoALU_out = resultadoALU;
        rd_out = rd;
        memtoReg_out = memtoReg;
        regWrite_out = regWrite;
    end
endmodule