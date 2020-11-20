`include "../../include/AXI_define.svh"
module write_response_decoder(
    input [`AXI_IDS_BITS-1:0] BID_S0,
	input [1:0] BRESP_S0,
	input BVALID_S0,
    input [`AXI_IDS_BITS-1:0] BID_S1,
	input [1:0] BRESP_S1,
	input BVALID_S1,
    input BREADY_M1,
    output logic [`AXI_IDS_BITS-1:0] BID_ARB,
	output logic [1:0] BRESP_ARB,
	output logic BVALID_ARB,
    output logic BREADY_S0,
    output logic BREADY_S1
);

always_comb begin
    if(BVALID_S0 & ~BVALID_S1)begin
        BID_ARB = BID_S0;
        BRESP_ARB = BRESP_S0;
        BVALID_ARB = BVALID_S0;
        BREADY_S0 = BREADY_M1;
	BREADY_S1 = BREADY_M1;
    end
    else if (BVALID_S1 & ~BVALID_S0)begin
        BID_ARB = BID_S1;
        BRESP_ARB = BRESP_S1;
        BVALID_ARB = BVALID_S1;
        BREADY_S1 = BREADY_M1;
	BREADY_S0 = BREADY_M1;
    end
    else begin
	BID_ARB = 8'b0;
	BRESP_ARB = 2'b0;
	BVALID_ARB = 1'b0;
	BREADY_S0 = 1'b0;
        BREADY_S1 = 1'b0;
    end 
end 

endmodule
