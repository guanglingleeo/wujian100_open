/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module sms_bank_64k_top(
  big_endian_b,
  mem_haddr,
  mem_hclk,
  mem_hprot,
  mem_hrdata,
  mem_hready,
  mem_hready_resp,
  mem_hresp,
  mem_hrst_b,
  mem_hsel,
  mem_hsize,
  mem_htrans,
  mem_hwdata,
  mem_hwrite,
  region_rd_deny_flag,
  region_wr_deny_flag,
  sms_idle0
);
input           big_endian_b;        
input   [31:0]  mem_haddr;           
input           mem_hclk;            
input   [3 :0]  mem_hprot;           
input           mem_hready;          
input           mem_hrst_b;          
input           mem_hsel;            
input   [2 :0]  mem_hsize;           
input   [1 :0]  mem_htrans;          
input   [31:0]  mem_hwdata;          
input           mem_hwrite;          
input           region_rd_deny_flag; 
input           region_wr_deny_flag; 
output  [31:0]  mem_hrdata;          
output          mem_hready_resp;     
output  [1 :0]  mem_hresp;           
output          sms_idle0;           
reg             rd_deny_resp;        
reg             rd_deny_resp_2_cycle; 
reg             wr_deny_resp;        
reg             wr_deny_resp_2_cycle; 
wire            a_act_burst;         
wire            a_nonseq;            
wire            a_seq;               
wire            big_endian_b;        
wire            deny_hready_resp;    
wire    [1 :0]  deny_hresp;          
wire    [31:0]  mem_haddr;           
wire            mem_hclk;            
wire    [3 :0]  mem_hprot;           
wire    [31:0]  mem_hrdata;          
wire            mem_hready;          
wire            mem_hready_resp;     
wire    [1 :0]  mem_hresp;           
wire            mem_hrst_b;          
wire            mem_hsel;            
wire            mem_hsel_deny;       
wire    [2 :0]  mem_hsize;           
wire    [1 :0]  mem_htrans;          
wire    [1 :0]  mem_htrans_deny;     
wire    [31:0]  mem_hwdata;          
wire            mem_hwrite;          
wire    [15:0]  ram_addr;            
wire    [31:0]  ram_rdata;           
wire            ram_sel;             
wire    [2 :0]  ram_size;            
wire    [31:0]  ram_wdata;           
wire            ram_write;           
wire            region_rd_deny_flag; 
wire            region_wr_deny_flag; 
wire    [3 :0]  resp_cfg;            
wire            sms_idle0;           
parameter  NONSEQ = 2'b10;
parameter  SEQ    = 2'b11;
parameter  ERROR  = 2'b01;  
assign a_nonseq = mem_htrans[1:0] == NONSEQ;
assign a_seq    = mem_htrans[1:0] == SEQ;
assign a_act_burst = (a_nonseq || a_seq) && mem_hsel && mem_hready;
assign mem_hsel_deny =( (a_act_burst&mem_hwrite&region_wr_deny_flag) |
                        (a_act_burst&(~mem_hwrite)&region_rd_deny_flag) )
                        ? 1'b0 : mem_hsel;
assign mem_htrans_deny[1:0] =( (a_act_burst&mem_hwrite&region_wr_deny_flag) |
                               (a_act_burst&(~mem_hwrite)&region_rd_deny_flag) )
                               ? 2'b0 : mem_htrans[1:0];
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		wr_deny_resp <= 1'b0;
        end
	else if(wr_deny_resp && wr_deny_resp_2_cycle) begin
		wr_deny_resp <= 1'b0;
        end
	else if(a_act_burst && mem_hwrite && region_wr_deny_flag) begin
		wr_deny_resp <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		wr_deny_resp_2_cycle <= 1'b0;
        end
	else if(wr_deny_resp && wr_deny_resp_2_cycle) begin
		wr_deny_resp_2_cycle <= 1'b0;
        end
	else if(wr_deny_resp) begin
		wr_deny_resp_2_cycle <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		rd_deny_resp <= 1'b0;
        end
	else if(rd_deny_resp && rd_deny_resp_2_cycle) begin
		rd_deny_resp <= 1'b0;
        end
	else if(a_act_burst && (!mem_hwrite) && region_rd_deny_flag) begin
		rd_deny_resp <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		rd_deny_resp_2_cycle <= 1'b0;
        end
	else if(rd_deny_resp && rd_deny_resp_2_cycle) begin
		rd_deny_resp_2_cycle <= 1'b0;
        end
	else if(rd_deny_resp) begin
		rd_deny_resp_2_cycle <= 1'b1;
        end
end
assign mem_hready_resp = rd_deny_resp ? rd_deny_resp_2_cycle : 
                    (wr_deny_resp ? wr_deny_resp_2_cycle : deny_hready_resp);
assign mem_hresp[1:0] = rd_deny_resp ? ERROR : (wr_deny_resp ? ERROR : deny_hresp);
sms_sms_ahbs_bk2  x_sms_sms_ahbs (
  .ahbs_harb_hrdata    (mem_hrdata         ),
  .ahbs_harb_hready    (deny_hready_resp   ),
  .ahbs_harb_hresp     (deny_hresp         ),
  .harb_ahbs_hsel      (mem_hsel_deny      ),
  .harb_xx_haddr       (mem_haddr          ),
  .harb_xx_hready      (mem_hready         ),
  .harb_xx_hsize       (mem_hsize          ),
  .harb_xx_htrans      (mem_htrans_deny    ),
  .harb_xx_hwdata      (mem_hwdata         ),
  .harb_xx_hwrite      (mem_hwrite         ),
  .i_sys_hclk          (mem_hclk           ),
  .i_sys_rst_b         (mem_hrst_b         ),
  .little_endian_trans (big_endian_b       ),
  .mem_hprot           (mem_hprot          ),
  .ram_addr            (ram_addr           ),
  .ram_idle            (sms_idle0          ),
  .ram_rdata           (ram_rdata          ),
  .ram_sel             (ram_sel            ),
  .ram_size            (ram_size           ),
  .ram_wdata           (ram_wdata          ),
  .ram_write           (ram_write          ),
  .resp_cfg            (resp_cfg           )
);
sms_sram_bk2  x_sms_sram (
  .hrst_b     (mem_hrst_b),
  .ram_addr   (ram_addr  ),
  .ram_clk    (mem_hclk  ),
  .ram_rdata  (ram_rdata ),
  .ram_sel    (ram_sel   ),
  .ram_size   (ram_size  ),
  .ram_wdata  (ram_wdata ),
  .ram_write  (ram_write )
);
assign resp_cfg[3:0] = 4'b1000;
endmodule
