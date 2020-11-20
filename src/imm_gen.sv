//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module imm_gen(
    output  logic[`data_size-1:0] imm,
    input   [`ins_size-1:0] ins
);

always_comb begin
    case (ins[6:0])
        `I_OP: begin
            for(int i=31;i>10;i--) begin
                imm[i] = ins[31];
            end
            for(int i=10;i>=0;i--) begin
                imm[i] = ins[20+i];
            end
        end
        `I_OP_L: begin
            for(int i=31;i>10;i--) begin
                imm[i] = ins[31];
            end
            for(int i=10;i>=0;i--) begin
                imm[i] = ins[20+i];
            end
        end
        `I_OP_J: begin
            for(int i=31;i>10;i--) begin
                imm[i] = ins[31];
            end
            for(int i=10;i>=0;i--) begin
                imm[i] = ins[20+i];
            end
        end
        `S_OP: begin
            for(int i=31;i>10;i--) begin
                imm[i] = ins[31];
            end
            for(int i=10;i>4;i--) begin
                imm[i] = ins[20+i];
            end
            for(int i=4;i>=0;i--) begin
                imm[i] = ins[7+i];
            end
        end
        `B_OP: begin
            for(int i=31;i>11;i--) begin
                imm[i] = ins[31];
            end
            imm[11] = ins[7]; 
            for(int i=10;i>4;i--) begin
                imm[i] = ins[20+i];
            end
            for(int i=4;i>0;i--) begin
                imm[i] = ins[7+i];
            end
            imm[0] = 1'b0;
        end
        `U_OP_1: begin
            for(int i=31;i>11;i--) begin
                imm[i] = ins[i];
            end
            for(int i=11;i>=0;i--) begin
                imm[i] = 1'b0;
            end
        end
        `U_OP_2: begin
            for(int i=31;i>11;i--) begin
                imm[i] = ins[i];
            end
            for(int i=11;i>=0;i--) begin
                imm[i] = 1'b0;
            end
        end
        `J_OP: begin
            for(int i=31;i>19;i--) begin
                imm[i] = ins[31];
            end
            for(int i=19;i>11;i--) begin
                imm[i] = ins[i];
            end
            imm[11] = ins[20];
            for(int i=10;i>0;i--) begin
                imm[i] = ins[20+i];
            end
            imm[0] = 1'b0;
        end
        default: imm = 32'b0;
    endcase
end

endmodule
