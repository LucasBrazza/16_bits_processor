module MuxWB(clock, resultULA, dataRead, outputMUX, MemtoReg);

    input clock;
    input MemtoReg;
    input [15:0] resultULA;
    input [15:0] dataRead;

    output reg [15:0] outputMUX;

    always @ (posedge clock or negedge clock)begin
        if(MemtoReg == 1)begin
            outputMUX = dataRead;
        end 
        else begin
            if(MemtoReg == 0) begin
                outputMUX = resultULA;
            end
        end
    end

endmodule