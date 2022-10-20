`include "MUX.v"
`include "adder.v"
`include "ShiftLeft.v"
`include "ALUControl.v"
`include "ALU.v"


module EX(clock, Branch, Zero, ALUSrc, nextAddress, PC4, funct, ALUOp, dataID1, dataID2, jumpResult, 
            outputBranch, outputALU);


    input clock;
    input Branch;
    input ALUSrc;
    input [15:0]nextAddress;
    input [15:0]PC4;
    input [2:0]funct;
    input [1:0]ALUOp;
    input [15:0]dataID1;
    input [15:0]dataID2;
    
    output [15:0] jumpResult;
    output [15:0]outputALU;
    output [15:0]outputBranch;
    output Zero;

    wire [15:0]outputALUSrc;
    wire [2:0]outputALUControl;
    wire [15:0]shiftedAddress;


    ShiftLeft shift(
        .clock(clock), 
        .signal(nextAddress), 
        .shiftedSignal(shiftedAddress));


    Adder adder(
        .clock(clock), 
        .input1(PC4), 
        .input2(shiftedAddress), 
        .result(jumpResult));


    MUX muxALU(
        .clock(clock), 
        .data1(dataID2),
        .data2(nextAddress), 
        .ctrl(ALUSrc), 
        .outputMux(outputALUSrc));


    ALUControl ALUCtrl(
        .clock(clock), 
        .ALUOp(ALUOp), 
        .funct(funct), 
        .outputALUControl(outputALUControl));


    ALU alu(
        .clock(clock), 
        .input1(dataID1), 
        .input2(outputALUSrc), 
        .ALUControl(outputALUControl), 
        .result(outputALU), 
        .Zero(Zero));

endmodule