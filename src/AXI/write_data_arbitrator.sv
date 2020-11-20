`include "../../include/AXI_define.svh"
module write_data_arbitrator(
    input ACLK,
    input ARESETn,
    input [`AXI_DATA_BITS-1:0] WDATA_M1,
    input [`AXI_STRB_BITS-1:0] WSTRB_M1,
    input WLAST_M1,
    input WVALID_M1,
    output logic [`AXI_DATA_BITS-1:0] WDATA_ARB,
    output logic [`AXI_STRB_BITS-1:0] WSTRB_ARB,
    output logic WLAST_ARB,
    output logic WVALID_ARB,
    input BREADY_M1,
    input BVALID_ARB,
    input WREADY_M1,
    output logic W_lock_reg
);
logic BREADY_M1_reg;
logic BVALID_ARB_reg;
logic WVALID_M1_reg;
logic WREADY_M1_reg;

/*always_ff @(posedge ACLK, negedge ARESETn) begin
    if(~ARESETn)begin
        //W_lock_reg <= 1'b0;
	BREADY_M1_reg <= 1'b0;
	BVALID_ARB_reg <= 1'b0;
	WVALID_M1_reg <= 1'b0;
	WREADY_M1_reg <= 1'b0;
    end
    else begin
        //W_lock_reg <= W_lock;
	BREADY_M1_reg <= BREADY_M1;
	BVALID_ARB_reg <= BVALID_ARB;
	WVALID_M1_reg <= WVALID_M1;
	WREADY_M1_reg <= WREADY_M1;
    end
end*/

always_ff @(posedge ACLK, negedge ARESETn)begin
	if(~ARESETn)begin
		W_lock_reg <= 1'b0;
	end
	else if(WVALID_M1 & WREADY_M1)begin
		W_lock_reg <= 1'b1;
	end
	else if(BVALID_ARB & BREADY_M1) begin
		W_lock_reg <= 1'b0;
	end
	else begin
		W_lock_reg <= W_lock_reg;
	end
end

always_comb begin
    if(W_lock_reg)begin
        //if(BREADY_M1 & BVALID_ARB)begin
	//W_lock = 1'b0;
        //end
	//else W_lock = 1'b1;
	WDATA_ARB = 32'b0;
        WSTRB_ARB = 4'b0;
        WLAST_ARB = 1'b0;
        WVALID_ARB = 1'b0;
	//W_lock = 1'b1; 

    end/*
    else if(WVALID_M1_reg & WREADY_M1_reg)begin
        WDATA_ARB = WDATA_M1;
        WSTRB_ARB = WSTRB_M1;
        WLAST_ARB = WLAST_M1;
        WVALID_ARB = WVALID_M1; 
        //W_lock = 1'b1;
    end
    else if(WVALID_M1_reg)begin
        WDATA_ARB = WDATA_M1;
        WSTRB_ARB = WSTRB_M1;
        WLAST_ARB = WLAST_M1;
        WVALID_ARB = WVALID_M1; 
 	//W_lock = 1'b0;
    end*/
    else begin
	WDATA_ARB = WDATA_M1;
        WSTRB_ARB = WSTRB_M1;
        WLAST_ARB = WLAST_M1;
        WVALID_ARB = WVALID_M1; 
 	//W_lock = 1'b0;
    end
end
    
endmodule
