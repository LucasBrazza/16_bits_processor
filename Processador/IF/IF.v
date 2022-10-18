`include "PC.v"
`include "AddPC4.v"
`include "InstructionMemory.v"
`include "MuxIF.v"

module IF(clock, shiftAddress, PCSrc, outputPC4, outputMEM);

    input clock;
    input [15:0] shiftAddress;
    input PCSrc;

    wire [15:0]outputMux;
    wire [15:0]outputPC;

    output wire [15:0]outputPC4;
    output wire [15:0]outputMEM;


    MuxIF mux(
        .clock(clock),
        .PCSrc(PCSrc),
        .inputPC4Mux(outputPC4),
        .signalShifted(shiftAddress),
        .response(outputMux));

    PC pc(
        .clock(clock),
        .entrada(outputMux), 
        .saida(outputPC));

    AddPC4 pc4(	
        .clock(clock), 
        .PC(outputPC), 
        .PC4(outputPC4));

    InstructionMemory memIn(
        .clock(clock),
        .endereco(outputPC4),
        .instrucaoOut(outputMEM));

endmodule