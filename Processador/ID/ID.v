`include "RegisterBank.v"
`include "SignalExtensor.v"

module ID(clock, rs, rt, rd, funct, address, addressjump, PC4, writeDat, writeRegister, RegWrite, readData1, 
            readData2, extendedSignal, PC4_outpuID);

    input clock;
    input RegWrite;
    input [15:0]PC4;
    input [2:0]rs;
    input [2:0]rt;
    input [2:0]rd;
    input [2:0]funct;
    input [15:0]address;
    input [13:0]addressjump;
    input [15:0]writeDat;
    input [2:0]writeRegister;

    output [15:0]readData1;
    output [15:0]readData2;
    output [15:0]extendedSignal;

    output reg [15:0]PC4_outpuID;

    initial begin
        PC4_outpuID = PC4;
    end

    RegsterBank bank(
        .clock(clock), 
        .RegWrite(RegWrite), 
        .reg1(rs), 
        .reg2(rt), 
        .reg3(rd), 
        .dado_escrita(writeDat), 
        .readData1(readData1), 
        .readData2(readData2));

    SignalExtensor extensor(
        .clock(clock), 
        .signal8(address), 
        .signal16(extendedSignal));

    /*initial begin
        $monitor("clock = %b \n registrador1 = %b \n registrador2 = %b \n registradordestino = %b \n dado escrito = %b \n dado 1 = %b, dado 2 = %b, sinal extendido = %b", clock, reg1, reg2, RegDst, writeDat, saida1, saida2, sinal32saida);
        clock = 0;
        EscReg = 0;
        //#5 instuction = 32'b00000000001000100000000000000001;
        #5 RegDst = 32'b00000;
        //writeDat = 32'b00000000001000100000000000000000;
        
        #40 $finish;
    end

    always begin
    #5 clock = ~clock;
    end*/

    //banco_registradores banco(.clock(clock), .RegWrite(EscReg), .r1(reg1), .r2(reg2), .r3(RegDst), .dado_escrita(writeDat), .dado_lido1(saida1), .dado_lido2(saida2));

    //extensor16_32 extensor(.clock(clock), .sinal16(sinal16entrada), .sinal32(sinal32saida));

endmodule