module ALUControl(clock, funct, ALUOp,outputAluControll);
    
    input clock;
    input [2:0]funct;
    input [1:0]ALUOp;

    output reg [2:0]saida;

    always @ (*)begin
      case(ALUOp)
        2'b00:outputAluControll = 3'b010;

        2'b01:outputAluControll = 3'b110;

        2'b10: case(funct)
                 3'b010:outputAluControll = 3'b010; //add 

                 3'b110:outputAluControll = 3'b110; // subtract

                 3'b000:outputAluControll = 3'b000; // AND

                 3'b001:outputAluControll = 3'b001; //OR 

                 3'b111:outputAluControll = 3'b111; // SET ON LESS THAN

                 default: $display("Funct value not supported!");
                endcase
        default: $display("ALUOp value not supported!"); 
      endcase
    end


endmodule