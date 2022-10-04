module unidadeControle(clock, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    
    input clock;
    input [5:0] opcode;

    output reg RegDst;
    output reg Branch;
    output reg MemRead;
    output reg MemtoReg;
    output reg [1:0] ALUOp;
    output reg MemWrite;
    output reg ALUSrc;
    output reg RegWrite;

    always @ (posedge clock or negedge clock) begin
        case(opcode)
            6'b000000: begin
                RegDst = 1;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b10;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 1;
            end
            6'b100011: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 1;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            6'b101011: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 1;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 1;
                ALUSrc = 1;
                RegWrite = 0;
            end
            6'b001001: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b10;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            6'b001010: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b10;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            6'b000100: begin
                RegDst = 0;
                Branch = 1;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b01;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 0;
            end
            6'b000010: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b11;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 0;
            end
            default: $display("Valor de opcode não suportado.");
        endcase
    end
endmodule