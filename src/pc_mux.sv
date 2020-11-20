//finished
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module pc_mux(
    output [`pc_size-1:0] out,
    input  [`pc_size-1:0] in0,
    input  [`pc_size-1:0] in1,
    input  select
);
assign  out = select?in1:in0;
endmodule
