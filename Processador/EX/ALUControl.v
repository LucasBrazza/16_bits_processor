module ALUControl(clock, funct, ALUOp, saida);
    
    input clock;
    input [2:0]funct;
    input [1:0]ALUOp;

    output reg [2:0]saida;

    always @ (*)begin
      case(ALUOp)
        2'b00: saida = 3'b010;

        2'b01: saida = 3'b110;

        2'b10: case(funct)
                 6'b100000: saida = 3'b010;

                 6'b100010: saida = 3'b110;

                 6'b100100: saida = 3'b000;

                 6'b100101: saida = 3'b001;

                 6'b101010: saida = 3'b111;

                 default: $display("Valor de funct não suportada!");
                endcase
        default: $display("Valor de ALUOp não suportada!"); 
      endcase
    end


endmodule