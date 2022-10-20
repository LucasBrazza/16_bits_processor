`include "IF.v"
`include "ControlUnity.v"
`include "ID.v"
`include "EX.v"
`include "MEM.v"
`include "WB.v"

module Monocycle;

    reg clock;
    reg PCScr_inputIF;

    //CONTROL
    wire RegDst;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire Jump;
    wire Zero;
    wire PCSrc;

    //IF
    reg [15:0] shiftAddress_inputIF;
    wire [15:0] PC4_outpuIF;
    wire [15:0] instruction_outputIF;

    //ID
    wire [15:0] readData1_outputID;
    wire [15:0] readData2_outputID;
    wire [15:0] extdSignal_outputID;

    //EX
    wire [15:0]branch_outputEX;
    wire [15:0]resultALU_outputEX;
    wire [15:0]shiftAddress_outputEX;

    //MEM
    wire [15:0]dataRead_outputMEM;

    //WB
    reg [15:0]dataToWriteFromWB;
    wire [15:0]dataToWriteOnID;


    initial begin
        clock = 0;
        shiftAddress_inputIF = 16'b0;
        PCScr_inputIF = 1;
        #500 $finish;
	end

	always begin
        #10 clock = ~clock;
        #20 clock = ~clock;
	end

    always @ (posedge clock) begin
        PCScr_inputIF = PCSrc;
        dataToWriteFromWB = dataToWriteOnID;
        shiftAddress_inputIF = shiftAddress_outputEX;
	end

    always @ (negedge clock) begin
        PCScr_inputIF = PCSrc;
        dataToWriteFromWB = dataToWriteOnID;
        shiftAddress_inputIF = shiftAddress_outputEX;
	end


    IF ifmain (
        .clock(clock),
        .shiftAddress(shiftAddress_inputIF),
        .PCSrc(PCScr_inputIF),
        .outputMux(PC4_outpuIF),
        .outputIstruction(instruction_outputIF)
    );

    ControlUnity control(
        .clock(clock),
        .opcode(instruction_outputIF[15:12]),
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump)
    );

    ID idmain(
        .clock(clock),
        .rs(instruction_outputIF[11:9]),
        .rt(instruction_outputIF[8:6]),
        .rd(instruction_outputIF[5:3]),
        .funct(instruction_outputIF[2:0]),
        .signalToExtend(instruction_outputIF[5:0]),
        .dataToWrite(dataToWriteFromWB),
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .readData1(readData1_outputID),
        .readData2(readData2_outputID),
        .extendedSignal(extdSignal_outputID)
    );


    EX exmain(
        .clock(clock),
        .Branch(Branch),
        .Zero(Zero),
        .ALUSrc(ALUSrc),
        .nextAddress(extdSignal_outputID),
        .PC4(PC4_outpuIF),
        .funct(instruction_outputIF[2:0]),
        .ALUOp(ALUOp),
        .dataID1(readData1_outputID),
        .dataID2(readData2_outputID),
        .outputBranch(branch_outputEX),
        .outputALU(resultALU_outputEX),
        .jumpResult(shiftAddress_outputEX)
    );


    MEM memmain(
        .clock(clock),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Zero(Zero),
        .Branch(Branch),
        .address(resultALU_outputEX),
        .writeData(readData2_outputID),
        .RegDst(RegDst),
        .PCSrc(PCSrc),
        .outputDataRead(dataRead_outputMEM)
    );

    WB wbmain(
        .clock(clock),
        .MemtoReg(MemtoReg),
        .dataReadMEM(dataRead_outputMEM),
        .resultALU(resultALU_outputEX),
        .outputWB(dataToWriteOnID)
    );

endmodule