module muxIF(clock, PCSrc, entradaPC4_mux, sinal_deslocado, resposta);
    
    input clock;
    input [31:0] entradaPC4_mux;
    input [31:0] sinal_deslocado;
    input PCSrc;

    output reg [31:0]resposta;

    always @ (negedge clock or posedge clock)begin
        if(PCSrc == 0)begin
          resposta <= entradaPC4_mux;
        end if(PCSrc == 1)begin
          resposta <= sinal_deslocado;
        end
    end

endmodule