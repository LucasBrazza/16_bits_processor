module InstructionMemory(address, instructionOutput, clock);

    input [3:0]address;
    input clock;

    output reg [15:0]instructionOutput;

// aqui na memoria de instruções tera um array cm todas as instruções
// mips que serao passadas via arquivo
// o endereço que a memoria recebe é pra falar em qual posição do arquivo ainstrução esta armazenada

    reg [15:0]instructions[255:0];

    initial begin
        instructions[4'b0000] = 16'b0001010001010000; //tipo r and
        instructions[4'b0001] = 16'b0001010001010001; // tipo r or
        instructions[4'b0010] = 16'b0001010001010010; // tipo r add
        instructions[4'b0011] = 16'b0001010001010111; // tipo r slt
        instructions[4'b0100] = 16'b0011011001100010; //lw add
        instructions[4'b0101] = 16'b0010011001100010; //sw add
        instructions[4'b0110] = 16'b0100100100000110; //beq sub
        instructions[4'b0111] = 16'b0100100111000110; //bnq
        instructions[4'b1000] = 16'b0000000000000000; // jump
    end
    
    always @ (posedge clock) begin
        if(address > 4'b1000)begin
            $monitor("Fim das instruções.");
            $finish;
        end
        instructionOutput = instructions[address];
    end

endmodule