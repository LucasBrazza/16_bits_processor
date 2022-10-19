`include "../ALU.v"

module ALU_TB;
	
	reg clock;
   reg [15:0]entrada1;
   reg [15:0]entrada2;
   reg [2:0]ALUControl;
	wire zero;
	wire [15:0]resultado;

   initial begin
	   $monitor("clock=%b, entrada 1=%b, entrada 2=%b, ALUControl=%b, zero=%b, resultado=%b", clock, entrada1, entrada2, ALUControl, zero, resultado);
		clock = 0;
		entrada1 = 16'b0000000000000011;
		entrada2 = 16'b0000000000000001;
		ALUControl <= 3'b110;
		#10 $finish;
    end
    
    always begin
      #10 clock = !clock;
    end

    ALU U0(clock, entrada1, entrada2, ALUControl, zero, resultado);

endmodule