`include "memoria_instrucao.v"

module memoria_instrucao_TB;
    reg [31:0]endereco;
    reg clock;
    
    wire [31:0]instrucaoOut;
    wire [31:0]instrucoes[255:0];

    initial begin
      $monitor("clock = %b, instrucao = %b, endereco = %b", clock, instrucaoOut, endereco);
      clock = 0;
      #5 endereco = 32'b0;
      #5 endereco = 32'b00000000000000000000000000000001;
      #5 endereco = 32'b00000000000000000000000000000010;
      #5 endereco = 32'b00000000000000000000000000000011;
      #5 endereco = 32'b00000000000000000000000000000100;
      #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    memoria_instrucao UO(clock, endereco, instrucaoOut);

endmodule