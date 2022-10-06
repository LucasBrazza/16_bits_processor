module RegisterBank(clock, regWrite, reg1, reg2, reg3, dataToWrite, data1, data2);

    input clock;
    input regWrite;
    input [2:0]reg1;
    input [2:0]reg2;
    input [2:0]reg3;
    input [15:0]dataToWrite;

    // esse é o output original, achei q saiam 32 bits, mas aqui saem só 5???
    // no nosso caso seria o que entao?
    output reg [2:0]data1;
    output reg [2:0]data2;

    // esse [5:0] tbm é o original, ele diz respeito a que?
    reg [5:0]registers[15:0];
	 
    initial begin
	registers[0] = 3'b000;
	registers[1] = 3'b001;
	registers[2] = 3'b010;
	registers[3] = 3'b100;
	registers[4] = 3'b011;
	registers[5] = 3'b101;
	registers[6] = 3'b110;
	registers[7] = 3'b111;
    end

    always @ (posedge clock)begin
      data1 = registers[reg1];
      data2 = registers[reg2];
    end

    always @ (negedge clock)begin
      if(regWrite == 1)begin
        registers[reg3] = dataToWrite;
      end
    end
endmodule