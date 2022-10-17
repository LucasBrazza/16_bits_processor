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
input [15:0]PC4;
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

endmodule