`include "../include/AXI_define.svh"
`include "if.sv"
`include "id.sv"
`include "ex.sv"
`include "mem_wb_reg.sv"
`include "data_control.sv"
`include "wb_mux.sv"
`include "wb_converter.sv"
module cpu(
    output i_cs,
    output i_oe,
    output [3:0]i_web,
    output [31:0]i_address,
    output [`data_size-1:0]i_di,

    output d_cs,
    output d_oe,
    output [3:0]d_web,
    output [31:0]d_address,
    output [`data_size-1:0]d_di,

    input  [`data_size-1:0]i_do,
    input  [`data_size-1:0]d_do,

    input  i_stall,
    input  d_stall,

    input  clk,
    input  rst
);

assign i_cs = 1'b1;
assign d_cs = 1'b1;
assign i_web = 4'b1111;
assign i_di = 32'd0;
assign i_oe = 1'b1;

//if out
logic [`pc_size-1:0] pc_if_id_out;
logic [`data_size-1:0] ins_if_id_out;
//id out
logic hazard_if_id_write, hazard_pc_write;
logic control_if_flush;
logic pcsrc_0;
logic [`pc_size-1:0]branch_pc_0;
logic [4:0]r1_2, r2_2, rd_2;
logic [`data_size-1:0]r1_data_0, r2_data_0, imm_0;
logic memread_0, memwrite_1;
logic alusrc_0;
logic [1:0]aluop_0;
logic [3:0]ins301412_0;
logic memtoreg_2, regwrite_2;
logic ex_flush_0;
logic [`log_reg_num-1:0]r1_to_forwarding,r2_to_forwarding;
logic [`pc_size-1:0] pc_0;
logic ex_alusrc_pc0;
logic ubranch0;
//ex out
logic [`data_size-1:0]result_1;
logic [`log_reg_num-1:0]rd_1;
logic memtoreg_1, regwrite_1;
logic [`data_size-1:0]zero;
logic [1:0] r1_forwarding_signal, r2_forwarding_signal;
logic lsword0;
logic ex_mem_memread0;
logic [`data_size-1:0]data2_to_control;
//mem out
logic [`data_size-1:0]result_0;
logic memtoreg_0, regwrite_0;
logic [`log_reg_num-1:0]rd_0;
logic memwrite_0;
logic lsword1;
logic [`data_size-1:0] d_do_out;
//wb out
logic [`data_size-1:0]wb_data;
logic [`data_size-1:0]convertdo;

//assign
assign d_address = result_1;

logic  [3:0] write_byte;

assign d_web = memwrite_0?write_byte:4'b1111;
assign d_oe = ex_mem_memread0;


IF if0(
    .pc_to_iram(i_address),
    .pc_if_id(pc_if_id_out),
    .data_out(ins_if_id_out),
    .if_id_write(hazard_if_id_write),
    .pc_write(hazard_pc_write),
    .if_flush(control_if_flush),
    .branch_pc(branch_pc_0),
    .pcsrc(pcsrc_0),
    .data_in(i_do),
    .i_stall(i_stall),
    .d_stall(d_stall),
    .clk(clk),
    .rst(rst)
);
ID id0(
    .r1(r1_2),
    .r2(r2_2),
    .rd(rd_2),
    .r1_data(r1_data_0),
    .r2_data(r2_data_0),
    .imm(imm_0),
    .mem_memread(memread_0),
    .mem_memwrite(memwrite_1),
    .ex_alusrc(alusrc_0),
    .ex_alusrc_pc(ex_alusrc_pc0),
    .ex_aluop(aluop_0),
    .ins_30_14_12(ins301412_0),
    .wb_memtoreg(memtoreg_2),
    .wb_regwrite(regwrite_2),
    .branch_pc(branch_pc_0),
    .pcsrc(pcsrc_0),
    .pc_out(pc_0),
    .if_id_write(hazard_if_id_write),
    .pc_write(hazard_pc_write),
    .if_flush(control_if_flush),
    .ex_flush(ex_flush_0),
    .r1_to_forwarding(r1_to_forwarding),
    .r2_to_forwarding(r2_to_forwarding),
    .ubranch_out(ubranch0),
    .ins_in(ins_if_id_out),
    .pc_in(pc_if_id_out),
    .regwrite(regwrite_0),
    .id_ex_memread(memread_0),
    .id_ex_regwrite(regwrite_2),
    .ex_mem_memread(ex_mem_memread0),
    .id_ex_rd(rd_2),
    .ex_mem_rd(rd_1),
    .wb_data(wb_data),
    .wb_rd(rd_0),
    .wb_result(result_1),
    .r1_forwarding_signal(r1_forwarding_signal),
    .r2_forwarding_signal(r2_forwarding_signal),
    .d_stall(d_stall),
    .clk(clk),
    .rst(rst)
);
EX ex0(
    .result(result_1),
    .data2_out(data2_to_control),
    .rd_out(rd_1),
    .wb_memtoreg_out(memtoreg_1),
    .wb_regwrite_out(regwrite_1),
    .mem_memread_out(ex_mem_memread0),
    .mem_memwrite_out(memwrite_0),
    .zero(zero),
    .r1_forwarding_signal(r1_forwarding_signal),
    .r2_forwarding_signal(r2_forwarding_signal),
    .ls_word(lsword0),
    .wb_memtoreg_in(memtoreg_2),
    .wb_regwrite_in(regwrite_2),
    .mem_memread_in(memread_0),
    .mem_memwrite_in(memwrite_1),
    .ex_alusrc(alusrc_0),
    .ex_alusrc_pc(ex_alusrc_pc0),
    .ex_aluop(aluop_0),
    .data1_in(r1_data_0),
    .data2_in(r2_data_0),
    .imm_in(imm_0),
    .id_r1_in(r1_to_forwarding),
    .id_r2_in(r2_to_forwarding),
    .r1_in(r1_2),
    .r2_in(r2_2),
    .rd_in(rd_2),
    .ex_flush(ex_flush_0),
    .wb_data(wb_data),
    .ex_mem_rd(rd_1),
    .mem_wb_rd(rd_0),
    .ex_mem_regwrite(regwrite_1),
    .mem_wb_regwrite(regwrite_0),
    .ex_mem_result(result_1),
    .ins_30_14_12(ins301412_0),
    .pc_in(pc_0),
    .ubranch(ubranch0),
    .d_stall(d_stall),
    .clk(clk),
    .rst(rst)
);
data_control datacontrol0(
    .web(write_byte),
    .shifted_data(d_di),
    .lsword(lsword0),
    .address_byte(result_1[1:0]),
    .data(data2_to_control)
);
mem_wb_reg memwbreg0(
    .result_out(result_0),
    .rd_out(rd_0),
    .wb_memtoreg_out(memtoreg_0),
    .wb_regwrite_out(regwrite_0),
    .ls_word_out(lsword1),
    .mem_out(d_do_out),
    .result_in(result_1),
    .rd_in(rd_1),
    .wb_memtoreg_in(memtoreg_1),
    .wb_regwrite_in(regwrite_1),
    .ls_word_in(lsword0),
    .mem_in(d_do),
    .stall(d_stall),
    .clk(clk),
    .rst(rst)
);
wb_converter wbconverter0(
    .out(convertdo),
    .in(d_do_out),
    .w_b(lsword1)
);
wb_mux wbmux0(
    .out(wb_data),
    .in0(result_0),
    .in1(convertdo),
    .select(memtoreg_0)
);


endmodule
