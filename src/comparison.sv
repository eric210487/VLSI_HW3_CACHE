//finished
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module comparison(
    output logic pcsrc,
    input  [`data_size-1:0]r1_data,
    input  [`data_size-1:0]r2_data,
    input  [2:0]func3,
    input  branch
);
always_comb begin
    if(branch)begin
        case (func3)
            `FUNC3_BEQ: begin
                if(r1_data==r2_data)begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            `FUNC3_BNE: begin
                if(r1_data!=r2_data)begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            `FUNC3_BLT: begin
                if($signed(r1_data)<$signed(r2_data))begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            `FUNC3_BGE: begin
                if($signed(r1_data)>=$signed(r2_data))begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            `FUNC3_BLTU: begin
                if(r1_data<r2_data)begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            `FUNC3_BGEU: begin
                if(r1_data>=r2_data)begin
                     pcsrc = 1'b1;
                end
                else pcsrc = 1'b0;
            end
            default: begin
                pcsrc = 1'b0;
            end
        endcase 
    end
    else pcsrc = 1'b0;
end
    
endmodule
