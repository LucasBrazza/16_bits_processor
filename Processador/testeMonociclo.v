`include "\IF\IF.v"
`include "\ID\ID.v"
`include "\EX\EX.v"
`include "\MEM\MEM.v"
`include "\WB\WB.v"



module Monociclo;


IF ifmain (
    .clock(),
    .shiftAddress(),
    .PCSrc(),
    .outputPC4(),
    .outputMEM()
);


ID idmain(
    .clock(),
    .rs(),
    .rt(),
    .rd(),
    .funct(),
    .addressjump(),
    .PC4(),
    .writeDat(),
    .RegWrite(),
    .readData1(),
    .readData2(),
    .extendedSignal(),
    .PC4_outpuID()
);


EX exmain(
    .clock(),
    .PC4(),
    .data1ALU(),
    .data2ALU(),
    .address(),
    .reg2(),
    .reg3(),
    .ALUSrc_EX(),
    .ALUOpEx(),
    .regDestEx(),
    .RD(),
    .adderOutput(),
    .outputALU(),
    .zeroEx(),
    .data2ALU_out(),
    .result_ALU_MEM(),
    .result_MUX_WB()
);

MEM memmain(
    .clock(),
    .resultULA(),
    .writeDataMEM(),
    .RegDst(),
    .shiftPC(),
    .MemRead(),
    .MemWrite(),
    .Zero(),
    .Branch(),
    .outputDataReadMEM(),
    .PCSrc(),
    .outputMemULA(),
    .outputRegDst(),
    .outputShiftPC()
);

WB wbmain(
    .clock(),
    .dataReadMEM(),
    .resultULAEXE(),
    .MemtoReg(),
    .RegDst(),
    .RegWrite(),
    .outputMUX(),
    .outputRegDst(),
    .outputRegWrite()
);

endmodule