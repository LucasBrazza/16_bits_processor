`include "ID.v"

module _TB_ID;

   reg RegWrite;
   reg RegDst;
   reg clock;
   reg [15:0] instruction;
   reg [15:0] dataToWrite;

   wire [15:0] readData1;
   wire [15:0] readData2;
   wire [15:0] extdSignal;

   initial begin
		clock = 0;
      instruction = 16'b0010010010111010;
      dataToWrite = 16'b0011000111101011;
      RegWrite = 0;
      #25 $finish;
   end

   always begin
      #10 clock = ~clock;
      $display("instruction %b - readData1 %b - readData2 %b - extdSignal %b", instruction, readData1, readData2, extdSignal);
   end

   //ok
   ID idmain(
      .clock(clock),
      .rs(instruction[11:9]),
      .rt(instruction[8:6]),
      .rd(instruction[5:3]),
      .funct(instruction[2:0]),
      .signalToExtend(instruction[5:0]),
      .dataToWrite(dataToWrite),
      .RegWrite(RegWrite),
      .RegDst(RegDst),
      .readData1(readData1),
      .readData2(readData2),
      .extendedSignal(extdSignal)
   );

endmodule