module InstructionMemory(address, instructionOutput, clock);

    input clock;
    input [15:0]address;
    
    output reg [15:0]instructionOutput;
    
    reg [15:0]instructions;

    initial begin
      instructionOutput=16'b0001110111000010;
    end
    
    
endmodule