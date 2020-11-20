`include "../../include/AXI_define.svh"
module read_data_decoder(
    //slave 0
    input [`AXI_IDS_BITS-1:0] RID_S0,
	input [`AXI_DATA_BITS-1:0] RDATA_S0,
	input [1:0] RRESP_S0,
	input RLAST_S0,
	input RVALID_S0,
    //slave 1
    input [`AXI_IDS_BITS-1:0] RID_S1,
	input [`AXI_DATA_BITS-1:0] RDATA_S1,
	input [1:0] RRESP_S1,
	input RLAST_S1,
	input RVALID_S1,
    //to arbitrator
    output logic [`AXI_IDS_BITS-1:0] RID_ARB,
    output logic [`AXI_DATA_BITS-1:0] RDATA_ARB,
    output logic [1:0] RRESP_ARB,
    output logic RLAST_ARB,
    output logic RVALID_ARB,
    input RREADY_ARB,
    output logic RREADY_S0,
    output logic RREADY_S1

);


always_comb begin
    if(RVALID_S0)begin
        RID_ARB = RID_S0;
        RDATA_ARB = RDATA_S0;
        RRESP_ARB = RRESP_S0;
        RLAST_ARB = RLAST_S0;
        RVALID_ARB = RVALID_S0;
        RREADY_S0 = RREADY_ARB;
        RREADY_S1 = 1'b0;
    end
    else if (RVALID_S1)begin
        RID_ARB = RID_S1;
        RDATA_ARB = RDATA_S1;
        RRESP_ARB = RRESP_S1;
        RLAST_ARB = RLAST_S1;
        RVALID_ARB = RVALID_S1;
        RREADY_S1 = RREADY_ARB;
        RREADY_S0 = 1'b0;
    end
    else begin
        RID_ARB = RID_S1;
        RDATA_ARB = RDATA_S1;
        RRESP_ARB = `AXI_RESP_DECERR;
        RLAST_ARB = 1'b1;
        RVALID_ARB = RVALID_S1;
        RREADY_S0 = 1'b0;
        RREADY_S1 = 1'b0;
    end
end






endmodule
