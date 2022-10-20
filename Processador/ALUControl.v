module ALUControl(clock, funct, ALUOp, outputALUControl);
    
    input clock;
    input [1:0]ALUOp;
    input [2:0]funct;

    output reg [2:0]outputALUControl;

    always @ (*)begin
        case(ALUOp)
            2'b00: outputALUControl = 3'b010;  //LW SW

            2'b01: outputALUControl = 3'b110;  //BRANCH

            2'b10: outputALUControl = funct;    //R-TYPE

            2'b11: outputALUControl = 3'b010;

//            default: $display("ALUOp value not supported!"); 
        endcase
    end

endmodule