//implement the hazard detection
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module hazard_detector(
    output logic id_flush,
    output logic if_id_write,
    output logic pc_write,
    output logic stall_branch,
    input  id_ex_memread,
    input  ex_mem_memread,
    input  branch,
    input  ubranch_jalr,
    input  id_ex_regwrite,
    input  [`log_reg_num-1:0]id_ex_rd,
    input  [`log_reg_num-1:0]ex_mem_rd,
    input  [`log_reg_num-1:0]if_id_r1,
    input  [`log_reg_num-1:0]if_id_r2
);

always_comb begin
    //stall
    if((id_ex_memread&&((id_ex_rd==if_id_r1)||(id_ex_rd==if_id_r2)))||
        (branch&&id_ex_regwrite&&((id_ex_rd==if_id_r1)||(id_ex_rd==if_id_r2)))||
        (ubranch_jalr&&id_ex_regwrite&&(id_ex_rd==if_id_r1))||
        (ex_mem_memread&&branch&&(((ex_mem_rd==if_id_r1)||(ex_mem_rd==if_id_r2))))) begin
        id_flush    = 1'b1;
        if_id_write = 1'b0;
        pc_write    = 1'b0;
        stall_branch= 1'b0;
    end
    else begin
        id_flush    = 1'b0;
        if_id_write = 1'b1;
        pc_write    = 1'b1;
        stall_branch= 1'b1;
    end
end

    
endmodule
