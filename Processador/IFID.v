module IFID(clock, PC4, instrucao, IFIDWrite, opcode, rs, rt, rd, shamt, funct, address, addressJump, PC4_out);
    
    input clock;
    input [31:0] instrucao;
    input IFIDWrite;
    input [31:0] PC4;

    output reg [5:0] opcode;
    output reg [31:0] PC4_out;
    output reg [4:0] rs;
    output reg [4:0] rt;
    output reg [4:0] rd;
    output reg [4:0] shamt;
    output reg [5:0] funct;
    output reg [15:0] address;
    output reg [25:0] addressJump;

    always @ (posedge clock)begin
        PC4_out = PC4;
        opcode = instrucao[31:26];
        if(IFIDWrite == 1)begin
            if(opcode == 6'b000000)begin
                rs = instrucao[25:21];
                rt = instrucao[20:16];
                rd = instrucao[15:11];
                shamt = instrucao[10:6];
                funct = instrucao[5:0];
            end else if(opcode == 6'b100011 || opcode == 6'b101011 ||
            opcode == 6'b001001 || opcode == 6'b001010 ||
            opcode == 6'b000100)begin
                rs = instrucao[25:21];
                rt = instrucao[20:16];
                address = instrucao[15:0];  
            end else begin
                addressJump = instrucao[25:0];
            end
        end
    end
endmodule