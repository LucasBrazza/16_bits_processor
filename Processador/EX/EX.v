`include "muxALUSrc.v"
`include "muxRegDest.v"
`include "adder.v"
`include "Shift_left.v"
`include "ALUControl.v"
`include "ALU.v"
`include "muxForwardA.v"
`include "muxForwardB.v"

module EX(clock, PC4, data1ALU, data2ALU, address, reg2, reg3, ALUSrc_EX, ALUOpEx, regDestEx, RD, 
          adderOutput, outputALU, zeroEx, data2ALU_out, result_ALU_MEM, result_MUX_WB,);

input  clock;
//entradas do módulo
input [15:0]PC2;
input [15:0]data1ALU;
input [15:0]data2ALU;
input [15:0]address;
input [2:0]reg2;
input [2:0]reg3;
input ALUSrc_EX;
input [1:0]ALUOpEx;
input regDestEx;
input [15:0]result_ALU_MEM;
input [15:0]result_MUX_WB;
input [1:0]outputAfw;
input [1:0]outputBfw;

reg [2:0]functEx;


//saidas dos modulos internos

wire [15:0]addressSHIFT;
wire [15:0]saidaMuxALUSrc;
wire [2:0]outputALUControl;
//wire [1:0]outputAfw;
//wire [1:0]outputBfw;
wire [15:0]saidaMuxA;
wire [15:0]saidaMuxB;

output [2:0]RD;
output [15:0]adderOutput;
output [15:0]outputALU;
output zeroEx;
output reg [15:0]data2ALU_out;

always @(*)begin
  functEx = address[2:0];
  data2ALU_out = data2ALU;
end

/*initial begin
  $monitor("clock = %b \n data1 = %b \n data2 = %b \n address = %b \n address deslocado = %b \n reg2 = %b \n reg3 = %b \n ALUSrc = %b \n funct = %b \n ALUOp = %b \n regDest = %b \n PC2 = %b \n saida somador = %b \n saida ULA = %b \n saida reg dest = %b \n", clock, daddataU, data2ALU, address, addressSHIFT, reg2, reg3, ALUSrc_EX, functEx, ALUOpEx, regDestEx, PC2, adderOutput, outputALU, RD);
          clock = 0;
          #5 PC2 =  32'b00000000000000000000000001010101;
          ALUSrc_EX = 0;
          ALUOpEx = 2'b00;
          regDestEx = 0;
          reg2 = 5'b00010;
          reg3 = 5'b00011;
          daddataU = 32'b00000000000000000000000000000001;
          data2ALU = 32'b00000000000000000000000000000001;
          address = 32'b00000000000000000000000000100000;
          functEx = address[5:0];
          #20 clock = 0;
          $finish;
end

initial begin
  #5 clock = ~clock;
end*/

Shift_left desloca(
	.clock(clock), 
	.signal(address), 
	.signal_displaced(addressSHIFT));

adder soma(
	.clock(clock), 
	.input1(PC2), 
	.input2(addressSHIFT), 
	.result(adderOutput));

muxALUSrc muxALUSrcEx(
	.clock(clock), 
	.data1(data2ALU),
	.data2(address), 
	.ALUSrc(ALUSrc_EX), 
	.outputMuxAlu(saidaMuxALUSrc));

ALUControl ALUCtrl(
	.clock(clock), 
	.funct(functEx), 
	.ALUOp(ALUOpEx), 
	.outputALUControl(outputALUControl));

muxRegDest muxRD(
	.clock(clock), 
	.r1(reg2), 
	.r2(reg3), 
	.regDest(regDestEx), 
	.outputMuxReg(RD));

ALU ulaEx(
	.clock(clock), 
	.input1(saidaMuxA), 
	.input2(saidaMuxB), 
	.ALUControl(outputALUControl), 
	.zero(zeroEx), 
	.result(outputALU));

endmodule
