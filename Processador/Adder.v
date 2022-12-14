module Adder(clock, input1, input2, result);
    input clock;
    input [15:0]input1;
    input [15:0]input2;

    output reg [15:0]result;

    always @ (posedge clock or negedge clock)begin
      result = input1[3:0] + input2[8:5];
    end 
endmodule