//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
`include "registers.sv"
`include "control.sv"
`include "hazard_detector.sv"
`include "imm_gen.sv"
`include "shift_left.sv"
`include "addsum.sv"
`include "comparison.sv"
`include "id_mux.sv"
`include "id_ex_reg.sv"
`include "id_mux_4inputs.sv"
`include "id_flush_branch.sv"

module ID(
    output  [`log_reg_num-1:0]r1,
    output  [`log_reg_num-1:0]r2,
    output  [`log_reg_num-1:0]rd,
    output  [`data_size-1:0]  r1_data,
    output  [`data_size-1:0]  r2_data,
    output  [`data_size-1:0]  imm,
    output  mem_memread,
    output  mem_memwrite,
    output  ex_alusrc,
    output  ex_alusrc_pc,
    output  [1:0]ex_aluop,
    output  [3:0]ins_30_14_12,
    output  wb_memtoreg,
    output  wb_regwrite,
    output  [`pc_size-1:0]branch_pc,
    output  pcsrc,
    output  [`pc_size-1:0]pc_out,

    //hazard detection
    output  if_id_write,   
    output  pc_write,

    //control
    output  if_flush,
    output  ex_flush,

    output  [`log_reg_num-1:0]r1_to_forwarding,
    output  [`log_reg_num-1:0]r2_to_forwarding,
    output  ubranch_out,

    input   [`ins_size-1:0]  ins_in,
    input   [`pc_size-1:0]   pc_in,
    input   regwrite,
    input   id_ex_memread,
    input   id_ex_regwrite,
    input   ex_mem_memread,
    input   [`log_reg_num-1:0]   id_ex_rd,
    input   [`log_reg_num-1:0]   ex_mem_rd,
    input   [`data_size-1:0]     wb_data,
    input   [`log_reg_num-1:0]   wb_rd, 
    input   [`data_size-1:0]     wb_result,
    input   [1:0] r1_forwarding_signal,
    input   [1:0] r2_forwarding_signal,

    input   d_stall,
    input   clk,
    input   rst
);

logic branch0, memread0, memtoreg0, memwrite0, alusrc0, regwrite0, id_flush0;
logic [1:0] aluop0;
logic id_flush1;
logic [`pc_size-1:0] imm_out0;
logic [`data_size-1:0] r1_data0, r2_data0, r1_data1, r2_data1;
logic idmux_select;
logic memread1, memtoreg1, memwrite1, alusrc1, regwrite1;
logic [1:0] aluop1;
logic alusrcpc0,alusrcpc1;
logic [3:0] ins_30_14_12_0;
logic ubranch0, comparison_out,branch1,ubranch1;
logic uregwrite0;
logic regwrite_or;
logic pcsrc_reg;
logic stallbranch0;
logic ubranch_jalr;

assign idmux_select = pcsrc_reg || id_flush1;
assign ins_30_14_12_0[3] = ins_in[30];
assign ins_30_14_12_0[2:0] = ins_in[14:12];
assign r1_to_forwarding = ins_in[19:15];
assign r2_to_forwarding = ins_in[24:20];
assign pcsrc = stallbranch0&&(ubranch1||comparison_out);
assign if_flush = pcsrc;
assign ubranch_jalr = ubranch0 && !ins_in[3];

always_ff @(posedge clk, posedge rst) begin
    if(rst) pcsrc_reg <= 1'b0;
    else pcsrc_reg <= pcsrc; 
end

registers registers0(
    .data_r1(r1_data0),
    .data_r2(r2_data0),
    .read_r1(ins_in[19:15]),
    .read_r2(ins_in[24:20]),
    .write_rd(wb_rd),
    .write_data(wb_data),
    .regwrite(regwrite),
    .clk(clk),
    .rst(rst)
);
control control0(
    .branch(branch0),
    .ubranch(ubranch0),
    .memread(memread0),
    .memtoreg(memtoreg0),
    .aluop(aluop0),
    .memwrite(memwrite0),
    .alusrc(alusrc0),
    .alusrc_pc(alusrcpc0),
    .regwrite(regwrite0),
    .ex_flush(ex_flush),
    .ins_op(ins_in[6:0])
);
id_flush_branch idflushbranch0(
    .branch_out(branch1),
    .ubranch_out(ubranch1),
    .branch_in(branch0),
    .ubranch_in(ubranch0),
    .flush(pcsrc_reg)
);
hazard_detector hazard_detector0(
    .id_flush(id_flush1),
    .if_id_write(if_id_write),
    .pc_write(pc_write),
    .stall_branch(stallbranch0),
    .id_ex_memread(id_ex_memread),
    .ex_mem_memread(ex_mem_memread),
    .branch(branch0),
    .ubranch_jalr(ubranch_jalr),
    .id_ex_regwrite(id_ex_regwrite),
    .id_ex_rd(id_ex_rd),
    .ex_mem_rd(ex_mem_rd),
    .if_id_r1(ins_in[19:15]),
    .if_id_r2(ins_in[24:20])
);
imm_gen imm_gen0(
    .imm(imm_out0),
    .ins(ins_in)
);
addsum addsum0(
    .pc_out(branch_pc),
    .pc_in(pc_in),
    .op(ins_in[6:0]),
    .r1_in(r1_data1),
    .imm_in(imm_out0)
);
comparison comparison0(
    .pcsrc(comparison_out),
    .r1_data(r1_data1),
    .r2_data(r2_data1),
    .func3(ins_in[14:12]),
    .branch(branch1)
);
id_mux idmux0(
    .memread_out(memread1),
    .memwrite_out(memwrite1),
    .alusrc_out(alusrc1),
    .alusrc_pc_out(alusrcpc1),
    .aluop_out(aluop1),
    .memtoreg_out(memtoreg1),
    .regwrite_out(regwrite1),
    .memread_in(memread0),
    .memwrite_in(memwrite0),
    .alusrc_in(alusrc0),
    .alusrc_pc_in(alusrcpc0),
    .aluop_in(aluop0),
    .memtoreg_in(memtoreg0),
    .regwrite_in(regwrite0),
    .select(idmux_select)
);
id_mux_4inputs idmux4inputs0(
    .out(r1_data1),
    .in0(r1_data0),
    .in1(32'b0),
    .in2(wb_result),
    .in3(wb_data),
    .select(r1_forwarding_signal)
);
id_mux_4inputs idmux4inputs1(
    .out(r2_data1),
    .in0(r2_data0),
    .in1(32'b0),
    .in2(wb_result),
    .in3(wb_data),
    .select(r2_forwarding_signal)
);
id_ex_reg idexreg0(
    .r1_out(r1),
    .r2_out(r2),
    .rd_out(rd),
    .wb_memtoreg_out(wb_memtoreg),
    .wb_regwrite_out(wb_regwrite),
    .mem_memread_out(mem_memread),
    .mem_memwrite_out(mem_memwrite),
    .ex_alusrc_out(ex_alusrc),
    .ex_aluop_out(ex_aluop),
    .ins_30_14_12_out(ins_30_14_12),
    .pc_out(pc_out),
    .alusrc_pc_out(ex_alusrc_pc),
    .imm_out(imm),
    .ubranch_out(ubranch_out),
    .r1_data_out(r1_data),
    .r2_data_out(r2_data),
    .r1_in(ins_in[19:15]),
    .r2_in(ins_in[24:20]),
    .rd_in(ins_in[11:7]),
    .wb_memtoreg_in(memtoreg1),
    .wb_regwrite_in(regwrite1),
    .mem_memread_in(memread1),
    .mem_memwrite_in(memwrite1),
    .ex_alusrc_in(alusrc1),
    .ex_aluop_in(aluop1),
    .ins_30_14_12_in(ins_30_14_12_0),
    .pc_in(pc_in),
    .alusrc_pc_in(alusrcpc1),
    .imm_in(imm_out0),
    .ubranch_in(ubranch0),
    .r1_data_in(r1_data1),
    .r2_data_in(r2_data1),
    .stall(d_stall),
    .clk(clk),
    .rst(rst)
);

endmodule
