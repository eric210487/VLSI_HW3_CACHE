////`include "parameters.svh"
`include "../include/AXI_define.svh"
module wb_mux(
    output[`data_size-1:0] out,
    input [`data_size-1:0] in0,
    input [`data_size-1:0] in1,
    input select
);
assign out = select?in1:in0;
endmodule
