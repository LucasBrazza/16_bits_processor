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
        registers[3'b000] = 3'b000;
        registers[3'b001] = 3'b001;
        registers[3'b010] = 3'b010;
        registers[3'b011] = 3'b011;
        registers[3'b100] = 3'b100;
        registers[3'b101] = 3'b101;
        registers[3'b110] = 3'b110;
        registers[3'b111] = 3'b111;
    end

    always @ (posedge clock)begin       
        data1 = registers[rs];
        data2 = registers[rt];
    end

    always @ (negedge clock)begin
        if(RegWrite == 1)begin
            registers[reg3] <= dataToWrite;
        end
//        $monitor("aaa %b",RegWrite);
    end
endmodule