`include "../Processador/branch.v"

module branch_TB;
    reg s1, s2, clock;
    wire r;

    initial begin
        $monitor("clock=%b, Entrada 1=%b, Sinal Entrada 2=%b, Saida=%b", clock, s1, s2, r);
        clock = 0;
        #5 s1 <= 1'b1;
        #5 s2 <= 1'b0;
        #5 s1 <= 1'b1;
        #5 s2 <= 1'b1;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    branch UO(clock,s1,s2,r);

endmodule