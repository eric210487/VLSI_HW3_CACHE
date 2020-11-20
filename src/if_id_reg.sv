//finished
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module if_id_reg(
    output  logic[`pc_size-1:0]  pc_out,
    output  logic[`data_size-1:0] data_out,
    input   [`pc_size-1:0]   pc_in,
    input   [`data_size-1:0] data_in,
    input   stall,
    input   if_flush,
    input   clk,
    input   rst
);

always_ff@(posedge clk ,posedge rst)begin
    if(rst) begin
        pc_out   <= 1'b0;
        data_out <= `data_size'b0;
    end
    else if(stall) begin
        pc_out   <= pc_out;
        data_out <= data_out;
    end
    else if(if_flush) begin
        pc_out   <= 1'b0;
        data_out <= `data_size'b0;
    end
    else begin
        pc_out   <= pc_in;
        data_out <= data_in;
    end

end


endmodule
