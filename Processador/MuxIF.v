module MuxIF(clock, PCSrc, inputPC4Mux, signalShifted, response);
    
    input clock;
    input [15:0] inputPC4Mux;
    input [15:0] signalShifted;
    input PCSrc;


    output reg [15:0]response;

    always @ (*)begin
        if(PCSrc == 1)begin
            response <= signalShifted;
        end
        else begin
            response <= inputPC4Mux;
        end 
    end

endmodule