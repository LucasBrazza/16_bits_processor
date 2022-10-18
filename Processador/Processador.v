

module Processador(instruction);

	reg clock;

	// Instruction Fetch
	wire [15:0]shiftAddress; 
	wire PCSrc; 
	wire [15:0]outputPC4; 
	wire [15:0]outputMEM; 


	//Unidade de Controle
	wire regDst_UC; 
	wire branch_UC; 
	wire memRead_UC; 
	wire memtoReg_UC; 
	wire [1:0]ALUOp_UC; 
	wire memWrite_UC; 
	wire ALUSrc_UC;
	wire regWrite_UC;

	//ID
	wire [31:0]endereco_desvioID;
	wire PCSrcID;
	wire [31:0]saidaPC4ID;
	wire [31:0]saidaMemIns;

	//IFID
	wire [5:0]opcodeIFID;
	wire [4:0]rsIFID;
	wire [4:0]rtIFID;
	wire [4:0]rdIFID;
	wire [4:0]shamtIFID;
	wire [5:0]functIFID;
	wire [15:0]addressIFID;
	wire [25:0]addressJumpIFID;
	wire [31:0]PC4_outIFID;

	//ID
	wire [31:0]dadolido1ID;
	wire [31:0]dadolido2ID;
	wire [31:0]sinalextendidoID;
	wire [4:0]rt_mux_outID;
	wire [4:0]rd_mux_outID;
	wire [4:0]rs_fw_outID; 
	wire [4:0]rt_fw_outID; 
	wire [31:0]PC4_out_ID;

	//IDEX
	wire [31:0]PC4_outIDEX;
	wire [31:0]dadoRt_outIDEX;
	wire [31:0]dadoRs_outIDEX;
	wire [31:0]sinalExtendido_outIDEX;
	wire [4:0]rt_mux_out_IDEX;
	wire [4:0]rd_mux_out_IDEX;
	wire [4:0]rs_fw_out_IDEX; 
	wire [4:0]rt_fw_out_IDEX; 
	wire [1:0]ALUOp_IDEX; 


	//EX
	wire [4:0]RD_EX;
	wire [31:0]endereco_desvio_EX;
	wire [31:0]saidaULA_EX;
	wire zero_EX;
	wire [31:0]dadolido2_EX;

	//EXMEM
	wire [31:0]endereco_desvio_EXMEM;
	wire zero_EXMEM;
	wire [31:0]resultadoALU_EXMEM;
	wire [31:0]dadoescrita_EXMEM;
	wire [4:0]rd_EXMEM;

	//MEM
	wire [31:0]dadoLido_MEM;
	wire PCSrc_MEM; 
	wire [31:0]saidaULA_MEM; 
	wire [4:0]rd_MEM; 
	wire [31:0]PC_desvio_MEM;

	//MEMWB
	wire [31:0]dadoMemoria_MEMWB;
	wire [31:0]resultadoALU_MEMWB;
	wire [4:0]rd_MEMWB;

	//WB
	wire [31:0]mux_WB;
	wire [4:0]rd_WB;

	//MUXCONTROLE
	wire regDst_out; 
	wire branch_out; 
	wire memRead_out;
	wire memtoReg_out; 
	wire [1:0]ALUOp_out;
	wire memWrite_out; 
	wire ALUSrc_out; 
	wire regWrite_out;

	initial begin
	$monitor("PCSrc = %b", PCSrc_MEM);
	clock = 0;
	#50 $finish;
	end

	always begin
	#5 clock = ~clock;
	end

	ControlUnity CU(
		.clock(),
		.opcode(),
		.RegDst(),
		.Branch(),
		.MemRead(),
		.MemtoReg(),
		.ALUOp(),
		.MemWrite(),
		.ALUSrc(),
		.RegWrite());


	muxControle mux(
		.clock(clock),
		.hazardMux(hazardMux),
		.RegDst(regDst_UC),
		.Branch(branch_UC),
		.MemRead(memRead_UC),
		.MemtoReg(memtoReg_UC),
		.ALUOp(ALUOp_UC),
		.MemWrite(memWrite_UC),
		.ALUSrc(ALUSrc_UC),
		.RegWrite(regWrite_UC),
		.RegDst_out(regDst_out),
		.Branch_out(branch_out),
		.MemRead_out(memRead_out),
		.MemtoReg_out(memtoReg_out),
		.ALUOp_out(ALUOp_out),
		.MemWrite_out(memWrite_out),
		.ALUSrc_out(ALUSrc_out),
		.RegWrite_out(regWrite_out));


	IF ifmain(
		.clock(),
		.shiftAddress(),
		.PCSrc(),
		.outputPC4(),
		.outputMEM());


	IFID ifidmain(
		.clock(),
		.IFIDWrite(),
		.PC4(),
		.outputPC4(),
		.instuction(),
		.opcode(),
		.rs(),
		.rt(),
		.rd(),
		.funct(),
		.address(),
		.addressJump());


	ID idmain(
		.clock(), 
		.rs(), 
		.rt(), 
		.rd(), 
		.funct(), 
		.address(), 
		.signalToExtend(), 
		.PC4(), 
		.dataToWrite(), 
		.writeRegister(), 
		.RegWrite(), 
		.readData1(), 
		.readData2(), 
		.extendedSignal(), 
		.PC4_outpuID());


	IDEX idexmain(
		.clock(), 
		.RegDst(), 
		.Branch(), 
		.MemRead(), 
		.MemtoReg(), 
		.MemWrite(), 
		.ALUSrc(), 
		.RegWrite(), 
		.ALUOp(), 
		.PC4(), 
		.dataRegBank1(), 
		.dataRegBank2(), 
		.extendedSignal(), 
		.rt(), 
		.rd(), 
		.outputPC4(), 
		.outputDataRegBank1(), 
		.outputDataRegBank2(), 
		.RegDstOut(), 
		.BranchOut(), 
		.MemReadOut(), 
		.MemtoRegOut(), 
		.ALUOpOut(), 
		.MemWriteOut(), 
		.ALUSrcOut(), 
		.RegWriteOut(), 
		.outputExtendedSignal(), 
		.rtOut(), 
		.rdOut());


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
		.result_MUX_WB());


	EXMEM exmemmain(
		.clock(), 
		.Branch(), 
		.MemRead(), 
		.MemWrite(), 
		.MemtoReg(), 
		.Zero(), 
		.RegWrite(), 
		.outputShiftLeft(), 
		.outputALU(), 
		.dataRegBank2(), 
		.muxRegDst(), 
		.outputShiftLeftOut(), 
		.outputALUOut(), 
		.dataRegBank2Out(), 
		.muxRegDstOut(), 
		.BranchOut(), 
		.MemReadOut(), 
		.MemWriteOut(), 
		.MemtoRegOut(), 
		.ZeroOut(), 
		.RegWriteOut());


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
		.outputShiftPC());


	MEMWB memwb(
		.clock(), 
		.MemtoReg(),
		.RegWrite(), 
		.outputDataMem(),
		.outputALU(), 
		.muxRegDst(), 
		.MemtoRegOut(), 
		.RegWriteOut(), 
		.outputDataMemOut(), 
		.outputALUOut(),
		.muxRegDstOut());


	WB wbmain(
		.clock(), 
		.dataReadMEM(), 
		.resultULAEXE(), 
		.MemtoReg(), 
		.RegDst(), 
		.RegWrite(), 
		.outputMUX(), 
		.outputRegDst(), 
		.outputRegWrite());


endmodule