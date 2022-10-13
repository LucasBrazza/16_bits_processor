module IFID(clock, IFIDWrite, PC4, outputPC4, instuction, opcode, rs, rt, rd, funct, address, addressJump);
    
    input clock;
    input IFIDWrite;
    input [15:0] PC4;
    input [15:0] instuction;

    output reg [15:0] outputPC4;
    output reg [3:0] opcode;
    output reg [2:0] rs;
    output reg [2:0] rt;
    output reg [2:0] rd;
    output reg [2:0] funct;
    output reg [5:0] address;              
    output reg [12:0] addressJump;         

    always @ (posedge clock)begin
        outputPC4 = PC4;
        opcode = instuction[15:12];
        if(IFIDWrite == 1)begin
            if(opcode == 4'b0001)begin
                rs = inst[11:9];
                rt = inst[8:6];
                rd = inst[5:3];
                funct = inst[2:0];
            end 
            else if(opcode == 4'0001 || opcode == 4'0010 ||opcode == 4'0011)begin
                rs = inst[11:9];
                rt = inst[8:6];
                address = inst[5:0];  
            end else begin
                addressJump = inst[12:0];
            end
        end
    end
endmodule