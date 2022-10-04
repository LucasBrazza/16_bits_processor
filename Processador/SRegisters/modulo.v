`include "PC.v"
`include "SomadorPC4.v"

module modulo(clock, PC, PC4);
    
    output [31:0]PC4;
    input [31:0]PC;

    input wire clock;
    wire [31:0]PC4;
    wire [31:0]PC;
    wire [31:0]entrada; 
    wire [31:0]saida;

    assign PC4 = 32'b0000000000000000000000000000001;

    PC U0(.clock(clock), .entrada(PC4), .saida(saida));
    SomadorPC4 U1(.clock(clock), .PC(saida), .PC4(PC4));

endmodule

