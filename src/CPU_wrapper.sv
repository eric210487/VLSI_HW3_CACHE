`include "../include/AXI_define.svh"
`include "../include/def.svh"
`include "cpu.sv"
module cpu_wrapper(
    //READ ADDRESS0
	output logic[`AXI_ID_BITS-1:0] ARID_M0,          //don't need out of order (give zero?)
	output logic[`AXI_ADDR_BITS-1:0] ARADDR_M0,
	output logic[`AXI_LEN_BITS-1:0] ARLEN_M0,
	output logic[`AXI_SIZE_BITS-1:0] ARSIZE_M0,
	output logic[1:0] ARBURST_M0,
	output logic ARVALID_M0,
	input ARREADY_M0,
    //READ DATA0
	input [`AXI_ID_BITS-1:0] RID_M0,
	input [`AXI_DATA_BITS-1:0] RDATA_M0,
	input [1:0] RRESP_M0,
	input RLAST_M0,
	input RVALID_M0,
	output logic RREADY_M0,

    //connect with AXI bus (about M1 DSRAM)
    //WRITE ADDRESS
	output logic[`AXI_ID_BITS-1:0] AWID_M1,
	output logic[`AXI_ADDR_BITS-1:0] AWADDR_M1,
	output logic[`AXI_LEN_BITS-1:0] AWLEN_M1,
	output logic[`AXI_SIZE_BITS-1:0] AWSIZE_M1,
	output logic[1:0] AWBURST_M1,
	output logic AWVALID_M1,
	input AWREADY_M1,
    //WRITE DATA
	output logic[`AXI_DATA_BITS-1:0] WDATA_M1,
	output logic[`AXI_STRB_BITS-1:0] WSTRB_M1,
	output logic WLAST_M1,
	output logic WVALID_M1,
	input WREADY_M1,
    //WRITE RESPONSE
	input [`AXI_ID_BITS-1:0] BID_M1,
	input [1:0] BRESP_M1,
	input BVALID_M1,
	output logic BREADY_M1,
    //READ ADDRESS1
	output logic[`AXI_ID_BITS-1:0] ARID_M1,
	output logic[`AXI_ADDR_BITS-1:0] ARADDR_M1,
	output logic[`AXI_LEN_BITS-1:0] ARLEN_M1,
	output logic[`AXI_SIZE_BITS-1:0] ARSIZE_M1,
	output logic[1:0] ARBURST_M1,
	output logic ARVALID_M1,
	input ARREADY_M1,
    //READ DATA1
	input [`AXI_ID_BITS-1:0] RID_M1,
	input [`AXI_DATA_BITS-1:0] RDATA_M1,
	input [1:0] RRESP_M1,
	input RLAST_M1,
	input RVALID_M1,
	output logic RREADY_M1,

	input clk,
	input rst
);

//cpu output
	//logic i_cs;
	logic i_oe;
	//logic [3:0]i_web;
	logic [31:0]i_address;
	//logic [`data_size-1:0]i_di;

	//logic d_cs;
	logic d_oe;
	logic [3:0]d_web;
	logic [31:0]d_address;
	logic [`data_size-1:0]d_di;
//cpu input
	logic [`data_size-1:0]i_do;
	logic [`data_size-1:0]d_do;
	logic i_stall;
	logic d_stall;
// d_cache input from cpu
	logic d_core_req;
	logic d_core_write;
	logic [`CACHE_TYPE_BITS-1:0]d_core_type;

// d_cache input from wrapper 
	logic [`DATA_BITS-1:0]d_d_out;
	logic d_d_wait;
// d_cache output to wrapper
	logic d_d_req;
	logic [`DATA_BITS-1:0]d_d_addr;
	logic d_d_write;
	logic [`DATA_BITS-1:0]d_d_in;
	logic  [`CACHE_TYPE_BITS-1:0]d_d_type;

// other logic
	logic d_web_bit;
	logic [1:0]web_sum;



cpu cpu0(
	//output---------------------------
	//.i_cs(i_cs),
	.i_oe(i_oe),				
	//.i_web(i_web),
	.i_address(i_address),
	//.i_di(i_di),

	//.d_cs(d_cs),
	.d_oe(d_oe),				//-> tell cache that cpu want to read data
	.d_web(d_web),				//-> tell cache that cpu want to write data
	.d_address(d_address),		//-> give cache address
	.d_di(d_di),				//-> data input to cache

	//input-----------------------------
	.i_do(i_do),								
	.d_do(d_do),				//<- data output from cache

	.i_stall(i_stall),
	.d_stall(d_stall),			//<- stall signal from cache

	.clk(clk),
	.rst(rst)
);

L1C_inst inst_c(
	.clk(clk),
	.rst(rst),
	.core_addr(),
	.core_req(),
	.core_write(),
	.core_in(),
	.core_type(),
	.I_out(),
	.I_wait(),
	.core_out(),
	.core_wait(),
	.I_req(),
	.I_addr(),
	.I_write(),
	.I_in(),
	.I_type
);
L1C_data data_c(
	.clk(clk),
	.rst(rst),
	.core_addr(d_address),			//<- get the address from cpu
	.core_req(d_core_req),			//<- cpu tell cache run
	.core_write(d_core_write),		//<- cpu tell cache write or read (0:read/1:write)
	.core_in(d_di),					//<- cpu give the write data to cache
	.core_type(d_core_type),		//<- cpu write/read data type
	.D_out(d_d_out),				//<- data from wrapper *
	.D_wait(d_d_wait),				//<- wait signal from cpu wrapper *
	.core_out(d_do),				//-> cache output the data to cpu
	.core_wait(d_stall),			//-> cache tell cpu to stall
	.D_req(d_d_req),				//-> request to cpu wrapper *
	.D_addr(d_d_addr),				//-> addr to cpu wrapper *
	.D_write(d_d_write),			//-> 1 = write ; 0 = read *
	.D_in(d_d_in),					//-> data to wrapper *
	.D_type(d_d_type)				//-> type of data to wrapper *
);

// ----------------assign---------------

assign d_core_req = (d_oe|d_web_bit)?1'b1:1'b0;
assign d_core_write = d_web_bit;



always_comb begin
	if(d_web==4'b1111) d_web_bit = 1'b0;
	else d_web_bit = 1'b1;
end

always_comb begin
	web_sum = d_web[0] + d_web[1] + d_web[2] + d_web[3];
	case (web_sum)
		2'd0: d_core_type = `CACHE_WORD;
		2'd1: d_core_type = `CACHE_WORD; //never touch
		2'd2: d_core_type = `CACHE_HWORD;
		2'd3: d_core_type = `CACHE_BYTE;
	endcase
end


assign i_stall = (~RVALID_M0) & i_oe;
assign d_d_wait = ((~RVALID_M1) & d_d_req) | ((~BVALID_M1) & d_d_req); //change


logic [1:0]M0_state;
logic [31:0]M0_r_addr_reg;

//M0 channel
always_ff @(posedge clk, posedge rst) begin
	if(rst) begin
		M0_state <= `CPU_WRAPPER_RM0_INI;
		M0_r_addr_reg <= 32'b0;
	end
	else begin
		case (M0_state)
			`CPU_WRAPPER_RM0_INI:   begin
				M0_state <= (i_oe)?`CPU_WRAPPER_RM0_SEND:`CPU_WRAPPER_RM0_INI;
				M0_r_addr_reg <= i_address;
			end
			`CPU_WRAPPER_RM0_SEND:	M0_state <= (ARREADY_M0)?`CPU_WRAPPER_RM0_WAIT:`CPU_WRAPPER_RM0_SEND;
			`CPU_WRAPPER_RM0_WAIT:	M0_state <= (RVALID_M0)?`CPU_WRAPPER_RM0_INI:`CPU_WRAPPER_RM0_WAIT;
		endcase
	end
end
always_comb begin
			ARID_M0		= 1'b0;					//
			ARADDR_M0	= `AXI_ADDR_BITS'b0;
			ARLEN_M0	= `AXI_LEN_ONE;			//
			ARSIZE_M0	= `AXI_SIZE_WORD;		//
			ARBURST_M0	= `AXI_BURST_INC;		//
			ARVALID_M0	= 1'b0;
			//READ DATA
			RREADY_M0	= 1'b0;
			//CPU
			i_do		= 32'b0;
	case (M0_state)
		`CPU_WRAPPER_RM0_INI: begin
			//READ ADDRESS
			ARID_M0		= 1'b0;					//
			ARADDR_M0	= `AXI_ADDR_BITS'b0;
			ARLEN_M0	= `AXI_LEN_ONE;			//
			ARSIZE_M0	= `AXI_SIZE_WORD;		//
			ARBURST_M0	= `AXI_BURST_INC;		//
			ARVALID_M0	= 1'b0;
			//READ DATA
			RREADY_M0	= 1'b0;
			//CPU
			i_do		= 32'b0;
		end
		`CPU_WRAPPER_RM0_SEND: begin
			//READ ADDRESS
			ARID_M0		= 1'b0;					//
			ARADDR_M0	= M0_r_addr_reg;
			ARLEN_M0	= `AXI_LEN_ONE;			//
			ARSIZE_M0	= `AXI_SIZE_WORD;		//
			ARBURST_M0	= `AXI_BURST_INC;		//
			ARVALID_M0	= 1'b1;
			//READ DATA
			RREADY_M0	= 1'b0;
			//CPU
			i_do		= 32'b0;
		end
		`CPU_WRAPPER_RM0_WAIT: begin
			//READ ADDRESS
			ARID_M0		= 1'b0;					//
			ARADDR_M0	= `AXI_ADDR_BITS'b0;
			ARLEN_M0	= `AXI_LEN_ONE;			//
			ARSIZE_M0	= `AXI_SIZE_WORD;		//
			ARBURST_M0	= `AXI_BURST_INC;		//
			ARVALID_M0	= 1'b0;
			//READ DATA
			RREADY_M0	= 1'b1;
			//CPU
			i_do		= RDATA_M0;
		end
	endcase
end


logic [2:0]M1_state;
logic [31:0]M1_r_addr_reg, M1_w_addr_reg, M1_w_data_reg;


//M1 channel
always_ff @(posedge clk, posedge rst) begin
	if(rst) begin
		M1_state <= `CPU_WRAPPER_RM1_INI;
	    M1_r_addr_reg <= 32'b0;
	end
	else begin
		case(M1_state)
			`CPU_WRAPPER_RM1_INI: 	begin
				M1_state <= (d_oe)?`CPU_WRAPPER_RM1_RSEND:((d_web_bit)?`CPU_WRAPPER_RM1_WSEND:`CPU_WRAPPER_RM1_INI);
				if(d_oe) begin
					M1_r_addr_reg <= d_address; //chang to cache gived address
					M1_w_addr_reg <= 32'b0;
					M1_w_data_reg <= 32'b0;
				end
				else if(d_web_bit) begin
					M1_r_addr_reg <= 32'b0;
					M1_w_addr_reg <= d_address; //chang to cache gived address
					M1_w_data_reg <= d_di;
				end
				else begin
					M1_r_addr_reg <= 32'b0;
				    M1_w_addr_reg <= 32'b0;
					M1_w_data_reg <= 32'b0;
				end
			end
			`CPU_WRAPPER_RM1_RSEND: M1_state <= (ARREADY_M1)?`CPU_WRAPPER_RM1_RWAIT:`CPU_WRAPPER_RM1_RSEND;
			`CPU_WRAPPER_RM1_RWAIT: M1_state <= (RVALID_M1)?`CPU_WRAPPER_RM1_INI:`CPU_WRAPPER_RM1_RWAIT;
			`CPU_WRAPPER_RM1_WSEND: M1_state <= (AWREADY_M1)?`CPU_WRAPPER_RM1_WWAIT:`CPU_WRAPPER_RM1_WSEND;
			`CPU_WRAPPER_RM1_WWAIT: M1_state <= (WREADY_M1)?`CPU_WRAPPER_RM1_WREADY:`CPU_WRAPPER_RM1_WWAIT;
			`CPU_WRAPPER_RM1_WREADY:M1_state <= (BVALID_M1)?`CPU_WRAPPER_RM1_INI:`CPU_WRAPPER_RM1_WREADY;
		endcase
	end
end
always_comb begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_BITS'b0;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= (BVALID_M1)?1'b1:1'b0;
			//READ ADDRESS1
			ARID_M1		= 1'b0;
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;
			ARSIZE_M1	= `AXI_SIZE_WORD;
			ARBURST_M1	= `AXI_BURST_INC;
			ARVALID_M1	= 1'b0;
			//READ DATA1
			RREADY_M1	= 1'b1;
			//cache
			d_d_out		= 32'b0;
	case (M1_state)
		`CPU_WRAPPER_RM1_INI: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_BITS'b0;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= (BVALID_M1)?1'b1:1'b0;
			//READ ADDRESS1
			ARID_M1		= 1'b0;
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;
			ARSIZE_M1	= `AXI_SIZE_WORD;
			ARBURST_M1	= `AXI_BURST_INC;
			ARVALID_M1	= 1'b0;
			//READ DATA1
			RREADY_M1	= 1'b1;
			//cache
			d_d_out		= 32'b0;

		end
		`CPU_WRAPPER_RM1_RSEND: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_BITS'b0;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= 1'b0;
			//READ ADDRESS
			ARID_M1		= 1'b0;					//
			ARADDR_M1	= M1_r_addr_reg;
			ARLEN_M1	= `AXI_LEN_ONE;			//
			ARSIZE_M1	= `AXI_SIZE_WORD;		//
			ARBURST_M1	= `AXI_BURST_INC;		//
			ARVALID_M1	= 1'b1;
			//READ DATA
			RREADY_M1	= 1'b0;
			//cache
			d_d_out		= 32'b0;
		end
		`CPU_WRAPPER_RM1_RWAIT: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_BITS'b0;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= 1'b0;
			//READ ADDRESS
			ARID_M1		= 1'b0;					//
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;			//
			ARSIZE_M1	= `AXI_SIZE_WORD;		//
			ARBURST_M1	= `AXI_BURST_INC;		//
			ARVALID_M1	= 1'b0;
			//READ DATA
			RREADY_M1	= 1'b0;
			//cache
			d_d_out		= RDATA_M1;
		end
		`CPU_WRAPPER_RM1_WSEND: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= M1_w_addr_reg;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b1;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_WORD;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= 1'b0;
			//READ ADDRESS1
			ARID_M1		= 1'b0;
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;
			ARSIZE_M1	= `AXI_SIZE_WORD;
			ARBURST_M1	= `AXI_BURST_INC;
			ARVALID_M1	= 1'b0;
			//READ DATA1
			RREADY_M1	= 1'b1;
			//cache
			d_d_out		= 32'b0;
		end
		`CPU_WRAPPER_RM1_WWAIT: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= M1_w_data_reg;
			WSTRB_M1	= d_web;
			WLAST_M1	= 1'b1;
			WVALID_M1	= 1'b1;
			//WRITE RESPONSE
			BREADY_M1	= 1'b0;
			//READ ADDRESS1
			ARID_M1		= 1'b0;
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;
			ARSIZE_M1	= `AXI_SIZE_WORD;
			ARBURST_M1	= `AXI_BURST_INC;
			ARVALID_M1	= 1'b0;
			//READ DATA1
			RREADY_M1	= 1'b1;
			//cache
			d_d_out		= 32'b0;
		end
		`CPU_WRAPPER_RM1_WREADY: begin
			//Write address
			AWID_M1		= `AXI_ID_BITS'b0;
			AWADDR_M1	= `AXI_ADDR_BITS'b0;
			AWLEN_M1	= `AXI_LEN_ONE;
			AWSIZE_M1	= `AXI_SIZE_WORD;
			AWBURST_M1	= `AXI_BURST_INC;
			AWVALID_M1	= 1'b0;
			//Write data
			WDATA_M1	= `AXI_DATA_BITS'b0;
			WSTRB_M1	= `AXI_STRB_WORD;
			WLAST_M1	= 1'b0;
			WVALID_M1	= 1'b0;
			//WRITE RESPONSE
			BREADY_M1	= 1'b0;
			//READ ADDRESS1
			ARID_M1		= 1'b0;
			ARADDR_M1	= `AXI_ADDR_BITS'b0;
			ARLEN_M1	= `AXI_LEN_ONE;
			ARSIZE_M1	= `AXI_SIZE_WORD;
			ARBURST_M1	= `AXI_BURST_INC;
			ARVALID_M1	= 1'b0;
			//READ DATA1
			RREADY_M1	= 1'b1;
			//cache
			d_d_out		= 32'b0;
		end
	endcase
end


endmodule
