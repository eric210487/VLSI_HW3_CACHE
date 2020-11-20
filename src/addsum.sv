//finished
`include "../include/AXI_define.svh"
module addsum(
    output logic[`pc_size-1:0]   pc_out,
    input  [`pc_size-1:0]   pc_in,
    input  [6:0] op,
    input  [`data_size-1:0] r1_in,
    input  [`data_size-1:0] imm_in
);

always_comb begin
    if (op == 7'b1100111) pc_out = imm_in + r1_in;
    else pc_out = pc_in + imm_in;
end

endmodule
