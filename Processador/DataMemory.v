module DataMemory(clock, MemRead, MemWrite, address, writeData, dataRead);

    input clock;
    input MemRead;
    input MemWrite;
    input [15:0]address;
    input [15:0]writeData;

    output reg [15:0]dataRead;

    reg [15:0]data[1599:0];

    always @(posedge clock)begin
        if(MemRead == 1)begin
            dataRead = data[address];
        end
    end

    always @(negedge clock)begin
        if(MemWrite == 1)begin
            data[address] <= writeData;
        end
    end
    
endmodule

