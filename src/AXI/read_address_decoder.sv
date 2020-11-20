`include "../../include/AXI_define.svh"
module read_address_decoder(
    //from read_address_arbitrator
    input [`AXI_ID_BITS-1:0] ARID_ARB,
	input [`AXI_ADDR_BITS-1:0] ARADDR_ARB,
	input [`AXI_LEN_BITS-1:0] ARLEN_ARB,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_ARB,
	input [1:0] ARBURST_ARB,
	input ARVALID_ARB,
    //to slave0
    output logic [`AXI_IDS_BITS-1:0] ARID_S0,
	output logic [`AXI_ADDR_BITS-1:0] ARADDR_S0,
	output logic [`AXI_LEN_BITS-1:0] ARLEN_S0,
	output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S0,
	output logic [1:0] ARBURST_S0,
	output logic ARVALID_S0,
    //to slave1
    output logic [`AXI_IDS_BITS-1:0] ARID_S1,
	output logic [`AXI_ADDR_BITS-1:0] ARADDR_S1,
	output logic [`AXI_LEN_BITS-1:0] ARLEN_S1,
	output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S1,
	output logic [1:0] ARBURST_S1,
	output logic ARVALID_S1,
    //for default slave
    output logic AR_SD,
    input ARREADY_S0,
    input ARREADY_S1,
    output logic ARREADY_ARB,
    input M0_flag,
    input M1_flag

    
);

always_comb begin
    if((32'h00000000 <= ARADDR_ARB)&&(ARADDR_ARB <= 32'h0000ffff))begin //slave 0
        if(M0_flag)begin
            ARID_S0 = {4'b0,ARID_ARB};
        end
        else if (M1_flag)begin
            ARID_S0 = {ARID_ARB,4'b0};
        end
	else begin
	    ARID_S0 = 8'b0;
	end
        //ARID_S0 = ARID_ARB;
        ARADDR_S0 = ARADDR_ARB;
        ARLEN_S0 = ARLEN_ARB;
        ARSIZE_S0 = ARSIZE_ARB;
        ARBURST_S0 = ARBURST_ARB;
        ARVALID_S0 = ARVALID_ARB;
        ARID_S1 = 8'b0;
        ARADDR_S1 = 32'b0;
        ARLEN_S1 = 4'b0;
        ARSIZE_S1 = 3'b0;
        ARBURST_S1 = 2'b0;
        ARVALID_S1 = 1'b0;  
        AR_SD = 1'b0;
	ARREADY_ARB = ARREADY_S0;
    end
    else if ((32'h00010000 <= ARADDR_ARB)&&(ARADDR_ARB <= 32'h0001ffff))begin //slave 1
        if(M0_flag)begin
            ARID_S1 = {4'b0,ARID_ARB};
        end
        else if (M1_flag)begin
            ARID_S1 = {ARID_ARB,4'b0};
        end
	else begin
	    ARID_S1 = 8'b0;
	end
        ARADDR_S1 = ARADDR_ARB;
        ARLEN_S1 = ARLEN_ARB;
        ARSIZE_S1 = ARSIZE_ARB;
        ARBURST_S1 = ARBURST_ARB;
        ARVALID_S1 = ARVALID_ARB;
        ARID_S0 = 8'b0;
        ARADDR_S0 = 32'b0;
        ARLEN_S0 = 4'b0;
        ARSIZE_S0 = 3'b0;
        ARBURST_S0 = 2'b0;
        ARVALID_S0 = 1'b0;
        AR_SD = 1'b0;
        ARREADY_ARB = ARREADY_S1;
    end
    else begin //default slave
        AR_SD = 1'b1;
        ARID_S1 = 8'b0;
        ARADDR_S1 = 32'b0;
        ARLEN_S1 = 4'b0;
        ARSIZE_S1 = 3'b0;
        ARBURST_S1 = 2'b0;
        ARVALID_S1 = 1'b0;
        ARID_S0 = 8'b0;
        ARADDR_S0 = 32'b0;
        ARLEN_S0 = 4'b0;
        ARSIZE_S0 = 3'b0;
        ARBURST_S0 = 2'b0;
        ARVALID_S0 = 1'b0;
        ARREADY_ARB = 1'b0;
    end
end


endmodule
