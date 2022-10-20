module RegisterBank(clock, RegWrite, rs, rt, rd, dataToWrite, data1, data2);

    input clock;
    input RegWrite;
    input [2:0]rs;
    input [2:0]rt;
    input [2:0]rd;
    input [15:0]dataToWrite;

    output reg [15:0]data1;
    output reg [15:0]data2;

    reg [2:0]registers[15:0];
    integer i;
	 
    initial begin
        for(i=0;i<16;i=i+1) begin
            registers[i] <= 16'b0 + i;  
        end
        registers[0] <= 16'b000;
        registers[1] <= 16'b001;
        registers[2] <= 16'b010;
        registers[3] <= 16'b011;
        registers[4] <= 16'b100;
        registers[5] <= 16'b101;
        registers[6] <= 16'b110;
        registers[7] <= 16'b111;
    end

    always @ (posedge clock)begin       
        data1 = registers[rs];
        data2 = registers[rt];
    end

    always @ (negedge clock)begin
        if(RegWrite == 1)begin
            registers[rd] <= dataToWrite;
        end
    end
endmodule