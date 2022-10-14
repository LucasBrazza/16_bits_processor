module muxALUSrc(clock, data1, data2, ALUSrc, outputMuxAlu);

    input [15:0]data1;
    input [15:0]data2;
    input ALUSrc;
    input clock;

    output reg [15:0]outputMuxAlu;

    always @ (posedge clock or negedge clock)begin
      if(ALUSrc == 0)begin
        outputMuxAlu = data1;
      end if(ALUSrc == 1)begin
        outputMuxAlu = data2;
      end
    end
endmodule