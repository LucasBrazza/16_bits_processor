module branch(clock, s1, s2, r);
    input clock, s1, s2;
    output reg r;

    always @ (posedge clock or posedge clock)begin
      r = s1 && s2;
    end

endmodule
