`include "../Processador\MEM\MEM.v"

module MEM_TB();

    reg clock;
    reg MemRead;
    reg MemWrite;
    reg Zero;
    reg Branch;
    reg [2:0]RegDst;

	reg [15:0]resultULA;
    reg [15:0]writeDataMEM;
    reg [15:0]shiftPC;


	wire PCSrc;
	wire [15:0]outputDataReadMEM;
	wire [15:0]outputMemULA;
	wire [2:0]outputRegDst;
	wire [15:0]outputShiftPC;

	initial begin
		$monitor("PCSrc = %b, outputDataReadMEM = %b, outputMemULA = %b, outputRegDst = %b, outputShiftPC = %b",PCSrc, outputDataReadMEM, outputMemULA, outputRegDst, outputShiftPC, );

		resultULA = 16'b1111;
		writeDataMEM = 16'b1;
		shiftPC = 16'b11;
		
        RegDst = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;

		#10 RegDst = 0;
        MemRead = 1;
        MemWrite = 1;
        Branch = 0;

		#40 $finish;
	end

	always begin
		#5 clock = !clock;
	end

	MEM memmain(
		.clock(clock), 
		.resultULA(resultULA), 
		.writeDataMEM(writeDataMEM), 
		.RegDst(RegDst), 
		.shiftPC(shiftPC), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Zero(Zero), 
		.Branch(Branch), 
		.outputDataReadMEM(outputDataReadMEM), 
		.PCSrc(PCSrc), 
		.outputMemULA(outputMemULA), 
		.outputRegDst(outputRegDst), 
		.outputShiftPC(outputShiftPC));
        
endmodule