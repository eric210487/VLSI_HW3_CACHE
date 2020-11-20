//================================================
// Auther:      Chang Wan-Yun (Claire)            
// Filename:    AXI.sv                            
// Description: Top module of AXI                  
// Version:     1.0 
//================================================
`include "../../include/AXI_define.svh"
`include "read_address_arbitrator.sv"
`include "read_address_decoder.sv"
`include "read_data_arbitrator.sv"
`include "read_data_decoder.sv"
`include "write_address_arbitrator.sv"
`include "write_address_decoder.sv"
`include "write_data_arbitrator.sv"
`include "write_data_decoder.sv"
`include "write_response_arbitrator.sv"
`include "write_response_decoder.sv"

module AXI(

	input ACLK,
	input ARESETn,

	//SLAVE INTERFACE FOR MASTERS
	//WRITE ADDRESS
	input [`AXI_ID_BITS-1:0] AWID_M1,
	input [`AXI_ADDR_BITS-1:0] AWADDR_M1,
	input [`AXI_LEN_BITS-1:0] AWLEN_M1,
	input [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
	input [1:0] AWBURST_M1,
	input AWVALID_M1,
	output logic AWREADY_M1,
	//WRITE DATA
	input [`AXI_DATA_BITS-1:0] WDATA_M1,
	input [`AXI_STRB_BITS-1:0] WSTRB_M1,
	input WLAST_M1,
	input WVALID_M1,
	output logic WREADY_M1,
	//WRITE RESPONSE
	output logic [`AXI_ID_BITS-1:0] BID_M1,
	output logic [1:0] BRESP_M1,
	output logic BVALID_M1,
	input BREADY_M1,

	//READ ADDRESS0
	input [`AXI_ID_BITS-1:0] ARID_M0,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M0,
	input [`AXI_LEN_BITS-1:0] ARLEN_M0,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
	input [1:0] ARBURST_M0,
	input ARVALID_M0,
	output logic ARREADY_M0,
	//READ DATA0
	output logic [`AXI_ID_BITS-1:0] RID_M0,
	output logic [`AXI_DATA_BITS-1:0] RDATA_M0,
	output logic [1:0] RRESP_M0,
	output logic RLAST_M0,
	output logic RVALID_M0,
	input RREADY_M0,
	//READ ADDRESS1
	input [`AXI_ID_BITS-1:0] ARID_M1,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M1,
	input [`AXI_LEN_BITS-1:0] ARLEN_M1,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
	input [1:0] ARBURST_M1,
	input ARVALID_M1,
	output logic ARREADY_M1,
	//READ DATA1
	output logic [`AXI_ID_BITS-1:0] RID_M1,
	output logic [`AXI_DATA_BITS-1:0] RDATA_M1,
	output logic [1:0] RRESP_M1,
	output logic RLAST_M1,
	output logic RVALID_M1,
	input RREADY_M1,

	//MASTER INTERFACE FOR SLAVES
	//WRITE ADDRESS0
	output logic [`AXI_IDS_BITS-1:0] AWID_S0,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S0,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S0,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
	output logic [1:0] AWBURST_S0,
	output logic AWVALID_S0,
	input AWREADY_S0,
	//WRITE DATA0
	output logic [`AXI_DATA_BITS-1:0] WDATA_S0,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_S0,
	output logic WLAST_S0,
	output logic WVALID_S0,
	input WREADY_S0,
	//WRITE RESPONSE0
	input [`AXI_IDS_BITS-1:0] BID_S0,
	input [1:0] BRESP_S0,
	input BVALID_S0,
	output logic BREADY_S0,
	
	//WRITE ADDRESS1
	output logic [`AXI_IDS_BITS-1:0] AWID_S1,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S1,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S1,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
	output logic [1:0] AWBURST_S1,
	output logic AWVALID_S1,
	input AWREADY_S1,
	//WRITE DATA1
	output logic [`AXI_DATA_BITS-1:0] WDATA_S1,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_S1,
	output logic WLAST_S1,
	output logic WVALID_S1,
	input WREADY_S1,
	//WRITE RESPONSE1
	input [`AXI_IDS_BITS-1:0] BID_S1,
	input [1:0] BRESP_S1,
	input BVALID_S1,
	output logic BREADY_S1,
	
	//READ ADDRESS0
	output logic [`AXI_IDS_BITS-1:0] ARID_S0,
	output logic [`AXI_ADDR_BITS-1:0] ARADDR_S0,
	output logic [`AXI_LEN_BITS-1:0] ARLEN_S0,
	output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S0,
	output logic [1:0] ARBURST_S0,
	output logic ARVALID_S0,
	input ARREADY_S0,
	//READ DATA0
	input [`AXI_IDS_BITS-1:0] RID_S0,
	input [`AXI_DATA_BITS-1:0] RDATA_S0,
	input [1:0] RRESP_S0,
	input RLAST_S0,
	input RVALID_S0,
	output logic RREADY_S0,
	//READ ADDRESS1
	output logic [`AXI_IDS_BITS-1:0] ARID_S1,
	output logic [`AXI_ADDR_BITS-1:0] ARADDR_S1,
	output logic [`AXI_LEN_BITS-1:0] ARLEN_S1,
	output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S1,
	output logic [1:0] ARBURST_S1,
	output logic ARVALID_S1,
	input ARREADY_S1,
	//READ DATA1
	input [`AXI_IDS_BITS-1:0] RID_S1,
	input [`AXI_DATA_BITS-1:0] RDATA_S1,
	input [1:0] RRESP_S1,
	input RLAST_S1,
	input RVALID_S1,
	output logic RREADY_S1
	
);
    //---------- you should put your design here ----------//
//read address
logic [`AXI_ID_BITS-1:0] ARID_ARB;
logic [`AXI_ADDR_BITS-1:0] ARADDR_ARB;
logic [`AXI_LEN_BITS-1:0] ARLEN_ARB;
logic [`AXI_SIZE_BITS-1:0] ARSIZE_ARB;
logic [1:0]ARBURST_ARB;
logic ARVALID_ARB;
logic M0_flag;
logic M1_flag;
logic AR_SD; //default slave
logic ARREADY_ARB;
//read data
logic [`AXI_IDS_BITS-1:0] RID_ARB;
logic [`AXI_DATA_BITS-1:0] RDATA_ARB;
logic [1:0] RRESP_ARB;
logic RLAST_ARB;
logic RVALID_ARB;
logic RREADY_ARB;
//write address
logic [`AXI_ID_BITS-1:0] AWID_ARB;
logic [`AXI_ADDR_BITS-1:0] AWADDR_ARB;
logic [`AXI_LEN_BITS-1:0] AWLEN_ARB;
logic [`AXI_SIZE_BITS-1:0] AWSIZE_ARB;
logic [1:0] AWBURST_ARB;
logic AWVALID_ARB;
logic [1:0] AW_S;
logic AW_lock_reg;
//write data
logic [`AXI_DATA_BITS-1:0] WDATA_ARB;
logic [`AXI_STRB_BITS-1:0] WSTRB_ARB;
logic WLAST_ARB;
logic WVALID_ARB;
//write response
logic [`AXI_IDS_BITS-1:0] BID_ARB;
logic [1:0] BRESP_ARB;
logic BVALID_ARB;
logic W_lock;


read_address_arbitrator arbitrator1(
	.ACLK(ACLK),
	.ARESETn(ARESETn),
	.ARID_M0(ARID_M0),
	.ARADDR_M0(ARADDR_M0),
	.ARLEN_M0(ARLEN_M0),
	.ARSIZE_M0(ARSIZE_M0),
	.ARBURST_M0(ARBURST_M0),
	.ARVALID_M0(ARVALID_M0),
	.ARID_M1(ARID_M1),
	.ARADDR_M1(ARADDR_M1),
	.ARLEN_M1(ARLEN_M1),
	.ARSIZE_M1(ARSIZE_M1),
	.ARBURST_M1(ARBURST_M1),
	.ARVALID_M1(ARVALID_M1),
	.ARREADY_ARB(ARREADY_ARB),
	.ARID_ARB(ARID_ARB),
	.ARADDR_ARB(ARADDR_ARB),
	.ARLEN_ARB(ARLEN_ARB),
	.ARSIZE_ARB(ARSIZE_ARB),
	.ARBURST_ARB(ARBURST_ARB),
	.ARVALID_ARB(ARVALID_ARB),
	.M0_flag(M0_flag),
	.M1_flag(M1_flag),
	.ARREADY_M0(ARREADY_M0),
	.ARREADY_M1(ARREADY_M1),
	.RVALID_ARB(RVALID_ARB),
	.RREADY_M0(RREADY_M0),
	.RREADY_M1(RREADY_M1)
);	
read_address_decoder decoder1(
	.ARID_ARB(ARID_ARB),
	.ARADDR_ARB(ARADDR_ARB),
	.ARLEN_ARB(ARLEN_ARB),
	.ARSIZE_ARB(ARSIZE_ARB),
	.ARBURST_ARB(ARBURST_ARB),
	.ARVALID_ARB(ARVALID_ARB),
	.ARID_S0(ARID_S0),
	.ARADDR_S0(ARADDR_S0),
	.ARLEN_S0(ARLEN_S0),
	.ARSIZE_S0(ARSIZE_S0),
	.ARBURST_S0(ARBURST_S0),
	.ARVALID_S0(ARVALID_S0),
	.ARID_S1(ARID_S1),
	.ARADDR_S1(ARADDR_S1),
	.ARLEN_S1(ARLEN_S1),
	.ARSIZE_S1(ARSIZE_S1),
	.ARBURST_S1(ARBURST_S1),
	.ARVALID_S1(ARVALID_S1),
	.AR_SD(AR_SD),
	.ARREADY_S0(ARREADY_S0),
	.ARREADY_S1(ARREADY_S1),
	.ARREADY_ARB(ARREADY_ARB),
	.M0_flag(M0_flag),
	.M1_flag(M1_flag)
);
read_data_decoder decoder2(
	.RID_S0(RID_S0),
	.RDATA_S0(RDATA_S0),
	.RRESP_S0(RRESP_S0),
	.RLAST_S0(RLAST_S0),
	.RVALID_S0(RVALID_S0),
	.RID_S1(RID_S1),
	.RDATA_S1(RDATA_S1),
	.RRESP_S1(RRESP_S1),
	.RLAST_S1(RLAST_S1),
	.RVALID_S1(RVALID_S1),
	.RID_ARB(RID_ARB),
	.RDATA_ARB(RDATA_ARB),
	.RRESP_ARB(RRESP_ARB),
	.RLAST_ARB(RLAST_ARB),
	.RVALID_ARB(RVALID_ARB),
	.RREADY_ARB(RREADY_ARB),
	.RREADY_S0(RREADY_S0),
	.RREADY_S1(RREADY_S1)
);
read_data_arbitrator arbitrator2(
	.ACLK(ACLK),
	.ARESETn(ARESETn),
	.RID_ARB(RID_ARB),
	.RDATA_ARB(RDATA_ARB),
	.RRESP_ARB(RRESP_ARB),
	.RLAST_ARB(RLAST_ARB),
	.RVALID_ARB(RVALID_ARB),
	.M0_flag(M0_flag),
	.M1_flag(M1_flag),
	.RREADY_M0(RREADY_M0),
	.RREADY_M1(RREADY_M1),
	.RREADY_ARB(RREADY_ARB),
	.RID_M0(RID_M0),
	.RDATA_M0(RDATA_M0),
	.RRESP_M0(RRESP_M0),
	.RLAST_M0(RLAST_M0),
	.RVALID_M0(RVALID_M0),
	.RID_M1(RID_M1),
	.RDATA_M1(RDATA_M1),
	.RRESP_M1(RRESP_M1),
	.RLAST_M1(RLAST_M1),
	.RVALID_M1(RVALID_M1),
	.ARREADY_ARB(ARREADY_ARB),
	.ARVALID_ARB(ARVALID_ARB)
);
write_address_arbitrator arbitrator3(
	.ACLK(ACLK),
	.ARESETn(ARESETn),
	.AWID_M1(AWID_M1),
	.AWADDR_M1(AWADDR_M1),
	.AWLEN_M1(AWLEN_M1),
	.AWSIZE_M1(AWSIZE_M1),
	.AWBURST_M1(AWBURST_M1),
	.AWVALID_M1(AWVALID_M1),
	.AWID_ARB(AWID_ARB),
	.AWADDR_ARB(AWADDR_ARB),
	.AWLEN_ARB(AWLEN_ARB),
	.AWSIZE_ARB(AWSIZE_ARB),
	.AWBURST_ARB(AWBURST_ARB),
	.AWVALID_ARB(AWVALID_ARB),
	.BVALID_ARB(BVALID_ARB),
	.BREADY_M1(BREADY_M1),
	.AWREADY_M1(AWREADY_M1),
	.WVALID_M1(WVALID_M1),
	.AW_lock_reg(AW_lock_reg)
);
write_address_decoder decoder3(
	.AWID_ARB(AWID_ARB),
	.AWADDR_ARB(AWADDR_ARB),
	.AWLEN_ARB(AWLEN_ARB),
	.AWSIZE_ARB(AWSIZE_ARB),
	.AWBURST_ARB(AWBURST_ARB),
	.AWVALID_ARB(AWVALID_ARB),
	.AWREADY_S0(AWREADY_S0),
	.AWREADY_S1(AWREADY_S1),
	.AWID_S0(AWID_S0),
	.AWADDR_S0(AWADDR_S0),
	.AWLEN_S0(AWLEN_S0),
	.AWSIZE_S0(AWSIZE_S0),
	.AWBURST_S0(AWBURST_S0),
	.AWVALID_S0(AWVALID_S0),
	.AWID_S1(AWID_S1),
	.AWADDR_S1(AWADDR_S1),
	.AWLEN_S1(AWLEN_S1),
	.AWSIZE_S1(AWSIZE_S1),
	.AWBURST_S1(AWBURST_S1),
	.AWVALID_S1(AWVALID_S1),
	.AW_S(AW_S),
	.AWREADY_M1(AWREADY_M1),
	.AW_lock_reg(AW_lock_reg)
);
write_data_arbitrator arbitrator4(
	.ACLK(ACLK),
	.ARESETn(ARESETn),
	.WDATA_M1(WDATA_M1),
	.WSTRB_M1(WSTRB_M1),
	.WLAST_M1(WLAST_M1),
	.WVALID_M1(WVALID_M1),
	.WDATA_ARB(WDATA_ARB),
	.WSTRB_ARB(WSTRB_ARB),
	.WLAST_ARB(WLAST_ARB),
	.WVALID_ARB(WVALID_ARB),
	.BREADY_M1(BREADY_M1),
	.BVALID_ARB(BVALID_ARB),
	.WREADY_M1(WREADY_M1),
	.W_lock_reg(W_lock)
);
write_data_decoder decoder4(
	.ACLK(ACLK),
	.ARESETn(ARESETn),
	.WDATA_ARB(WDATA_ARB),
	.WSTRB_ARB(WSTRB_ARB),
	.WLAST_ARB(WLAST_ARB),
	.WVALID_ARB(WVALID_ARB),
	.AW_S(AW_S),
	.WREADY_S0(WREADY_S0),
	.WREADY_S1(WREADY_S1),
	.WDATA_S0(WDATA_S0),
	.WSTRB_S0(WSTRB_S0),
	.WLAST_S0(WLAST_S0),
	.WVALID_S0(WVALID_S0),
	.WDATA_S1(WDATA_S1),
	.WSTRB_S1(WSTRB_S1),
	.WLAST_S1(WLAST_S1),
	.WVALID_S1(WVALID_S1),
	.WREADY_M1(WREADY_M1),
	.W_lock(W_lock)
);
write_response_decoder decoder5(
	.BID_S0(BID_S0),
	.BRESP_S0(BRESP_S0),
	.BVALID_S0(BVALID_S0),
	.BID_S1(BID_S1),
	.BRESP_S1(BRESP_S1),
	.BVALID_S1(BVALID_S1),
	.BREADY_M1(BREADY_M1),
	.BID_ARB(BID_ARB),
	.BRESP_ARB(BRESP_ARB),
	.BVALID_ARB(BVALID_ARB),
	.BREADY_S0(BREADY_S0),
	.BREADY_S1(BREADY_S1)
);
write_response_arbitrator arbitrator5(
	.BID_ARB(BID_ARB),
	.BRESP_ARB(BRESP_ARB),
	.BVALID_ARB(BVALID_ARB),
	.BID_M1(BID_M1),
	.BRESP_M1(BRESP_M1),
	.BVALID_M1(BVALID_M1)
);



	
	
	
endmodule
