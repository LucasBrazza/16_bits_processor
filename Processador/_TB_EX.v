`include "EX.v"

module _TB_IF;

   reg clock;
   reg Branch;
   reg ALUSrc;
   reg [1:0] ALUOp;
   reg [15:0] extdSignal;
   reg [15:0] PC4;
   reg [15:0] instruction;
   reg [15:0] readData1;
   reg [15:0] readData2;

   wire Zero;
   wire [15:0] branchAddress;
   wire [15:0] resultALU;
   wire [15:0] shiftAddress;

   initial begin
		clock = 0;
      instruction = 16'b0001010001010010;
      readData1 = 16'b0000000000000010;
      readData2 = 16'b0000000000000001;
      Branch = 0;
      ALUSrc = 0;
      extdSignal = 16'b0000000000110001;
      PC4 = 0000000000000111;
      ALUOp = 10;
      #25 $finish;
   end

   always begin
      #10 clock = ~clock;
      $display("OPCode %b - ALUOp %b - readData1 %b - readData2 %b - resultALU %b",instruction[15:12], ALUOp, readData1, readData2, resultALU);
   end

   //ok
   EX exmain(
      .clock(clock),
      .Branch(Branch),
      .Zero(Zero),
      .ALUSrc(ALUSrc),
      .nextAddress(extdSignal),
      .PC4(PC4),
      .funct(instruction[2:0]),
      .ALUOp(ALUOp),
      .dataID1(readData1),
      .dataID2(readData2),
      .outputBranch(branchAddress),
      .outputALU(resultALU),
      .jumpResult(shiftAddress)
   );

endmodule