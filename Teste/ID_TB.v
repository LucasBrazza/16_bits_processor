`include "../Processador\ID\ID.v"

module ID_TB;
	reg clock;
   reg [2:0]rs;
   reg [2:0]rt;
   reg [2:0]rd;
   reg [1:0]funct;
	reg RegWrite;
   reg [15:0]dado_escrita;       
   reg [7:0]aj;

   wire [15:0]PC4OUT;       
   wire [15:0]dado1;
   wire [15:0]dado2;
   wire [15:0]exSig;       

   initial begin
      $monitor("clock=%b, RegWrite=%b, rs=%b, rt=%b, rd=%b, dado_escrita=%b, dado1=%b, dado2=%b, ext=%b", clock, RegWrite, rs, rt, rd, dado_escrita, dado1, dado2, exSig);
		clock = 0;
      #5 RegWrite = 1'b1;
      rs = 3'b001;
      rt = 3'b011;
      rd = 3'b100;
      funct = 2'b10;
      dado_escrita = 16'b0000000000001000;
      aj = 8'b10011111;
      #5 rs = 3'b100;
      rt = 3'b100;
      rd = 3'b110;
      dado_escrita = 16'b0000000000001111;
      #5 $finish;
   end

   always begin
		#5 clock = !clock;
   end

   //ok
   ID idtest(
      .clock(clock), 
      .rs(rs), 
      .rt(rt), 
      .rd(rd), 
      .funct(funct), 
      .addressjump(aj), 
      .PC4(16'b0), 
      .writeDat(dado_escrita), 
      .RegWrite(RegWrite), 
      .readData1(dado1), 
      .readData2(dado2), 
      .extendedSignal(exSig), 
      .PC4_outpuID(PC4OUT));

endmodule