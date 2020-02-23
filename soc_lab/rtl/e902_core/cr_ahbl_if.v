/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ahbl_if(
  ahbLif_ahbl_haddr,
  ahbLif_ahbl_hburst,
  ahbLif_ahbl_hprot,
  ahbLif_ahbl_hsize,
  ahbLif_ahbl_htrans,
  ahbLif_ahbl_hwdata,
  ahbLif_ahbl_hwrite,
  ahbLif_ahbl_vec_redrct,
  ahbl_ahbLif_hrdata,
  ahbl_ahbLif_hready,
  ahbl_ahbLif_hresp,
  ahbl_clk_en,
  ahbl_gated_clk,
  ahblif_busy,
  ahblif_idle,
  ahblif_power_mask,
  cpu_acc_err,
  cpu_addr,
  cpu_data_vld,
  cpu_prot,
  cpu_rdata,
  cpu_req,
  cpu_req_grnt,
  cpu_req_power_masked,
  cpu_sec,
  cpu_size,
  cpu_trans_cmplt,
  cpu_vec_redirect,
  cpu_wdata_sel,
  cpu_wr_data,
  cpu_write,
  cpurst_b,
  pad_cpu_halt_ff2
);
input   [31:0]  ahbl_ahbLif_hrdata;    
input           ahbl_ahbLif_hready;    
input           ahbl_ahbLif_hresp;     
input           ahbl_gated_clk;        
input           ahblif_power_mask;     
input   [31:0]  cpu_addr;              
input   [3 :0]  cpu_prot;              
input           cpu_req;               
input           cpu_req_power_masked;  
input   [1 :0]  cpu_size;              
input           cpu_vec_redirect;      
input   [31:0]  cpu_wr_data;           
input           cpu_write;             
input           cpurst_b;              
input           pad_cpu_halt_ff2;      
output  [31:0]  ahbLif_ahbl_haddr;     
output  [2 :0]  ahbLif_ahbl_hburst;    
output  [3 :0]  ahbLif_ahbl_hprot;     
output  [2 :0]  ahbLif_ahbl_hsize;     
output  [1 :0]  ahbLif_ahbl_htrans;    
output  [31:0]  ahbLif_ahbl_hwdata;    
output          ahbLif_ahbl_hwrite;    
output          ahbLif_ahbl_vec_redrct; 
output          ahbl_clk_en;           
output          ahblif_busy;           
output          ahblif_idle;           
output          cpu_acc_err;           
output          cpu_data_vld;          
output  [31:0]  cpu_rdata;             
output          cpu_req_grnt;          
output          cpu_sec;               
output          cpu_trans_cmplt;       
output          cpu_wdata_sel;         
reg     [2 :0]  ahbLif_cur_state;      
reg     [2 :0]  ahbLif_nxt_state;      
reg             buf_write;             
wire            acc_err;               
wire    [31:0]  ahbLif_ahbl_haddr;     
wire    [2 :0]  ahbLif_ahbl_hburst;    
wire    [3 :0]  ahbLif_ahbl_hprot;     
wire    [2 :0]  ahbLif_ahbl_hsize;     
wire    [1 :0]  ahbLif_ahbl_htrans;    
wire    [31:0]  ahbLif_ahbl_hwdata;    
wire            ahbLif_ahbl_hwrite;    
wire            ahbLif_ahbl_vec_redrct; 
wire    [31:0]  ahbl_ahbLif_hrdata;    
wire            ahbl_ahbLif_hready;    
wire            ahbl_ahbLif_hresp;     
wire            ahbl_ahbLif_hsec;      
wire            ahbl_clk_en;           
wire            ahbl_gated_clk;        
wire            ahblif_busy;           
wire            ahblif_idle;           
wire            ahblif_power_mask;     
wire    [31:0]  bus_rdata;             
wire            bus_ready;             
wire            bus_resp;              
wire            bus_sec;               
wire            cpu_acc_err;           
wire    [31:0]  cpu_addr;              
wire            cpu_data_vld;          
wire    [3 :0]  cpu_prot;              
wire    [31:0]  cpu_rdata;             
wire            cpu_req;               
wire            cpu_req_grnt;          
wire            cpu_req_power_masked;  
wire            cpu_sec;               
wire    [1 :0]  cpu_size;              
wire            cpu_trans_cmplt;       
wire            cpu_vec_redirect;      
wire            cpu_wdata_sel;         
wire    [31:0]  cpu_wr_data;           
wire            cpu_write;             
wire            cpurst_b;              
wire            data_vld;              
wire    [31:0]  hwdata;                
wire            pad_cpu_halt_ff2;      
wire            req_grnt;              
wire            trans_cmplt;           
parameter DATA_WIDTH = 32;
parameter IDLE   = 3'b000,
          WFD    = 3'b001,
          WFG    = 3'b010,
          ERROR1 = 3'b110,
          ERROR2 = 3'b111;
always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ahbLif_cur_state[2:0] <= IDLE;
  else
  begin
      ahbLif_cur_state[2:0] <= ahbLif_nxt_state[2:0];
  end
end 
always @( cpu_req_power_masked
       or bus_ready
       or ahbLif_cur_state
       or cpu_req
       or bus_resp
       or pad_cpu_halt_ff2)
begin
case(ahbLif_cur_state)
  IDLE: 
  begin
    if(cpu_req_power_masked && !pad_cpu_halt_ff2) 
      if(bus_ready)
        ahbLif_nxt_state = WFD;
      else 
        ahbLif_nxt_state = WFG;
    else 
      ahbLif_nxt_state = IDLE;
  end
  WFG: 
  begin
    if(cpu_req)
      if(bus_ready)
        ahbLif_nxt_state = WFD;
      else 
        ahbLif_nxt_state = WFG;
    else 
      ahbLif_nxt_state = IDLE;
  end
  WFD:   
  begin
    if(bus_resp) 
      ahbLif_nxt_state = ERROR1;
    else if(!bus_ready) 
      ahbLif_nxt_state = WFD;
    else 
    begin
      if(cpu_req)
        ahbLif_nxt_state = WFD;
      else
        ahbLif_nxt_state = IDLE;
    end
  end
  ERROR1: 
  begin
    if(bus_resp)               
      if(!bus_ready)           
        ahbLif_nxt_state = ERROR1;
      else
        ahbLif_nxt_state = ERROR2; 
    else
      ahbLif_nxt_state = ERROR2; 
  end
  ERROR2: 
  begin
    ahbLif_nxt_state = IDLE; 
  end
  default:
    ahbLif_nxt_state = IDLE;
endcase
end
always @( posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    buf_write <= 1'b0;
  else if(cpu_req && req_grnt)
    buf_write <= cpu_write;
end
assign cpu_wdata_sel = buf_write;
assign req_grnt = ((ahbLif_cur_state[2:0]==IDLE && !ahblif_power_mask && !pad_cpu_halt_ff2)
                 || ahbLif_cur_state[2:0]==WFG
                 || ahbLif_cur_state[2:0]==WFD)
                 && bus_ready && !bus_resp;
assign trans_cmplt  = (ahbLif_cur_state[2:0]==WFD) &&  bus_ready && !bus_resp
                   || (ahbLif_cur_state[2:0]==ERROR2); 
assign data_vld = (ahbLif_cur_state[2:0]==WFD) && !buf_write
                && bus_ready && !bus_resp;
assign acc_err = (ahbLif_cur_state[2:0]==ERROR2);
assign bus_ready        = ahbl_ahbLif_hready;
assign bus_resp         = ahbl_ahbLif_hresp;
assign bus_rdata[DATA_WIDTH-1:0] = ahbl_ahbLif_hrdata[DATA_WIDTH-1:0];
assign ahbl_ahbLif_hsec = 1'b0;
assign bus_sec                   = ahbl_ahbLif_hsec;
assign ahbLif_ahbl_haddr[31:0] = cpu_addr[31:0];
  assign hwdata[DATA_WIDTH-1:0] = cpu_wr_data[DATA_WIDTH-1:0];
assign ahbLif_ahbl_hwdata[DATA_WIDTH-1:0] = hwdata[DATA_WIDTH-1:0];
assign ahbLif_ahbl_htrans[1] = ahbLif_cur_state[2:0]==IDLE &&
                               !pad_cpu_halt_ff2 &&
                               cpu_req_power_masked || 
                              (ahbLif_cur_state[2:0]==WFG ||
                               ahbLif_cur_state[2:0]==WFD) &&
                               cpu_req; 
assign ahbLif_ahbl_htrans[0] = 1'b0;
assign ahbLif_ahbl_hwrite = cpu_write;
assign ahbLif_ahbl_hsize[2:0] = { 1'b0, cpu_size[1:0]};
assign ahbLif_ahbl_hprot[3:0] = cpu_prot[3:0];
assign ahbLif_ahbl_hburst[2:0] = 3'b0;
assign ahbLif_ahbl_vec_redrct = cpu_vec_redirect;
assign cpu_req_grnt = req_grnt;
assign cpu_trans_cmplt = trans_cmplt;
assign cpu_data_vld = data_vld;
  assign cpu_rdata[DATA_WIDTH-1:0] = bus_rdata[DATA_WIDTH-1:0];
assign cpu_acc_err = acc_err;
assign cpu_sec     = bus_sec; 
assign ahbl_clk_en = !(ahbLif_cur_state[2:0]==IDLE) || cpu_req;
assign ahblif_busy = !(ahbLif_cur_state[2:0]==IDLE);
assign ahblif_idle = ahbLif_cur_state[2:0]==IDLE;
endmodule
