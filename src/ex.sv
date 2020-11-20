//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
`include "alu_control.sv"
`include "alu.sv"
`include "ex_mem_reg.sv"
`include "ex_mux_2bits.sv"
`include "ex_mux_4inputs.sv"
`include "forwarding.sv"
module EX(

    output  [`data_size-1:0]   result,
    output  [`data_size-1:0]   data2_out,
    output  [`log_reg_num-1:0] rd_out,
    output  wb_memtoreg_out,
    output  wb_regwrite_out,
    output  mem_memread_out,
    output  mem_memwrite_out,
    output  [`data_size-1:0] zero, //connect with the alu zero directly

    output [1:0] r1_forwarding_signal,
    output [1:0] r2_forwarding_signal,
    output ls_word,

    input   wb_memtoreg_in,
    input   wb_regwrite_in,
    input   mem_memread_in,
    input   mem_memwrite_in,
    input   ex_alusrc,
    input   ex_alusrc_pc,
    input   [1:0]ex_aluop,

    input   [`data_size-1:0]   data1_in,
    input   [`data_size-1:0]   data2_in,
    input   [`data_size-1:0]   imm_in,
    input   [`log_reg_num-1:0] id_r1_in,
    input   [`log_reg_num-1:0] id_r2_in,
    input   [`log_reg_num-1:0] r1_in,
    input   [`log_reg_num-1:0] r2_in,
    input   [`log_reg_num-1:0] rd_in,
    input   ex_flush,
    input   [`data_size-1:0]   wb_data,
    input   [`log_reg_num-1:0] ex_mem_rd,
    input   [`log_reg_num-1:0] mem_wb_rd,
    input   ex_mem_regwrite,
    input   mem_wb_regwrite,
    input   [`data_size-1:0]ex_mem_result,
    input   [3:0]ins_30_14_12,
    input   [`pc_size-1:0]pc_in,
    input   ubranch,

    input   d_stall,
    input   clk,
    input   rst
);

logic [3:0]alucontrol_out0;
logic [`data_size-1:0]result0, data1_0, data2_0, data2_1;
logic [1:0]mux0_select, mux1_select, mux2_select;
logic [1:0]wb_in,mem_in;
logic [1:0]mux0_out,mux1_out;
logic ls_word0;


assign wb_in[0]  = wb_memtoreg_in;
assign wb_in[1]  = wb_regwrite_in;
assign mem_in[0] = mem_memread_in;
assign mem_in[1] = mem_memwrite_in;

alu_control alucontrol0(
    .out(alucontrol_out0),
    .ls_word(ls_word0),
    .aluop(ex_aluop),
    .ins_30_14_12(ins_30_14_12)
);
alu alu0(
    .zero(zero),
    .result(result0),
    .data1(data1_0),
    .data2(data2_0),
    .func(alucontrol_out0),
    .ubranch(ubranch)
);
forwarding forwarding0(
    .mux0_select(mux0_select),
    .mux1_select(mux1_select),
    .mux2_select(mux2_select),
    .id_mux0_select(r1_forwarding_signal),
    .id_mux1_select(r2_forwarding_signal),
    .if_id_r1(id_r1_in),
    .if_id_r2(id_r2_in),
    .id_ex_r1(r1_in),
    .id_ex_r2(r2_in),
    .ex_mem_rd(ex_mem_rd),
    .mem_wb_rd(mem_wb_rd),
    .ex_mem_regwrite(ex_mem_regwrite),
    .mem_wb_regwrite(mem_wb_regwrite),
    .alusrc(ex_alusrc),
    .alusrc_pc(ex_alusrc_pc)
);
ex_mem_reg exmemreg0(
    .result_out(result),
    .data2_out(data2_out),
    .rd_out(rd_out),
    .wb_memtoreg_out(wb_memtoreg_out),
    .wb_regwrite_out(wb_regwrite_out),
    .mem_memread_out(mem_memread_out),
    .mem_memwrite_out(mem_memwrite_out),
    .ls_word_out(ls_word),
    .result_in(result0),
    .data2_in(data2_1),
    .rd_in(rd_in),
    .wb_memtoreg_in(mux0_out[0]),
    .wb_regwrite_in(mux0_out[1]),
    .mem_memread_in(mux1_out[0]),
    .mem_memwrite_in(mux1_out[1]),
    .ls_word_in(ls_word0),
    .stall(d_stall),
    .clk(clk),
    .rst(rst)
);
ex_mux_2bits exmux2bits0(
    .out(mux0_out),
    .in1(wb_in),
    .select(ex_flush)
);
ex_mux_2bits exmux2bits1(
    .out(mux1_out),
    .in1(mem_in),
    .select(ex_flush)
);
ex_mux_4inputs exmux4inputs0(
    .out(data1_0),
    .in0(data1_in),
    .in1(pc_in),
    .in2(ex_mem_result),
    .in3(wb_data),
    .select(mux0_select)
);
ex_mux_4inputs exmux4inputs1(
    .out(data2_0),
    .in0(data2_in),
    .in1(imm_in),
    .in2(ex_mem_result),
    .in3(wb_data),
    .select(mux1_select)
);
id_mux_4inputs idmuxfordata2(
    .out(data2_1),
    .in0(data2_in),
    .in1(0),
    .in2(ex_mem_result),
    .in3(wb_data),
    .select(mux2_select)
);
endmodule
