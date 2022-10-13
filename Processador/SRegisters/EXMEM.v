module EXMEM(clock, Branch, MemRead, MemWrite, MemtoReg, Zero, RegWrite, outputShiftLeft, 
            outputALU, dataRegBank2, muxRegDst, outputShiftLeftOut, outputALUOut, dataRegBank2Out, 
            muxRegDstOut, BranchOut, MemReadOut, MemWriteOut, MemtoRegOut, ZeroOut, RegWriteOut);
    
    input clock;
    input Branch;
    input MemRead;
    input MemWrite;
    input MemtoReg;
    input Zero;
    input RegWrite;
    input [15:0] outputShiftLeft;
    input [15:0] outputALU;
    input [15:0] dataRegBank2;
    input [2:0] muxRegDst;


    output reg [15:0] outputShiftLeftOut;
    output reg [15:0] outputALUOut;
    output reg [15:0] dataRegBank2Out;
    output reg [2:0] muxRegDstOut;
    output reg BranchOut;
    output reg MemReadOut;
    output reg MemWriteOut;
    output reg MemtoRegOut;
    output reg ZeroOut;
    output reg RegWriteOut;

    always @ (posedge clock)begin
        outputShiftLeftOut = outputShiftLeft;
        outputALUOut = outputALU;
        dataRegBank2Out = dataRegBank2;
        muxRegDstOut = muxRegDst;
        BranchOut = Branch;
        MemReadOut = MemRead;
        MemWriteOut = MemWrite;
        MemtoRegOut = MemtoReg;
        ZeroOut = Zero;
        RegWriteOut = RegWrite;
    end

endmodule