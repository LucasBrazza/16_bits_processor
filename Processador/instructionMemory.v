module InstructionMemory(address, instructionOutput, clock);

    input [15:0]address;
    input clock;

    output reg [15:0]instructionOutput;

// aqui na memoria de instruções tera um array cm todas as instruções
// mips que serao passadas via arquivo
// o endereço que a memoria recebe é pra falar em qual posição do arquivo ainstrução esta armazenada

    reg [15:0]instructions[15:0];

    initial begin
        instructions[4'b0000] = 16'b0001000001010000; //tipo r and
        instructions[4'b0001] = 16'b0001000001010001; // tipo r or
        instructions[4'b0010] = 16'b0001000001010010; // tipo r add
        instructions[4'b0011] = 16'b0001000001010111; // tipo r slt
        instructions[4'b0100] = 16'b0100100111xxx110; //bnq
        instructions[4'b0101] = 16'b0010000001xxx010; //lw add
        instructions[4'b0110] = 16'b0011000001xxx010; //sw add
        instructions[4'b0111] = 16'b0100100111xxx110; //beq sub
        instructions[4'b1000] = 16'b0000xxxxxxxxxxxx; // jump
    end
    
    always @ (posedge clock) begin
        if(address[15:11] > 4'b1000)begin
            $monitor("Instrucao nao suportada. Executando a poxima instrucao...");
        end
        instructionOutput = instructions[address[15:11]];
    end

endmodule