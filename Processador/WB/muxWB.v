module muxWB(clock, resultadoALU, dadoLido, resposta, MemtoReg);

    input clock;
    input [31:0] resultadoALU;
    input [31:0] dadoLido;
    input MemtoReg;

    output reg [31:0] resposta;

    always @ (posedge clock or negedge clock)begin
        if(MemtoReg == 1)begin
            resposta = dadoLido;
        end else begin
            if(MemtoReg == 0) begin
              resposta = resultadoALU;
            end
        end
    end
endmodule