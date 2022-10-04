module SignalExtensor(clock, signal8, signal16);

    input clock;
    input [7:0]signal8;

    output reg [15:0]signal16;

    always @ (posedge clock)begin
        signal16 = signal8 + 16'b0000000000000000;
    end

endmodule
