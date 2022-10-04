module muxForwardA(clock, resultadoALU, resultadoMuxWB, dadoR1, forwardA, resposta);

    input clock;
    input [31:0] resultadoALU;
    input [31:0] resultadoMuxWB;
    input [31:0] dadoR1;
    input [1:0] forwardA;

    output reg [31:0] resposta;
    always @ (posedge clock)begin
        if(forwardA == 2'b00)begin
            resposta = dadoR1;
        end else if(forwardA == 2'b10)begin
            resposta = resultadoALU;
        end else if(forwardA == 2'b01) begin
            resposta = resultadoMuxWB;
        end
    end
endmodule