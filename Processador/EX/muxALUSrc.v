module muxALUSrc(clock, dado1, dado2, ALUSrc, saida);

    input [15:0]dado1;
    input [15:0]dado2;
    input ALUSrc;
    input clock;

    output reg [15:0]saida;

    always @ (posedge clock or negedge clock)begin
      if(ALUSrc == 0)begin
        saida = dado1;
      end if(ALUSrc == 1)begin
        saida = dado2;
      end
    end
endmodule