`include "../include/AXI_define.svh"
module id_flush_branch(
    output logic branch_out,
    output logic ubranch_out,
    input  branch_in,
    input  ubranch_in,
    input  flush
);

always_comb begin
    if(flush) begin
        branch_out = 1'b0;
        ubranch_out = 1'b0; 
    end
    else begin
        branch_out = branch_in;
        ubranch_out = ubranch_in; 
    end
end
    
endmodule
