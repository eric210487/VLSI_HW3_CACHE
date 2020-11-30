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
  input [`DATA_BITS-1:0] core_addr, //cpu give address to cache
  input core_req, //cpu give tell cache to start
  input core_write, // 0 = write ; 1 = read
  input [`DATA_BITS-1:0] core_in, //cpu give datas to cache
  input [`CACHE_TYPE_BITS-1:0] core_type, //type of data
  // Mem to CPU wrapper
  input [`DATA_BITS-1:0] D_out, //mem give read data to cache
  input D_wait, //mem tell cache to wait
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
  logic [`CACHE_LINES-1:0] valid_wire;
  logic [1:0]count_wire;

  //--------------- complete this part by yourself -----------------//

  //wire
  logic [2:0] state, nstate;
  logic hit;
  logic nvalid; //new valid

  //--------------- assigned --------------//
  //assign index = core_addr[9:4];
  //assign D_addr = {core_addr[31:10],index,counter,core_addr[1:0]};
  //assign hit = valid[index] && (TA_out== core_addr[31:10]);


  //---------------------------------------//

  //the data inside data array is : 32bits data
  data_array_wrapper DA(
    .A(index), //input
    .DO(DA_out), //output
    .DI(DA_in), //input
    .CK(clk),
    .WEB(DA_write), //input 
    .OE(DA_read), //input
    .CS(1'b1)
  );
  
  //the data inside tag array is : (31:10) bits of address
  tag_array_wrapper  TA(
    .A(index), //input
    .DO(TA_out), //output
    .DI(TA_in), //input
    .CK(clk),
    .WEB(TA_write), //input 16bits;
    .OE(TA_read), //input
    .CS(1'b1)
  );

always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    curr_state <= `IDLE;
  end
  else begin
    curr_state <= next_state;
  end
end
/*
always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
      //core_addr_reg <= 32'b0;
      core_in_reg <= 32'b0;
      core_type <= 3'b0;
  end
  else begin
    if(curr_state==`IDLE)begin
      //core_addr_reg <= core_addr;
      core_in <= core_in;
      core_type <= core_type;
    end
    else begin
      //core_addr_reg <= core_addr_reg;
      core_in <= core_in;
      core_type <= core_type;
    end
      
  end
end*/
always_ff @(posedge clk, posedge rst) begin
  if(rst)begin
    valid <= 64'b0;
    count <= 2'b00;
  end
  else begin
    case (curr_state)
      `IDLE: begin
        count <= count;
        valid <= valid;
      end
      `READMISS: begin
        count <= count_wire;
        valid <= valid;
      end
      `READDATA: begin
        count <= count;
        valid <= valid_wire;
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
      if(read_hit) next_state = `WRITEDATA;
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
	default:begin
	
end
endcase
end

always_comb begin
  case (curr_state)
    `IDLE:begin
        core_wait = 1'b0;
        D_req = 1'b0;
        D_addr = 32'b0;
        D_write = 1'b0;
        D_in = 32'b0;
        D_type = 3'b0;
        index = core_addr[9:4];
    end
    `WRITE:begin
      TA_read = 1'b1;
      TA_write = 1'b1;
      TA_in = core_addr[31:10];
      if((TA_out==core_addr[31:10])&&(valid[core_addr[9:4]]==1))write_hit=1'b1;
      else write_hit = 1'b0;
	    core_wait = 1;
    end
    `WRITEHIT:begin
      //write data to data array
      DA_read = 1'b0;
      index = core_addr[9:4];
      if ((core_addr[3:0]==4'b0000)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))          begin DA_write = 16'hfffe; DA_in = {120'b0,core_in[7:0]}; end
      else if ((core_addr[3:0]==4'b0001)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfffd; DA_in = {112'b0,core_in[15:8],8'b0}; end
      else if ((core_addr[3:0]==4'b0010)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfffb; DA_in = {104'b0,core_in[23:16],16'b0}; end
      else if ((core_addr[3:0]==4'b0011)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfff7; DA_in = {96'b0,core_in[31:24],24'b0}; end
      else if ((core_addr[3:0]==4'b0000)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfffc; DA_in = {112'b0,core_in[15:0]}; end
      else if ((core_addr[3:0]==4'b0010)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfff3; DA_in = {96'b0,core_in[31:16],16'b0}; end
      else if ((core_addr[3:2]==2'b00)&(core_type==`CACHE_WORD))                                         begin DA_write = 16'hfff0; DA_in = {96'b0,core_in[31:0]}; end
      else if ((core_addr[3:0]==4'b0100)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffef; DA_in = {88'b0,core_in[7:0],32'b0}; end
      else if ((core_addr[3:0]==4'b0101)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffdf; DA_in = {80'b0,core_in[15:8],40'b0}; end
      else if ((core_addr[3:0]==4'b0110)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hffbf; DA_in = {72'b0,core_in[23:16],48'b0}; end
      else if ((core_addr[3:0]==4'b0111)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hff7f; DA_in = {64'b0,core_in[31:24],56'b0}; end
      else if ((core_addr[3:0]==4'b0100)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hffcf; DA_in = {80'b0,core_in[15:0],32'b0}; end
      else if ((core_addr[3:0]==4'b0110)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hff3f; DA_in = {64'b0,core_in[31:16],48'b0}; end
      else if ((core_addr[3:2]==2'b01)&(core_type==`CACHE_WORD))                                         begin DA_write = 16'hff0f; DA_in = {64'b0,core_in[31:0],32'b0}; end
      else if ((core_addr[3:0]==4'b1000)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfeff; DA_in = {56'b0,core_in[7:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1001)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfdff; DA_in = {48'b0,core_in[15:8],72'b0}; end
      else if ((core_addr[3:0]==4'b1010)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hfbff; DA_in = {40'b0,core_in[23:16],80'b0}; end
      else if ((core_addr[3:0]==4'b1011)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hf7ff; DA_in = {32'b0,core_in[31:24],88'b0}; end
      else if ((core_addr[3:0]==4'b1000)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hfcff; DA_in = {48'b0,core_in[15:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1010)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hf3ff; DA_in = {32'b0,core_in[31:16],80'b0}; end
      else if ((core_addr[3:2]==2'b10)&(core_type==`CACHE_WORD))                                         begin DA_write = 16'hf0ff; DA_in = {32'b0,core_in[31:0],64'b0}; end
      else if ((core_addr[3:0]==4'b1100)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hefff; DA_in = {24'b0,core_in[7:0],96'b0}; end
      else if ((core_addr[3:0]==4'b1101)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hdfff; DA_in = {16'b0,core_in[15:8],104'b0}; end
      else if ((core_addr[3:0]==4'b1110)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'hbfff; DA_in = {8'b0,core_in[23:16],112'b0}; end
      else if ((core_addr[3:0]==4'b1111)&((core_type==`CACHE_BYTE)||(core_type==`CACHE_BYTE_U)))     begin DA_write = 16'h7fff; DA_in = {core_in[31:24],120'b0}; end
      else if ((core_addr[3:0]==4'b1100)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'hcfff; DA_in = {16'b0,core_in[15:0],96'b0}; end
      else if ((core_addr[3:0]==4'b1110)&((core_type==`CACHE_HWORD)||(core_type==`CACHE_HWORD_U)))   begin DA_write = 16'h3fff; DA_in = {core_in[31:16],112'b0}; end
      else if ((core_addr[3:2]==2'b11)&(core_type==`CACHE_WORD))                                         begin DA_write = 16'h0fff; DA_in = {core_in[31:0],96'b0}; end
      else begin DA_write = 16'hffff; DA_in = 128'b0; end
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = 1'b1;
      D_in = core_in;
      D_type = core_type;
      core_out = 32'b0; //not sure
      core_wait = 1'b1; //not sure
    end
    `WRITEMISS:begin
      //write data to memory
      D_req = 1'b1;
      D_addr = core_addr;
      D_write = 1'b1;
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
	    D_write = 1'b1;
	    core_out = 32'b0;
	    core_wait = 1'b0;
      if(core_addr[3:2]==2'b00)         core_out = DA_out[31:0];
        else if(core_addr[3:2]==2'b01)  core_out = DA_out[63:32];
        else if(core_addr[3:2]==2'b10)  core_out = DA_out[95:64];
        else if(core_addr[3:2]==2'b11)  core_out = DA_out[127:96];
        else                            core_out = 32'b0;
    end
    `READ:begin
      core_wait = 1'b1;
      TA_read = 1'b1;
      TA_write = 1'b1;
      TA_in = core_addr[31:10];
      index = core_addr[9:4];
      if((TA_out==core_addr[31:10])&&(valid[core_addr[9:4]]==1))begin 
        read_hit=1'b1;
        DA_write = 16'hffff;
        DA_in = 32'b0;
        DA_read = 1'b1;
        /*if(core_addr[3:2]==2'b00)       core_out = DA_out[31:0];
        else if(core_addr[3:2]==2'b01)  core_out = DA_out[63:32];
        else if(core_addr[3:2]==2'b10)  core_out = DA_out[95:64];
        else if(core_addr[3:2]==2'b11)  core_out = DA_out[127:96];
        else                            core_out = 32'b0;*/
        /*if ((core_addr[3:2]==00)&(core_type==`CACHE_BYTE))          core_out = {24'b0,DA_out[7:0]};
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
        else if ((core_addr[3:2]==11)&(core_type==`CACHE_HWORD_U))  core_out = {16'b0,DA_out[111:96]};*/
      end
      else read_hit = 1'b0;
    end
    `READMISS:begin
      if(count==2'b00)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b00,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = `CACHE_WORD;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count_wire = 2'b01;
      end
      else if (count==2'b01)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b01,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = `CACHE_WORD;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count_wire = 2'b10;
      end
      else if (count==2'b10)begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b10,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = `CACHE_WORD;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count_wire = 2'b11;
      end
      else begin
        D_req = 1'b1;
        D_addr = {core_addr[31:4],2'b11,core_addr[1:0]};
        D_write = 1'b0;
        D_in = core_in;
        D_type = `CACHE_WORD;
        core_out = 32'b0; //not sure
        core_wait = 1'b1; //not sure
        count_wire = 2'b00;
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
        valid_wire[core_addr[9:4]]=1'b1;
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





endmodule

