module SignalExtensor(clock, signal6, signal16);

    input clock;
    input [5:0]signal6;

    output reg [15:0]signal16;

    always @ (posedge clock)begin
        signal16 = signal6 + 16'b0000000000000000;
    end

endmodule
