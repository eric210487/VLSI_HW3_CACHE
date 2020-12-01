//================================================
// Auther:      Chen Yun-Ru (May)
// Filename:    L1C_inst.sv
// Description: L1 Cache for instruction
// Version:     0.1
//================================================
`include "def.svh"
`include "tag_array_wrapper.sv"
`include "data_array_wrapper.sv"
module L1C_data(
  input clk,
  input rst,
  // Core to CPU wrapper
  input [`DATA_BITS-1:0] core_addr,
  input core_req,
  input core_write,
  input [`DATA_BITS-1:0] core_in,
  input [`CACHE_TYPE_BITS-1:0] core_type,
  // Mem to CPU wrapper
  input [`DATA_BITS-1:0] D_out,
  input D_wait,
  // CPU wrapper to core
  output logic [`DATA_BITS-1:0] core_out,
  output logic core_wait,
  // CPU wrapper to Mem
  output logic D_req,
  output logic [`DATA_BITS-1:0] D_addr,
  output logic D_write,
  output logic [`DATA_BITS-1:0] D_in,
  output logic [`CACHE_TYPE_BITS-1:0] D_type
);

  logic [`CACHE_INDEX_BITS-1:0] index;
  logic [`CACHE_DATA_BITS-1:0] DA_out;
  logic [`CACHE_DATA_BITS-1:0] DA_in;
  logic [`CACHE_WRITE_BITS-1:0] DA_write;
  logic DA_read;
  logic [`CACHE_TAG_BITS-1:0] TA_out;
  logic [`CACHE_TAG_BITS-1:0] TA_in;
  logic TA_write;
  logic TA_read;

  logic [`CACHE_LINES-1:0] valid;
  logic valid_wire;
  logic [1:0]count;
  logic [1:0]count_wire;
  logic read_hit;
  logic write_hit;
  logic [3:0]curr_state;
  logic [3:0]next_state;

  //--------------- complete this part by yourself -----------------//
  
  data_array_wrapper DA(
    .A(index),
    .DO(DA_out),
    .DI(DA_in),
    .CK(clk),
    .WEB(DA_write),
    .OE(DA_read),
    .CS(1'b1)
  );
   
  tag_array_wrapper  TA(
    .A(index),
    .DO(TA_out),
    .DI(TA_in),
    .CK(clk),
    .WEB(TA_write),
    .OE(TA_read),
    .CS(1'b1)
  );

  //-------------------assign-------------------//
  assign index = core_addr[9:4];
  assign TA_in = core_addr[31:10];
  assign D_in = core_in;
  assign D_type = core_type;

always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    curr_state <= `IDLE;
  end
  else begin
    curr_state <= next_state;
  end
end

always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    valid <= 64'b0;
    count <= 2'b00;
  end
  else begin
    case (curr_state)
      `READMISS: begin
        count <= count_wire;
        valid <= valid;
      end
      `READDATA: begin
        count <= count;
        valid[index] <= valid_wire;
      end
      default: begin
        count <= count;
        valid <= valid;
      end
    endcase
  end
end

always_comb begin
  case (curr_state) 
    `IDLE:begin
      if(core_req&core_write) next_state = `WRITE;
      else if (core_req&~core_write) next_state = `READ;
      else next_state = `IDLE;
    end
    `WRITE:begin
      if(write_hit) next_state = `WRITEHIT;
      else if (~write_hit) next_state = `WRITEMISS;
    end
    `WRITEHIT:begin
      next_state = `WRITEMISS;
    end
    `WRITEMISS:begin
      if(~D_wait) next_state = `WRITEDATA;
      else next_state = `WRITEMISS;
    end
    `WRITEDATA:begin
      next_state = `IDLE;
    end
    `READ:begin
      if(read_hit) next_state = `READOUT;
      else if (~read_hit)next_state = `READMISS;
    end
    `READMISS:begin
      next_state = `READDATA;
    end
    `READDATA:begin
      if(~D_wait) begin
        if(count==2'b00) next_state = `READ;
        else next_state = `READMISS;
      end
      else next_state = `READDATA;
    end
    `READOUT: begin
      next_state = `IDLE;
    end
	  default: begin
      next_state = `IDLE;
    end
endcase
end

always_comb begin
  //core
  core_out = 32'd0;
  core_wait = 1'b1;
  //wrapper
  D_req = 1'b0;
  D_addr = 32'd0;
  D_write = 1'b0;
  //data array
  DA_in = 128'd0;
  DA_write = 16'hffff;
  DA_read = 1'b0;
  //tag array
  TA_write = 1'b1; 
  TA_read = 1'b0;
  //count
  count_wire = 2'd0;
  //hit
  read_hit = 1'b0;
  write_hit = 1'b0;
  //valid 
  valid_wire = 1'b0;

  case (curr_state)
    `IDLE:begin
        core_wait = 1'b0;
        end
    `WRITE:begin
      TA_read = 1'b1;
      write_hit = ((TA_out==core_addr[31:10])&&(valid[index]==1))?1'b1:1'b0;
    end
    `WRITEHIT:begin
      if ((core_addr[3:0]==4'b0000)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))          begin DA_write = 16'hfffe; DA_in = {120'b0,core_in[7:0]}; end
      else if ((core_addr[3:0]==4'b0001)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfffd; DA_in = {112'b0,core_in[15:8],8'b0}; end
      else if ((core_addr[3:0]==4'b0010)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfffb; DA_in = {104'b0,core_in[23:16],16'b0}; end
      else if ((core_addr[3:0]==4'b0011)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfff7; DA_in = {96'b0,core_in[31:24],24'b0}; end
      else if ((core_addr[3:0]==4'b0000)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfffc; DA_in = {112'b0,core_in[15:0]}; end
      else if ((core_addr[3:0]==4'b0010)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfff3; DA_in = {96'b0,core_in[31:16],16'b0}; end
      else if ((core_addr[3:2]==2'b00)&(core_type==`CACHE_WORD))                                     begin DA_write = 16'hfff0; DA_in = {96'b0,core_in[31:0]}; end
      else if ((core_addr[3:0]==4'b0100)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffef; DA_in = {88'b0,core_in[7:0],32'b0}; end
      else if ((core_addr[3:0]==4'b0101)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffdf; DA_in = {80'b0,core_in[15:8],40'b0}; end
      else if ((core_addr[3:0]==4'b0110)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffbf; DA_in = {72'b0,core_in[23:16],48'b0}; end
      else if ((core_addr[3:0]==4'b0111)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hff7f; DA_in = {64'b0,core_in[31:24],56'b0}; end
      else if ((core_addr[3:0]==4'b0100)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hffcf; DA_in = {80'b0,core_in[15:0],32'b0}; end
      else if ((core_addr[3:0]==4'b0110)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hff3f; DA_in = {64'b0,core_in[31:16],48'b0}; end
      else if ((core_addr[3:2]==2'b01)&(core_type==`CACHE_WORD))                                     begin DA_write = 16'hff0f; DA_in = {64'b0,core_in[31:0],32'b0}; end
      else if ((core_addr[3:0]==4'b1000)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfeff; DA_in = {56'b0,core_in[7:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1001)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfdff; DA_in = {48'b0,core_in[15:8],72'b0}; end
      else if ((core_addr[3:0]==4'b1010)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfbff; DA_in = {40'b0,core_in[23:16],80'b0}; end
      else if ((core_addr[3:0]==4'b1011)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hf7ff; DA_in = {32'b0,core_in[31:24],88'b0}; end
      else if ((core_addr[3:0]==4'b1000)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfcff; DA_in = {48'b0,core_in[15:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1010)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hf3ff; DA_in = {32'b0,core_in[31:16],80'b0}; end
      else if ((core_addr[3:2]==2'b10)&(core_type==`CACHE_WORD))                                     begin DA_write = 16'hf0ff; DA_in = {32'b0,core_in[31:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1100)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hefff; DA_in = {24'b0,core_in[7:0],96'b0}; end
      else if ((core_addr[3:0]==4'b1101)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hdfff; DA_in = {16'b0,core_in[15:8],104'b0}; end
      else if ((core_addr[3:0]==4'b1110)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hbfff; DA_in = {8'b0,core_in[23:16],112'b0}; end
      else if ((core_addr[3:0]==4'b1111)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'h7fff; DA_in = {core_in[31:24],120'b0}; end
      else if ((core_addr[3:0]==4'b1100)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hcfff; DA_in = {16'b0,core_in[15:0],96'b0}; end
      else if ((core_addr[3:0]==4'b1110)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'h3fff; DA_in = {core_in[31:16],112'b0}; end
      else if ((core_addr[3:2]==2'b11)&(core_type==`CACHE_WORD))                                     begin DA_write = 16'h0fff; DA_in = {core_in[31:0],96'b0}; end
      else begin DA_write = 16'hffff; DA_in = 128'b0; end
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = 1'b1;
      
    end
    `WRITEMISS:begin
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = 1'b1;
    end
    `WRITEDATA:begin
      core_wait = 1'b0;
    end
    `READ:begin
      TA_read = 1'b1;
      read_hit = ((TA_out==core_addr[31:10])&&(valid[index]==1))?1'b1:1'b0;
    end
    `READMISS:begin
      D_req = 1'b1;
      D_addr = {core_addr[31:4],count,core_addr[1:0]};
      count_wire = count + 2'b01;
    end
    `READDATA:begin
      D_req = 1'b1;
      TA_write = 1'b0;
      if(count==2'b01)begin
        DA_write = 16'hfff0;
        DA_in = {96'b0,D_out[31:0]};
      end
      else if (count==2'b10)begin
        DA_write = 16'hff0f;
        DA_in = {64'b0,D_out[31:0],32'b0};
      end
      else if (count==2'b11)begin
        DA_write = 16'hf0ff;
        DA_in = {32'b0,D_out[31:0],64'b0};
      end
      else begin
        DA_write = 16'h0fff;
        DA_in = {D_out[31:0],96'b0};
        valid_wire = 1'b1;
      end
    end
    `READOUT: begin
      core_wait = 1'b0;
      DA_read = 1'b1;
      case (core_addr[3:2])
        2'b00:  core_out = DA_out[31:0];
        2'b01:  core_out = DA_out[63:32];
        2'b10:  core_out = DA_out[95:64];
        2'b11:  core_out = DA_out[127:96];
      endcase
    end
  endcase
end
endmodule

