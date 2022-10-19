module MUXRegisters(clock, data1, data2, ctrl, outputMux);

    input [2:0]data1;
    input [2:0]data2;
    input ctrl;
    input clock;

    output reg [2:0]outputMux;

    always @ (posedge clock or negedge clock)begin
        if(ctrl == 0)begin
            outputMux = data1;
        end if(ctrl == 1)begin
            outputMux = data2;
        end
    end
endmodule