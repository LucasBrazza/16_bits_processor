module ALU(clock, input1, input2, ALUControl, Zero, result);

    input clock;
    input [15:0]input1;
    input [15:0]input2;
    input [2:0]ALUControl;

    output reg [15:0]result;
    output reg Zero;
        
    always @(*) begin
        case(ALUControl)
            
            3'b000: result <= input1 & input2;   //AND

            3'b001: result <= input1 | input2;   //OR

            3'b010: result <= input1 + input2;   //ADD

            3'b110: result <= input1 - input2;   //SUB

            3'b011: begin                        //bnq             
                if (input1 - input2 != 16'b0) begin
                        result <= 16'b0;
                end else begin
                        result <= 16'b1;
                end
            end

            3'b111: begin                         //SLT             
            
                    if (input1 < input2) begin
                        result <= 16'b1;
                end else begin
                        result <= 16'b0;
                end
            end

            default: result <= 16'b0;
        endcase
        
        Zero = (result == 16'b0 ? 1 : 0);
    end

endmodule
