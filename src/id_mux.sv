//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module id_mux(
    output logic memread_out,
    output logic memwrite_out,
    output logic alusrc_out,
    output logic alusrc_pc_out,
    output logic [1:0]aluop_out,
    output logic memtoreg_out,
    output logic regwrite_out,

    input  memread_in,
    input  memwrite_in,
    input  alusrc_in,
    input  alusrc_pc_in,
    input  [1:0]aluop_in,
    input  memtoreg_in,
    input  regwrite_in,

    input  select
);

always_comb begin
    if(!select) begin
        memread_out  = memread_in;
        memwrite_out = memwrite_in;
        alusrc_out   = alusrc_in;
        alusrc_pc_out = alusrc_pc_in;
        aluop_out    = aluop_in;
        memtoreg_out = memtoreg_in;
        regwrite_out = regwrite_in;
    end
    else begin
        memread_out  = 1'b0;
        memwrite_out = 1'b0;
        alusrc_out   = 1'b0;
        alusrc_pc_out =1'b0;
        aluop_out    = 2'b0;
        memtoreg_out = 1'b0;
        regwrite_out = 1'b0;
    end
end

endmodule 
