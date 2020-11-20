`include "../../include/AXI_define.svh"
module read_data_arbitrator(
    input ACLK,
    input ARESETn,
    input [`AXI_IDS_BITS-1:0] RID_ARB,
    input [`AXI_DATA_BITS-1:0] RDATA_ARB,
    input [1:0] RRESP_ARB,
    input RLAST_ARB,
    input RVALID_ARB,
    input M0_flag,
    input M1_flag,
    input RREADY_M0,
    input RREADY_M1,
    output logic RREADY_ARB,
    //master 0
    output logic [`AXI_ID_BITS-1:0] RID_M0,
	output logic [`AXI_DATA_BITS-1:0] RDATA_M0,
	output logic [1:0] RRESP_M0,
	output logic RLAST_M0,
	output logic RVALID_M0,
    //master 1
    output logic [`AXI_ID_BITS-1:0] RID_M1,
	output logic [`AXI_DATA_BITS-1:0] RDATA_M1,
	output logic [1:0] RRESP_M1,
	output logic RLAST_M1,
	output logic RVALID_M1,
	input ARREADY_ARB,
	input ARVALID_ARB
);
logic M0_flag_reg;
logic M1_flag_reg;

always_ff @(posedge ACLK, negedge ARESETn) begin
    if(~ARESETn)begin
        M0_flag_reg <= 1'b0;
        M1_flag_reg <= 1'b0;
    end
    else begin
        M0_flag_reg <= M0_flag;
        M1_flag_reg <= M1_flag;
    end

end
always_comb begin
	if(M0_flag_reg)begin
            RID_M0 = RID_ARB[3:0];
            RDATA_M0 = RDATA_ARB;
            RRESP_M0 = RRESP_ARB;
            RLAST_M0 = RLAST_ARB;
            RVALID_M0 = RVALID_ARB;
            RID_M1 = RID_ARB[7:4];
            RDATA_M1 = RDATA_ARB;
            RRESP_M1 = RRESP_ARB;
            RLAST_M1 = RLAST_ARB;
            RVALID_M1 = 1'b0;
            RREADY_ARB = RREADY_M0;
        end
        else if (M1_flag_reg)begin
            RID_M1 = RID_ARB[7:4];
            RDATA_M1 = RDATA_ARB;
            RRESP_M1 = RRESP_ARB;
            RLAST_M1 = RLAST_ARB;
            RVALID_M1 = RVALID_ARB;
            RID_M0 = RID_ARB[3:0];
            RDATA_M0 = RDATA_ARB;
            RRESP_M0 = RRESP_ARB;
            RLAST_M0 = RLAST_ARB;
            RVALID_M0 = 1'b0;
            RREADY_ARB = RREADY_M1;
        end
        else begin
            RID_M1 = 4'b0;
            RDATA_M1 = 32'b0;
            RRESP_M1 = 2'b0;
            RLAST_M1 = 1'b0;
            RVALID_M1 = 1'b0;
            RID_M0 = 4'b0;
            RDATA_M0 = 32'b0;
            RRESP_M0 = 2'b0;
            RLAST_M0 = 1'b0;
            RVALID_M0 = 1'b0;
            RREADY_ARB = 1'b0;
        end
end






endmodule
