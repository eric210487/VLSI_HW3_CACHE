`define AXI_ID_BITS 4
`define AXI_IDS_BITS 8
`define AXI_ADDR_BITS 32
`define AXI_LEN_BITS 4
`define AXI_SIZE_BITS 3
`define AXI_DATA_BITS 32
`define AXI_STRB_BITS 4
`define AXI_LEN_ONE 4'h0
`define AXI_SIZE_BYTE 3'b000
`define AXI_SIZE_HWORD 3'b001
`define AXI_SIZE_WORD 3'b010
`define AXI_BURST_INC 2'h1
`define AXI_STRB_WORD 4'b1111
`define AXI_STRB_HWORD 4'b0011
`define AXI_STRB_BYTE 4'b0001
`define AXI_RESP_OKAY 2'h0
`define AXI_RESP_SLVERR 2'h2
`define AXI_RESP_DECERR 2'h3
`define M0_F_ID 4'h1
`define M1_L_ID 4'h2
`define M1_S_ID 4'h3
`define INST_BITS 32
`define DATA_BITS 32
`define MAXPEND 2'd2

`define CPU_WRAPPER_RM0_INI  2'd0
`define CPU_WRAPPER_RM0_SEND 2'd1
`define CPU_WRAPPER_RM0_WAIT 2'd2

`define CPU_WRAPPER_RM1_INI    3'd0
`define CPU_WRAPPER_RM1_RSEND  3'd1
`define CPU_WRAPPER_RM1_RWAIT  3'd2
`define CPU_WRAPPER_RM1_WSEND  3'd3
`define CPU_WRAPPER_RM1_WWAIT  3'd4
`define CPU_WRAPPER_RM1_WREADY 3'd5

`define SRAM_WRAPPER_INI    3'd0
`define SRAM_WRAPPER_GETRA  3'd1
`define SRAM_WRAPPER_SEND   3'd2
`define SRAM_WRAPPER_GETWA  3'd3
`define SRAM_WRAPPER_GETW   3'd4
`define SRAM_WRAPPER_WRITE  3'd5

//ALU control
`define ALUADD  4'b0000
`define ALUSUB  4'b0001
`define ALUSLL  4'b0010
`define ALUSLT  4'b0011
`define ALUSLTU 4'b0100
`define ALUXOR  4'b0101
`define ALUSRL  4'b0110
`define ALUSRA  4'b0111
`define ALUOR   4'b1000
`define ALUAND  4'b1001
`define ALULUI  4'b1010

//ALUOP
`define ALUOP_R     2'b10
`define ALUOP_U     2'b11
`define ALUOP_I     2'b01
`define ALUOP_SL     2'b00

//OP code
`define R_OP        7'b0110011
`define I_OP        7'b0010011
`define I_OP_L      7'b0000011
`define I_OP_J      7'b1100111
`define S_OP        7'b0100011
`define B_OP        7'b1100011
`define U_OP_1      7'b0010111
`define U_OP_2      7'b0110111
`define J_OP        7'b1101111

//func3 for branch
`define FUNC3_BEQ   3'b000
`define FUNC3_BNE   3'b001
`define FUNC3_BLT   3'b100
`define FUNC3_BGE   3'b101
`define FUNC3_BLTU  3'b110
`define FUNC3_BGEU  3'b111

//func3 for Load/Store
`define FUNC3_W     3'b010
`define FUNC3_B     3'b000
`define FUNC3_BU    3'b100
`define FUNC3_H     3'b001
`define FUNC3_HU    3'b101

//size of some variable
`define data_size 32
`define ins_size 32
`define pc_size 32
`define log_reg_num 5
`define reg_num 32
`define func_size 4