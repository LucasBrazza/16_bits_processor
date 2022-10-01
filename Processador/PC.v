module PC(inp, outp, clock);

input [15:0] inp;
input clock;

output reg [15:0] outp = 0;

always @ (posedge clock or negedge clock) begin
  outp = inp;
end

endmodule