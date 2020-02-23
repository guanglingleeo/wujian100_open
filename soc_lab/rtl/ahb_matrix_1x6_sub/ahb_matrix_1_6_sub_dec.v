/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ahb_matrix_1_6_sub_dec(
  hclk,
  hresetn,
  load_cmd,
  m_haddr,
  m_hburst,
  m_hprot,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hsize,
  m_htrans,
  m_hwdata,
  m_hwrite,
  m_resp_vld,
  pmu_matrix_clkdiv_bypass,
  s0_haddr,
  s0_hburst,
  s0_hprot,
  s0_hrdata,
  s0_hready,
  s0_hresp,
  s0_hselx,
  s0_hsize,
  s0_htrans,
  s0_hwdata,
  s0_hwrite,
  s1_haddr,
  s1_hburst,
  s1_hprot,
  s1_hrdata,
  s1_hready,
  s1_hresp,
  s1_hselx,
  s1_hsize,
  s1_htrans,
  s1_hwdata,
  s1_hwrite,
  s2_haddr,
  s2_hburst,
  s2_hprot,
  s2_hrdata,
  s2_hready,
  s2_hresp,
  s2_hselx,
  s2_hsize,
  s2_htrans,
  s2_hwdata,
  s2_hwrite,
  s3_haddr,
  s3_hburst,
  s3_hprot,
  s3_hrdata,
  s3_hready,
  s3_hresp,
  s3_hselx,
  s3_hsize,
  s3_htrans,
  s3_hwdata,
  s3_hwrite,
  s4_haddr,
  s4_hburst,
  s4_hprot,
  s4_hrdata,
  s4_hready,
  s4_hresp,
  s4_hselx,
  s4_hsize,
  s4_htrans,
  s4_hwdata,
  s4_hwrite,
  s5_haddr,
  s5_hburst,
  s5_hprot,
  s5_hrdata,
  s5_hready,
  s5_hresp,
  s5_hselx,
  s5_hsize,
  s5_htrans,
  s5_hwdata,
  s5_hwrite,
  wfifo_rd_empty
);
input           hclk;                    
input           hresetn;                 
input   [31:0]  m_haddr;                 
input   [2 :0]  m_hburst;                
input   [3 :0]  m_hprot;                 
input   [2 :0]  m_hsize;                 
input   [1 :0]  m_htrans;                
input   [31:0]  m_hwdata;                
input           m_hwrite;                
input           pmu_matrix_clkdiv_bypass; 
input   [31:0]  s0_hrdata;               
input           s0_hready;               
input   [1 :0]  s0_hresp;                
input   [31:0]  s1_hrdata;               
input           s1_hready;               
input   [1 :0]  s1_hresp;                
input   [31:0]  s2_hrdata;               
input           s2_hready;               
input   [1 :0]  s2_hresp;                
input   [31:0]  s3_hrdata;               
input           s3_hready;               
input   [1 :0]  s3_hresp;                
input   [31:0]  s4_hrdata;               
input           s4_hready;               
input   [1 :0]  s4_hresp;                
input   [31:0]  s5_hrdata;               
input           s5_hready;               
input   [1 :0]  s5_hresp;                
input           wfifo_rd_empty;          
output          load_cmd;                
output  [31:0]  m_hrdata;                
output          m_hready;                
output  [1 :0]  m_hresp;                 
output          m_resp_vld;              
output  [31:0]  s0_haddr;                
output  [2 :0]  s0_hburst;               
output  [3 :0]  s0_hprot;                
output          s0_hselx;                
output  [2 :0]  s0_hsize;                
output  [1 :0]  s0_htrans;               
output  [31:0]  s0_hwdata;               
output          s0_hwrite;               
output  [31:0]  s1_haddr;                
output  [2 :0]  s1_hburst;               
output  [3 :0]  s1_hprot;                
output          s1_hselx;                
output  [2 :0]  s1_hsize;                
output  [1 :0]  s1_htrans;               
output  [31:0]  s1_hwdata;               
output          s1_hwrite;               
output  [31:0]  s2_haddr;                
output  [2 :0]  s2_hburst;               
output  [3 :0]  s2_hprot;                
output          s2_hselx;                
output  [2 :0]  s2_hsize;                
output  [1 :0]  s2_htrans;               
output  [31:0]  s2_hwdata;               
output          s2_hwrite;               
output  [31:0]  s3_haddr;                
output  [2 :0]  s3_hburst;               
output  [3 :0]  s3_hprot;                
output          s3_hselx;                
output  [2 :0]  s3_hsize;                
output  [1 :0]  s3_htrans;               
output  [31:0]  s3_hwdata;               
output          s3_hwrite;               
output  [31:0]  s4_haddr;                
output  [2 :0]  s4_hburst;               
output  [3 :0]  s4_hprot;                
output          s4_hselx;                
output  [2 :0]  s4_hsize;                
output  [1 :0]  s4_htrans;               
output  [31:0]  s4_hwdata;               
output          s4_hwrite;               
output  [31:0]  s5_haddr;                
output  [2 :0]  s5_hburst;               
output  [3 :0]  s5_hprot;                
output          s5_hselx;                
output  [2 :0]  s5_hsize;                
output  [1 :0]  s5_htrans;               
output  [31:0]  s5_hwdata;               
output          s5_hwrite;               
reg             clr_cmd;                 
reg             latch_cmd;               
reg             load_cmd;                
reg     [42:0]  m_ctrl_bus_d;            
reg     [12:0]  m_cur_st;                
reg             m_hready;                
reg     [31:0]  m_hwdata_d;              
reg     [12:0]  m_nxt_st;                
reg             m_resp_vld;              
reg             s0_cur_cmd;              
reg             s0_last_cmd;             
reg             s1_cur_cmd;              
reg             s1_last_cmd;             
reg             s2_cur_cmd;              
reg             s2_last_cmd;             
reg             s3_cur_cmd;              
reg             s3_last_cmd;             
reg             s4_cur_cmd;              
reg             s4_last_cmd;             
reg             s5_cur_cmd;              
reg             s5_last_cmd;             
wire            bypass_mode;             
wire            hclk;                    
wire            hresetn;                 
wire    [42:0]  m_ctrl_bus;              
wire    [31:0]  m_haddr;                 
wire    [2 :0]  m_hburst;                
wire    [3 :0]  m_hprot;                 
wire    [31:0]  m_hrdata;                
wire    [1 :0]  m_hresp;                 
wire    [2 :0]  m_hsize;                 
wire    [1 :0]  m_htrans;                
wire    [31:0]  m_hwdata;                
wire            m_hwrite;                
wire            pmu_matrix_clkdiv_bypass; 
wire    [31:0]  s0_haddr;                
wire    [2 :0]  s0_hburst;               
wire    [3 :0]  s0_hprot;                
wire    [31:0]  s0_hrdata;               
wire            s0_hready;               
wire    [1 :0]  s0_hresp;                
wire            s0_hselx;                
wire    [2 :0]  s0_hsize;                
wire    [1 :0]  s0_htrans;               
wire    [31:0]  s0_hwdata;               
wire            s0_hwrite;               
wire            s0_sel;                  
wire    [31:0]  s1_haddr;                
wire    [2 :0]  s1_hburst;               
wire    [3 :0]  s1_hprot;                
wire    [31:0]  s1_hrdata;               
wire            s1_hready;               
wire    [1 :0]  s1_hresp;                
wire            s1_hselx;                
wire    [2 :0]  s1_hsize;                
wire    [1 :0]  s1_htrans;               
wire    [31:0]  s1_hwdata;               
wire            s1_hwrite;               
wire            s1_sel;                  
wire    [31:0]  s2_haddr;                
wire    [2 :0]  s2_hburst;               
wire    [3 :0]  s2_hprot;                
wire    [31:0]  s2_hrdata;               
wire            s2_hready;               
wire    [1 :0]  s2_hresp;                
wire            s2_hselx;                
wire    [2 :0]  s2_hsize;                
wire    [1 :0]  s2_htrans;               
wire    [31:0]  s2_hwdata;               
wire            s2_hwrite;               
wire            s2_sel;                  
wire    [31:0]  s3_haddr;                
wire    [2 :0]  s3_hburst;               
wire    [3 :0]  s3_hprot;                
wire    [31:0]  s3_hrdata;               
wire            s3_hready;               
wire    [1 :0]  s3_hresp;                
wire            s3_hselx;                
wire    [2 :0]  s3_hsize;                
wire    [1 :0]  s3_htrans;               
wire    [31:0]  s3_hwdata;               
wire            s3_hwrite;               
wire            s3_sel;                  
wire    [31:0]  s4_haddr;                
wire    [2 :0]  s4_hburst;               
wire    [3 :0]  s4_hprot;                
wire    [31:0]  s4_hrdata;               
wire            s4_hready;               
wire    [1 :0]  s4_hresp;                
wire            s4_hselx;                
wire    [2 :0]  s4_hsize;                
wire    [1 :0]  s4_htrans;               
wire    [31:0]  s4_hwdata;               
wire            s4_hwrite;               
wire            s4_sel;                  
wire    [31:0]  s5_haddr;                
wire    [2 :0]  s5_hburst;               
wire    [3 :0]  s5_hprot;                
wire    [31:0]  s5_hrdata;               
wire            s5_hready;               
wire    [1 :0]  s5_hresp;                
wire            s5_hselx;                
wire    [2 :0]  s5_hsize;                
wire    [1 :0]  s5_htrans;               
wire    [31:0]  s5_hwdata;               
wire            s5_hwrite;               
wire            s5_sel;                  
wire            wfifo_rd_empty;          
parameter BUS_WIDTH = 43;
parameter S_IDLE    = 13'b0000000000001;
parameter S_S0_CMD  = 13'b0000000000010;
parameter S_S0_DATA = 13'b0000000000100;
parameter S_S1_CMD  = 13'b0000000001000;
parameter S_S1_DATA = 13'b0000000010000;
parameter S_S2_CMD  = 13'b0000000100000;
parameter S_S2_DATA = 13'b0000001000000;
parameter S_S3_CMD  = 13'b0000010000000;
parameter S_S3_DATA = 13'b0000100000000;
parameter S_S4_CMD  = 13'b0001000000000;
parameter S_S4_DATA = 13'b0010000000000;
parameter S_S5_CMD  = 13'b0100000000000;
parameter S_S5_DATA = 13'b1000000000000;
assign s0_sel =( m_haddr[31:0] >= 32'h40200000) & (m_haddr[31:0] <= 32'h40200fff) & (m_htrans[1]);
assign s1_sel =( m_haddr[31:0] >= 32'h40300000) & (m_haddr[31:0] <= 32'h403fffff) & (m_htrans[1]);
assign s2_sel =( m_haddr[31:0] >= 32'h50000000) & (m_haddr[31:0] <= 32'h5004ffff) & (m_htrans[1]);
assign s3_sel =( m_haddr[31:0] >= 32'h60000000) & (m_haddr[31:0] <= 32'h6004ffff) & (m_htrans[1]);
assign s4_sel =( m_haddr[31:0] >= 32'h70000000) & (m_haddr[31:0] <= 32'h77ffffff) & (m_htrans[1]);
assign s5_sel =( m_haddr[31:0] >= 32'h78000000) & (m_haddr[31:0] <= 32'h7fffffff) & (m_htrans[1]);
assign bypass_mode = pmu_matrix_clkdiv_bypass;
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m_cur_st[12:0] <= S_IDLE;
    else
       m_cur_st[12:0] <= m_nxt_st[12:0];
  end
always @ (*)
begin
case(m_cur_st[12:0])
  S_IDLE:begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       clr_cmd = 1'b0;
       m_resp_vld = 1'b0;
       latch_cmd = 1'b0;
       s0_cur_cmd = 1'b0;
       s0_last_cmd = 1'b0;
       s1_cur_cmd = 1'b0;
       s1_last_cmd = 1'b0;
       s2_cur_cmd = 1'b0;
       s2_last_cmd = 1'b0;
       s3_cur_cmd = 1'b0;
       s3_last_cmd = 1'b0;
       s4_cur_cmd = 1'b0;
       s4_last_cmd = 1'b0;
       s5_cur_cmd = 1'b0;
       s5_last_cmd = 1'b0;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s0_hready ? S_S0_DATA : S_S0_CMD) : S_S0_CMD;
                   s0_cur_cmd = bypass_mode ? (s0_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s0_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s1_hready ? S_S1_DATA : S_S1_CMD) : S_S1_CMD;
                   s1_cur_cmd = bypass_mode ? (s1_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s1_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s2_hready ? S_S2_DATA : S_S2_CMD) : S_S2_CMD;
                   s2_cur_cmd = bypass_mode ? (s2_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s2_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s3_hready ? S_S3_DATA : S_S3_CMD) : S_S3_CMD;
                   s3_cur_cmd = bypass_mode ? (s3_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s3_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s4_hready ? S_S4_DATA : S_S4_CMD) : S_S4_CMD;
                   s4_cur_cmd = bypass_mode ? (s4_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s4_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = bypass_mode ? (s5_hready ? S_S5_DATA : S_S5_CMD) : S_S5_CMD;
                   s5_cur_cmd = bypass_mode ? (s5_hready ? 1'b1 : 1'b0) : 1'b0;
                   latch_cmd = bypass_mode ? (s5_hready ? 1'b0 : 1'b1) : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
  end
  S_S0_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s0_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b1;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
  end
  S_S0_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s0_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S0_DATA;
     end
  end
  S_S1_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s1_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b1;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
  end
  S_S1_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s1_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S1_DATA;
     end
  end
  S_S2_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s2_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b1;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
  end
  S_S2_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s2_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S2_DATA;
     end
  end
  S_S3_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s3_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b1;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
  end
  S_S3_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s3_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S3_DATA;
     end
  end
  S_S4_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s4_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b1;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
  end
  S_S4_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s4_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S4_DATA;
     end
  end
  S_S5_CMD:begin
     load_cmd = 1'b0;
     clr_cmd = s5_hready ? 1'b1 : 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b1;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
  end
  S_S5_DATA:begin
     load_cmd = 1'b0;
     clr_cmd = 1'b0;
     s0_cur_cmd = 1'b0;
     s0_last_cmd = 1'b0;
     s1_cur_cmd = 1'b0;
     s1_last_cmd = 1'b0;
     s2_cur_cmd = 1'b0;
     s2_last_cmd = 1'b0;
     s3_cur_cmd = 1'b0;
     s3_last_cmd = 1'b0;
     s4_cur_cmd = 1'b0;
     s4_last_cmd = 1'b0;
     s5_cur_cmd = 1'b0;
     s5_last_cmd = 1'b0;
     latch_cmd = 1'b0;
     m_resp_vld = 1'b0;
     if(s5_hready) begin
       load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
       m_resp_vld = 1'b1;
       case(1'b1)
         s0_sel: begin 
                   m_nxt_st[12:0] = s0_hready ? S_S0_DATA : S_S0_CMD;
                   latch_cmd = s0_hready ? 1'b0 : 1'b1;
                   s0_cur_cmd = s0_hready  ? 1'b1 : 1'b0;
         end
         s1_sel: begin 
                   m_nxt_st[12:0] = s1_hready ? S_S1_DATA : S_S1_CMD;
                   latch_cmd = s1_hready ? 1'b0 : 1'b1;
                   s1_cur_cmd = s1_hready  ? 1'b1 : 1'b0;
         end
         s2_sel: begin 
                   m_nxt_st[12:0] = s2_hready ? S_S2_DATA : S_S2_CMD;
                   latch_cmd = s2_hready ? 1'b0 : 1'b1;
                   s2_cur_cmd = s2_hready  ? 1'b1 : 1'b0;
         end
         s3_sel: begin 
                   m_nxt_st[12:0] = s3_hready ? S_S3_DATA : S_S3_CMD;
                   latch_cmd = s3_hready ? 1'b0 : 1'b1;
                   s3_cur_cmd = s3_hready  ? 1'b1 : 1'b0;
         end
         s4_sel: begin 
                   m_nxt_st[12:0] = s4_hready ? S_S4_DATA : S_S4_CMD;
                   latch_cmd = s4_hready ? 1'b0 : 1'b1;
                   s4_cur_cmd = s4_hready  ? 1'b1 : 1'b0;
         end
         s5_sel: begin 
                   m_nxt_st[12:0] = s5_hready ? S_S5_DATA : S_S5_CMD;
                   latch_cmd = s5_hready ? 1'b0 : 1'b1;
                   s5_cur_cmd = s5_hready  ? 1'b1 : 1'b0;
         end
         default: m_nxt_st[12:0] = S_IDLE;
       endcase
     end
     else begin
       m_nxt_st[12:0] = S_S5_DATA;
     end
  end
  default: begin
             m_nxt_st[12:0] = S_IDLE;
             load_cmd = bypass_mode ? 1'b0 : ~wfifo_rd_empty;
             clr_cmd = 1'b0;
             m_resp_vld = 1'b0;
             latch_cmd = 1'b0;
             s0_cur_cmd = 1'b0;
             s0_last_cmd = 1'b0;
             s1_cur_cmd = 1'b0;
             s1_last_cmd = 1'b0;
             s2_cur_cmd = 1'b0;
             s2_last_cmd = 1'b0;
             s3_cur_cmd = 1'b0;
             s3_last_cmd = 1'b0;
             s4_cur_cmd = 1'b0;
             s4_last_cmd = 1'b0;
             s5_cur_cmd = 1'b0;
             s5_last_cmd = 1'b0;
  end
endcase
end
assign m_ctrl_bus[BUS_WIDTH-1:0] = {m_haddr[32-1:0],m_hsize[2:0],m_hburst[2:0],m_hprot[3:0],m_hwrite};
assign {s0_haddr[32-1:0],s0_hsize[2:0],s0_hburst[2:0],s0_hprot[3:0],s0_hwrite} = s0_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s0_htrans[1:0] = (s0_cur_cmd | s0_last_cmd) ? 2'b10 : 2'b00;
assign {s1_haddr[32-1:0],s1_hsize[2:0],s1_hburst[2:0],s1_hprot[3:0],s1_hwrite} = s1_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s1_htrans[1:0] = (s1_cur_cmd | s1_last_cmd) ? 2'b10 : 2'b00;
assign {s2_haddr[32-1:0],s2_hsize[2:0],s2_hburst[2:0],s2_hprot[3:0],s2_hwrite} = s2_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s2_htrans[1:0] = (s2_cur_cmd | s2_last_cmd) ? 2'b10 : 2'b00;
assign {s3_haddr[32-1:0],s3_hsize[2:0],s3_hburst[2:0],s3_hprot[3:0],s3_hwrite} = s3_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s3_htrans[1:0] = (s3_cur_cmd | s3_last_cmd) ? 2'b10 : 2'b00;
assign {s4_haddr[32-1:0],s4_hsize[2:0],s4_hburst[2:0],s4_hprot[3:0],s4_hwrite} = s4_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s4_htrans[1:0] = (s4_cur_cmd | s4_last_cmd) ? 2'b10 : 2'b00;
assign {s5_haddr[32-1:0],s5_hsize[2:0],s5_hburst[2:0],s5_hprot[3:0],s5_hwrite} = s5_cur_cmd ? m_ctrl_bus[BUS_WIDTH-1:0] : m_ctrl_bus_d[BUS_WIDTH-1:0];
assign s5_htrans[1:0] = (s5_cur_cmd | s5_last_cmd) ? 2'b10 : 2'b00;
always @ (posedge hclk or negedge hresetn)
    begin
      if(!hresetn) begin
        m_ctrl_bus_d[BUS_WIDTH-1:0] <= 0;
        m_hwdata_d[32-1:0] <= 0;
      end
      else if (load_cmd | latch_cmd) begin
        m_ctrl_bus_d[BUS_WIDTH-1:0] <= m_ctrl_bus[BUS_WIDTH-1:0];
        m_hwdata_d[32-1:0] <= m_hwdata[32-1:0];
      end
      else if (clr_cmd) begin
        m_ctrl_bus_d[BUS_WIDTH-1:0] <= 0;
        m_hwdata_d[32-1:0] <= m_hwdata_d[32-1:0];
      end
    end
assign s0_hwdata[32-1:0] = m_cur_st[2] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign s1_hwdata[32-1:0] = m_cur_st[4] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign s2_hwdata[32-1:0] = m_cur_st[6] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign s3_hwdata[32-1:0] = m_cur_st[8] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign s4_hwdata[32-1:0] = m_cur_st[10] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign s5_hwdata[32-1:0] = m_cur_st[12] ? (bypass_mode ? m_hwdata[32-1:0] : m_hwdata_d[32-1:0] ): 0;
assign m_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m_cur_st[2]}}) |
                           (s1_hrdata[32-1:0] & {32{m_cur_st[4]}}) |
                           (s2_hrdata[32-1:0] & {32{m_cur_st[6]}}) |
                           (s3_hrdata[32-1:0] & {32{m_cur_st[8]}}) |
                           (s4_hrdata[32-1:0] & {32{m_cur_st[10]}}) |
                           (s5_hrdata[32-1:0] & {32{m_cur_st[12]}});
assign m_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m_cur_st[2]}}) |
                       (s1_hresp[1:0] & {2{m_cur_st[4]}}) |
                       (s2_hresp[1:0] & {2{m_cur_st[6]}}) |
                       (s3_hresp[1:0] & {2{m_cur_st[8]}}) |
                       (s4_hresp[1:0] & {2{m_cur_st[10]}}) |
                       (s5_hresp[1:0] & {2{m_cur_st[12]}});
always @( s4_hready
       or s2_hready
       or m_cur_st[12:0]
       or s1_hready
       or s3_hready
       or s5_hready
       or s0_hready)
begin
case(m_cur_st[12:0])
   S_IDLE : m_hready = 1'b1;
   S_S0_CMD: m_hready = 1'b0;
   S_S1_CMD: m_hready = 1'b0;
   S_S2_CMD: m_hready = 1'b0;
   S_S3_CMD: m_hready = 1'b0;
   S_S4_CMD: m_hready = 1'b0;
   S_S5_CMD: m_hready = 1'b0;
   S_S0_DATA: m_hready = s0_hready;
   S_S1_DATA: m_hready = s1_hready;
   S_S2_DATA: m_hready = s2_hready;
   S_S3_DATA: m_hready = s3_hready;
   S_S4_DATA: m_hready = s4_hready;
   S_S5_DATA: m_hready = s5_hready;
   default: m_hready = 1'b1;
endcase
end
assign s0_hselx = s0_cur_cmd | s0_last_cmd ;
assign s1_hselx = s1_cur_cmd | s1_last_cmd ;
assign s2_hselx = s2_cur_cmd | s2_last_cmd ;
assign s3_hselx = s3_cur_cmd | s3_last_cmd ;
assign s4_hselx = s4_cur_cmd | s4_last_cmd ;
assign s5_hselx = s5_cur_cmd | s5_last_cmd ;
endmodule
