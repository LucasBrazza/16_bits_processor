module AddPC4(clock, PC, PC4);

    input clock;
    input [15:0]PC;
    output reg [15:0]PC4;


    always @ (posedge clock or negedge clock)begin
        PC4 = PC + 16'b1;
    end

endmodule