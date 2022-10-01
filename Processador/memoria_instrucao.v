module memoria_instrucao(clock, endereco, instrucaoOut);

    input clock;
    input [31:0]endereco;

    output reg [31:0]instrucaoOut;
    
    reg [31:0]instrucoes[1599:0];

    initial begin
      $readmemb("traducao.txt", instrucoes);
    end

    always @ (negedge clock) begin
      instrucaoOut = instrucoes[(endereco/4) - 1];
    end

endmodule