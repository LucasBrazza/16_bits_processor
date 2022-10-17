module AddPC4(clock, PC, PC4, PCWrite);

    input clock;
    input [15:0]PC;
    input PCWrite;
    output [15:0]PC4;
    reg PC4;

    always @ (*)begin
        if (PCWrite == 0) begin
            PC4 = PC;
        end
        if (PCWrite == 1) begin
            PC4 = PC + 16'b0000000000000100;
        end
    end

endmodule