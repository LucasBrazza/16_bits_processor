module Branch(clock, s1, s2, outputBranch);

    input clock;
    input s1;
    input s2;

    output reg outputBranch;

    always @ (posedge clock or posedge clock)begin
        outputBranch = s1 && s2; 
    end

endmodule
