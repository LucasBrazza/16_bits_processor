`include "../../Processador\Control\ControlUnity.v"

module CU_TB;
	
	reg clock;
	reg [3:0]opcode;
	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0]ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;


   initial begin
	   $monitor("clock = %b, opcode = %b, RegDst = %b, Branch = %b, MemRead = %b, MemtoReg = %b, ALUOp = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b", clock, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
		clock = 0;
      	opcode = 4'b0001;
		#5 $finish;
    end
    
    always begin
      #5 clock = !clock;
    end

    ControlUnity cu(clock, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

endmodule