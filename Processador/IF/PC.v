module PC(clock, inp, outp);

    input clock;
    input [15:0]inp;

    output reg [15:0]outp;

    always @ (*)begin
        outp = inp;
    end

endmodule