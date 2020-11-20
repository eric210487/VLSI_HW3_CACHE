//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module registers(
    output logic[`data_size-1:0] data_r1,
    output logic[`data_size-1:0] data_r2,
    input  [`log_reg_num-1:0]    read_r1,
    input  [`log_reg_num-1:0]    read_r2,
    input  [`log_reg_num-1:0]    write_rd,
    input  [`data_size-1:0]      write_data,
    input  regwrite,
    input  clk,
    input  rst
);

logic [`data_size-1:0] reg_ [`reg_num-1:0];


always_ff@(posedge clk or posedge rst)begin
    if(rst)begin
        foreach ( reg_[i] ) begin
            reg_[i] <= 32'b0;
        end
    end
    else begin
        if (regwrite) begin
            if(write_rd == 0)reg_[write_rd] <= 32'b0;
            else reg_[write_rd] <= write_data;
        end
    end
end

always_comb begin
    data_r1 <= reg_[read_r1];
    data_r2 <= reg_[read_r2];
end

endmodule
