`include "IF.v"

module _TB_IF;

   reg clock;
   reg PCScr;
   reg [15:0] shiftAddress;

   wire [15:0] instruction;
   wire [15:0] PC4;

   initial begin
		clock = 0;
      shiftAddress = 16'b0011000111101011;
      PCScr = 0;
      #25 $finish;
   end

   always begin
      #10 clock = ~clock;
      $display("PCScr %b - shiftAddress %b - instruction %b - PC4 %b", PCScr, shiftAddress, instruction, PC4);
   end

   //ok
   IF ifmain (
      .clock(clock),
      .shiftAddress(shiftAddress),
      .PCSrc(PCScr),
      .outputMux(PC4),
      .outputIstruction(instruction)
   );

endmodule