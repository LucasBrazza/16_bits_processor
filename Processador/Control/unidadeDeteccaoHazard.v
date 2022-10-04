module unidadeDeteccaoHazard(clock, IDEXEMemRead, IFIDrs, IFIDrt, IDEXE_destino, PCWrite, IFIDWrite, hazardMux);

    input clock;
    input IDEXEMemRead;
    input [4:0] IFIDrs;
    input [4:0] IFIDrt;
    input [4:0] IDEXE_destino;
    
    output reg PCWrite;
    output reg IFIDWrite;
    output reg hazardMux;

    always @ (posedge clock) begin
        if((IDEXEMemRead == 1) && (IDEXE_destino != 0) && ((IDEXE_destino == IFIDrs) || (IDEXE_destino == IFIDrt)))begin
            hazardMux = 1;
            PCWrite = 0;
            IFIDWrite = 0;
        end
    end
endmodule