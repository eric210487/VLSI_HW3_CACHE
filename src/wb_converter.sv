////`include "parameters.svh"
`include "../include/AXI_define.svh"
module wb_converter(
    output  logic[`data_size-1:0]out,
    input   [`data_size-1:0]in,
    input   w_b
);

always_comb begin
    if(!w_b) begin
        out[7:0] = in[7:0];
        for(int i=`data_size-1;i>7;i--)begin
            out[i] = in[7];
        end
    end
    else out = in;
end

    
endmodule
