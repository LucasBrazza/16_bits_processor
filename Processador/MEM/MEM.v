`include "../Processador\MEM\DataMemory.v"
`include "../Processador\MEM\Branch.v"

module MEM(clock, resultULA, writeDataMEM, RegDst, shiftPC, MemRead, MemWrite, Zero, Branch, 
            outputDataReadMEM, PCSrc, outputMemULA, outputRegDst, outputShiftPC);

    input clock;
    input MemRead;
    input MemWrite;
    input Zero;
    input Branch;
    input [15:0]resultULA;
    input [15:0]writeDataMEM;
    input [2:0]RegDst;
    input [15:0]shiftPC;

    output PCSrc;
    output [15:0]outputDataReadMEM;
    output reg [15:0]outputMemULA;
    output reg [2:0]outputRegDst;
    output reg [15:0]outputShiftPC;

    always @(posedge clock or negedge clock)begin
        outputMemULA = resultULA;
        outputRegDst = RegDst;
        outputShiftPC = shiftPC;
    end

    DataMemory dataMem(
        .clock(clock),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(resultULA),
        .writeData(writeDataMEM),
        .dataRead(outputDataReadMEM));

    Branch branch(
        .clock(clock),
        .s1(Branch),
        .s2(Zero),
        .outputBranch(PCSrc));

endmodule