`include "Shift_left.v"

module Shift_left_TB;
    reg clock;
    reg [31:0]sinal;
	 
    wire [31:0]sinal_deslocado;

    initial begin
        $monitor("clock=%b, sinal=%b, sinal_deslocado=%b", clock, sinal, sinal_deslocado);
        clock = 0;
        #5 sinal = 32'b00000000000000000000000000000100;
        #5 sinal = 32'b00000000000000000000000000001000;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    Shift_left UO(clock,sinal,sinal_deslocado);

endmodule 
