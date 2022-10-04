module memoria_dados(clock, memRead, memWrite, endereco, dadoEscrita, dadoLido);

    input clock;
    input memRead;
    input memWrite;
    input [31:0]endereco;
    input [31:0]dadoEscrita;

    output reg [31:0]dadoLido;

    reg [31:0]dados[1599:0];

    always @(posedge clock)begin
      if(memRead == 1)begin
        dadoLido <= dados[endereco];
      end
    end

    always @(negedge clock)begin
      if(memWrite == 1)begin
        dados[endereco] <= dadoEscrita;
      end
    end
endmodule

