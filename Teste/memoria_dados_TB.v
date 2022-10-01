`include "memoria_dados.v"

module memoria_dados_TB();

reg [31:0]endereco;
reg [31:0]dadoEscrita;
reg memRead;
reg memWrite;
reg clock;

wire [31:0]dadoLido;

initial begin
    $monitor("clock = %b \n endereco = %b \n dado escrita = %b \n memRead = %b \n memWrite = %b \n dado lido = %b \n", clock, endereco, dadoEscrita, memRead, memWrite, dadoLido);
    clock = 0;
    #5 memWrite = 1; 
    endereco = 0;
    dadoEscrita = 1;
    //memWrite = 1;
    memRead = 0;
    #10 memRead = 1;
    endereco = 0;
    memWrite = 0;
    #20 $finish;
end

always begin
    #5 clock = !clock;
end

memoria_dados UO(clock, memRead, memWrite, endereco, dadoEscrita, dadoLido);

endmodule