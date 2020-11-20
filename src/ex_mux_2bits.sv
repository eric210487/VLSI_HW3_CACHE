//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module ex_mux_2bits(
    output [1:0] out,
    input  [1:0] in1,
    input  select
);

assign out = select?in1:2'b0;

endmodule 
