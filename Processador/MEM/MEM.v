`include "DataMemory.v"
`include "Branch.v"

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

    /*initial begin
      $monitor("clock = %b \nendereco = %b \ndado escrita = %b \nRD = %b \nPC desvio = %b\nmemRead = %b \nmemWrite = %b \nzero = %b \nM = %b \ndado lido = %b \nbranch = %b\n\n",
      clock, outputMemULA, writeDataMEM, RegDst, shiftPC, MemRead, MemWrite, Zero, M, dadoLidoMem, branchMem);
      clock = 0;
      #5 outputMemULA = 0;
      MemWrite = 1;
      writeDataMEM = 0;
      RegDst = 5'b00001;
      shiftPC = 4;
      MemRead = 0;
      Zero = 1;
      M = 0;
      #10 outputMemULA = 0;
      MemRead = 1;
      MemWrite = 0;
      writeDataMEM = 1;
      RegDst = 5'b00010;
      shiftPC = 8;
      Zero = 1; 
      M = 1;
      #10 $finish;

    end

    always begin
        #5 clock = !clock;
    end*/

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