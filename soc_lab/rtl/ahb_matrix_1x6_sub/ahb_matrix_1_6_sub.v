/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ahb_matrix_1_6_sub(
  m_haddr,
  m_hburst,
  m_hprot,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hselx,
  m_hsize,
  m_htrans,
  m_hwdata,
  m_hwrite,
  main_hclk,
  main_hresetn,
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
  sub_hclk,
  sub_hresetn
);
input   [31:0]  m_haddr;                 
input   [2 :0]  m_hburst;                
input   [3 :0]  m_hprot;                 
input           m_hselx;                 
input   [2 :0]  m_hsize;                 
input   [1 :0]  m_htrans;                
input   [31:0]  m_hwdata;                
input           m_hwrite;                
input           main_hclk;               
input           main_hresetn;            
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
input           sub_hclk;                
input           sub_hresetn;             
output  [31:0]  m_hrdata;                
output          m_hready;                
output  [1 :0]  m_hresp;                 
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
reg             clk_div;                 
reg     [31:0]  m_haddr_d;               
reg     [2 :0]  m_hburst_d;              
reg     [3 :0]  m_hprot_d;               
reg     [2 :0]  m_hsize_d;               
reg     [1 :0]  m_htrans_d;              
reg             m_hwrite_d;              
reg             rd_hready;               
reg             wfifo_wr_en;             
wire            clk_div_rst;             
wire            load_cmd;                
wire    [31:0]  m_haddr;                 
wire    [31:0]  m_haddr_fifo;            
wire    [31:0]  m_haddr_sub;             
wire    [2 :0]  m_hburst;                
wire    [2 :0]  m_hburst_fifo;           
wire    [2 :0]  m_hburst_sub;            
wire    [3 :0]  m_hprot;                 
wire    [3 :0]  m_hprot_fifo;            
wire    [3 :0]  m_hprot_sub;             
wire    [31:0]  m_hrdata;                
wire    [31:0]  m_hrdata_fifo;           
wire    [31:0]  m_hrdata_sub;            
wire            m_hready;                
wire            m_hready_fifo;           
wire            m_hready_sub;            
wire    [1 :0]  m_hresp;                 
wire    [1 :0]  m_hresp_fifo;            
wire    [1 :0]  m_hresp_sub;             
wire            m_hselx;                 
wire    [2 :0]  m_hsize;                 
wire    [2 :0]  m_hsize_fifo;            
wire    [2 :0]  m_hsize_sub;             
wire    [1 :0]  m_htrans;                
wire    [1 :0]  m_htrans_fifo;           
wire    [1 :0]  m_htrans_sub;            
wire    [31:0]  m_hwdata;                
wire    [31:0]  m_hwdata_fifo;           
wire    [31:0]  m_hwdata_sub;            
wire            m_hwrite;                
wire            m_hwrite_fifo;           
wire            m_hwrite_sub;            
wire            m_resp_vld;              
wire            m_resp_vld_sub;          
wire            main_hclk;               
wire            main_hresetn;            
wire            pmu_matrix_clkdiv_bypass; 
wire            rfifo_rd_aempty;         
wire    [34:0]  rfifo_rd_data;           
wire            rfifo_rd_empty;          
wire            rfifo_rd_en;             
wire            rfifo_rd_reset;          
wire            rfifo_wr_afull;          
wire    [34:0]  rfifo_wr_data;           
wire            rfifo_wr_en;             
wire            rfifo_wr_full;           
wire            rfifo_wr_reset;          
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
wire            sub_hclk;                
wire            sub_hresetn;             
wire            wfifo_rd_aempty;         
wire    [76:0]  wfifo_rd_data;           
wire            wfifo_rd_empty;          
wire            wfifo_rd_en;             
wire            wfifo_rd_reset;          
wire            wfifo_wr_afull;          
wire    [76:0]  wfifo_wr_data;           
wire            wfifo_wr_full;           
wire            wfifo_wr_reset;          
ahb_matrix_1_6_sub_dec  x_matrix_sub_dec (
  .hclk                     (sub_hclk                ),
  .hresetn                  (sub_hresetn             ),
  .load_cmd                 (load_cmd                ),
  .m_haddr                  (m_haddr_sub             ),
  .m_hburst                 (m_hburst_sub            ),
  .m_hprot                  (m_hprot_sub             ),
  .m_hrdata                 (m_hrdata_sub            ),
  .m_hready                 (m_hready_sub            ),
  .m_hresp                  (m_hresp_sub             ),
  .m_hsize                  (m_hsize_sub             ),
  .m_htrans                 (m_htrans_sub            ),
  .m_hwdata                 (m_hwdata_sub            ),
  .m_hwrite                 (m_hwrite_sub            ),
  .m_resp_vld               (m_resp_vld_sub          ),
  .pmu_matrix_clkdiv_bypass (pmu_matrix_clkdiv_bypass),
  .s0_haddr                 (s0_haddr                ),
  .s0_hburst                (s0_hburst               ),
  .s0_hprot                 (s0_hprot                ),
  .s0_hrdata                (s0_hrdata               ),
  .s0_hready                (s0_hready               ),
  .s0_hresp                 (s0_hresp                ),
  .s0_hselx                 (s0_hselx                ),
  .s0_hsize                 (s0_hsize                ),
  .s0_htrans                (s0_htrans               ),
  .s0_hwdata                (s0_hwdata               ),
  .s0_hwrite                (s0_hwrite               ),
  .s1_haddr                 (s1_haddr                ),
  .s1_hburst                (s1_hburst               ),
  .s1_hprot                 (s1_hprot                ),
  .s1_hrdata                (s1_hrdata               ),
  .s1_hready                (s1_hready               ),
  .s1_hresp                 (s1_hresp                ),
  .s1_hselx                 (s1_hselx                ),
  .s1_hsize                 (s1_hsize                ),
  .s1_htrans                (s1_htrans               ),
  .s1_hwdata                (s1_hwdata               ),
  .s1_hwrite                (s1_hwrite               ),
  .s2_haddr                 (s2_haddr                ),
  .s2_hburst                (s2_hburst               ),
  .s2_hprot                 (s2_hprot                ),
  .s2_hrdata                (s2_hrdata               ),
  .s2_hready                (s2_hready               ),
  .s2_hresp                 (s2_hresp                ),
  .s2_hselx                 (s2_hselx                ),
  .s2_hsize                 (s2_hsize                ),
  .s2_htrans                (s2_htrans               ),
  .s2_hwdata                (s2_hwdata               ),
  .s2_hwrite                (s2_hwrite               ),
  .s3_haddr                 (s3_haddr                ),
  .s3_hburst                (s3_hburst               ),
  .s3_hprot                 (s3_hprot                ),
  .s3_hrdata                (s3_hrdata               ),
  .s3_hready                (s3_hready               ),
  .s3_hresp                 (s3_hresp                ),
  .s3_hselx                 (s3_hselx                ),
  .s3_hsize                 (s3_hsize                ),
  .s3_htrans                (s3_htrans               ),
  .s3_hwdata                (s3_hwdata               ),
  .s3_hwrite                (s3_hwrite               ),
  .s4_haddr                 (s4_haddr                ),
  .s4_hburst                (s4_hburst               ),
  .s4_hprot                 (s4_hprot                ),
  .s4_hrdata                (s4_hrdata               ),
  .s4_hready                (s4_hready               ),
  .s4_hresp                 (s4_hresp                ),
  .s4_hselx                 (s4_hselx                ),
  .s4_hsize                 (s4_hsize                ),
  .s4_htrans                (s4_htrans               ),
  .s4_hwdata                (s4_hwdata               ),
  .s4_hwrite                (s4_hwrite               ),
  .s5_haddr                 (s5_haddr                ),
  .s5_hburst                (s5_hburst               ),
  .s5_hprot                 (s5_hprot                ),
  .s5_hrdata                (s5_hrdata               ),
  .s5_hready                (s5_hready               ),
  .s5_hresp                 (s5_hresp                ),
  .s5_hselx                 (s5_hselx                ),
  .s5_hsize                 (s5_hsize                ),
  .s5_htrans                (s5_htrans               ),
  .s5_hwdata                (s5_hwdata               ),
  .s5_hwrite                (s5_hwrite               ),
  .wfifo_rd_empty           (wfifo_rd_empty          )
);
afifo_77x2  x_sub_wr_afifo (
  .rd_aempty       (wfifo_rd_aempty),
  .rd_clk          (sub_hclk       ),
  .rd_data         (wfifo_rd_data  ),
  .rd_empty        (wfifo_rd_empty ),
  .rd_en           (wfifo_rd_en    ),
  .rd_reset_n      (wfifo_rd_reset ),
  .wr_afull        (wfifo_wr_afull ),
  .wr_clk          (main_hclk      ),
  .wr_data         (wfifo_wr_data  ),
  .wr_en           (wfifo_wr_en    ),
  .wr_full         (wfifo_wr_full  ),
  .wr_reset_n      (wfifo_wr_reset )
);
assign wfifo_wr_reset = main_hresetn & clk_div_rst;
assign wfifo_rd_reset = sub_hresetn & clk_div_rst;
always @ (posedge main_hclk or negedge main_hresetn)
    begin
       if(~main_hresetn)
         wfifo_wr_en <= 1'b0;
       else
         wfifo_wr_en <= ~wfifo_wr_afull & m_hselx & (~pmu_matrix_clkdiv_bypass);
    end
always @ (posedge main_hclk)
    begin
      m_haddr_d[31:0] <= m_haddr[31:0];
      m_htrans_d[1:0] <= m_htrans[1:0];
      m_hsize_d[2:0] <= m_hsize[2:0];
      m_hburst_d[2:0] <= m_hburst[2:0];
      m_hprot_d[3:0] <= m_hprot[3:0];
      m_hwrite_d <= m_hwrite;
    end
assign wfifo_wr_data[76:0] = {m_haddr_d[31:0],m_htrans_d[1:0],m_hsize_d[2:0],m_hburst_d[2:0],m_hprot_d[3:0],m_hwrite_d,m_hwdata[31:0]};
assign wfifo_rd_en = load_cmd;
assign {m_haddr_fifo[31:0],m_htrans_fifo[1:0],m_hsize_fifo[2:0],m_hburst_fifo[2:0],m_hprot_fifo[3:0],m_hwrite_fifo,m_hwdata_fifo[31:0]} = wfifo_rd_en ? wfifo_rd_data[76:0] : 77'd0;
afifo_35x2  x_sub_rd_afifo (
  .rd_aempty       (rfifo_rd_aempty),
  .rd_clk          (main_hclk      ),
  .rd_data         (rfifo_rd_data  ),
  .rd_empty        (rfifo_rd_empty ),
  .rd_en           (rfifo_rd_en    ),
  .rd_reset_n      (rfifo_rd_reset ),
  .wr_afull        (rfifo_wr_afull ),
  .wr_clk          (sub_hclk       ),
  .wr_data         (rfifo_wr_data  ),
  .wr_en           (rfifo_wr_en    ),
  .wr_full         (rfifo_wr_full  ),
  .wr_reset_n      (rfifo_wr_reset )
);
assign rfifo_wr_reset = sub_hresetn & clk_div_rst;
assign rfifo_rd_reset = main_hresetn & clk_div_rst;
assign rfifo_wr_en = (~rfifo_wr_afull) & m_resp_vld_sub & ~pmu_matrix_clkdiv_bypass;
assign rfifo_wr_data[34:0] = {m_hrdata_sub[31:0],m_hresp_sub[1:0],m_resp_vld_sub};
assign rfifo_rd_en = ~rfifo_rd_empty;
assign m_hrdata_fifo[31:0] = rfifo_rd_data[34:3];
assign m_hresp_fifo[1:0]= rfifo_rd_en ? rfifo_rd_data[2:1] : 2'b00;
assign m_resp_vld = rfifo_rd_en ? rfifo_rd_data[0] : 1'b0;
assign m_hready_fifo= (~wfifo_wr_full)&((~rd_hready)|m_resp_vld);
always @ (posedge main_hclk or negedge main_hresetn)
	begin
		if(~main_hresetn) begin
			rd_hready <= 1'b0;
		end
		else if(m_htrans[1]) begin
			rd_hready <= 1'b1;
		end
		else if(m_resp_vld) begin
			rd_hready <= 1'b0;
		end
	end
always @ (posedge main_hclk or negedge main_hresetn)
    begin
        if(~main_hresetn)
            clk_div <= 1'b0;
        else
            clk_div <= pmu_matrix_clkdiv_bypass;
    end
assign clk_div_rst = pmu_matrix_clkdiv_bypass | ~clk_div;
assign m_haddr_sub[31:0] = pmu_matrix_clkdiv_bypass ? m_haddr[31:0] : m_haddr_fifo[31:0];
assign m_htrans_sub[1:0] = pmu_matrix_clkdiv_bypass ? m_htrans[1:0] : m_htrans_fifo[1:0];
assign m_hburst_sub[2:0] = pmu_matrix_clkdiv_bypass ? m_hburst[2:0] : m_hburst_fifo[2:0];
assign m_hsize_sub[2:0]  = pmu_matrix_clkdiv_bypass ? m_hsize[2:0] : m_hsize_fifo[2:0];
assign m_hprot_sub[3:0]  = pmu_matrix_clkdiv_bypass ? m_hprot[3:0] : m_hprot_fifo[3:0];
assign m_hwrite_sub      = pmu_matrix_clkdiv_bypass ? m_hwrite : m_hwrite_fifo;
assign m_hwdata_sub[31:0]= pmu_matrix_clkdiv_bypass ? m_hwdata[31:0] : m_hwdata_fifo[31:0];
assign m_hrdata[31:0]    = pmu_matrix_clkdiv_bypass ? m_hrdata_sub[31:0] : m_hrdata_fifo[31:0];
assign m_hresp[1:0]      = pmu_matrix_clkdiv_bypass ? m_hresp_sub[1:0] : m_hresp_fifo[1:0];
assign m_hready          = pmu_matrix_clkdiv_bypass ? m_hready_sub : m_hready_fifo;
endmodule
