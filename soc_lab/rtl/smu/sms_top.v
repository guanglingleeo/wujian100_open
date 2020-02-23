/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module sms_top(
  ahb_sms0_haddr,
  ahb_sms0_hprot,
  ahb_sms0_hsel,
  ahb_sms0_hsize,
  ahb_sms0_htrans,
  ahb_sms0_hwdata,
  ahb_sms0_hwrite,
  ahb_sms1_haddr,
  ahb_sms1_hprot,
  ahb_sms1_hsel,
  ahb_sms1_hsize,
  ahb_sms1_htrans,
  ahb_sms1_hwdata,
  ahb_sms1_hwrite,
  ahb_sms2_haddr,
  ahb_sms2_hprot,
  ahb_sms2_hsel,
  ahb_sms2_hsize,
  ahb_sms2_htrans,
  ahb_sms2_hwdata,
  ahb_sms2_hwrite,
  ahb_sms3_haddr,
  ahb_sms3_hprot,
  ahb_sms3_hsel,
  ahb_sms3_hsize,
  ahb_sms3_htrans,
  ahb_sms3_hwdata,
  ahb_sms3_hwrite,
  pmu_sms_hclk,
  pmu_sms_hrst_b,
  sms0_ahb_hrdata,
  sms0_ahb_hready,
  sms0_ahb_hresp,
  sms0_idle,
  sms1_ahb_hrdata,
  sms1_ahb_hready,
  sms1_ahb_hresp,
  sms1_idle,
  sms2_ahb_hrdata,
  sms2_ahb_hready,
  sms2_ahb_hresp,
  sms2_idle,
  sms3_ahb_hrdata,
  sms3_ahb_hready,
  sms3_ahb_hresp,
  sms3_idle,
  sms_big_endian_b
);
input   [31:0]  ahb_sms0_haddr;      
input   [3 :0]  ahb_sms0_hprot;      
input           ahb_sms0_hsel;       
input   [2 :0]  ahb_sms0_hsize;      
input   [1 :0]  ahb_sms0_htrans;     
input   [31:0]  ahb_sms0_hwdata;     
input           ahb_sms0_hwrite;     
input   [31:0]  ahb_sms1_haddr;      
input   [3 :0]  ahb_sms1_hprot;      
input           ahb_sms1_hsel;       
input   [2 :0]  ahb_sms1_hsize;      
input   [1 :0]  ahb_sms1_htrans;     
input   [31:0]  ahb_sms1_hwdata;     
input           ahb_sms1_hwrite;     
input   [31:0]  ahb_sms2_haddr;      
input   [3 :0]  ahb_sms2_hprot;      
input           ahb_sms2_hsel;       
input   [2 :0]  ahb_sms2_hsize;      
input   [1 :0]  ahb_sms2_htrans;     
input   [31:0]  ahb_sms2_hwdata;     
input           ahb_sms2_hwrite;     
input   [31:0]  ahb_sms3_haddr;      
input   [3 :0]  ahb_sms3_hprot;      
input           ahb_sms3_hsel;       
input   [2 :0]  ahb_sms3_hsize;      
input   [1 :0]  ahb_sms3_htrans;     
input   [31:0]  ahb_sms3_hwdata;     
input           ahb_sms3_hwrite;     
input           pmu_sms_hclk;        
input           pmu_sms_hrst_b;      
input           sms_big_endian_b;    
output  [31:0]  sms0_ahb_hrdata;     
output          sms0_ahb_hready;     
output  [1 :0]  sms0_ahb_hresp;      
output          sms0_idle;           
output  [31:0]  sms1_ahb_hrdata;     
output          sms1_ahb_hready;     
output  [1 :0]  sms1_ahb_hresp;      
output          sms1_idle;           
output  [31:0]  sms2_ahb_hrdata;     
output          sms2_ahb_hready;     
output  [1 :0]  sms2_ahb_hresp;      
output          sms2_idle;           
output  [31:0]  sms3_ahb_hrdata;     
output          sms3_ahb_hready;     
output  [1 :0]  sms3_ahb_hresp;      
output          sms3_idle;           
wire    [31:0]  ahb_sms0_haddr;      
wire    [3 :0]  ahb_sms0_hprot;      
wire            ahb_sms0_hsel;       
wire    [2 :0]  ahb_sms0_hsize;      
wire    [1 :0]  ahb_sms0_htrans;     
wire    [31:0]  ahb_sms0_hwdata;     
wire            ahb_sms0_hwrite;     
wire    [31:0]  ahb_sms1_haddr;      
wire    [3 :0]  ahb_sms1_hprot;      
wire            ahb_sms1_hsel;       
wire    [2 :0]  ahb_sms1_hsize;      
wire    [1 :0]  ahb_sms1_htrans;     
wire    [31:0]  ahb_sms1_hwdata;     
wire            ahb_sms1_hwrite;     
wire    [31:0]  ahb_sms2_haddr;      
wire    [3 :0]  ahb_sms2_hprot;      
wire            ahb_sms2_hsel;       
wire    [2 :0]  ahb_sms2_hsize;      
wire    [1 :0]  ahb_sms2_htrans;     
wire    [31:0]  ahb_sms2_hwdata;     
wire            ahb_sms2_hwrite;     
wire    [31:0]  ahb_sms3_haddr;      
wire    [3 :0]  ahb_sms3_hprot;      
wire            ahb_sms3_hsel;       
wire    [2 :0]  ahb_sms3_hsize;      
wire    [1 :0]  ahb_sms3_htrans;     
wire    [31:0]  ahb_sms3_hwdata;     
wire            ahb_sms3_hwrite;     
wire            pmu_sms_hclk;        
wire            pmu_sms_hrst_b;      
wire            region_rd_deny_flag0; 
wire            region_rd_deny_flag1; 
wire            region_rd_deny_flag2; 
wire            region_rd_deny_flag3; 
wire            region_wr_deny_flag0; 
wire            region_wr_deny_flag1; 
wire            region_wr_deny_flag2; 
wire            region_wr_deny_flag3; 
wire    [31:0]  sms0_ahb_hrdata;     
wire            sms0_ahb_hready;     
wire    [1 :0]  sms0_ahb_hresp;      
wire            sms0_idle;           
wire    [31:0]  sms1_ahb_hrdata;     
wire            sms1_ahb_hready;     
wire    [1 :0]  sms1_ahb_hresp;      
wire            sms1_idle;           
wire    [31:0]  sms2_ahb_hrdata;     
wire            sms2_ahb_hready;     
wire    [1 :0]  sms2_ahb_hresp;      
wire            sms2_idle;           
wire    [31:0]  sms3_ahb_hrdata;     
wire            sms3_ahb_hready;     
wire    [1 :0]  sms3_ahb_hresp;      
wire            sms3_idle;           
wire            sms_big_endian_b;    
sms_bank_64k_top  x_sms0_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms0_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms0_hprot             ),
  .mem_hrdata                  (sms0_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms0_ahb_hready            ),
  .mem_hresp                   (sms0_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms0_hsel              ),
  .mem_hsize                   (ahb_sms0_hsize             ),
  .mem_htrans                  (ahb_sms0_htrans            ),
  .mem_hwdata                  (ahb_sms0_hwdata            ),
  .mem_hwrite                  (ahb_sms0_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag0       ),
  .region_wr_deny_flag         (region_wr_deny_flag0       ),
  .sms_idle0                   (sms0_idle                  )
);
sms_bank_64k_top  x_sms1_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms1_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms1_hprot             ),
  .mem_hrdata                  (sms1_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms1_ahb_hready            ),
  .mem_hresp                   (sms1_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms1_hsel              ),
  .mem_hsize                   (ahb_sms1_hsize             ),
  .mem_htrans                  (ahb_sms1_htrans            ),
  .mem_hwdata                  (ahb_sms1_hwdata            ),
  .mem_hwrite                  (ahb_sms1_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag1       ),
  .region_wr_deny_flag         (region_wr_deny_flag1       ),
  .sms_idle0                   (sms1_idle                  )
);
sms_bank_64k_top  x_sms2_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms2_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms2_hprot             ),
  .mem_hrdata                  (sms2_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms2_ahb_hready            ),
  .mem_hresp                   (sms2_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms2_hsel              ),
  .mem_hsize                   (ahb_sms2_hsize             ),
  .mem_htrans                  (ahb_sms2_htrans            ),
  .mem_hwdata                  (ahb_sms2_hwdata            ),
  .mem_hwrite                  (ahb_sms2_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag2       ),
  .region_wr_deny_flag         (region_wr_deny_flag2       ),
  .sms_idle0                   (sms2_idle                  )
);
sms_bank_64k_top  x_isram_top (
  .big_endian_b                 (sms_big_endian_b            ),
  .mem_haddr                    (ahb_sms3_haddr              ),
  .mem_hclk                     (pmu_sms_hclk                ),
  .mem_hprot                    (ahb_sms3_hprot              ),
  .mem_hrdata                   (sms3_ahb_hrdata             ),
  .mem_hready                   (1'b1                        ),
  .mem_hready_resp              (sms3_ahb_hready             ),
  .mem_hresp                    (sms3_ahb_hresp              ),
  .mem_hrst_b                   (pmu_sms_hrst_b              ),
  .mem_hsel                     (ahb_sms3_hsel               ),
  .mem_hsize                    (ahb_sms3_hsize              ),
  .mem_htrans                   (ahb_sms3_htrans             ),
  .mem_hwdata                   (ahb_sms3_hwdata             ),
  .mem_hwrite                   (ahb_sms3_hwrite             ),
  .region_rd_deny_flag          (region_rd_deny_flag3        ),
  .region_wr_deny_flag          (region_wr_deny_flag3        ),
  .sms_idle0                    (sms3_idle                   )
);
assign region_rd_deny_flag0 = 1'b0;
assign region_rd_deny_flag1 = 1'b0;
assign region_rd_deny_flag2 = 1'b0;
assign region_rd_deny_flag3 = 1'b0;
assign region_wr_deny_flag0 = 1'b0;
assign region_wr_deny_flag1 = 1'b0;
assign region_wr_deny_flag2 = 1'b0;
assign region_wr_deny_flag3 = 1'b0;
endmodule
