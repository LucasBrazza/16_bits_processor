module IDEX(clock, PC4, dadoRs, dadoRt, regDst, branch, memRead, memtoReg, ALUOp, memWrite, ALUSrc, regWrite,
 sinalExtendido, rt_mux, rd_mux, rs_fw, rt_fw, PC4_out, dadoRs_out, dadoRt_out, regDst_out, branch_out, 
 memRead_out, memtoReg_out, ALUOp_out, memWrite_out, ALUSrc_out, regWrite_out, sinalExtendido_out,
  rt_mux_out, rd_mux_out, rs_fw_out, rt_fw_out);

    input clock;
    input [31:0] PC4;
    input [31:0] dadoRs;
    input [31:0] dadoRt;
    input regDst;
    input branch;
    input memRead;
    input memtoReg;
    input [1:0] ALUOp;
    input memWrite;
    input ALUSrc;
    input regWrite;
    input [31:0] sinalExtendido;
    input [4:0]rt_mux;
    input [4:0]rd_mux;
    input [4:0]rs_fw;
    input [4:0]rt_fw;

    output reg [31:0] PC4_out;
    output reg [31:0] dadoRs_out;
    output reg [31:0] dadoRt_out;
    output reg regDst_out;
    output reg branch_out;
    output reg memRead_out;
    output reg memtoReg_out;
    output reg [1:0] ALUOp_out;
    output reg memWrite_out;
    output reg ALUSrc_out;
    output reg regWrite_out;
    output reg [31:0] sinalExtendido_out;
    output reg [4:0] rt_mux_out;
    output reg [4:0] rd_mux_out;
    output reg [4:0] rs_fw_out;
    output reg [4:0] rt_fw_out;

    always @ (negedge clock)begin
    PC4_out = PC4;
    dadoRs_out = dadoRs;
    dadoRt_out = dadoRt;
    regDst_out = regDst;
    branch_out = branch;
    memRead_out = memRead;
    memtoReg_out = memtoReg;
    ALUOp_out = ALUOp;
    memWrite_out = memWrite;
    ALUSrc_out = ALUSrc;
    regWrite_out = regWrite;
    sinalExtendido_out = sinalExtendido;
    rt_mux_out = rt_mux;
    rd_mux_out = rd_mux;
    rs_fw_out = rs_fw;
    rt_fw_out = rt_fw;

    end

endmodule