//`include "banco_registradores.v"

module WB(clock, MemtoReg, dataReadMEM, resultALU, outputWB);

    input clock;
    input MemtoReg;
    input [15:0]dataReadMEM;
    input [15:0]resultALU;

    output [15:0]outputWB;

    MUX muxWB(
        .clock(clock), 
        .data1(dataReadMEM),
        .data2(resultALU), 
        .ctrl(MemtoReg),
        .outputMux(outputWB)
    );

endmodule