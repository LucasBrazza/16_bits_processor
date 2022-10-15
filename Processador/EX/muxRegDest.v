module muxRegDest(clock, r1, r2, regDest, outputMuxReg);

    input [2:0]r1;
    input [2:0]r2;
    input regDest;
    input clock;

    output reg [2:0]outputMuxReg;

    always @ (posedge clock or negedge clock)begin
      if(regDest == 0)begin
        outputMuxReg = r1;
      end if(regDest == 1)begin
        outputMuxReg = r2;
      end
    end
endmodule

    
    