module instructionMemory(address, instructionOut, clock);

    input clock;
    input [15:0]address;

    output reg [15:0]instructionOut;
    
    reg [15:0]instructions[1599:0];

    initial begin
      $readmemb("instruções.txt", instructions);
    end

    always @ (negedge clock) begin
      instructionOut = instructions[(address/4) - 1];
    end

endmodule