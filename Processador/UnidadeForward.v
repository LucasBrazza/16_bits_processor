module UnidadeForward(clock, IFIDrs, IFIDrt, MEMWBrd, EXEMEMrd, EXEMEMRegWrite, MEMWBRegWrite, 
forwardA, forwardB);

    input clock;
    input [4:0] IFIDrs;
    input [4:0] IFIDrt;
    input [4:0] MEMWBrd;
    input [4:0] EXEMEMrd;
    input EXEMEMRegWrite;
    input MEMWBRegWrite;

    output reg [1:0] forwardA;
    output reg [1:0] forwardB;

    always @ (posedge clock)begin
        //Hazard em EXE
        if(EXEMEMRegWrite && (EXEMEMrd != 5'b0) && (EXEMEMrd == IFIDrs))begin
            forwardA = 2'b10;
        end else if (EXEMEMRegWrite && (EXEMEMrd != 5'b0) && (EXEMEMrd == IFIDrt)) begin
            forwardB = 2'b10;  
        end
        //Hazard em MEM
        if(MEMWBRegWrite && (MEMWBrd != 5'b0) && MEMWBrd == IFIDrs)begin
            forwardA = 2'b01;
        end else if(MEMWBRegWrite && (MEMWBrd != 5'b0) && (MEMWBrd == IFIDrt))begin
            forwardB = 2'b01;
        end
    end
endmodule