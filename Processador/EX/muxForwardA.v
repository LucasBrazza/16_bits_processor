module muxForwardA(clock, resultALU, resultMuxWB, dataR1, forwardA, response);

    input clock;
    input [15:0] resultALU;
    input [15:0] resultMuxWB;
    input [15:0] dataR1;
    input [1:0] forwardA;

    output reg [15:0] response;
    always @ (posedge clock)begin
        if(forwardA == 2'b00)begin
            response = dataR1;
        end else if(forwardA == 2'b10)begin
            response = resultALU;
        end else if(forwardA == 2'b01) begin
            response = resultMuxWB;
        end
    end
endmodule