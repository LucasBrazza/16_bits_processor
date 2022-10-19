`include "../Processador\ID\RegisterBank.v"
`include "../Processador\ID\SignalExtensor.v"

module ID(clock, rs, rt, rd, funct, signalToExtend, dataToWrite, RegWrite, RegDst, readData1, 
            readData2, extendedSignal);

    input clock;
    input RegWrite;
    input RegDst;
    input [2:0]rs;
    input [2:0]rt;
    input [2:0]rd;
    input [1:0]funct;
    input [5:0]signalToExtend;
    input [15:0]dataToWrite;

    output [15:0]readData1;
    output [15:0]readData2;
    output [15:0]extendedSignal;

    wire [2:0]outputMux;

    MUXRegisters mux(
        .clock(clock),
        .data1(rt),
        .data2(rd),
        .ctrl(RegDst),
        .outputMux(outputMux)
    );

    RegisterBank bank(
        .clock(clock), 
        .RegWrite(RegWrite), 
        .reg1(rs), 
        .reg2(rt), 
        .reg3(outputMux), 
        .dataToWrite(dataToWrite), 
        .data1(readData1), 
        .data2(readData2));

    SignalExtensor extensor(
        .clock(clock), 
        .signal6(signalToExtend), 
        .signal16(extendedSignal));

endmodule