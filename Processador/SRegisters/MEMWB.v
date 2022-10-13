module MEMWB(clock, MemtoReg, RegWrite, outputDataMem, outputALU, muxRegDst, MemtoRegOut, 
            RegWriteOut, outputDataMemOut, outputALUOut, muxRegDstOut);

    input clock;
    input MemtoReg;
    input RegWrite;
    input [15:0] outputDataMem;
    input [15:0] outputALU;
    input [2:0] muxRegDst;

    output reg MemtoRegOut;
    output reg RegWriteOut;
    output reg [15:0] outputDataMemOut;
    output reg [15:0] outputALUOut;
    output reg [2:0] muxRegDstOut;

    always @(negedge clock)begin
        outputDataMemOut = outputDataMem;
        outputALUOut = outputALU;
        muxRegDstOut = muxRegDst;
        MemtoRegOut = MemtoReg;
        RegWriteOut = RegWrite;
    end

endmodule