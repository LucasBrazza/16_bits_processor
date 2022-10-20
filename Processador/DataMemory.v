module DataMemory(clock, MemRead, MemWrite, address, writeData, dataRead);

    input clock;
    input MemRead;
    input MemWrite;
    input [7:0]address;
    input [15:0]writeData;

    output reg [15:0]dataRead;

    reg [15:0]memory[255:0]; //cabem 100 dados na memoria
    reg [7:0]aux;
    integer i;

    initial begin  
        for(i=0;i<256;i=i+1) begin
            memory[i] <= 16'b0;  
        end
     end  

    always @(posedge clock)begin
        if(MemRead == 1)begin
            dataRead = memory[address];
        end
    end

    always @(negedge clock)begin
        if(MemWrite == 1)begin
            memory[address] = writeData;
        end
    end
    
endmodule

