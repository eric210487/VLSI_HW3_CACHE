//finished
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module pc_reg(
    output  logic[`pc_size-1:0] pc_out, 
    input   [`pc_size-1:0] pc_in, 
    input   w_en,
    input   clk,
    input   rst
);
always_ff @(posedge clk, posedge rst) begin
    if(rst) begin
        pc_out <= 1'b0;
    end
    else if(w_en) begin
        pc_out <= pc_in;
    end
    else begin
        pc_out <= pc_out;
    end
end

endmodule
