`include "DataMemory.v"
`include "Branch.v"

module MEM(clock, MemRead, MemWrite, Zero, Branch, address, writeData, RegDst, PCSrc, outputDataRead);

    input clock;
    input MemRead;
    input MemWrite;
    input Zero;
    input Branch;
    input [15:0]address;
    input [15:0]writeData;
    input RegDst;

    output PCSrc;
    output [15:0]outputDataRead;

    DataMemory dataMem(
        .clock(clock),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(address),
        .writeData(writeData),
        .dataRead(outputDataRead));


    Branch branch(
        .clock(clock),
        .s1(Branch),
        .s2(Zero),
        .outputBranch(PCSrc));

endmodule