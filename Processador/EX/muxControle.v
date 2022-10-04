module muxControle(clock, hazardMux, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, RegDst_out, Branch_out, MemRead_out, MemtoReg_out, ALUOp_out, MemWrite_out, ALUSrc_out, RegWrite_out);

    input clock;
    input hazardMux;
    input RegDst;
    input Branch;
    input MemRead;
    input MemtoReg;
    input [1:0] ALUOp;
    input MemWrite;
    input ALUSrc;
    input RegWrite;

    output reg RegDst_out;
    output reg Branch_out;
    output reg MemRead_out;
    output reg MemtoReg_out;
    output reg [1:0] ALUOp_out;
    output reg MemWrite_out;
    output reg ALUSrc_out;
    output reg RegWrite_out;

    always @ (posedge clock) begin
        if(hazardMux == 1)begin
            RegDst_out = 0;
            Branch_out = 0;
            MemRead_out = 0;
            MemtoReg_out = 0;
            ALUOp_out = 2'b00;
            MemWrite_out = 0;
            ALUSrc_out = 0;
            RegWrite_out = 0;  
        end else begin
            RegDst_out = RegDst;
            Branch_out = Branch;
            MemRead_out = MemRead;
            MemtoReg_out = MemtoReg;
            ALUOp_out = ALUOp;
            MemWrite_out = MemWrite;
            ALUSrc_out = ALUSrc;
            RegWrite_out = RegWrite;  
        end
    end
endmodule