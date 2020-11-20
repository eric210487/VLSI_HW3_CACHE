////`include "parameters.svh"
`include "../include/AXI_define.svh"
module data_control(
    output logic[3:0]web,
    output logic[`data_size-1:0] shifted_data,
    input  lsword,
    input  [1:0] address_byte,
    input  [`data_size-1:0]data
);
always_comb begin
    if(lsword)begin
        web = 4'b0000;
        shifted_data = data;
    end
    else begin
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
end 

endmodule
