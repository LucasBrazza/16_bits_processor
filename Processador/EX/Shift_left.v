module Shift_left(clock, signal, signal_displaced);

    input clock;
    input [15:0]signal;
    output reg [15:0]signal_displaced;

    always @ (posedge clock)begin
      signal_displaced = signal<<2;
    end
endmodule