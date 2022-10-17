`include "../Processador\ID\RegisterBank.v"
`include "../Processador\ID\SignalExtensor.v"

module ID(clock, rs, rt, rd, funct, addressjump, PC4, writeDat, RegWrite, readData1, 
            readData2, extendedSignal, PC4_outpuID);

    input clock;
    input RegWrite;
    input [15:0]PC4;
    input [2:0]rs;
    input [2:0]rt;
    input [2:0]rd;
    input [1:0]funct;
    input [7:0]addressjump;
    input [15:0]writeDat;

    output [15:0]readData1;
    output [15:0]readData2;
    output [15:0]extendedSignal;
    output reg [15:0]PC4_outpuID;

    initial begin
        PC4_outpuID = PC4;
    end

    RegisterBank bank(
        .clock(clock), 
        .RegWrite(RegWrite), 
        .reg1(rs), 
        .reg2(rt), 
        .reg3(rd), 
        .dataToWrite(writeDat), 
        .data1(readData1), 
        .data2(readData2));

    SignalExtensor extensor(
        .clock(clock), 
        .signal8(addressjump), 
        .signal16(extendedSignal));

endmodule