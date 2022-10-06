module muxForwardB(clock, resultadoALU, resultadoMuxWB, dadoR2, forwardB, resposta);

    input clock;
    input [15:0] resultadoALU;
    input [15:0] resultadoMuxWB;
    input [15:0] dadoR2;
    input [1:0] forwardB;

    output reg [15:0] resposta;

    always @ (posedge clock) begin
        if(forwardB == 2'b00) begin
            resposta = dadoR2;
        end else if(forwardB == 2'b10)begin
            resposta = resultadoALU;  
        end else if(forwardB == 2'b01)begin
            resposta = resultadoMuxWB;
        end
    end
endmodule