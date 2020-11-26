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
  output logic [`DATA_BITS-1:0] core_out, //data to cpu
  output core_wait, //tell the cpu to wait
  // CPU wrapper to Mem
  output logic D_req, //tell wrapper to start
  output logic [`DATA_BITS-1:0] D_addr, //address to wrapper
  output D_write, // 0 = write ; 1 = read 
  output [`DATA_BITS-1:0] D_in, // data to wrapper
  output [`CACHE_TYPE_BITS-1:0] D_type //type of data
);

  logic [`CACHE_INDEX_BITS-1:0] index; //address to tag/data array
  logic [`CACHE_DATA_BITS-1:0] DA_out; //read data from data array
  logic [`CACHE_DATA_BITS-1:0] DA_in;  //wrtie data to data array
  logic [`CACHE_WRITE_BITS-1:0] DA_write; // 16bits write signal to data array
  logic DA_read; //read signal to data array
  logic [`CACHE_TAG_BITS-1:0] TA_out; //data from tage_array
  logic [`CACHE_TAG_BITS-1:0] TA_in; //data to tage_array
  logic TA_write; //write signal to tag_array
  logic TA_read; //read signal to tag_array
  logic [`CACHE_LINES-1:0] valid; // 64 bits -> 64 index

  //--------------- complete this part by yourself -----------------//

  //wire
  logic [2:0] state, nstate;
  logic hit;
  logic nvalid; //new valid

  //reg
  logic [1:0]counter;
  



  //--------------- assigned --------------//
  assign index = core_addr[9:4];
  assign D_addr = {core_addr[31:10],index,counter,core_addr[1:0]};
  assign hit = valid[index] && (TA_out== core_addr[31:10]);


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
    if(rst) begin
      state <= `IDLE;
      valid <= 64'd0;
      counter <= 2'd0;
    end
    else begin
      state <= nstate;
      valid[index] <= nvalid;
    end
end

always_comb begin
  case (state)
    `IDLE: begin
      if(core_req & ~core_write) nstate = `READ;
      else if (core_req & core_write) nstate = `WRITE;
      else nstate = `IDLE;
    end
    `READ: begin
      if(hit) nstate =`IDLE; //Match && Valid
      else nstate = `READMISS;
    end
    `READMISS: begin
      nstate = `READDATA;
    end
    `READDATA: begin
      if(D_wait) nstate = `READDATA;
      else nstate = `IDLE;
    end
    `WRITE: begin
      if(hit) nstate = `WRITEHIT; //Match && Valid
      else nstate = `WRITEMISS;
    end
    `WRITEHIT: begin
      mstate = `WRITEDATA;
    end
    `WRITEMISS: begin
      nstate = `WRITEDATA;
    end
    `WRITEDATA: begin
      if(D_wait) nstate = `WRITEDATA;
      else nstate = `IDLE;
    end
  endcase
end

always_comb begin
  //output to cpu
  core_out = `DATA_BITS'd0;
  core_wait = 1'b1; //cpu stall in every state, except `IDLE;
  //output to wrapper
  D_req = 1'b0;
  D_write = 1'b0;
  D_in = `DATA_BITS'd0;
  D_type = `CACHE_WORD;
  //output to data array
  DA_in = `CACHE_DATA_BITS'd0;
  DA_write = `CACHE_WRITE_BITS'd0;
  DA_read = 1'b0;
  //output to tag array
  nvalid = 1'b0;
  case (state)
    `IDLE: begin
      //do nothing?
      core_wait = 1'b0; //cache IDLE-> cpu don't stall
    end
    //the state will decide is hit or miss
    `READ: begin
      if(hit) begin
        DA_read = 1'b1;
        core_out = DA_out;
      end
      else begin
        //do nothing jump to readmiss state
      end
    end
    //read a line from memory -> communicate with memory 
    `READMISS: begin
      D_req = 1'b1;
    end
    `READDATA: begin
      D_req = 1'b1;
      if(~D_wait) begin //wrapper said don't wait
        //write the data to three ram
        DA_in = D_out;
        DA_write = //using (counter) to decide
        TA_in = D_addr[31:10];
        TA_write = 1'b1;
        nvalid = 1'b1;
      end
    end
    `WRITE: begin
      
    end
    `WRITEHIT: begin
      
    end
    `WRITEMISS: begin
      
    end
    `WRITEDATA: begin
      
    end
end

//counter
always_ff @(posedge clk, posedge rst) begin
  if(rst) begin
    counter = 2'b0;
  end
  else begin
    case (state)
      `READDATA: begin
        
      end
      default: begin
        counter = counter;
      end
    endcase
  end
end


endmodule

