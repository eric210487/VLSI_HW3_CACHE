//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module id_mux_4inputs(
    output logic [`data_size-1:0] out,
    input  [`data_size-1:0] in0,
    input  [`data_size-1:0] in1,
    input  [`data_size-1:0] in2,
    input  [`data_size-1:0] in3,
    input  [1:0]select
);

always_comb begin
    case(select)
        2'b00 : out = in0;
        2'b01 : out = in1;
        2'b10 : out = in2;
        2'b11 : out = in3;
    endcase
end

endmodule 
