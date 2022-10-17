//`include "../Processador\IF\IF.v"
`include "../Processador\IF\MuxIF.v"
`include "../Processador\IF\PC.v"
`include "../Processador\IF\AddPC4.v"


module IF_TB;

    reg clk;
    reg PCSrc;
    reg PCWrite;

    reg [15:0]outputPC4;
    reg [15:0]shiftAddress;
    wire [15:0]outputMux;
    wire [15:0]outputPC;
    wire [15:0]outputPC4plus;





    initial begin
        outputPC4 = 16'b0000000000000001;
        $monitor("clock = %b, PCsrc = %b , PC4 = %b", clk, PCWrite, outputPC4plus);
        clk = 0;
        PCSrc = 0;
        PCWrite = 0;
        #40 $finish;
    end

    always begin
        #10 clk = !clk;   
        PCSrc = !PCSrc;   
        PCWrite = !PCWrite;   

    end
/*
    //ok
    MuxIF mux(
        .clock(clock),
        .PCSrc(PCSrc),
        .inputPC4Mux(outputPC4),
        .signalShifted(shiftAddress),
        .response(outputMux));

    //ok
    PC pc(
        .clock(clock),
        .inp(outputMux), 
        .outp(outputPC));

    //ok
    AddPC4 pc4(	
        .clock(clock), 
        .PC(outputPC4), 
        .PC4(outputPC4plus),
        .PCWrite(PCWrite));

*/
    InstructionMemory memIn(
        .clock(clock),
        .endereco(outputPC4),
        .instrucaoOut(outputMEM));

endmodule