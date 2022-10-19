`include "../Control/ControlUnity.v"

module ADD
 reg [15:0] add;

initial begin
        
        clock = 0;
        #5 add = 16'0001000001010000;// 
       
        #5 $finish;
    end

endmodule