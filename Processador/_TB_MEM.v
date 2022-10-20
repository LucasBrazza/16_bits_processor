`include "MEM.v"

module _TB_MEM;

   reg clock;
   reg MemRead;
   reg MemWrite;
   reg Zero;
   reg Branch;
   reg RegDst;
   reg [15:0] resultALU;
   reg [15:0] readData2;


   wire PCSrc;
   wire [15:0] dataRead;

   initial begin
		clock = 0;
      MemRead = 0;
      MemWrite = 0;
      Zero = 0;
      Branch = 0;
      RegDst = 1;
      resultALU = 16'b11;
      readData2 = 16'b1;
      #25 $finish;
   end

   always begin
      #10 clock = ~clock;
      $display("resultALU %b - MemRead %b - MemWrite %b - dataRead %b - PCSrc %b",resultALU, MemRead, MemWrite, readData2, PCSrc);
   end

   //ok
   MEM memmain(
      .clock(clock),
      .MemRead(MemRead),
      .MemWrite(MemWrite),
      .Zero(Zero),
      .Branch(Branch),
      .address(resultALU),
      .writeData(readData2),
      .RegDst(RegDst),
      .PCSrc(PCSrc),
      .outputDataRead(dataRead)
   );

endmodule