module RegisterBank(clock, RegWrite, rs, rt, rd, dataToWrite, data1, data2);

    input clock;
    input RegWrite;
    input [2:0]rs;
    input [2:0]rt;
    input [2:0]rd;
    input [15:0]dataToWrite;

    output reg [15:0]data1;
    output reg [15:0]data2;

    integer reg1;
    integer reg2;
    integer reg3;
    reg [2:0]registers[15:0];
	 
    initial begin
        registers[0] = 3'b000;
        registers[1] = 3'b001;
        registers[2] = 3'b010;
        registers[3] = 3'b011;
        registers[4] = 3'b100;
        registers[5] = 3'b101;
        registers[6] = 3'b110;
        registers[7] = 3'b111;
    end

    always @(*)begin
        reg1 = rs;
        reg2 = rt;
        reg3 = rd;
    end

    always @ (posedge clock)begin       
        data1 <= registers[reg1];
        data2 <= registers[reg2];
    end

    always @ (negedge clock)begin
        if(RegWrite == 1)begin
            registers[reg3] <= dataToWrite;
        end
    end
endmodule