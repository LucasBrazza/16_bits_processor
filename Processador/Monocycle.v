`include "\IF\IF.v"
`include "\ID\ID.v"
`include "\EX\EX.v"
`include "\MEM\MEM.v"
`include "\WB\WB.v"

module Monociclo;

    reg clock;

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
    wire [15:0] shiftAddress_inputIF;
    wire [15:0] PC4_outpuIF;
    wire [15:0] instruction_outputIF;

    //ID
    wire [15:0] readData1_outputID;
    wire [15:0] readData2_outputID;
    wire [15:0] extdSignal_outputID;

    //EX
    wire [15:0]branch_outputEX;
    wire [15:0]resultALU_outputEX;

    //MEM
    wire [15:0]dataRead_outputMEM;

    //WB
    wire [15:0]dataToWriteFromWB;


    //FAZER CLOCK
    initial begin
        clock = 0;
        #50 $finish;
	end

	always begin
	    #5 clock = ~clock;
	end


    IF ifmain (
        .clock(clock),
        .shiftAddress(shiftAddress_inputIF),
        .PCSrc(PcSrc),
        .outputPC4(PC4_outpuIF),
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
        .readData1(readData1_outputID),
        .readData2(readData2_outputID),
        .extendedSignal(extdSignal_outputID),
    );


    EX exmain(
        .clock(clock),
        .Branch(Branch),
        .Zero(Zero),
        .nextAddress(extdSignal_outputID),
        .PC4(PC4_outpuIF),
        .funct(instruction_outputIF[2:0]),
        .ALUOp(ALUOp),
        .dataID1(readData1_outputID),
        .dataID2(readData2_outputID),
        .outputBranch(branch_outputEX),
        .outputALU(resultALU_outputEX)
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
        .outputWB(dataToWriteFromWB)
    );


endmodule