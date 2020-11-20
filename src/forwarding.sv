//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module forwarding(
    output logic[1:0] mux0_select,
    output logic[1:0] mux1_select,
    output logic[1:0] mux2_select,
    output logic[1:0] id_mux0_select,
    output logic[1:0] id_mux1_select,
    input  [`log_reg_num-1:0]if_id_r1,
    input  [`log_reg_num-1:0]if_id_r2,
    input  [`log_reg_num-1:0]id_ex_r1,
    input  [`log_reg_num-1:0]id_ex_r2,
    input  [`log_reg_num-1:0]ex_mem_rd,
    input  [`log_reg_num-1:0]mem_wb_rd,
    input  ex_mem_regwrite,
    input  mem_wb_regwrite,
    input  alusrc,
    input  alusrc_pc
);
    
always_comb begin
    if (alusrc_pc) mux0_select = 2'b01;
    else if(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r1)) begin
        mux0_select = 2'b10;
    end
    else if (mem_wb_regwrite && 
            (mem_wb_rd!=0) && 
            !(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r1)) &&
            mem_wb_rd == id_ex_r1) begin
        mux0_select = 2'b11;
    end
    
    else mux0_select = 2'b00;
end

always_comb begin
    if (alusrc) mux1_select = 2'b01;
    else if(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r2)) begin
        mux1_select = 2'b10;
    end
    else if (mem_wb_regwrite && 
            (mem_wb_rd!=0) && 
            !(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r2)) &&
            mem_wb_rd == id_ex_r2) begin
        mux1_select = 2'b11;
    end
    else mux1_select = 2'b00;
end

always_comb begin
    if(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r2)) begin
        mux2_select = 2'b10;
    end
    else if (mem_wb_regwrite && 
            (mem_wb_rd!=0) && 
            !(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_r2)) &&
            mem_wb_rd == id_ex_r2) begin
        mux2_select = 2'b11;
    end
    else mux2_select = 2'b00;
end

always_comb begin
    if(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==if_id_r1)) begin
        id_mux0_select = 2'b10;
    end
    else if (mem_wb_regwrite && 
            (mem_wb_rd!=0) && 
            !(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==if_id_r1)) &&
            mem_wb_rd == if_id_r1) begin
        id_mux0_select = 2'b11;
    end
    else id_mux0_select = 2'b00;
end

always_comb begin
    if(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==if_id_r2)) begin
        id_mux1_select = 2'b10;
    end
    else if (mem_wb_regwrite && 
            (mem_wb_rd!=0) && 
            !(ex_mem_regwrite && (ex_mem_rd!=0) && (ex_mem_rd==if_id_r2)) &&
            mem_wb_rd == if_id_r2) begin
        id_mux1_select = 2'b11;
    end
    else id_mux1_select = 2'b00;
end

endmodule
