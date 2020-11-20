`include "../../include/AXI_define.svh"
module write_data_decoder(
	input ACLK,
	input ARESETn,
    input [`AXI_DATA_BITS-1:0] WDATA_ARB,
	input [`AXI_STRB_BITS-1:0] WSTRB_ARB,
	input WLAST_ARB,
	input WVALID_ARB,
    input [1:0]AW_S,
    input WREADY_S0,
    input WREADY_S1,
    output logic [`AXI_DATA_BITS-1:0] WDATA_S0,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_S0,
	output logic WLAST_S0,
	output logic WVALID_S0,
    output logic [`AXI_DATA_BITS-1:0] WDATA_S1,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_S1,
	output logic WLAST_S1,
	output logic WVALID_S1,
    output logic WREADY_M1,
	input W_lock

);


always_comb begin
	
    if(AW_S==2'b00)begin
        WDATA_S0 = WDATA_ARB;
        WSTRB_S0 = WSTRB_ARB;
        WLAST_S0 = WLAST_ARB;
        WVALID_S0 = WVALID_ARB;
        WDATA_S1 = 32'b0;
        WSTRB_S1 = 4'b0;
        WLAST_S1 = 1'b0;
        WVALID_S1 = 1'b0;
	if(W_lock)begin
		WREADY_M1 = 1'b0;
	end
	else begin
        WREADY_M1 = WREADY_S0;
	end
        //WREADY_M1 = WREADY_S0;
    end
    else if (AW_S==2'b01)begin
        WDATA_S1 = WDATA_ARB;
        WSTRB_S1 = WSTRB_ARB;
        WLAST_S1 = WLAST_ARB;
        WVALID_S1 = WVALID_ARB;
        WDATA_S0 = 32'b0;
        WSTRB_S0 = 4'b0;
        WLAST_S0 = 1'b0;
        WVALID_S0 = 1'b0;
	if(W_lock)begin
		WREADY_M1 = 1'b0;
	end
	else begin
        WREADY_M1 = WREADY_S1;
	end
        //WREADY_M1 = WREADY_S1;
    end
    
    else begin
        WDATA_S0 = 32'b0;
        WSTRB_S0 = 4'b0;
        WLAST_S0 = 1'b0;
        WVALID_S0 = 1'b0;
        WDATA_S1 = 32'b0;
        WSTRB_S1 = 4'b0;
        WLAST_S1 = 1'b0;
        WVALID_S1 = 1'b0;
        WREADY_M1 = 1'b0;
    end
end
    
endmodule
