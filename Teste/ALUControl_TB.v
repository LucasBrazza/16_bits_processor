`include "../Processador/ALUControl.v"

module ALUControl_TB;

    reg clock;
    reg [5:0]funct;
    reg [1:0]ALUOp;

    wire [2:0]saida;

    initial begin
      $monitor("clock=%b, funct=%b, ALUOp=%b, saida=%b", clock, funct, ALUOp, saida);
      clock = 0;
      #5 ALUOp <= 2'b10;
      #5 funct <= 6'b100000;
      #5 ALUOp <= 2'b01;
      #10 $finish;
    
    end

    always begin
      #5 clock = !clock;
    end

    ALUControl UO(clock, funct, ALUOp, saida);
endmodule