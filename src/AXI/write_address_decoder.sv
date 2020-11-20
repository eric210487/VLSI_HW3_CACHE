`include "../../include/AXI_define.svh"
module write_address_decoder(
    input [`AXI_ID_BITS-1:0] AWID_ARB,
	input [`AXI_ADDR_BITS-1:0] AWADDR_ARB,
	input [`AXI_LEN_BITS-1:0] AWLEN_ARB,
	input [`AXI_SIZE_BITS-1:0] AWSIZE_ARB,
	input [1:0] AWBURST_ARB,
	input AWVALID_ARB,
    input AWREADY_S0,
    input AWREADY_S1,
    output logic [`AXI_IDS_BITS-1:0] AWID_S0,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S0,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S0,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
	output logic [1:0] AWBURST_S0,
	output logic AWVALID_S0,
    output logic [`AXI_IDS_BITS-1:0] AWID_S1,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S1,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S1,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
	output logic [1:0] AWBURST_S1,
	output logic AWVALID_S1,
    output logic [1:0]AW_S,
    output logic AWREADY_M1,
	input AW_lock_reg
);

always_comb begin

    if((32'h00000000 <= AWADDR_ARB)&&(AWADDR_ARB <= 32'h0000ffff))begin //slave 0
        AWID_S0 = {AWID_ARB,4'b0};
        AWADDR_S0 = AWADDR_ARB;
        AWLEN_S0 = AWLEN_ARB;
        AWSIZE_S0 = AWSIZE_ARB;
        AWBURST_S0 = AWBURST_ARB;
        AWVALID_S0 = AWVALID_ARB;
        AWID_S1 = 8'b0;
        AWADDR_S1 = 32'b0;
        AWLEN_S1 = 4'b0;
        AWSIZE_S1 = 3'b0;
        AWBURST_S1 = 2'b0;
        AWVALID_S1 = 1'b0;  
        AW_S = 2'b00;
	//AWREADY_M1 = 1'b0;
	if(AW_lock_reg)	AWREADY_M1 = 1'b0;
	else	AWREADY_M1 = AWREADY_S0;

    end
    else if ((32'h00010000 <= AWADDR_ARB)&&(AWADDR_ARB <= 32'h0001ffff))begin //slave 1
        AWID_S1 = {AWID_ARB,4'b0};
        AWADDR_S1 = AWADDR_ARB;
        AWLEN_S1 = AWLEN_ARB;
        AWSIZE_S1 = AWSIZE_ARB;
        AWBURST_S1 = AWBURST_ARB;
        AWVALID_S1 = AWVALID_ARB;
        AWID_S0 = 8'b0;
        AWADDR_S0 = 32'b0;
        AWLEN_S0 = 4'b0;
        AWSIZE_S0 = 3'b0;
        AWBURST_S0 = 2'b0;
        AWVALID_S0 = 1'b0;
        AW_S = 2'b01;
	//AWREADY_M1 = 1'b0;
	if(AW_lock_reg)	AWREADY_M1 = 1'b0;
	else
	AWREADY_M1 = AWREADY_S1;
    end
    else begin //default slave
        AW_S = 2'b10;
        AWREADY_M1 = 1'b0;
        AWID_S0 = 8'b0;
        AWADDR_S0 = 32'b0;
        AWLEN_S0 = 4'b0;
        AWSIZE_S0 = 3'b0;
        AWBURST_S0 = 2'b0;
        AWVALID_S0 = 1'b0;
        AWID_S1 = 8'b0;
        AWADDR_S1 = 32'b0;
        AWLEN_S1 = 4'b0;
        AWSIZE_S1 = 3'b0;
        AWBURST_S1 = 2'b0;
        AWVALID_S1 = 1'b0;
    end
end
    
endmodule
