`include "../../include/AXI_define.svh"
module write_response_arbitrator(
    input [`AXI_IDS_BITS-1:0] BID_ARB,
	input [1:0] BRESP_ARB,
	input BVALID_ARB,
    output logic [`AXI_ID_BITS-1:0] BID_M1,
	output logic [1:0] BRESP_M1,
	output logic BVALID_M1
);

assign BID_M1 = BID_ARB[7:4];
assign BRESP_M1 = BRESP_ARB;
assign BVALID_M1 = BVALID_ARB;
    
endmodule
