`include "IF.v"
`include "IFID.v"
`include "ID.v"
`include "IDEX.v"
`include "EX.v"
`include "EXMEM.v"
`include "MEM.v"
`include "MEMWB.v"
`include "WB.v"
`include "unidadeControle.v"
`include "UnidadeForward.v"
`include "unidadeDeteccaoHazard.v"
`include "muxControle.v"

module Processador();

reg clock;

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

unidadeControle controle(
	.clock(clock),
	.opcode(opcodeIFID),
	.RegDst(regDst_UC),
	.Branch(branch_UC),
	.MemRead(memRead_UC),
	.MemtoReg(memtoReg_UC),
	.ALUOp(ALUOp_UC),
	.MemWrite(memWrite_UC),
	.ALUSrc(ALUSrc_UC),
	.RegWrite(regWrite_UC));

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
	.clock(clock),
	.endereco_desvio(endereco_desvioID),
	.PCSrc(PCSrcID),
	.saidaPC4(saidaPC4ID),
	.saidaMem(saidaMemIns));
//ok
IFID ifidmain(
	.clock(clock),
	.PC4(saidaPC4ID),
	.instrucao(saidaMemIns),
	.IFIDWrite(IFIDWrite),
	.opcode(opcodeIFID),
	.rs(rsIFID),
	.rt(rtIFID),
	.rd(rdIFID),
	.shamt(shamtIFID),
	.funct(functIFID),
	.address(addressIFID),
	.addressJump(addressJumpIFID),
	.PC4_out(PC4_outIFID));
//ok
ID idmain(
	.clock(clock), 
	.rs(rsIFID), 
	.rt(rtIFID), 
	.rd(rdIFID), 
	.funct(functIFID), 
	.address(addressIFID), 
	.adressjump(addressJumpIFID), 
	.PC4ID(PC4_outIFID), 
	.WB(mux_WB), 
	.WriteRegister(rd_WB), 
	.RegWrite(regWrite_WB), 
	.dado1(dadolido1ID), 
	.dado2(dadolido2ID), 
	.sinalextendido(sinalextendidoID), 
	.rt_mux(rt_mux_outID), 
	.rd_mux(rd_mux_outID), 
	.rs_fw(rs_fw_outID), 
	.rt_fw(rt_fw_outID), 
	.PC4ID_out(PC4_out_ID));
//ok
IDEX idexmain(
	.clock(clock), 
	.PC4(PC4_out_ID), 
	.dadoRs(dadolido1ID), 
	.dadoRt(dadolido2ID), 
	.regDst(regDst_main), 
	.Branch(branch_main), 
	.memRead(memRead_main), 
	.memtoReg(memtoReg_main), 
	.ALUOp(ALUOp_UC), 
	.memWrite(memWrite_main), 
	.ALUSrc(ALUSrc_main), 
	.RegWrite(regWrite_main), 
	.sinalExtendido(sinalextendidoID), 
	.rt_mux(rt_mux_outID), 
	.rd_mux(rd_mux_outID), 
	.rs_fw(rs_fw_outID), 
	.rt_fw(rt_fw_outID), 
	.PC4_out(PC4_outIDEX), 
	.dadoRs_out(dadoRs_outIDEX), 
	.dadoRt_out(dadoRt_outIDEX), 
	.regDst_out(regDst_IDEX), 
	.branch_out(branch_IDEX), 
	.memRead_out(memRead_IDEX), 
	.memtoReg_out(memtoReg_IDEX), 
	.ALUOp_out(ALUOp_IDEX), 
	.memWrite_out(memWrite_IDEX), 
	.ALUSrc_out(ALUSrc_IDEX), 
	.regWrite_out(regWrite_IDEX), 
	.outputExtendedSignal(sinalExtendido_outIDEX), 
	.rtOut(rt_mux_out_IDEX), 
	.rdOut(rd_mux_out_IDEX), 
	.rs_fw_out(rs_fw_out_IDEX), 
	.rt_fw_out(rt_fw_out_IDEX));
//ok
EX exmain(
	.clock(clock), 
	.PC4(PC4_outIDEX), 
	.dado1ALU(dadoRs_outIDEX), 
	.dado2ALU(dadoRt_outIDEX), 
	.endereco(sinalExtendido_outIDEX), 
	.reg2(rt_mux_out_IDEX), 
	.reg3(rd_mux_out_IDEX), 
	.ALUSrc_EX(ALUSrc_IDEX), 
	.ALUOpEx(ALUOp_IDEX), 
	.regDestEx(regDst_IDEX), 
	.RD(RD_EX), 
	.saidaSomador(endereco_desvio_EX), 
	.saidaULA(saidaULA_EX), 
	.zeroEx(zero_EX), 
	.dado2ALU_out(dadolido2_EX), 
	.resultadoALU_MEM(resultadoALU_EXMEM), 
	.resultadoMux_WB(mux_WB));
//ok
UnidadeForward ufw(
	.clock(clock), 
	.IFIDrs(rs_fw_out_IDEX), 
	.IFIDrt(rt_fw_out_IDEX), 
	.MEMWBrd(rd_final), 
	.EXEMEMrd(rd_semifinal), 
	.EXEMEMRegWrite(regWrite_EXMEM), 
	.MEMWBRegWrite(regWrite_MEMWB), 
	.forwardA(forwardA_out), 
	.forwardB(forwardB_out));

EXMEM exmemmain(
	.clock(clock), 
	.outputShiftLeft(endereco_desvio_EX), 
	.outputALU(saidaULA_EX), 
	.dataRegBank2(dadolido2_EX), 
	.rd(RD_EX), 
	.RegWrite(regWrite_IDEX), 
	.Branch(branch_IDEX), 
	.memRead(memRead_IDEX), 
	.memWrite(memWrite_IDEX), 
	.memtoReg(memtoReg_IDEX), 
	.zero(zero_EX), 
	.outputShiftLeftOut(endereco_desvio_EXMEM), 
	.outputALUOut(resultadoALU_EXMEM), 
	.dataRegBank2Out(dadoescrita_EXMEM), 
	.muxRegDstOut(rd_EXMEM), 
	.regWrite_out(regWrite_EXMEM), 
	.branch_out(branch_EXMEM), 
	.memRead_out(memRead_EXMEM), 
	.memWrite_out(memWrite_EXMEM), 
	.memtoReg_out(memtoReg_EXMEM), 
	.ZeroOut(zero_EXMEM));
//ok
MEM memmain(
	.clock(clock), 
	.saidaULAMem(resultadoALU_EXMEM), 
	.dadoEscritaMem(dadoescrita_EXMEM), 
	.RD(rd_EXMEM), 
	.PCdesvio(endereco_desvio_EXMEM), 
	.memReadMem(memRead_EXMEM), 
	.memWriteMem(memWrite_EXMEM), 
	.zero(zero_EXMEM), 
	.Branch(branch_EXMEM), 
	.dadoLidoMem_out(dadoLido_MEM), 
	.PCSrc(PCSrc_MEM), 
	.saidaULAMem_out(saidaULA_MEM), 
	.RD_out(rd_MEM), 
	.PCdesvio_out(PC_desvio_MEM));
//ok
MEMWB memwb(
	.clock(clock), 
	.outputDataMem(dadoLido_MEM),
	.outputALU(saidaULA_MEM), 
	.rd(rd_MEM), .memtoReg(memtoReg_EXMEM), 
	.RegWrite(regWrite_EXMEM), 
	.outputDataMemOut(dadoMemoria_MEMWB), 
	.outputALUOut(resultadoALU_MEMWB), 
	.muxRegDstOut(rd_MEMWB), 
	.memtoReg_out(memtoReg_MEMWB), 
	.regWrite_out(regWrite_MEMWB));
//ok
WB wbmain(
	.clock(clock), 
	.dadoLidoWB(dadoMemoria_MEMWB), 
	.resultadoALUWB(resultadoALU_MEMWB), 
	.memToRegWB(memtoReg_MEMWB), 
	.RD(rd_MEMWB), 
	.RegWrite(regWrite_MEMWB), 
	.saidaMUX(mux_WB), 
	.RD_out_WB(rd_WB), 
	.regWrite_out(regWrite_WB));
//ok
unidadeDeteccaoHazard hazard(
	.clock(clock),
	.IDEXEMemRead(memRead_IDEX), 
	.IFIDrs(rs), 
	.IFIDrt(rt), 
	.IDEXE_destino(rt_mux_out_IDEX), 
	.PCWrite(PCWrite), 
	.IFIDWrite(IFIDWrite), 
	.hazardMux(hazardMux));

endmodule