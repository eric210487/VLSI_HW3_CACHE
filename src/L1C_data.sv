//================================================
// Auther:      Chen Yun-Ru (May)
// Filename:    L1C_data.sv
// Description: L1 Cache for data
// Version:     0.1
//================================================
`include "def.svh"
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
  logic [`CACHE_LINES-1:0] valid; //register
  /*logic [`DATA_BITS-1:0] core_addr_latch;
  logic core_req_latch;
  logic core_write_latch;
  logic [`CACHE_TYPE_BITS-1:0] core_type_latch;
  logic [`DATA_BITS-1:0] core_in_latch;
  logic [`DATA_BITS-1:0] D_out_latch;
  logic D_wait_latch;*/
logic [1:0] count;
  logic write_hit;
  logic read_hit;
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

always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    curr_state <= `IDLE;
	valid <= 64'b0;
count <= 2'b00;
  end
  else begin
    curr_state <= next_state;
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
      next_state = `WRITEDATA;
    end
    `WRITEMISS:begin
      next_state = `WRITEDATA;
    end
    `WRITEDATA:begin
      if(~D_wait) next_state = `IDLE;
      else next_state = `WRITEDATA;
    end
    `READ:begin
      if(read_hit) next_state = `IDLE;
      else if (~read_hit)next_state = `READMISS;
    end
    `READMISS:begin
      next_state = `READDATA;
    end
    `READDATA:begin
      if(count==2'b00) next_state = `IDLE;
      else if(~D_wait)next_state = `READMISS;
      else next_state = `READDATA;
    end
	default:begin
	
end
endcase
end

always_comb begin
  case (curr_state)
    `IDLE:begin
	core_out = 32'b0;
        core_wait = 1'b0;
        D_req = 1'b0;
        D_addr = 32'b0;
        D_write = 1'b0;
        D_in = 32'b0;
        D_type = 3'b0;
    end
    `WRITE:begin
      TA_read = 1'b1;
      TA_write = 1'b1;
      TA_in = core_addr[31:10];
      index = core_addr[9:4];
      if((TA_out==core_addr[31:10])&&(valid[core_addr[9:4]]==1))write_hit=1'b1;
      else write_hit = 1'b0;
	core_wait = 1;
    end
    `WRITEHIT:begin
      //write data to data array
      DA_read = 1'b0;
      index = core_addr[9:4];
      if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          begin DA_write = 16'hfffe; DA_in = {120'b0,core_in[7:0]}; end
      else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    begin DA_write = 16'hfffc; DA_in = {112'b0,core_in[15:0]}; end
      else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     begin DA_write = 16'hfff0; DA_in = {96'b0,core_in[31:0]}; end
      else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'hfffe; DA_in = {120'b0,core_in[7:0]}; end
      else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'hfffc; DA_in = {112'b0,core_in[15:0]}; end
      else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     begin DA_write = 16'hffef; DA_in = {88'b0,core_in[7:0],32'b0}; end
      else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    begin DA_write = 16'hffcf; DA_in = {80'b0,core_in[15:0],32'b0}; end
      else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     begin DA_write = 16'hff0f; DA_in = {64'b0,core_in[31:0],32'b0}; end
      else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'hffef; DA_in = {88'b0,core_in[7:0],32'b0}; end
      else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'hffcf; DA_in = {80'b0,core_in[15:0],32'b0}; end
      else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     begin DA_write = 16'hfeff; DA_in = {56'b0,core_in[7:0],64'b0}; end
      else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    begin DA_write = 16'hfcff; DA_in = {48'b0,core_in[15:0],64'b0}; end
      else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     begin DA_write = 16'hf0ff; DA_in = {32'b0,core_in[31:0],64'b0}; end
      else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'hfeff; DA_in = {56'b0,core_in[7:0],64'b0}; end
      else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'hfcff; DA_in = {48'b0,core_in[15:0],64'b0}; end
      else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     begin DA_write = 16'hefff; DA_in = {24'b0,core_in[7:0],96'b0}; end
      else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    begin DA_write = 16'hefff; DA_in = {16'b0,core_in[15:0],96'b0}; end
      else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     begin DA_write = 16'h0fff; DA_in = {core_in[31:0],96'b0}; end
      else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'hefff; DA_in = {24'b0,core_in[7:0],96'b0}; end
      else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'hcfff; DA_in = {16'b0,core_in[15:0],96'b0}; end
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = core_write;
      D_in = core_in;
      D_type = core_type;
      core_out = 32'b0; //not sure
      core_wait = 1'b1; //not sure
    end
    `WRITEMISS:begin
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = core_write;
      D_in = core_in;
      D_type = core_type;
      core_out = 32'b0; //not sure
      core_wait = 1'b1; //not sure
    end
    `WRITEDATA:begin
	D_req = 1'b0;
	D_type = core_type;
	D_addr = core_addr;
	D_in = core_in;
	D_write = core_write;
	core_out = 32'b0;
	core_wait = 1'b1;
    end
    `READ:begin
core_wait = 1;
      TA_read = 1'b1;
      TA_write = 1'b1;
      TA_in = core_addr[31:10];
      index = core_addr[9:4];
      if((TA_out==core_addr[31:10])&&(valid[core_addr[9:4]]==1))begin 
        read_hit=1'b1;
        DA_write = 16'h1111;
        DA_in = 32'b0;
        DA_read = 1'b1;
        if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          core_out = {24'b0,DA_out[7:0]};
        else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[15:0]};
        else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     core_out = DA_out[31:0];
        else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[7:0]};
        else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[15:0]};
        else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[39:32]};
        else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[47:32]};
        else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     core_out = DA_out[63:32];
        else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[39:32]};
        else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[47:32]};
        else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[71:64]};
        else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[79:64]};
        else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     core_out = DA_out[95:64];
        else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[71:64]};
        else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[79:64]};
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[103:96]};
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[111:96]};
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     core_out = DA_out[127:96];
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[103:96]};
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[111:96]};
      end
      else read_hit = 1'b0;
    end
    `READMISS:begin
      if(count==2'b00)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b00,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = core_type;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count = 2'b01;
      end
      else if (count==2'b01)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b01,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = core_type;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count = 2'b10;
      end
      else if (count==2'b10)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b10,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = core_type;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count = 2'b11;
      end
      else begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b11,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = core_type;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count = 2'b00;
      end
    end
    `READDATA:begin
	core_wait = 1;
      if(count==2'b01)begin
        index = core_addr[9:4];
        TA_write = 1'b0;
        TA_read = 1'b0;
        TA_in = core_addr[31:10];
        DA_write = 16'hfff0;
        DA_read = 1'b0;
        DA_in = {96'b0,D_out[31:0]};
      end
      else if (count==2'b10)begin
        index = core_addr[9:4];
        TA_write = 1'b0;
        TA_read = 1'b0;
        TA_in = core_addr[31:10];
        DA_write = 16'hff0f;
        DA_read = 1'b0;
        DA_in = {64'b0,D_out[31:0],32'b0};
      end
      else if (count==2'b11)begin
        index = core_addr[9:4];
        TA_write = 1'b0;
        TA_read = 1'b0;
        TA_in = core_addr[31:10];
        DA_write = 16'hf0ff;
        DA_read = 1'b0;
        DA_in = {32'b0,D_out[31:0],64'b0};
      end
      else begin
        index = core_addr[9:4];
        TA_write = 1'b0;
        TA_read = 1'b0;
        TA_in = core_addr[31:10];
        DA_write = 16'h0fff;
        DA_read = 1'b0;
        DA_in = {D_out[31:0],96'b0};
        valid[core_addr[9:4]]=1'b1;
      end
    end
    default: begin
        core_out = 32'b0;
        core_wait = 1'b0;
        D_req = 1'b0;
        D_addr = 32'b0;
        D_write = 1'b0;
        D_in = 32'b0;
        D_type = 3'b0; 
    end
  endcase
end



/**always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    core_req_latch <= 1'b0;
    core_addr_latch <= 32'b0;
    core_write_latch <= 1'b0;
    core_type_latch <= 3'b0;
    core_in_latch <= 32'b0;
    D_out_latch <= 32'b0;
    D_wait_latch <= 1'b0;
    
  end
  else begin
    core_addr_latch <= core_addr;
    core_in_latch <= core_in;
    core_req_latch <= core_req;
    core_write_latch <= core_write;
    core_type_latch <= core_type;
    D_out_latch <= D_out;
    D_wait_latch <= D_wait;
  end
end

always_comb begin
  if(core_req&~read_miss)begin
    index = core_addr[9:4];
    TA_read = 1'b1;
    TA_write = 1'b0;
    TA_in = 32'b0; //不確定會不會拿到TA_out --> 假設會
    if((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==1) & (core_write==1))begin 
          //cache write hit
            //write data to data array
            DA_read = 1'b0;
            if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          begin DA_write = 16'h0001; DA_in = {120'b0,core_in[7:0]}; end
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    begin DA_write = 16'h0003; DA_in = {112'b0,core_in[15:0]}; end
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     begin DA_write = 16'h000f; DA_in = {96'b0,core_in[31:0]}; end
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'h0001; DA_in = {120'b0,core_in[7:0]}; end
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'h0003; DA_in = {112'b0,core_in[15:0]}; end
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     begin DA_write = 16'h0010; DA_in = {88'b0,core_in[7:0],32'b0}; end
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    begin DA_write = 16'h0030; DA_in = {80'b0,core_in[15:0],32'b0}; end
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     begin DA_write = 16'h00f0; DA_in = {64'b0,core_in[31:0],32'b0}; end
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'h0010; DA_in = {88'b0,core_in[7:0],32'b0}; end
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'h0030; DA_in = {80'b0,core_in[15:0],32'b0}; end
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     begin DA_write = 16'h0100; DA_in = {56'b0,core_in[7:0],64'b0}; end
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    begin DA_write = 16'h0300; DA_in = {48'b0,core_in[15:0],64'b0}; end
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     begin DA_write = 16'h0f00; DA_in = {32'b0,core_in[31:0],64'b0}; end
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'h0100; DA_in = {56'b0,core_in[7:0],64'b0}; end
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'h0300; DA_in = {48'b0,core_in[15:0],64'b0}; end
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     begin DA_write = 16'h1000; DA_in = {24'b0,core_in[7:0],96'b0}; end
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    begin DA_write = 16'h3000; DA_in = {16'b0,core_in[15:0],96'b0}; end
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     begin DA_write = 16'hf000; DA_in = {core_in[31:0],96'b0}; end
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   begin DA_write = 16'h1000; DA_in = {24'b0,core_in[7:0],96'b0}; end
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  begin DA_write = 16'h3000; DA_in = {16'b0,core_in[15:0],96'b0}; end
            //write data to memory
            D_req = 1'b1;
            D_addr = core_addr;
            D_write = core_write;
            D_in = core_in;
            D_type = core_type;
            core_out = 32'b0; //not sure
            core_wait = 1'b0; //not sure
    end
    else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==1) & (core_write==0))begin
          //cache read hit
            //read data from data array to core
            DA_write = 16'b0;
            DA_in = 32'b0;
            DA_read = 1'b1; //不確定會不會拿到DA_out --> 假設會
            if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          core_out = {24'b0,DA_out[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[16:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     core_out = DA_out[31:0];
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[16:0]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[39:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[47:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     core_out = DA_out[63:32];
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[39:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[47:32]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[71:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[79:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     core_out = DA_out[95:64];
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[71:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[79:64]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     core_out = {24'b0,DA_out[103:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    core_out = {16'b0,DA_out[111:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     core_out = DA_out[127:96];
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   core_out = {24'b0,DA_out[103:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[111:96]};
            D_req = 1'b0;
            D_addr = 32'b0;
            D_write = 1'b0;
            D_in = 32'b0;
            D_type = 3'b0;
            core_wait = 1'b0; //not sure
    end
    else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==0) & (core_write==1))begin
          //cache address hit but value not valid (cache write miss)
            //only write data to memory (valid)
            D_req = 1'b1;
            D_addr = core_addr;
            D_write = core_write;
            D_in = core_in;
            D_type = core_type;
            core_out = 32'b0; //not sure
            core_wait = 1'b0; //not sure
    end
    else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==0) & (core_write==0))begin
          //cache address hit but value not valid (cache read miss)
            //read a line from memory
            D_req = 1'b1;
            D_addr = {core_addr[31:4],2'b00,core_addr[1:0]};
            D_write = core_write;
            D_in = core_in;
            D_type = core_type;
            core_out = 32'b0; //not sure
            core_wait = 1'b1; //not sure
            read_miss = 1'b1;
    end
    else if ((core_addr[31:10]!=TA_out) & (core_write==1))begin
          //cache write miss
          D_req = 1'b1;
          D_addr = core_addr;
          D_write = core_write;
          D_in = core_in;
          D_type = core_type;
          core_out = 32'b0; //not sure
          core_wait = 1'b0; //not sure
    end
    else if ((core_addr[31:10]!=TA_out) & (core_write==0))begin
          //cache read miss
          D_req = 1'b1;
          D_addr = {core_addr[31:4],2'b00,core_addr[1:0]};
          D_write = core_write;
          D_in = core_in;
          D_type = core_type;
          core_out = 32'b0; //not sure
          core_wait = 1'b1; //not sure
          read_miss = 1'b1;
    end
  end
  else if (core_req&read_miss)begin
        //accept write data to tag array and data array
        if(core_write)begin
        index = core_addr[9:4];
        TA_write = 1'b1;
        TA_read = 1'b0;
        TA_in = core_addr[31:10];
        if(core_addr[3:2]==2'b00)       begin DA_write = 16'h000f; DA_in = {96'b0,core_in[31:0]}; end
        else if (core_addr[3:2]==2'b01) begin DA_write = 16'h00f0; DA_in = {64'b0,core_in[31:0],32'b0}; end
        else if (core_addr[3:2]==2'b10) begin DA_write = 16'h0f00; DA_in = {32'b0,core_in[31:0],64'b0}; end
        else if (core_addr[3:2]==2'b11) begin DA_write = 16'hf000; DA_in = {core_in[31:0],96'b0}; end
        DA_read = 1'b0;
        count++;
          if(count==4)begin
            count = 0;
            read_miss = 1'b0;
          end
        end
        else begin //core_write == 1'b0 (tell core read data)
          D_req = 1'b1;
          if(count==1)      D_addr = {core_addr[31:4],2'b01,core_addr[1:0]};
          else if (count==2)D_addr = {core_addr[31:4],2'b10,core_addr[1:0]};
          else if (count==3)D_addr = {core_addr[31:4],2'b11,core_addr[1:0]};
          D_write = core_write;
          D_in = core_in;
          D_type = core_type;
          core_out = 32'b0; //not sure
          core_wait = 1'b1; //not sure
        end
  end
  else begin
        core_out = 32'b0;
        core_wait = 1'b0;
        D_req = 1'b0;
        D_addr = 32'b0;
        D_write = 1'b0;
        D_in = 32'b0;
        D_type = 3'b0; 
  end
end






always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
  core_out <= 32'b0;
  core_wait <= 1'b0;
  D_req <= 1'b0;
  D_addr <= 32'b0;
  D_write <= 1'b0;
  D_in <= 32'b0;
  D_type <= 3'b0;  
  end
  else begin
      if(core_req&~read_miss)begin //to get tag array data
        index <= core_addr[9:4];
        TA_read <= 1'b1;
        TA_write <= 1'b0;
        TA_in <= 22'b0; //不確定會不會拿到TA_out --> 不會
        //finish getting tag array data
      else if (core_req_latch&~read_miss)begin //take correct tag array data
        if((core_addr_latch[31:10]==TA_out) & (valid[core_addr_latch[9:4]]==1) & (core_write_latch==1))begin
          //cache write hit
            //wirte data to data array
            DA_read <= 1'b0;
            if ((core_addr_latch[3:2]==00)&(core_type_latch==`CACHE_BYTE))          begin DA_write <= 16'h0001; DA_in <= {120'b0,core_in_latch[7:0]}; end
            else if ((core_addr_latch[3:2]==00)&(core_type_latch==`CACHE_HWORD))    begin DA_write <= 16'h0003; DA_in <= {112'b0,core_in_latch[15:0]}; end
            else if ((core_addr_latch[3:2]==00)&(core_type_latch==`CACHE_WORD))     begin DA_write <= 16'h000f; DA_in <= {96'b0,core_in_latch[31:0]}; end
            else if ((core_addr_latch[3:2]==00)&(core_type_latch==`CACHE_BYTE_U))   begin DA_write <= 16'h0001; DA_in <= {120'b0,core_in_latch[7:0]}; end
            else if ((core_addr_latch[3:2]==00)&(core_type_latch==`CACHE_HWORD_U))  begin DA_write <= 16'h0003; DA_in <= {112'b0,core_in_latch[15:0]}; end
            else if ((core_addr_latch[3:2]==01)&(core_type_latch==`CACHE_BYTE))     begin DA_write <= 16'h0010; DA_in <= {88'b0,core_in_latch[7:0],32'b0}; end
            else if ((core_addr_latch[3:2]==01)&(core_type_latch==`CACHE_HWORD))    begin DA_write <= 16'h0030; DA_in <= {80'b0,core_in_latch[15:0],32'b0}; end
            else if ((core_addr_latch[3:2]==01)&(core_type_latch==`CACHE_WORD))     begin DA_write <= 16'h00f0; DA_in <= {64'b0,core_in_latch[31:0],32'b0}; end
            else if ((core_addr_latch[3:2]==01)&(core_type_latch==`CACHE_BYTE_U))   begin DA_write <= 16'h0010; DA_in <= {88'b0,core_in_latch[7:0],32'b0}; end
            else if ((core_addr_latch[3:2]==01)&(core_type_latch==`CACHE_HWORD_U))  begin DA_write <= 16'h0030; DA_in <= {80'b0,core_in_latch[15:0],32'b0}; end
            else if ((core_addr_latch[3:2]==10)&(core_type_latch==`CACHE_BYTE))     begin DA_write <= 16'h0100; DA_in <= {56'b0,core_in_latch[7:0],64'b0}; end
            else if ((core_addr_latch[3:2]==10)&(core_type_latch==`CACHE_HWORD))    begin DA_write <= 16'h0300; DA_in <= {48'b0,core_in_latch[15:0],64'b0}; end
            else if ((core_addr_latch[3:2]==10)&(core_type_latch==`CACHE_WORD))     begin DA_write <= 16'h0f00; DA_in <= {32'b0,core_in_latch[31:0],64'b0}; end
            else if ((core_addr_latch[3:2]==10)&(core_type_latch==`CACHE_BYTE_U))   begin DA_write <= 16'h0100; DA_in <= {56'b0,core_in_latch[7:0],64'b0}; end
            else if ((core_addr_latch[3:2]==10)&(core_type_latch==`CACHE_HWORD_U))  begin DA_write <= 16'h0300; DA_in <= {48'b0,core_in_latch[15:0],64'b0}; end
            else if ((core_addr_latch[3:2]==11)&(core_type_latch==`CACHE_BYTE))     begin DA_write <= 16'h1000; DA_in <= {24'b0,core_in_latch[7:0],96'b0}; end
            else if ((core_addr_latch[3:2]==11)&(core_type_latch==`CACHE_HWORD))    begin DA_write <= 16'h3000; DA_in <= {16'b0,core_in_latch[15:0],96'b0}; end
            else if ((core_addr_latch[3:2]==11)&(core_type_latch==`CACHE_WORD))     begin DA_write <= 16'hf000; DA_in <= {core_in_latch[31:0],96'b0}; end
            else if ((core_addr_latch[3:2]==11)&(core_type_latch==`CACHE_BYTE_U))   begin DA_write <= 16'h1000; DA_in <= {24'b0,core_in_latch[7:0],96'b0}; end
            else if ((core_addr_latch[3:2]==11)&(core_type_latch==`CACHE_HWORD_U))  begin DA_write <= 16'h3000; DA_in <= {16'b0,core_in_latch[15:0],96'b0}; end
            //write data to memory
            D_req <= 1'b1;
            D_addr <= core_addr_latch;
            D_write <= core_write_latch;
            D_in <= core_in_latch;
            D_type <= core_type_latch;
            core_out <= 32'b0; //not sure
            core_wait <= 1'b0; //not sure
            //finish write hit
        end
        else if ((core_addr_latch[31:10]==TA_out) & (valid[core_addr_latch[9:4]]==1) & (core_write_latch==0))begin
          //cache read hit
            //read data from data array to core
            DA_write <= 16'b0;
            DA_in <= 32'b0;
            DA_read <= 1'b1; //不確定會不會拿到DA_out --> 不會
        if((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==1) & (core_write==1))begin 
          //cache write hit
            //write data to data array
            DA_read <= 1'b0;
            if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          DA_write <= 16'h0001; DA_in <= {120'b0,core_in[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    DA_write <= 16'h0003; DA_in <= {112'b0,core_in[15:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     DA_write <= 16'h000f; DA_in <= {96'b0,core_in[31:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   DA_write <= 16'h0001; DA_in <= {120'b0,core_in[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  DA_write <= 16'h0003; DA_in <= {112'b0,core_in[15:0]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     DA_write <= 16'h0010; DA_in <= {88'b0,core_in[7:0],32'b0};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    DA_write <= 16'h0030; DA_in <= {80'b0,core_in[15:0],32'b0};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     DA_write <= 16'h00f0; DA_in <= {64'b0,core_in[31:0],32'b0};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   DA_write <= 16'h0010; DA_in <= {88'b0,core_in[7:0],32'b0};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  DA_write <= 16'h0030; DA_in <= {80'b0,core_in[15:0],32'b0};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     DA_write <= 16'h0100; DA_in <= {56'b0,core_in[7:0],64'b0};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    DA_write <= 16'h0300; DA_in <= {48'b0,core_in[15:0],64'b0};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     DA_write <= 16'h0f00; DA_in <= {32'b0,core_in[31:0],64'b0};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   DA_write <= 16'h0100; DA_in <= {56'b0,core_in[7:0],64'b0};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  DA_write <= 16'h0300; DA_in <= {48'b0,core_in[15:0],64'b0};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     DA_write <= 16'h1000; DA_in <= {24'b0,core_in[7:0],96'b0};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    DA_write <= 16'h3000; DA_in <= {16'b0,core_in[15:0],96'b0};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     DA_write <= 16'hf000; DA_in <= {core_in[31:0],96'b0};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   DA_write <= 16'h1000; DA_in <= {24'b0,core_in[7:0],96'b0};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  DA_write <= 16'h3000; DA_in <= {16'b0,core_in[15:0],96'b0};
            //write data to memory
            D_req <= 1'b1;
            D_addr <= core_addr;
            D_write <= core_write;
            D_in <= core_in;
            D_type <= core_type;
            core_out <= 32'b0; //not sure
            core_wait <= 1'b0; //not sure
        end
        else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==1) & (core_write==0))begin
          //cache read hit
            //read data from data array to core
            DA_write <= 16'b0;
            DA_in <= 32'b0;
            DA_read <= 1'b1; //不確定會不會拿到DA_out --> 不會
            if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          core_out <= {24'b0,DA_out[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD))    core_out <= {16'b0,DA_out[16:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_WORD))     core_out <= DA_out[31:0];
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE_U))   core_out <= {24'b0,DA_out[7:0]};
            else if ((core_addr[3:2]==00)&(core_type==`CACHE_HWORD_U))  core_out <= {16'b0,DA_out[16:0]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE))     core_out <= {24'b0,DA_out[39:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD))    core_out <= {16'b0,DA_out[47:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_WORD))     core_out <= DA_out[63:32];
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_BYTE_U))   core_out <= {24'b0,DA_out[39:32]};
            else if ((core_addr[3:2]==01)&(core_type==`CACHE_HWORD_U))  core_out <= {16'b0,DA_out[47:32]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE))     core_out <= {24'b0,DA_out[71:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD))    core_out <= {16'b0,DA_out[79:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_WORD))     core_out <= DA_out[95:64];
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_BYTE_U))   core_out <= {24'b0,DA_out[71:64]};
            else if ((core_addr[3:2]==10)&(core_type==`CACHE_HWORD_U))  core_out <= {16'b0,DA_out[79:64]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE))     core_out <= {24'b0,DA_out[103:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD))    core_out <= {16'b0,DA_out[111:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_WORD))     core_out <= DA_out[127:96];
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_BYTE_U))   core_out <= {24'b0,DA_out[103:96]};
            else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  core_out <= {16'b0,DA_out[111:96]};
            D_req <= 1'b0;
            D_addr <= 32'b0;
            D_write <= 1'b0;
            D_in <= 32'b0;
            D_type <= 3'b0;
            core_wait <= 1'b0; //not sure
        end
        else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==0) & (core_write==1))begin
          //cache address hit but value not valid (cache write miss)
            //only write data to memory (valid)
            D_req <= 1'b1;
            D_addr <= core_addr;
            D_write <= core_write;
            D_in <= core_in;
            D_type <= core_type;
            core_out <= 32'b0; //not sure
            core_wait <= 1'b0; //not sure
        end
        else if ((core_addr[31:10]==TA_out) & (valid[core_addr[9:4]]==0) & (core_write==0))begin
          //cache address hit but value not valid (cache read miss)
            //read a line from memory
            D_req <= 1'b1;
            D_addr <= {core_addr[31:4],2'b00,core_addr[1:0]};
            D_write <= core_write;
            D_in <= core_in;
            D_type <= core_type;
            core_out <= 32'b0; //not sure
            core_wait <= 1'b1; //not sure
            read_miss = 1'b1;
        end
        else if ((core_addr[31:10]!=TA_out) & (core_write==1))begin
          //cache write miss
          D_req <= 1'b1;
          D_addr <= core_addr;
          D_write <= core_write;
          D_in <= core_in;
          D_type <= core_type;
          core_out <= 32'b0; //not sure
          core_wait <= 1'b0; //not sure
        end
        else if ((core_addr[31:10]!=TA_out) & (core_write==0))begin
          //cache read miss
          D_req <= 1'b1;
          D_addr <= {core_addr[31:4],2'b00,core_addr[1:0]};
          D_write <= core_write;
          D_in <= core_in;
          D_type <= core_type;
          core_out <= 32'b0; //not sure
          core_wait <= 1'b1; //not sure
          read_miss = 1'b1;
        end
        else begin
          core_out <= 32'b0;
          core_wait <= 1'b0;
          D_req <= 1'b0;
          D_addr <= 32'b0;
          D_write <= 1'b0;
          D_in <= 32'b0;
          D_type <= 3'b0;
        end
      end
      else if (core_req&read_miss)begin
        //accept write data to tag array and data array
        if(core_write)begin
        index <= core_addr[9:4];
        TA_write <= 1'b1;
        TA_read <= 1'b0;
        TA_in <= core_addr[31:10];
        if(core_addr[3:2]==2'b00)       DA_write <= 16'h000f; DA_in <= {96'b0,core_in[31:0]};
        else if (core_addr[3:2]==2'b01) DA_write <= 16'h00f0; DA_in <= {64'b0,core_in[31:0],32'b0};
        else if (core_addr[3:2]==2'b10) DA_write <= 16'h0f00; DA_in <= {32'b0,core_in[31:0],64'b0};
        else if (core_addr[3:2]==2'b11) DA_write <= 16'hf000; DA_in <= {core_in[31:0],96'b0};
        DA_read <= 1'b0;
        count++;
          if(count==4)begin
            count = 0;
            read_miss <= 1'b0;
          end
        end
        else begin //core_write == 1'b0 (tell core read data)
          D_req <= 1'b1;
          if(count==1)      D_addr <= {core_addr[31:4],2'b01,core_addr[1:0]};
          else if (count==2)D_addr <= {core_addr[31:4],2'b10,core_addr[1:0]};
          else if (count==3)D_addr <= {core_addr[31:4],2'b11,core_addr[1:0]};
          D_write <= core_write;
          D_in <= core_in;
          D_type <= core_type;
          core_out <= 32'b0; //not sure
          core_wait <= 1'b1; //not sure
        end
      end
      else begin
        core_out <= 32'b0;
        core_wait <= 1'b0;
        D_req <= 1'b0;
        D_addr <= 32'b0;
        D_write <= 1'b0;
        D_in <= 32'b0;
        D_type <= 3'b0; 
      end
  end
end*/


endmodule

