`include "../include/AXI_define.svh"
//`include "../../sim/SRAM/SRAM.v"
module SRAM_wrapper(
    //WRITE ADDRESS
	input [`AXI_IDS_BITS-1:0] AWID,
	input [`AXI_ADDR_BITS-1:0] AWADDR,
	input [`AXI_LEN_BITS-1:0] AWLEN,    //1
	input [`AXI_SIZE_BITS-1:0] AWSIZE,  //1
	input [1:0] AWBURST,                //0
	input AWVALID,
	output logic AWREADY,
    //WRITE DATA
	input [`AXI_DATA_BITS-1:0] WDATA,
	input [`AXI_STRB_BITS-1:0] WSTRB,
	input WLAST,
	input WVALID,
	output logic WREADY,
    //WRITE RESPONSE
	output logic [`AXI_IDS_BITS-1:0] BID,
	output logic [1:0] BRESP,
	output logic BVALID,
	input BREADY,
    //READ ADDRESS
	input [`AXI_IDS_BITS-1:0] ARID,
	input [`AXI_ADDR_BITS-1:0] ARADDR,
	input [`AXI_LEN_BITS-1:0] ARLEN,    //1
	input [`AXI_SIZE_BITS-1:0] ARSIZE,  //1
	input [1:0] ARBURST,                //0
	input ARVALID,
	output logic ARREADY,
    //READ DATA
	output logic[`AXI_IDS_BITS-1:0] RID,
	output logic[`AXI_DATA_BITS-1:0] RDATA,
	output logic[1:0] RRESP,
	output logic RLAST,
	output logic RVALID,
	input RREADY,

    	input clk,
    	input rst
);

/* sram signal */
    logic CS;
    logic OE;
    logic [3:0] WEB;
    logic [13:0] A;
    logic [31:0] DI;
    logic [31:0] DO;
    assign CS = 1'b1;

SRAM i_SRAM (
    .A0   (A[0]  ),
    .A1   (A[1]  ),
    .A2   (A[2]  ),
    .A3   (A[3]  ),
    .A4   (A[4]  ),
    .A5   (A[5]  ),
    .A6   (A[6]  ),
    .A7   (A[7]  ),
    .A8   (A[8]  ),
    .A9   (A[9]  ),
    .A10  (A[10] ),
    .A11  (A[11] ),
    .A12  (A[12] ),
    .A13  (A[13] ),
    .DO0  (DO[0] ),
    .DO1  (DO[1] ),
    .DO2  (DO[2] ),
    .DO3  (DO[3] ),
    .DO4  (DO[4] ),
    .DO5  (DO[5] ),
    .DO6  (DO[6] ),
    .DO7  (DO[7] ),
    .DO8  (DO[8] ),
    .DO9  (DO[9] ),
    .DO10 (DO[10]),
    .DO11 (DO[11]),
    .DO12 (DO[12]),
    .DO13 (DO[13]),
    .DO14 (DO[14]),
    .DO15 (DO[15]),
    .DO16 (DO[16]),
    .DO17 (DO[17]),
    .DO18 (DO[18]),
    .DO19 (DO[19]),
    .DO20 (DO[20]),
    .DO21 (DO[21]),
    .DO22 (DO[22]),
    .DO23 (DO[23]),
    .DO24 (DO[24]),
    .DO25 (DO[25]),
    .DO26 (DO[26]),
    .DO27 (DO[27]),
    .DO28 (DO[28]),
    .DO29 (DO[29]),
    .DO30 (DO[30]),
    .DO31 (DO[31]),
    .DI0  (DI[0] ),
    .DI1  (DI[1] ),
    .DI2  (DI[2] ),
    .DI3  (DI[3] ),
    .DI4  (DI[4] ),
    .DI5  (DI[5] ),
    .DI6  (DI[6] ),
    .DI7  (DI[7] ),
    .DI8  (DI[8] ),
    .DI9  (DI[9] ),
    .DI10 (DI[10]),
    .DI11 (DI[11]),
    .DI12 (DI[12]),
    .DI13 (DI[13]),
    .DI14 (DI[14]),
    .DI15 (DI[15]),
    .DI16 (DI[16]),
    .DI17 (DI[17]),
    .DI18 (DI[18]),
    .DI19 (DI[19]),
    .DI20 (DI[20]),
    .DI21 (DI[21]),
    .DI22 (DI[22]),
    .DI23 (DI[23]),
    .DI24 (DI[24]),
    .DI25 (DI[25]),
    .DI26 (DI[26]),
    .DI27 (DI[27]),
    .DI28 (DI[28]),
    .DI29 (DI[29]),
    .DI30 (DI[30]),
    .DI31 (DI[31]),
    .CK   (clk   ),
    .WEB0 (WEB[0]),
    .WEB1 (WEB[1]),
    .WEB2 (WEB[2]),
    .WEB3 (WEB[3]),
    .OE   (OE    ),
    .CS   (CS    )
  );

/* wrapper signal */
    logic [2:0]state;
    logic [`AXI_IDS_BITS-1:0] AWID_reg, ARID_reg;
    logic [`AXI_ADDR_BITS-1:0] AWADDR_reg, ARADDR_reg;

always_ff @(posedge clk, posedge rst) begin
    if(rst) state <= `SRAM_WRAPPER_INI;
    else begin
        case (state)
            `SRAM_WRAPPER_INI   : begin
                if(ARVALID) begin
                    state       <= `SRAM_WRAPPER_GETRA;
                    ARID_reg    <= ARID;
                    ARADDR_reg  <= ARADDR;
                end
                else if(AWVALID) begin
                    state       <= `SRAM_WRAPPER_GETWA;
                    AWID_reg    <= AWID;
		    AWADDR_reg  <= AWADDR;
                end
		else if(AWVALID) begin
		
		end
                else begin
                    state       <= `SRAM_WRAPPER_INI;
                    AWID_reg    <= `AXI_IDS_BITS'b0;
	 	            AWADDR_reg  <= `AXI_ADDR_BITS'b0;
                    ARID_reg    <= `AXI_IDS_BITS'b0;
                    ARADDR_reg  <= `AXI_ADDR_BITS'b0;
                end
            end
            `SRAM_WRAPPER_GETRA : state <= `SRAM_WRAPPER_SEND;
            `SRAM_WRAPPER_SEND  : state <= (RREADY)?`SRAM_WRAPPER_INI:`SRAM_WRAPPER_SEND;
            `SRAM_WRAPPER_GETWA : state <= (WVALID)?`SRAM_WRAPPER_GETW:`SRAM_WRAPPER_GETWA;
            `SRAM_WRAPPER_GETW  : state <= `SRAM_WRAPPER_WRITE;
            `SRAM_WRAPPER_WRITE : state <= (BREADY)?`SRAM_WRAPPER_INI:`SRAM_WRAPPER_WRITE;
        endcase
    end
end

always_comb begin
    case (state)
        `SRAM_WRAPPER_INI: begin
            //WRITE ADDRESS
            AWREADY = 1'b0;
            //WRITE DATA
            WREADY  = 1'b0;
            //WRITE RESPONSE
            BID     = `AXI_IDS_BITS'b0;
            BRESP   = 2'b0;
            BVALID  = 1'b0;
            //READ ADDRESS
            ARREADY = 1'b0;
            //READ DATA
            RID     = `AXI_IDS_BITS'b0;
            RDATA   = `AXI_DATA_BITS'b0;
            RRESP   = 2'b0;
            RLAST   = 1'b0;
            RVALID  = 1'b0;
            //OUTPUT TO SRAM
            OE      = 1'b0;
            WEB     = 4'b1111;
            A       = 14'b0;
            DI      = 32'b0;
        end
        `SRAM_WRAPPER_GETRA: begin
            //WRITE ADDRESS
            AWREADY = 1'b0;
            //WRITE DATA
            WREADY  = 1'b0;
            //WRITE RESPONSE
            BID     = `AXI_IDS_BITS'b0;
            BRESP   = 2'b0;
            BVALID  = 1'b0;
            //READ ADDRESS
            ARREADY = 1'b1;
            //READ DATA
            RID     = `AXI_IDS_BITS'b0;
            RDATA   = `AXI_DATA_BITS'b0;
            RRESP   = 2'b0;
            RLAST   = 1'b0;
            RVALID  = 1'b0;
            //OUTPUT TO SRAM
            OE      = 1'b0;
            WEB     = 4'b1111;
            A       = ARADDR_reg[15:2];
            DI      = 32'b0;
        end
        `SRAM_WRAPPER_SEND: begin
            //WRITE ADDRESS
            AWREADY = 1'b0;
            //WRITE DATA
            WREADY  = 1'b0;
            //WRITE RESPONSE
            BID     = `AXI_IDS_BITS'b0;
            BRESP   = 2'b0;
            BVALID  = 1'b0;
            //READ ADDRESS
            ARREADY = 1'b0;
            //READ DATA
            RID     = ARID_reg;
            RDATA   = DO;
            RRESP   = `AXI_RESP_OKAY;
            RLAST   = 1'b1;
            RVALID  = 1'b1;
            //OUTPUT TO SRAM
            OE      = 1'b1;
            WEB     = 4'b1111;
            A       = ARADDR_reg[15:2];
            DI      = 32'b0;
        end
        `SRAM_WRAPPER_GETWA: begin
            //WRITE ADDRESS
            AWREADY = 1'b1;
            //WRITE DATA
            WREADY  = 1'b0;
            //WRITE RESPONSE
            BID     = `AXI_IDS_BITS'b0;
            BRESP   = 2'b0;
            BVALID  = 1'b0;
            //READ ADDRESS
            ARREADY = 1'b0;
            //READ DATA
            RID     = `AXI_IDS_BITS'b0;
            RDATA   = `AXI_DATA_BITS'b0;
            RRESP   = 2'b0;
            RLAST   = 1'b0;
            RVALID  = 1'b0;
            //OUTPUT TO SRAM
            OE      = 1'b0;
            WEB     = 4'b1111;
            A       = AWADDR[15:2];
            DI      = 32'b0;   
        end
	`SRAM_WRAPPER_GETW: begin
	   //WRITE ADDRESS
            AWREADY = 1'b1;
            //WRITE DATA
            WREADY  = 1'b1;
            //WRITE RESPONSE
            BID     = `AXI_IDS_BITS'b0;
            BRESP   = 2'b0;
            BVALID  = 1'b0;
            //READ ADDRESS
            ARREADY = 1'b0;
            //READ DATA
            RID     = `AXI_IDS_BITS'b0;
            RDATA   = `AXI_DATA_BITS'b0;
            RRESP   = 2'b0;
            RLAST   = 1'b0;
            RVALID  = 1'b0;
            //OUTPUT TO SRAM
            OE      = 1'b0;
            WEB     = WSTRB;
            A       = AWADDR_reg[15:2];
            DI      = WDATA;   
	end
        `SRAM_WRAPPER_WRITE: begin
            //WRITE ADDRESS
            AWREADY = 1'b0;
            //WRITE DATA
            WREADY  = 1'b0;
            //WRITE RESPONSE
            BID     = AWID_reg;
            BRESP   = `AXI_RESP_OKAY;
            BVALID  = 1'b1;
            //READ ADDRESS
            ARREADY = 1'b0;
            //READ DATA
            RID     = `AXI_IDS_BITS'b0;
            RDATA   = `AXI_DATA_BITS'b0;
            RRESP   = 2'b0;
            RLAST   = 1'b0;
            RVALID  = 1'b0;
            //OUTPUT TO SRAM
            OE      = 1'b0;
            WEB     = 4'b1111;
            A       = 14'b0;
            DI      = 32'b0;
        end

    endcase
end

endmodule
