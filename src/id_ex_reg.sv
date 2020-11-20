//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module id_ex_reg(

    output  logic[`log_reg_num-1:0] r1_out,
    output  logic[`log_reg_num-1:0] r2_out,
    output  logic[`log_reg_num-1:0] rd_out,
    output  logic wb_memtoreg_out,
    output  logic wb_regwrite_out,
    output  logic mem_memread_out,
    output  logic mem_memwrite_out,
    output  logic ex_alusrc_out,
    output  logic[1:0] ex_aluop_out,
    output  logic[3:0] ins_30_14_12_out,
    output  logic[`pc_size-1:0] pc_out,
    output  logic alusrc_pc_out,
    output  logic [`data_size-1:0]imm_out,
    output  logic ubranch_out,
    output  logic [`data_size-1:0]r1_data_out,
    output  logic [`data_size-1:0]r2_data_out, 

    input [`log_reg_num-1:0] r1_in,
    input [`log_reg_num-1:0] r2_in,
    input [`log_reg_num-1:0] rd_in,
    input wb_memtoreg_in,
    input wb_regwrite_in,
    input mem_memread_in,
    input mem_memwrite_in,
    input ex_alusrc_in,
    input [1:0] ex_aluop_in,
    input [3:0] ins_30_14_12_in,
    input [`pc_size-1:0] pc_in,
    input alusrc_pc_in,
    input [`data_size-1:0]imm_in,
    input ubranch_in,
    input [`data_size-1:0]r1_data_in,
    input [`data_size-1:0]r2_data_in, 
    
    input stall,

    input clk,
    input rst
);

always_ff @(posedge clk, posedge rst) begin
    if(rst)begin
        r1_out <= 1'b0;
        r2_out <= 1'b0;
        rd_out <= 1'b0;
        wb_memtoreg_out <= 1'b0;
        wb_regwrite_out <= 1'b0;
        mem_memread_out <= 1'b0;
        mem_memwrite_out<= 1'b0;
        ex_alusrc_out   <= 1'b0;
        ex_aluop_out    <= 1'b0;
        ins_30_14_12_out <= 1'b0;
        pc_out  <=1'b0;
        alusrc_pc_out <= 1'b0;
        imm_out <=1'b0;
        ubranch_out <= 1'b0;
        r1_data_out <= 1'b0;
        r2_data_out <= 1'b0;
    end
    else if(stall) begin
        r1_out <= r1_out;
        r2_out <= r2_out;
        rd_out <= rd_out;
        wb_memtoreg_out  <= wb_memtoreg_out;
        wb_regwrite_out  <= wb_regwrite_out;
        mem_memread_out  <= mem_memread_out;
        mem_memwrite_out <= mem_memwrite_out;
        ex_alusrc_out    <= ex_alusrc_out;
        ex_aluop_out     <= ex_aluop_out;
        ins_30_14_12_out <= ins_30_14_12_out;
        pc_out  <=  pc_out;
        alusrc_pc_out <= alusrc_pc_out;
        imm_out <= imm_out;
        ubranch_out <= ubranch_out;
        r1_data_out <= r1_data_out;
        r2_data_out <= r2_data_out;
    end
    else begin
        r1_out <= r1_in;
        r2_out <= r2_in;
        rd_out <= rd_in;
        wb_memtoreg_out  <= wb_memtoreg_in;
        wb_regwrite_out  <= wb_regwrite_in;
        mem_memread_out  <= mem_memread_in;
        mem_memwrite_out <= mem_memwrite_in;
        ex_alusrc_out    <= ex_alusrc_in;
        ex_aluop_out     <= ex_aluop_in;
        ins_30_14_12_out <= ins_30_14_12_in;
        pc_out  <=  pc_in;
        alusrc_pc_out <= alusrc_pc_in;
        imm_out <= imm_in;
        ubranch_out <= ubranch_in;
        r1_data_out <= r1_data_in;
        r2_data_out <= r2_data_in;
    end
end

endmodule
