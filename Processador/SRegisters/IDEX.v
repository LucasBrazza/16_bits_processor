module IDEX(clock, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp, 
            PC4, dataRegBank1, dataRegBank2, extendedSignal, rt, rd, outputPC4, outputDataRegBank1, 
            outputDataRegBank2, RegDstOut, BranchOut, MemReadOut, MemtoRegOut, ALUOpOut, MemWriteOut, 
            ALUSrcOut, RegWriteOut, outputExtendedSignal, rtOut, rdOut);

    input clock;
    input RegDst;
    input Branch;
    input MemRead;
    input MemtoReg;
    input MemWrite;
    input ALUSrc;
    input RegWrite;
    input [1:0] ALUOp;
    input [15:0] PC4;
    input [15:0] dataRegBank1;
    input [15:0] dataRegBank2;
    input [15:0] extendedSignal;
    input [2:0]rt;
    input [2:0]rd;
//    input [2:0]rs_fw;
//    input [2:0]rt_fw;

    output reg RegDstOut;
    output reg BranchOut;
    output reg MemReadOut;
    output reg MemtoRegOut;
    output reg MemWriteOut;
    output reg ALUSrcOut;
    output reg RegWriteOut;
    output reg [1:0] ALUOpOut;
    output reg [15:0] outputPC4;
    output reg [15:0] outputDataRegBank1;
    output reg [15:0] outputDataRegBank2;
    output reg [15:0] outputExtendedSignal;
    output reg [2:0] rtOut;
    output reg [2:0] rdOut;
    //output reg [4:0] rs_fw_out;
    //output reg [4:0] rt_fw_out;

    always @ (negedge clock)begin
        outputPC4 = PC4;
        outputDataRegBank1 = dataRegBank1;
        outputDataRegBank2 = dataRegBank2;
        RegDstOut = RegDst;
        BranchOut = Branch;
        MemReadOut = MemRead;
        MemtoRegOut = MemtoReg;
        ALUOpOut = ALUOp;
        MemWriteOut = MemWrite;
        ALUSrcOut = ALUSrc;
        RegWriteOut = RegWrite;
        outputExtendedSignal = extendedSignal;
        rtOut = rt;
        rdOut = rd;
    //rs_fw_out = rs_fw;
    //rt_fw_out = rt_fw;
    end

endmodule