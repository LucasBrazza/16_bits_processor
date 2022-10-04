module MuxIF(clock, PCSrc, inputPC4Mux, signalShifted, response);
    
    input clock;
    input [15:0] inputPC4Mux;
    input [15:0] signalShifted;
    input PCSrc;

    output reg [15:0]response;

    always @ (negedge clock or posedge clock)begin
        if(PCSrc == 0)begin
            response <= inputPC4Mux;
        end if(PCSrc == 1)begin
            response <= signalShifted;
        end
    end

endmodule