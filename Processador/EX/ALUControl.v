module ALUControl(clock, funct, ALUOp, saida);
    
    input clock;
    input [2:0]funct;
    input [1:0]ALUOp;

    output reg [2:0]saida;

    always @ (*)begin
      case(ALUOp)
        2'b00: saida = 3'b010;  //LW SW

        2'b01: saida = 3'b110;  //BRANCH

        2'b10: case(funct)    //R-TYPE
                 3'b010: saida = 3'b010; //add 

                 3'b110: saida = 3'b110; // subtract

                 3'b000: saida = 3'b000; // AND

                 3'b001: saida = 3'b001; //OR 

                 3'b111: saida = 3'b111; // SET ON LESS THAN

                 default: $display("Funct value not supported!");
                endcase
        default: $display("ALUOp value not supported!"); 
      endcase
    end


endmodule