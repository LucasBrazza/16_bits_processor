`include "PC.v"
`include "AddPC4.v"
`include "InstructionMemory.v"
`include "MuxIF.v"

module IF(clock, shiftAddress, PCSrc, outputIstruction, outputMux);

    input clock;
    input [15:0] shiftAddress;
    input PCSrc;

    output [15:0]outputMux;
    wire [15:0]outputPC;

    output wire [15:0]outputPC4;
    output wire [15:0]outputIstruction;

    reg [15:0]outputMux_inpPC;

    initial begin
        outputMux_inpPC = 16'b0000000000000000; 
    end

    always @(posedge clock)begin
        //$monitor("%b", outputPC);
        outputMux_inpPC = outputMux;
    end

    MuxIF mux(
        .clock(clock),
        .PCSrc(PCSrc),
        .inputPC4Mux(outputPC4),
        .signalShifted(shiftAddress),
        .response(outputMux));

    PC pc(
        .clock(clock),
        .inp(outputMux_inpPC), 
        .outp(outputPC));

    AddPC4 pc4(	
        .clock(clock), 
        .PC(outputPC), 
        .PC4(outputPC4));

    InstructionMemory memIn(
        .clock(clock),
        .address(outputPC[3:0]),
        .instructionOutput(outputIstruction));

endmodule