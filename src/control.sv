//finished
////`include "parameters.svh"
`include "../include/AXI_define.svh"
module control(
    output logic branch,
    output logic ubranch,
    output logic memread,
    output logic memtoreg,
    output logic [1:0]aluop,
    output logic memwrite,
    output logic alusrc,
    output logic alusrc_pc,
    output logic regwrite,
    output logic ex_flush,
    input  [6:0]ins_op
);

assign ex_flush =1'b1;

always_comb begin
    case(ins_op)
        //R-format
        7'b0110011: begin
            alusrc = 1'b0;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            ubranch = 1'b0;
            aluop = `ALUOP_R;
        end
        //I-type
        7'b0010011: begin
            alusrc   = 1'b1;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b0;
            aluop = `ALUOP_I;
        end
        //I-type(load)
        7'b0000011: begin
            alusrc   = 1'b1; //immediate
            alusrc_pc = 1'b0;
            memtoreg = 1'b1;
            regwrite = 1'b1;
            memread = 1'b1;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b0;
            aluop = `ALUOP_SL;
        end
        //JALR
        7'b1100111: begin
            alusrc   = 1'b0; 
            alusrc_pc = 1'b1;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b1;
            aluop = 2'b00;
        end
        //S-type
        7'b0100011: begin
            alusrc   = 1'b1;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b0;
            memread = 1'b0;
            memwrite = 1'b1;
            branch   = 1'b0;
            ubranch = 1'b0;
            aluop = `ALUOP_SL;
        end
        //B-type
        7'b1100011: begin
            alusrc   = 1'b0;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b1;
            ubranch = 1'b0;
            aluop = 2'b00;
        end
        //U-type-1
        7'b0010111: begin
            alusrc   = 1'b1;
            alusrc_pc = 1'b1;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b0;
            aluop = 2'b00;
        end
        //U-type-2
        7'b0110111: begin
            alusrc   = 1'b1;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b0;
            aluop = `ALUOP_U;
        end
        //J-type(JAL)
        7'b1101111: begin
            alusrc   = 1'b0;
            alusrc_pc = 1'b1;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch = 1'b1;
            aluop = 2'b00;
        end
        default:begin
            alusrc   = 1'b0;
            alusrc_pc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            branch   = 1'b0;
            ubranch  = 1'b0;
            aluop = 2'b00;
        end
    endcase
end


    
endmodule
