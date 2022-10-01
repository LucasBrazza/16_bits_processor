module extensor16_32(clock, sinal16, sinal32);

input [15:0]sinal16;
input clock;
output reg [31:0]sinal32;

always @ (posedge clock)begin
  sinal32 = sinal16 + 32'b00000000000000000000000000000000;
end
endmodule
