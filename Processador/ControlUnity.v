module ControlUnity(clock, opcode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);
    
    input clock;
    input [3:0] opcode;

    output reg RegDst;
    output reg Branch;
    output reg MemRead;
    output reg MemtoReg;
    output reg [1:0] ALUOp;
    output reg MemWrite;
    output reg ALUSrc;
    output reg RegWrite;
    output reg Jump;


    always @ (posedge clock or negedge clock) begin
        case(opcode)
            //jump
            4'b0000: begin
                RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b11;
                Jump = 1;
            end
            //R-Type
            4'b0001: begin
                RegDst = 1;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                Jump = 0;
            end
            //lw
            4'b0010: begin
                RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b00;
                Jump = 0;
            end
            //sw
            4'b0011: begin
                RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                ALUOp = 2'b00;
                Jump = 0;
            end
            //branch
            4'b0100: begin
                RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 2'b01;
                Jump = 0;
            end
            default: begin
                RegDst = 1;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                Jump = 0;
            end
        endcase
    end
endmodule