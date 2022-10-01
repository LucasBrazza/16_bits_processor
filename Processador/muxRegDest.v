module muxRegDest(clock, r1, r2, regDest, saida);

    input [4:0]r1;
    input [4:0]r2;
    input regDest;
    input clock;

    output reg [4:0]saida;

    always @ (posedge clock or negedge clock)begin
      if(regDest == 0)begin
        saida = r1;
      end if(regDest == 1)begin
        saida = r2;
      end
    end
endmodule

    
    