module ShiftLeft(clock, signal, shiftedSignal);

    input clock;
    input [15:0]signal;
    output reg [15:0]shiftedSignal;

    always @ (posedge clock)begin
      shiftedSignal = signal<<2;
    end
endmodule