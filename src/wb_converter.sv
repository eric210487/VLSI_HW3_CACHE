////`include "parameters.svh"
`include "../include/AXI_define.svh"
module wb_converter(
    output  logic[`data_size-1:0]out,
    input   [`data_size-1:0]in,
    input   [1:0]address_byte,
    input   [2:0]w_b
);

always_comb begin
    case (w_b)
        `FUNC3_W: begin
            out = in;
        end
        `FUNC3_B: begin
            case (address_byte)
                2'b00: out = $signed(in[7:0]);
                2'b01: out = $signed(in[15:8]);
                2'b10: out = $signed(in[23:16]);
                2'b11: out = $signed(in[31:24]);
            endcase
        end
        `FUNC3_BU: begin
            case (address_byte)
                2'b00: out = $unsigned(in[7:0]);
                2'b01: out = $unsigned(in[15:8]);
                2'b10: out = $unsigned(in[23:16]);
                2'b11: out = $unsigned(in[31:24]);
            endcase
        end
        `FUNC3_H: begin
            case (address_byte[1])
                1'b0: out = $signed(in[15:0]);
                1'b1: out = $signed(in[31:16]);
            endcase
        end
        `FUNC3_HU: begin
            case (address_byte[1])
                1'b0: out = $unsigned(in[15:0]);
                1'b1: out = $unsigned(in[31:16]);
            endcase
        end
        default: begin
            out = in;
        end
    endcase
end

    
endmodule
