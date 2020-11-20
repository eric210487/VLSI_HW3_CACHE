`include "../../include/AXI_define.svh"
module read_address_arbitrator(
	input ACLK,
	input ARESETn,
    input [`AXI_ID_BITS-1:0] ARID_M0,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M0,
	input [`AXI_LEN_BITS-1:0] ARLEN_M0,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
	input [1:0] ARBURST_M0,
	input ARVALID_M0,
    input [`AXI_ID_BITS-1:0] ARID_M1,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M1,
	input [`AXI_LEN_BITS-1:0] ARLEN_M1,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
	input [1:0] ARBURST_M1,
	input ARVALID_M1,
    input ARREADY_ARB,
    output logic [`AXI_ID_BITS-1:0] ARID_ARB,
	output logic [`AXI_ADDR_BITS-1:0] ARADDR_ARB,
	output logic [`AXI_LEN_BITS-1:0] ARLEN_ARB,
	output logic [`AXI_SIZE_BITS-1:0] ARSIZE_ARB,
	output logic [1:0] ARBURST_ARB,
	output logic ARVALID_ARB,
    output logic M0_flag,
    output logic M1_flag,
    output logic ARREADY_M0,
    output logic ARREADY_M1,
    input RVALID_ARB,
    input RREADY_M0,
    input RREADY_M1
);
logic M0_flag_reg;
logic M1_flag_reg;
logic AR_lock;
logic AR_lock_reg;
logic ARREADY_ARB_reg;
logic ARVALID_M0_reg;
logic ARVALID_M1_reg;
logic RVALID_ARB_reg;
logic RREADY_M0_reg;
logic RREADY_M1_reg;
always_ff@(posedge ACLK,negedge ARESETn) begin
	if(~ARESETn)begin
		M0_flag_reg <= 1'b0;
		M1_flag_reg <= 1'b0;
		AR_lock_reg <= 1'b0;
		ARREADY_ARB_reg <= 1'b0;
		ARVALID_M0_reg <= 1'b0;
		ARVALID_M1_reg <= 1'b0;
		RVALID_ARB_reg <= 1'b0;
		RREADY_M0_reg <= 1'b0;
		RREADY_M1_reg <= 1'b0;
	end
	else begin
		M0_flag_reg <= M0_flag;
		M1_flag_reg <= M1_flag;
		AR_lock_reg <= AR_lock;
		ARREADY_ARB_reg <= ARREADY_ARB;
		ARVALID_M0_reg <= ARVALID_M0;
		ARVALID_M1_reg <= ARVALID_M1;
		RVALID_ARB_reg <= RVALID_ARB;
		RREADY_M0_reg <= RREADY_M0;
		RREADY_M1_reg <= RREADY_M1;
	end
end
always_comb begin
    if(AR_lock_reg & M0_flag_reg)begin
        if(RVALID_ARB_reg&RREADY_M0_reg)begin
	    ARID_ARB = 4'b0;
            ARADDR_ARB = ARADDR_M0;
            ARLEN_ARB = 4'b0;
            ARSIZE_ARB = 3'b0;
            ARBURST_ARB = 2'b0;
            ARVALID_ARB = 1'b0;
            M0_flag = 1'b0;
            M1_flag = 1'b0;
	    ARREADY_M0 = 1'b0;
	    ARREADY_M1 = 1'b0;
            AR_lock = 1'b0;
        end
        else begin
	    ARID_ARB = ARID_M0;
            ARADDR_ARB = ARADDR_M0;
            ARLEN_ARB = 4'b0;
            ARSIZE_ARB = 3'b010;
            ARBURST_ARB = 2'b0;
            ARVALID_ARB = 1'b0;
            M0_flag = 1'b1;
            M1_flag = 1'b0;
            AR_lock = 1'b1;
	    ARREADY_M0 = 1'b0;
	    ARREADY_M1 = 1'b0;
        end
    end
    else if (AR_lock_reg & M1_flag_reg)begin
        if(RVALID_ARB_reg&RREADY_M1_reg)begin
	    ARID_ARB = 4'b0;
            ARADDR_ARB = ARADDR_M1;
            ARLEN_ARB = 4'b0;
            ARSIZE_ARB = 3'b0;
            ARBURST_ARB = 2'b0;
            ARVALID_ARB = 1'b0;
            M0_flag = 1'b0;
            M1_flag = 1'b0;
            AR_lock = 1'b0;
	    ARREADY_M0 = 1'b0;
	    ARREADY_M1 = 1'b0;
        end
        else begin
            ARID_ARB = ARID_M1;
            ARADDR_ARB = ARADDR_M1;
            ARLEN_ARB = 4'b0;
            ARSIZE_ARB = 3'b010;
            ARBURST_ARB = 2'b0;
            ARVALID_ARB = 1'b0;
            M0_flag = 1'b0;
            M1_flag = 1'b1;
            AR_lock = 1'b1;
	    ARREADY_M0 = 1'b0;
	    ARREADY_M1 = 1'b0;
        end
    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & ~M0_flag_reg & ~M1_flag_reg & ARREADY_ARB_reg & ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	ARREADY_M1 = 1'b0;
	AR_lock = 1'b1;
    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & M0_flag_reg & ~M1_flag_reg & ARREADY_ARB_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	ARREADY_M1 = 1'b0;
	AR_lock = 1'b1;
    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & ~M0_flag_reg & M1_flag_reg & ARREADY_ARB_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M1;
        ARADDR_ARB = ARADDR_M1;
        ARLEN_ARB = ARLEN_M1;
        ARSIZE_ARB = ARSIZE_M1;
        ARBURST_ARB = ARBURST_M1;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b0;
        M1_flag = 1'b1;
	ARREADY_M0 = 1'b0;
        ARREADY_M1 = ARREADY_ARB;
        AR_lock = 1'b1;
    end
    else if (ARVALID_M1_reg&ARREADY_ARB_reg&~ARVALID_M0_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M1;
        ARADDR_ARB = ARADDR_M1;
        ARLEN_ARB = ARLEN_M1;
        ARSIZE_ARB = ARSIZE_M1;
        ARBURST_ARB = ARBURST_M1;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b0;
        M1_flag = 1'b1;
	ARREADY_M0 = 1'b0;
        ARREADY_M1 = ARREADY_ARB;
        AR_lock = 1'b1;
    end
    else if (ARVALID_M0_reg & ~ARVALID_M1_reg & ARREADY_ARB_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	ARREADY_M1 = 1'b0;
        AR_lock = 1'b1;
    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & ~M0_flag_reg & ~M1_flag_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = ARVALID_M0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
	ARREADY_M1 = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	if(ARREADY_ARB)begin
        AR_lock = 1'b1;
	end
	else begin
        AR_lock = 1'b0;
	end

    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & M0_flag_reg & ~M1_flag_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = ARVALID_M0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	ARREADY_M1 = 1'b0;
	if(ARREADY_ARB)begin
        AR_lock = 1'b1;
	end
	else begin
        AR_lock = 1'b0;
	end
    end
    else if (ARVALID_M0_reg & ARVALID_M1_reg & ~M0_flag_reg & M1_flag_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M1;
        ARADDR_ARB = ARADDR_M1;
        ARLEN_ARB = ARLEN_M1;
        ARSIZE_ARB = ARSIZE_M1;
        ARBURST_ARB = ARBURST_M1;
        ARVALID_ARB = ARVALID_M1;
        M0_flag = 1'b0;
        M1_flag = 1'b1;
	ARREADY_M0 = 1'b0;
        ARREADY_M1 = ARREADY_ARB;
	if(ARREADY_ARB)begin
        AR_lock = 1'b1;
	end
	else begin
        AR_lock = 1'b0;
	end
    end
    else if (ARVALID_M0_reg & ~ARVALID_M1_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M0;
        ARADDR_ARB = ARADDR_M0;
        ARLEN_ARB = ARLEN_M0;
        ARSIZE_ARB = ARSIZE_M0;
        ARBURST_ARB = ARBURST_M0;
        ARVALID_ARB = ARVALID_M0;
        M0_flag = 1'b1;
        M1_flag = 1'b0;
	ARREADY_M1 = 1'b0;
        ARREADY_M0 = ARREADY_ARB;
	if(ARREADY_ARB)begin
        AR_lock = 1'b1;
	end
	else begin
        AR_lock = 1'b0;
	end
    end
    else if (~ARVALID_M0_reg & ARVALID_M1_reg& ~AR_lock_reg)begin
        ARID_ARB = ARID_M1;
        ARADDR_ARB = ARADDR_M1;
        ARLEN_ARB = ARLEN_M1;
        ARSIZE_ARB = ARSIZE_M1;
        ARBURST_ARB = ARBURST_M1;
        ARVALID_ARB = ARVALID_M1;
        M0_flag = 1'b0;
        M1_flag = 1'b1;  
        ARREADY_M1 = ARREADY_ARB;
	ARREADY_M0 = 1'b0;
	if(ARREADY_ARB)begin
        AR_lock = 1'b1;
	end
	else begin
        AR_lock = 1'b0;
	end
    end
    else if (~AR_lock_reg)begin
        ARID_ARB = 4'b0;
        ARADDR_ARB = 32'h30000;
        ARLEN_ARB = 4'b0;
        ARSIZE_ARB = 3'b0;
        ARBURST_ARB = 2'b0;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b0;
        M1_flag = 1'b0;
	ARREADY_M0 = 1'b0;
	ARREADY_M1 = 1'b0;
        AR_lock = 1'b0;
    end
    else begin
	ARID_ARB = 4'b0;
        ARADDR_ARB = 32'h30000;
        ARLEN_ARB = 4'b0;
        ARSIZE_ARB = 3'b0;
        ARBURST_ARB = 2'b0;
        ARVALID_ARB = 1'b0;
        M0_flag = 1'b0;
        M1_flag = 1'b0;
	ARREADY_M0 = 1'b0;
	ARREADY_M1 = 1'b0;
        AR_lock = 1'b0;
    end

end

endmodule
