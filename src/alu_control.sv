//finished
//`include "parameters.svh"
`include "../include/AXI_define.svh"
module alu_control(
    output logic[3:0]out,
    output ls_word,
    input  [1:0]aluop,
    input  [3:0]ins_30_14_12
);

assign ls_word = ins_30_14_12[1];

always_comb begin
    case (aluop)
    `ALUOP_R: begin
        case (ins_30_14_12)
            4'b0000: out = `ALUADD;
            4'b1000: out = `ALUSUB;
            4'b0001: out = `ALUSLL;
            4'b0010: out = `ALUSLT;
            4'b0011: out = `ALUSLTU;
            4'b0100: out = `ALUXOR;
            4'b0101: out = `ALUSRL;
            4'b1101: out = `ALUSRA;
            4'b0110: out = `ALUOR;
            4'b0111: out = `ALUAND;
            default: out = `ALUADD;
        endcase
    end
    `ALUOP_U: begin
        out = `ALULUI;
    end
    `ALUOP_I: begin
        case (ins_30_14_12[2:0])
            3'b000: out = `ALUADD;
            3'b010: out = `ALUSLT;
            3'b011: out = `ALUSLTU;
            3'b100: out = `ALUXOR;
            3'b110: out = `ALUOR;
            3'b111: out = `ALUAND;
            3'b001: out = `ALUSLL;
            3'b101: out = ins_30_14_12[3]?`ALUSRA:`ALUSRL; 
        endcase
    end
    `ALUOP_SL: begin
        out = `ALUADD;
    end
    endcase
end

endmodule
