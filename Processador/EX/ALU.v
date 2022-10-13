module ALU(clock, entrada1, entrada2, ALUControl, zero, resultado);

   input clock;
   input [15:0]entrada1;
   input [15:0]entrada2;
   input [2:0]ALUControl;

   output reg [15:0]resultado;
	output reg zero;
	
   always @(posedge clock)
	 begin
      case(ALUControl)
		  
		3'b000: resultado = entrada1 & entrada2;
        3'b001: resultado = entrada1 | entrada2;
        3'b010: resultado = entrada1 + entrada2;
        3'b011: resultado = entrada1 - entrada2;
        3'b100: 
		  begin
				if (entrada1 < entrada2) begin
                    resultado = 16'b1;
            end else begin
                    resultado = 16'b0;
            end
		  end

        default: $display("Valor não suportado!");
      endcase
	end

 always @(*) 
    begin
        resultado = ALU(entrada1, entrada2, ALUControl);
        if (resultado == 0) begin
            zero = 1;
        end else begin
            zero = 0;
        end
    end

	
endmodule
