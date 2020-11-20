//finished
`include "../include/AXI_define.svh"
module shift_left(
    output [`data_size-1:0] imm_out,
    input  [`data_size-1:0] imm_in
);
    assign imm_out = imm_in << 1;
endmodule
