`include "WB.v"

module _TB_WB;

   reg clock;
   reg MemtoReg;
   reg [15:0] dataRead;
   reg [15:0] resultALU;

   wire [15:0]dataToWriteOnID;

   initial begin
		clock = 0;
      MemtoReg = 0;
      dataRead = 16'b0000000000000001;
      resultALU = 16'b0000000000000011;
      #25 $finish;
   end

   always begin
      #10 clock = ~clock;
      $display("MemtoReg %b - dataRead %b - resultALU %b - outputWB %b",MemtoReg, dataRead, resultALU, dataToWriteOnID);
   end

   //ok
   WB wbmain(
      .clock(clock),
      .MemtoReg(MemtoReg),
      .dataReadMEM(dataRead),
      .resultALU(resultALU),
      .outputWB(dataToWriteOnID)
   );

endmodule