////`include "parameters.svh"
`include "../include/AXI_define.svh"
module data_control(
    output logic[3:0]web,
    output logic[`data_size-1:0] shifted_data,
    input  [2:0]lsword,
    input  [1:0] address_byte,
    input  [`data_size-1:0]data
);
always_comb begin
    if(lsword==`FUNC3_W)begin
        web = 4'b0000;
        shifted_data = data;
    end
    else if(lsword==`FUNC3_B)begin
        case (address_byte)
            2'b00: begin
                web = 4'b1110;
                shifted_data = data;
            end
            2'b01: begin
                web = 4'b1101;
                shifted_data = data << 8;
            end
            2'b10: begin
                web = 4'b1011;
                shifted_data = data << 16;
            end
            2'b11: begin
                web = 4'b0111;
                shifted_data = data << 24;
            end
        endcase
    end
    else if(lsword==`FUNC3_H)begin
        case (address_byte[1])
            1'b0: begin
                web = 4'b1100;
                shifted_data = data;
            end
            1'b1: begin
                web = 4'b0011;
                shifted_data = data << 16;
            end
        endcase
    end
    else begin
        web = 4'b1111;
        shifted_data = data;
    end
end 

endmodule
