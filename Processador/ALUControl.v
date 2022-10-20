module ALUControl(clock, funct, ALUOp, outputALUControl);
    
    input clock;
    input [1:0]ALUOp;
    input [2:0]funct;

    output reg [2:0]outputALUControl;

    always @ (*)begin
        case(ALUOp)
            2'b00: outputALUControl = 3'b010;  //LW SW

            2'b01: begin
                if(funct==3'b010) begin
                    outputALUControl = 3'b011;  //bne
                end
                else begin
                    outputALUControl = 3'b110;  //beq
                end
            end 

            2'b10: outputALUControl = funct;    //R-TYPE

            2'b11: outputALUControl = 3'b010;

            default: outputALUControl = 3'b010; 
        endcase
    end

endmodule