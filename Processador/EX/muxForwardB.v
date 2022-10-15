module muxForwardB(clock, resultALU, resultMuxWB, dataR2, forwardB, response);

    input clock;
    input [15:0] resultALU;
    input [15:0] resultMuxWB;
    input [15:0] dataR2;
    input [1:0] forwardB;

    output reg [15:0] response;

    always @ (posedge clock) begin
        if(forwardB == 2'b00) begin
            response = dataR2;
        end else if(forwardB == 2'b10)begin
            response = resultALU;  
        end else if(forwardB == 2'b01)begin
            response = resultMuxWB;
        end
    end
endmodule