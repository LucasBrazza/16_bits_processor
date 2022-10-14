`include "../Processador/EX/adder.v"

module adder_TB;
    reg clock;
    reg [15:0]entrada1;
    reg [15:0]entrada2;

    wire [15:0]resultado;

    initial begin
        $monitor("clock = %b, entrada 1 = %b, entrada 2 = %b, saida = %b", clock, entrada1, entrada2, resultado);
        clock = 0;
        #5 entrada1 = 16'b0000000000000001;
        #5 entrada2 = 16'b0000000000000011;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    adder UO(clock, entrada1, entrada2, resultado);

endmodule