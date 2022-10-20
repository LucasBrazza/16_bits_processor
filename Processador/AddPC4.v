module AddPC4(clock, PC, PC4);
    // agora o pc adiciona bit por bit
    input clock;
    input [15:0]PC;
    output reg [15:0]PC4;

    
    always @ (posedge clock)begin
        PC4 <= PC + 16'b1;
    end

endmodule