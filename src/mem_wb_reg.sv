////`include "parameters.svh"
`include "../include/AXI_define.svh"
module mem_wb_reg(
    output logic [`data_size-1:0] result_out,
    output logic [`log_reg_num-1:0] rd_out,
    output logic wb_memtoreg_out,
    output logic wb_regwrite_out,
    output logic ls_word_out,
    output logic [`data_size-1:0]mem_out,

    input [`data_size-1:0] result_in,
    input [`log_reg_num-1:0] rd_in,
    input wb_memtoreg_in,
    input wb_regwrite_in,
    input ls_word_in,
    input [`data_size-1:0]mem_in,

    input stall,

    input clk,
    input rst
);

always_ff @(posedge clk or posedge rst)begin
    if(rst)begin
        result_out          <= 32'b0;
        rd_out              <= 5'b0;
        wb_memtoreg_out     <= 1'b0;
        wb_regwrite_out     <= 1'b0;
        ls_word_out         <= 1'b0;
        mem_out             <= 32'b0;
    end
    else if(stall)begin
        result_out          <= result_out;
        rd_out              <= rd_out;
        wb_memtoreg_out     <= wb_memtoreg_out;
        wb_regwrite_out     <= wb_regwrite_out;
        ls_word_out         <= ls_word_out;
        mem_out             <= mem_out;
    end
    else begin
        result_out          <= result_in;
        rd_out              <= rd_in;
        wb_memtoreg_out     <= wb_memtoreg_in;
        wb_regwrite_out     <= wb_regwrite_in;
        ls_word_out         <= ls_word_in;
        mem_out             <= mem_in;
    end
end

    
endmodule
