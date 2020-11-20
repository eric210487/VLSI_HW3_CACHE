////`include "parameters.svh"
`include "../include/AXI_define.svh"
`include "if_id_reg.sv"
`include "pc_adder.sv"
`include "pc_mux.sv"
`include "pc_reg.sv"
module IF(
    output [31:0] pc_to_iram,          //address(pc)
    output [`pc_size-1:0] pc_if_id,
    output [`data_size-1:0] data_out,  //new(data to id stage)

    input  if_id_write,
    input  pc_write,
    input  if_flush,
    input  [`pc_size-1:0] branch_pc,
    input  pcsrc,                     //from branch comparison (1 for branch)
    input  [`data_size-1:0] data_in,  //new (data from sram)
    input  i_stall,
    input  d_stall,

    input  clk,
    input  rst
);

logic [`pc_size-1:0] pc_mux_out,pc_add4,pc_reg_out,stallmux_out;
assign pc_to_iram = pc_reg_out;

logic [`pc_size-1:0] branch_pc_reg;
logic pcsrc_reg;
always_ff @(posedge clk ,posedge rst) begin
    if(rst)begin
        branch_pc_reg <= `pc_size'b0;
        pcsrc_reg     <= 1'b0;
    end 
    else if(pcsrc) begin
        branch_pc_reg <= branch_pc;
        pcsrc_reg     <= pcsrc;
    end 
    else if(!i_stall) begin
        branch_pc_reg <= `pc_size'b0;
        pcsrc_reg     <= 1'b0;
    end
    else begin
        branch_pc_reg <= branch_pc_reg;
        pcsrc_reg     <= pcsrc_reg;
    end
end

//wen for pc_reg
logic pc_reg_wen ;
assign pc_reg_wen = pc_write & (~(i_stall|d_stall));
//flush for if_reg
logic if_id_reg_flush ;
assign if_id_reg_flush = pcsrc_reg | i_stall;
//stall for if_reg
logic if_id_reg_stall ;
assign if_id_reg_stall = (~if_id_write) | d_stall;

pc_mux pc_mux(
    .out(pc_mux_out),
    .in0(pc_add4),
    .in1(branch_pc_reg),
    .select(pcsrc_reg)
);
pc_reg pc_reg(
    .pc_out(pc_reg_out),
    .pc_in(pc_mux_out),
    .w_en(pc_reg_wen),
    .clk(clk),
    .rst(rst)
);
pc_adder pc_adder(
    .pc_out(pc_add4),
    .pc_in(pc_reg_out)
);
if_id_reg if_id_reg(
    .pc_out(pc_if_id),
    .data_out(data_out),
    .pc_in(pc_reg_out),
    .data_in(data_in),
    .stall(if_id_reg_stall),
    .if_flush(if_id_reg_flush),
    .clk(clk),
    .rst(rst)
);

endmodule
