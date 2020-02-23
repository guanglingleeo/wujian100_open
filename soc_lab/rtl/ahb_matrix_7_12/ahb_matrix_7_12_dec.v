/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ahb_matrix_7_12_dec(
  hclk,
  hresetn,
  m0_haddr,
  m0_hburst,
  m0_hgrant,
  m0_hprot,
  m0_hrdata,
  m0_hready,
  m0_hresp,
  m0_hsize,
  m0_htrans,
  m0_hwdata,
  m0_hwrite,
  m0_latch_cmd,
  m0_nor_hready,
  m0_s0_cmd_cur,
  m0_s0_cmd_last,
  m0_s0_data,
  m0_s0_req,
  m0_s10_cmd_cur,
  m0_s10_cmd_last,
  m0_s10_data,
  m0_s10_req,
  m0_s11_cmd_cur,
  m0_s11_cmd_last,
  m0_s11_data,
  m0_s11_req,
  m0_s1_cmd_cur,
  m0_s1_cmd_last,
  m0_s1_data,
  m0_s1_req,
  m0_s2_cmd_cur,
  m0_s2_cmd_last,
  m0_s2_data,
  m0_s2_req,
  m0_s3_cmd_cur,
  m0_s3_cmd_last,
  m0_s3_data,
  m0_s3_req,
  m0_s4_cmd_cur,
  m0_s4_cmd_last,
  m0_s4_data,
  m0_s4_req,
  m0_s5_cmd_cur,
  m0_s5_cmd_last,
  m0_s5_data,
  m0_s5_req,
  m0_s6_cmd_cur,
  m0_s6_cmd_last,
  m0_s6_data,
  m0_s6_req,
  m0_s7_cmd_cur,
  m0_s7_cmd_last,
  m0_s7_data,
  m0_s7_req,
  m0_s8_cmd_cur,
  m0_s8_cmd_last,
  m0_s8_data,
  m0_s8_req,
  m0_s9_cmd_cur,
  m0_s9_cmd_last,
  m0_s9_data,
  m0_s9_req,
  m1_haddr,
  m1_hburst,
  m1_hgrant,
  m1_hprot,
  m1_hrdata,
  m1_hready,
  m1_hresp,
  m1_hsize,
  m1_htrans,
  m1_hwdata,
  m1_hwrite,
  m1_latch_cmd,
  m1_nor_hready,
  m1_s0_cmd_cur,
  m1_s0_cmd_last,
  m1_s0_data,
  m1_s0_req,
  m1_s10_cmd_cur,
  m1_s10_cmd_last,
  m1_s10_data,
  m1_s10_req,
  m1_s11_cmd_cur,
  m1_s11_cmd_last,
  m1_s11_data,
  m1_s11_req,
  m1_s1_cmd_cur,
  m1_s1_cmd_last,
  m1_s1_data,
  m1_s1_req,
  m1_s2_cmd_cur,
  m1_s2_cmd_last,
  m1_s2_data,
  m1_s2_req,
  m1_s3_cmd_cur,
  m1_s3_cmd_last,
  m1_s3_data,
  m1_s3_req,
  m1_s4_cmd_cur,
  m1_s4_cmd_last,
  m1_s4_data,
  m1_s4_req,
  m1_s5_cmd_cur,
  m1_s5_cmd_last,
  m1_s5_data,
  m1_s5_req,
  m1_s6_cmd_cur,
  m1_s6_cmd_last,
  m1_s6_data,
  m1_s6_req,
  m1_s7_cmd_cur,
  m1_s7_cmd_last,
  m1_s7_data,
  m1_s7_req,
  m1_s8_cmd_cur,
  m1_s8_cmd_last,
  m1_s8_data,
  m1_s8_req,
  m1_s9_cmd_cur,
  m1_s9_cmd_last,
  m1_s9_data,
  m1_s9_req,
  m2_haddr,
  m2_hburst,
  m2_hgrant,
  m2_hprot,
  m2_hrdata,
  m2_hready,
  m2_hresp,
  m2_hsize,
  m2_htrans,
  m2_hwdata,
  m2_hwrite,
  m2_latch_cmd,
  m2_nor_hready,
  m2_s0_cmd_cur,
  m2_s0_cmd_last,
  m2_s0_data,
  m2_s0_req,
  m2_s10_cmd_cur,
  m2_s10_cmd_last,
  m2_s10_data,
  m2_s10_req,
  m2_s11_cmd_cur,
  m2_s11_cmd_last,
  m2_s11_data,
  m2_s11_req,
  m2_s1_cmd_cur,
  m2_s1_cmd_last,
  m2_s1_data,
  m2_s1_req,
  m2_s2_cmd_cur,
  m2_s2_cmd_last,
  m2_s2_data,
  m2_s2_req,
  m2_s3_cmd_cur,
  m2_s3_cmd_last,
  m2_s3_data,
  m2_s3_req,
  m2_s4_cmd_cur,
  m2_s4_cmd_last,
  m2_s4_data,
  m2_s4_req,
  m2_s5_cmd_cur,
  m2_s5_cmd_last,
  m2_s5_data,
  m2_s5_req,
  m2_s6_cmd_cur,
  m2_s6_cmd_last,
  m2_s6_data,
  m2_s6_req,
  m2_s7_cmd_cur,
  m2_s7_cmd_last,
  m2_s7_data,
  m2_s7_req,
  m2_s8_cmd_cur,
  m2_s8_cmd_last,
  m2_s8_data,
  m2_s8_req,
  m2_s9_cmd_cur,
  m2_s9_cmd_last,
  m2_s9_data,
  m2_s9_req,
  m3_haddr,
  m3_hburst,
  m3_hgrant,
  m3_hprot,
  m3_hrdata,
  m3_hready,
  m3_hresp,
  m3_hsize,
  m3_htrans,
  m3_hwdata,
  m3_hwrite,
  m3_latch_cmd,
  m3_nor_hready,
  m3_s0_cmd_cur,
  m3_s0_cmd_last,
  m3_s0_data,
  m3_s0_req,
  m3_s10_cmd_cur,
  m3_s10_cmd_last,
  m3_s10_data,
  m3_s10_req,
  m3_s11_cmd_cur,
  m3_s11_cmd_last,
  m3_s11_data,
  m3_s11_req,
  m3_s1_cmd_cur,
  m3_s1_cmd_last,
  m3_s1_data,
  m3_s1_req,
  m3_s2_cmd_cur,
  m3_s2_cmd_last,
  m3_s2_data,
  m3_s2_req,
  m3_s3_cmd_cur,
  m3_s3_cmd_last,
  m3_s3_data,
  m3_s3_req,
  m3_s4_cmd_cur,
  m3_s4_cmd_last,
  m3_s4_data,
  m3_s4_req,
  m3_s5_cmd_cur,
  m3_s5_cmd_last,
  m3_s5_data,
  m3_s5_req,
  m3_s6_cmd_cur,
  m3_s6_cmd_last,
  m3_s6_data,
  m3_s6_req,
  m3_s7_cmd_cur,
  m3_s7_cmd_last,
  m3_s7_data,
  m3_s7_req,
  m3_s8_cmd_cur,
  m3_s8_cmd_last,
  m3_s8_data,
  m3_s8_req,
  m3_s9_cmd_cur,
  m3_s9_cmd_last,
  m3_s9_data,
  m3_s9_req,
  m4_haddr,
  m4_hburst,
  m4_hgrant,
  m4_hprot,
  m4_hrdata,
  m4_hready,
  m4_hresp,
  m4_hsize,
  m4_htrans,
  m4_hwdata,
  m4_hwrite,
  m4_latch_cmd,
  m4_nor_hready,
  m4_s0_cmd_cur,
  m4_s0_cmd_last,
  m4_s0_data,
  m4_s0_req,
  m4_s10_cmd_cur,
  m4_s10_cmd_last,
  m4_s10_data,
  m4_s10_req,
  m4_s11_cmd_cur,
  m4_s11_cmd_last,
  m4_s11_data,
  m4_s11_req,
  m4_s1_cmd_cur,
  m4_s1_cmd_last,
  m4_s1_data,
  m4_s1_req,
  m4_s2_cmd_cur,
  m4_s2_cmd_last,
  m4_s2_data,
  m4_s2_req,
  m4_s3_cmd_cur,
  m4_s3_cmd_last,
  m4_s3_data,
  m4_s3_req,
  m4_s4_cmd_cur,
  m4_s4_cmd_last,
  m4_s4_data,
  m4_s4_req,
  m4_s5_cmd_cur,
  m4_s5_cmd_last,
  m4_s5_data,
  m4_s5_req,
  m4_s6_cmd_cur,
  m4_s6_cmd_last,
  m4_s6_data,
  m4_s6_req,
  m4_s7_cmd_cur,
  m4_s7_cmd_last,
  m4_s7_data,
  m4_s7_req,
  m4_s8_cmd_cur,
  m4_s8_cmd_last,
  m4_s8_data,
  m4_s8_req,
  m4_s9_cmd_cur,
  m4_s9_cmd_last,
  m4_s9_data,
  m4_s9_req,
  m5_haddr,
  m5_hburst,
  m5_hgrant,
  m5_hprot,
  m5_hrdata,
  m5_hready,
  m5_hresp,
  m5_hsize,
  m5_htrans,
  m5_hwdata,
  m5_hwrite,
  m5_latch_cmd,
  m5_nor_hready,
  m5_s0_cmd_cur,
  m5_s0_cmd_last,
  m5_s0_data,
  m5_s0_req,
  m5_s10_cmd_cur,
  m5_s10_cmd_last,
  m5_s10_data,
  m5_s10_req,
  m5_s11_cmd_cur,
  m5_s11_cmd_last,
  m5_s11_data,
  m5_s11_req,
  m5_s1_cmd_cur,
  m5_s1_cmd_last,
  m5_s1_data,
  m5_s1_req,
  m5_s2_cmd_cur,
  m5_s2_cmd_last,
  m5_s2_data,
  m5_s2_req,
  m5_s3_cmd_cur,
  m5_s3_cmd_last,
  m5_s3_data,
  m5_s3_req,
  m5_s4_cmd_cur,
  m5_s4_cmd_last,
  m5_s4_data,
  m5_s4_req,
  m5_s5_cmd_cur,
  m5_s5_cmd_last,
  m5_s5_data,
  m5_s5_req,
  m5_s6_cmd_cur,
  m5_s6_cmd_last,
  m5_s6_data,
  m5_s6_req,
  m5_s7_cmd_cur,
  m5_s7_cmd_last,
  m5_s7_data,
  m5_s7_req,
  m5_s8_cmd_cur,
  m5_s8_cmd_last,
  m5_s8_data,
  m5_s8_req,
  m5_s9_cmd_cur,
  m5_s9_cmd_last,
  m5_s9_data,
  m5_s9_req,
  m6_haddr,
  m6_hburst,
  m6_hgrant,
  m6_hprot,
  m6_hrdata,
  m6_hready,
  m6_hresp,
  m6_hsize,
  m6_htrans,
  m6_hwdata,
  m6_hwrite,
  m6_latch_cmd,
  m6_nor_hready,
  m6_s0_cmd_cur,
  m6_s0_cmd_last,
  m6_s0_data,
  m6_s0_req,
  m6_s10_cmd_cur,
  m6_s10_cmd_last,
  m6_s10_data,
  m6_s10_req,
  m6_s11_cmd_cur,
  m6_s11_cmd_last,
  m6_s11_data,
  m6_s11_req,
  m6_s1_cmd_cur,
  m6_s1_cmd_last,
  m6_s1_data,
  m6_s1_req,
  m6_s2_cmd_cur,
  m6_s2_cmd_last,
  m6_s2_data,
  m6_s2_req,
  m6_s3_cmd_cur,
  m6_s3_cmd_last,
  m6_s3_data,
  m6_s3_req,
  m6_s4_cmd_cur,
  m6_s4_cmd_last,
  m6_s4_data,
  m6_s4_req,
  m6_s5_cmd_cur,
  m6_s5_cmd_last,
  m6_s5_data,
  m6_s5_req,
  m6_s6_cmd_cur,
  m6_s6_cmd_last,
  m6_s6_data,
  m6_s6_req,
  m6_s7_cmd_cur,
  m6_s7_cmd_last,
  m6_s7_data,
  m6_s7_req,
  m6_s8_cmd_cur,
  m6_s8_cmd_last,
  m6_s8_data,
  m6_s8_req,
  m6_s9_cmd_cur,
  m6_s9_cmd_last,
  m6_s9_data,
  m6_s9_req,
  s0_haddr,
  s0_hburst,
  s0_hprot,
  s0_hrdata,
  s0_hresp,
  s0_hselx,
  s0_hsize,
  s0_htrans,
  s0_hwdata,
  s0_hwrite,
  s0_req,
  s10_haddr,
  s10_hburst,
  s10_hprot,
  s10_hrdata,
  s10_hresp,
  s10_hselx,
  s10_hsize,
  s10_htrans,
  s10_hwdata,
  s10_hwrite,
  s10_req,
  s11_haddr,
  s11_hburst,
  s11_hprot,
  s11_hrdata,
  s11_hresp,
  s11_hselx,
  s11_hsize,
  s11_htrans,
  s11_hwdata,
  s11_hwrite,
  s11_req,
  s1_haddr,
  s1_hburst,
  s1_hprot,
  s1_hrdata,
  s1_hresp,
  s1_hselx,
  s1_hsize,
  s1_htrans,
  s1_hwdata,
  s1_hwrite,
  s1_req,
  s2_haddr,
  s2_hburst,
  s2_hprot,
  s2_hrdata,
  s2_hresp,
  s2_hselx,
  s2_hsize,
  s2_htrans,
  s2_hwdata,
  s2_hwrite,
  s2_req,
  s3_haddr,
  s3_hburst,
  s3_hprot,
  s3_hrdata,
  s3_hresp,
  s3_hselx,
  s3_hsize,
  s3_htrans,
  s3_hwdata,
  s3_hwrite,
  s3_req,
  s4_haddr,
  s4_hburst,
  s4_hprot,
  s4_hrdata,
  s4_hresp,
  s4_hselx,
  s4_hsize,
  s4_htrans,
  s4_hwdata,
  s4_hwrite,
  s4_req,
  s5_haddr,
  s5_hburst,
  s5_hprot,
  s5_hrdata,
  s5_hresp,
  s5_hselx,
  s5_hsize,
  s5_htrans,
  s5_hwdata,
  s5_hwrite,
  s5_req,
  s6_haddr,
  s6_hburst,
  s6_hprot,
  s6_hrdata,
  s6_hresp,
  s6_hselx,
  s6_hsize,
  s6_htrans,
  s6_hwdata,
  s6_hwrite,
  s6_req,
  s7_haddr,
  s7_hburst,
  s7_hprot,
  s7_hrdata,
  s7_hresp,
  s7_hselx,
  s7_hsize,
  s7_htrans,
  s7_hwdata,
  s7_hwrite,
  s7_req,
  s8_haddr,
  s8_hburst,
  s8_hprot,
  s8_hrdata,
  s8_hresp,
  s8_hselx,
  s8_hsize,
  s8_htrans,
  s8_hwdata,
  s8_hwrite,
  s8_req,
  s9_haddr,
  s9_hburst,
  s9_hprot,
  s9_hrdata,
  s9_hresp,
  s9_hselx,
  s9_hsize,
  s9_htrans,
  s9_hwdata,
  s9_hwrite,
  s9_req
);
input           hclk;           
input           hresetn;        
input   [31:0]  m0_haddr;       
input   [2 :0]  m0_hburst;      
input   [3 :0]  m0_hprot;       
input   [2 :0]  m0_hsize;       
input   [1 :0]  m0_htrans;      
input   [31:0]  m0_hwdata;      
input           m0_hwrite;      
input           m0_latch_cmd;   
input           m0_nor_hready;  
input           m0_s0_cmd_cur;  
input           m0_s0_cmd_last; 
input           m0_s0_data;     
input           m0_s10_cmd_cur; 
input           m0_s10_cmd_last; 
input           m0_s10_data;    
input           m0_s11_cmd_cur; 
input           m0_s11_cmd_last; 
input           m0_s11_data;    
input           m0_s1_cmd_cur;  
input           m0_s1_cmd_last; 
input           m0_s1_data;     
input           m0_s2_cmd_cur;  
input           m0_s2_cmd_last; 
input           m0_s2_data;     
input           m0_s3_cmd_cur;  
input           m0_s3_cmd_last; 
input           m0_s3_data;     
input           m0_s4_cmd_cur;  
input           m0_s4_cmd_last; 
input           m0_s4_data;     
input           m0_s5_cmd_cur;  
input           m0_s5_cmd_last; 
input           m0_s5_data;     
input           m0_s6_cmd_cur;  
input           m0_s6_cmd_last; 
input           m0_s6_data;     
input           m0_s7_cmd_cur;  
input           m0_s7_cmd_last; 
input           m0_s7_data;     
input           m0_s8_cmd_cur;  
input           m0_s8_cmd_last; 
input           m0_s8_data;     
input           m0_s9_cmd_cur;  
input           m0_s9_cmd_last; 
input           m0_s9_data;     
input   [31:0]  m1_haddr;       
input   [2 :0]  m1_hburst;      
input   [3 :0]  m1_hprot;       
input   [2 :0]  m1_hsize;       
input   [1 :0]  m1_htrans;      
input   [31:0]  m1_hwdata;      
input           m1_hwrite;      
input           m1_latch_cmd;   
input           m1_nor_hready;  
input           m1_s0_cmd_cur;  
input           m1_s0_cmd_last; 
input           m1_s0_data;     
input           m1_s10_cmd_cur; 
input           m1_s10_cmd_last; 
input           m1_s10_data;    
input           m1_s11_cmd_cur; 
input           m1_s11_cmd_last; 
input           m1_s11_data;    
input           m1_s1_cmd_cur;  
input           m1_s1_cmd_last; 
input           m1_s1_data;     
input           m1_s2_cmd_cur;  
input           m1_s2_cmd_last; 
input           m1_s2_data;     
input           m1_s3_cmd_cur;  
input           m1_s3_cmd_last; 
input           m1_s3_data;     
input           m1_s4_cmd_cur;  
input           m1_s4_cmd_last; 
input           m1_s4_data;     
input           m1_s5_cmd_cur;  
input           m1_s5_cmd_last; 
input           m1_s5_data;     
input           m1_s6_cmd_cur;  
input           m1_s6_cmd_last; 
input           m1_s6_data;     
input           m1_s7_cmd_cur;  
input           m1_s7_cmd_last; 
input           m1_s7_data;     
input           m1_s8_cmd_cur;  
input           m1_s8_cmd_last; 
input           m1_s8_data;     
input           m1_s9_cmd_cur;  
input           m1_s9_cmd_last; 
input           m1_s9_data;     
input   [31:0]  m2_haddr;       
input   [2 :0]  m2_hburst;      
input   [3 :0]  m2_hprot;       
input   [2 :0]  m2_hsize;       
input   [1 :0]  m2_htrans;      
input   [31:0]  m2_hwdata;      
input           m2_hwrite;      
input           m2_latch_cmd;   
input           m2_nor_hready;  
input           m2_s0_cmd_cur;  
input           m2_s0_cmd_last; 
input           m2_s0_data;     
input           m2_s10_cmd_cur; 
input           m2_s10_cmd_last; 
input           m2_s10_data;    
input           m2_s11_cmd_cur; 
input           m2_s11_cmd_last; 
input           m2_s11_data;    
input           m2_s1_cmd_cur;  
input           m2_s1_cmd_last; 
input           m2_s1_data;     
input           m2_s2_cmd_cur;  
input           m2_s2_cmd_last; 
input           m2_s2_data;     
input           m2_s3_cmd_cur;  
input           m2_s3_cmd_last; 
input           m2_s3_data;     
input           m2_s4_cmd_cur;  
input           m2_s4_cmd_last; 
input           m2_s4_data;     
input           m2_s5_cmd_cur;  
input           m2_s5_cmd_last; 
input           m2_s5_data;     
input           m2_s6_cmd_cur;  
input           m2_s6_cmd_last; 
input           m2_s6_data;     
input           m2_s7_cmd_cur;  
input           m2_s7_cmd_last; 
input           m2_s7_data;     
input           m2_s8_cmd_cur;  
input           m2_s8_cmd_last; 
input           m2_s8_data;     
input           m2_s9_cmd_cur;  
input           m2_s9_cmd_last; 
input           m2_s9_data;     
input   [31:0]  m3_haddr;       
input   [2 :0]  m3_hburst;      
input   [3 :0]  m3_hprot;       
input   [2 :0]  m3_hsize;       
input   [1 :0]  m3_htrans;      
input   [31:0]  m3_hwdata;      
input           m3_hwrite;      
input           m3_latch_cmd;   
input           m3_nor_hready;  
input           m3_s0_cmd_cur;  
input           m3_s0_cmd_last; 
input           m3_s0_data;     
input           m3_s10_cmd_cur; 
input           m3_s10_cmd_last; 
input           m3_s10_data;    
input           m3_s11_cmd_cur; 
input           m3_s11_cmd_last; 
input           m3_s11_data;    
input           m3_s1_cmd_cur;  
input           m3_s1_cmd_last; 
input           m3_s1_data;     
input           m3_s2_cmd_cur;  
input           m3_s2_cmd_last; 
input           m3_s2_data;     
input           m3_s3_cmd_cur;  
input           m3_s3_cmd_last; 
input           m3_s3_data;     
input           m3_s4_cmd_cur;  
input           m3_s4_cmd_last; 
input           m3_s4_data;     
input           m3_s5_cmd_cur;  
input           m3_s5_cmd_last; 
input           m3_s5_data;     
input           m3_s6_cmd_cur;  
input           m3_s6_cmd_last; 
input           m3_s6_data;     
input           m3_s7_cmd_cur;  
input           m3_s7_cmd_last; 
input           m3_s7_data;     
input           m3_s8_cmd_cur;  
input           m3_s8_cmd_last; 
input           m3_s8_data;     
input           m3_s9_cmd_cur;  
input           m3_s9_cmd_last; 
input           m3_s9_data;     
input   [31:0]  m4_haddr;       
input   [2 :0]  m4_hburst;      
input   [3 :0]  m4_hprot;       
input   [2 :0]  m4_hsize;       
input   [1 :0]  m4_htrans;      
input   [31:0]  m4_hwdata;      
input           m4_hwrite;      
input           m4_latch_cmd;   
input           m4_nor_hready;  
input           m4_s0_cmd_cur;  
input           m4_s0_cmd_last; 
input           m4_s0_data;     
input           m4_s10_cmd_cur; 
input           m4_s10_cmd_last; 
input           m4_s10_data;    
input           m4_s11_cmd_cur; 
input           m4_s11_cmd_last; 
input           m4_s11_data;    
input           m4_s1_cmd_cur;  
input           m4_s1_cmd_last; 
input           m4_s1_data;     
input           m4_s2_cmd_cur;  
input           m4_s2_cmd_last; 
input           m4_s2_data;     
input           m4_s3_cmd_cur;  
input           m4_s3_cmd_last; 
input           m4_s3_data;     
input           m4_s4_cmd_cur;  
input           m4_s4_cmd_last; 
input           m4_s4_data;     
input           m4_s5_cmd_cur;  
input           m4_s5_cmd_last; 
input           m4_s5_data;     
input           m4_s6_cmd_cur;  
input           m4_s6_cmd_last; 
input           m4_s6_data;     
input           m4_s7_cmd_cur;  
input           m4_s7_cmd_last; 
input           m4_s7_data;     
input           m4_s8_cmd_cur;  
input           m4_s8_cmd_last; 
input           m4_s8_data;     
input           m4_s9_cmd_cur;  
input           m4_s9_cmd_last; 
input           m4_s9_data;     
input   [31:0]  m5_haddr;       
input   [2 :0]  m5_hburst;      
input   [3 :0]  m5_hprot;       
input   [2 :0]  m5_hsize;       
input   [1 :0]  m5_htrans;      
input   [31:0]  m5_hwdata;      
input           m5_hwrite;      
input           m5_latch_cmd;   
input           m5_nor_hready;  
input           m5_s0_cmd_cur;  
input           m5_s0_cmd_last; 
input           m5_s0_data;     
input           m5_s10_cmd_cur; 
input           m5_s10_cmd_last; 
input           m5_s10_data;    
input           m5_s11_cmd_cur; 
input           m5_s11_cmd_last; 
input           m5_s11_data;    
input           m5_s1_cmd_cur;  
input           m5_s1_cmd_last; 
input           m5_s1_data;     
input           m5_s2_cmd_cur;  
input           m5_s2_cmd_last; 
input           m5_s2_data;     
input           m5_s3_cmd_cur;  
input           m5_s3_cmd_last; 
input           m5_s3_data;     
input           m5_s4_cmd_cur;  
input           m5_s4_cmd_last; 
input           m5_s4_data;     
input           m5_s5_cmd_cur;  
input           m5_s5_cmd_last; 
input           m5_s5_data;     
input           m5_s6_cmd_cur;  
input           m5_s6_cmd_last; 
input           m5_s6_data;     
input           m5_s7_cmd_cur;  
input           m5_s7_cmd_last; 
input           m5_s7_data;     
input           m5_s8_cmd_cur;  
input           m5_s8_cmd_last; 
input           m5_s8_data;     
input           m5_s9_cmd_cur;  
input           m5_s9_cmd_last; 
input           m5_s9_data;     
input   [31:0]  m6_haddr;       
input   [2 :0]  m6_hburst;      
input   [3 :0]  m6_hprot;       
input   [2 :0]  m6_hsize;       
input   [1 :0]  m6_htrans;      
input   [31:0]  m6_hwdata;      
input           m6_hwrite;      
input           m6_latch_cmd;   
input           m6_nor_hready;  
input           m6_s0_cmd_cur;  
input           m6_s0_cmd_last; 
input           m6_s0_data;     
input           m6_s10_cmd_cur; 
input           m6_s10_cmd_last; 
input           m6_s10_data;    
input           m6_s11_cmd_cur; 
input           m6_s11_cmd_last; 
input           m6_s11_data;    
input           m6_s1_cmd_cur;  
input           m6_s1_cmd_last; 
input           m6_s1_data;     
input           m6_s2_cmd_cur;  
input           m6_s2_cmd_last; 
input           m6_s2_data;     
input           m6_s3_cmd_cur;  
input           m6_s3_cmd_last; 
input           m6_s3_data;     
input           m6_s4_cmd_cur;  
input           m6_s4_cmd_last; 
input           m6_s4_data;     
input           m6_s5_cmd_cur;  
input           m6_s5_cmd_last; 
input           m6_s5_data;     
input           m6_s6_cmd_cur;  
input           m6_s6_cmd_last; 
input           m6_s6_data;     
input           m6_s7_cmd_cur;  
input           m6_s7_cmd_last; 
input           m6_s7_data;     
input           m6_s8_cmd_cur;  
input           m6_s8_cmd_last; 
input           m6_s8_data;     
input           m6_s9_cmd_cur;  
input           m6_s9_cmd_last; 
input           m6_s9_data;     
input   [31:0]  s0_hrdata;      
input   [1 :0]  s0_hresp;       
input   [31:0]  s10_hrdata;     
input   [1 :0]  s10_hresp;      
input   [31:0]  s11_hrdata;     
input   [1 :0]  s11_hresp;      
input   [31:0]  s1_hrdata;      
input   [1 :0]  s1_hresp;       
input   [31:0]  s2_hrdata;      
input   [1 :0]  s2_hresp;       
input   [31:0]  s3_hrdata;      
input   [1 :0]  s3_hresp;       
input   [31:0]  s4_hrdata;      
input   [1 :0]  s4_hresp;       
input   [31:0]  s5_hrdata;      
input   [1 :0]  s5_hresp;       
input   [31:0]  s6_hrdata;      
input   [1 :0]  s6_hresp;       
input   [31:0]  s7_hrdata;      
input   [1 :0]  s7_hresp;       
input   [31:0]  s8_hrdata;      
input   [1 :0]  s8_hresp;       
input   [31:0]  s9_hrdata;      
input   [1 :0]  s9_hresp;       
output          m0_hgrant;      
output  [31:0]  m0_hrdata;      
output          m0_hready;      
output  [1 :0]  m0_hresp;       
output          m0_s0_req;      
output          m0_s10_req;     
output          m0_s11_req;     
output          m0_s1_req;      
output          m0_s2_req;      
output          m0_s3_req;      
output          m0_s4_req;      
output          m0_s5_req;      
output          m0_s6_req;      
output          m0_s7_req;      
output          m0_s8_req;      
output          m0_s9_req;      
output          m1_hgrant;      
output  [31:0]  m1_hrdata;      
output          m1_hready;      
output  [1 :0]  m1_hresp;       
output          m1_s0_req;      
output          m1_s10_req;     
output          m1_s11_req;     
output          m1_s1_req;      
output          m1_s2_req;      
output          m1_s3_req;      
output          m1_s4_req;      
output          m1_s5_req;      
output          m1_s6_req;      
output          m1_s7_req;      
output          m1_s8_req;      
output          m1_s9_req;      
output          m2_hgrant;      
output  [31:0]  m2_hrdata;      
output          m2_hready;      
output  [1 :0]  m2_hresp;       
output          m2_s0_req;      
output          m2_s10_req;     
output          m2_s11_req;     
output          m2_s1_req;      
output          m2_s2_req;      
output          m2_s3_req;      
output          m2_s4_req;      
output          m2_s5_req;      
output          m2_s6_req;      
output          m2_s7_req;      
output          m2_s8_req;      
output          m2_s9_req;      
output          m3_hgrant;      
output  [31:0]  m3_hrdata;      
output          m3_hready;      
output  [1 :0]  m3_hresp;       
output          m3_s0_req;      
output          m3_s10_req;     
output          m3_s11_req;     
output          m3_s1_req;      
output          m3_s2_req;      
output          m3_s3_req;      
output          m3_s4_req;      
output          m3_s5_req;      
output          m3_s6_req;      
output          m3_s7_req;      
output          m3_s8_req;      
output          m3_s9_req;      
output          m4_hgrant;      
output  [31:0]  m4_hrdata;      
output          m4_hready;      
output  [1 :0]  m4_hresp;       
output          m4_s0_req;      
output          m4_s10_req;     
output          m4_s11_req;     
output          m4_s1_req;      
output          m4_s2_req;      
output          m4_s3_req;      
output          m4_s4_req;      
output          m4_s5_req;      
output          m4_s6_req;      
output          m4_s7_req;      
output          m4_s8_req;      
output          m4_s9_req;      
output          m5_hgrant;      
output  [31:0]  m5_hrdata;      
output          m5_hready;      
output  [1 :0]  m5_hresp;       
output          m5_s0_req;      
output          m5_s10_req;     
output          m5_s11_req;     
output          m5_s1_req;      
output          m5_s2_req;      
output          m5_s3_req;      
output          m5_s4_req;      
output          m5_s5_req;      
output          m5_s6_req;      
output          m5_s7_req;      
output          m5_s8_req;      
output          m5_s9_req;      
output          m6_hgrant;      
output  [31:0]  m6_hrdata;      
output          m6_hready;      
output  [1 :0]  m6_hresp;       
output          m6_s0_req;      
output          m6_s10_req;     
output          m6_s11_req;     
output          m6_s1_req;      
output          m6_s2_req;      
output          m6_s3_req;      
output          m6_s4_req;      
output          m6_s5_req;      
output          m6_s6_req;      
output          m6_s7_req;      
output          m6_s8_req;      
output          m6_s9_req;      
output  [31:0]  s0_haddr;       
output  [2 :0]  s0_hburst;      
output  [3 :0]  s0_hprot;       
output          s0_hselx;       
output  [2 :0]  s0_hsize;       
output  [1 :0]  s0_htrans;      
output  [31:0]  s0_hwdata;      
output          s0_hwrite;      
output  [6 :0]  s0_req;         
output  [31:0]  s10_haddr;      
output  [2 :0]  s10_hburst;     
output  [3 :0]  s10_hprot;      
output          s10_hselx;      
output  [2 :0]  s10_hsize;      
output  [1 :0]  s10_htrans;     
output  [31:0]  s10_hwdata;     
output          s10_hwrite;     
output  [6 :0]  s10_req;        
output  [31:0]  s11_haddr;      
output  [2 :0]  s11_hburst;     
output  [3 :0]  s11_hprot;      
output          s11_hselx;      
output  [2 :0]  s11_hsize;      
output  [1 :0]  s11_htrans;     
output  [31:0]  s11_hwdata;     
output          s11_hwrite;     
output  [6 :0]  s11_req;        
output  [31:0]  s1_haddr;       
output  [2 :0]  s1_hburst;      
output  [3 :0]  s1_hprot;       
output          s1_hselx;       
output  [2 :0]  s1_hsize;       
output  [1 :0]  s1_htrans;      
output  [31:0]  s1_hwdata;      
output          s1_hwrite;      
output  [6 :0]  s1_req;         
output  [31:0]  s2_haddr;       
output  [2 :0]  s2_hburst;      
output  [3 :0]  s2_hprot;       
output          s2_hselx;       
output  [2 :0]  s2_hsize;       
output  [1 :0]  s2_htrans;      
output  [31:0]  s2_hwdata;      
output          s2_hwrite;      
output  [6 :0]  s2_req;         
output  [31:0]  s3_haddr;       
output  [2 :0]  s3_hburst;      
output  [3 :0]  s3_hprot;       
output          s3_hselx;       
output  [2 :0]  s3_hsize;       
output  [1 :0]  s3_htrans;      
output  [31:0]  s3_hwdata;      
output          s3_hwrite;      
output  [6 :0]  s3_req;         
output  [31:0]  s4_haddr;       
output  [2 :0]  s4_hburst;      
output  [3 :0]  s4_hprot;       
output          s4_hselx;       
output  [2 :0]  s4_hsize;       
output  [1 :0]  s4_htrans;      
output  [31:0]  s4_hwdata;      
output          s4_hwrite;      
output  [6 :0]  s4_req;         
output  [31:0]  s5_haddr;       
output  [2 :0]  s5_hburst;      
output  [3 :0]  s5_hprot;       
output          s5_hselx;       
output  [2 :0]  s5_hsize;       
output  [1 :0]  s5_htrans;      
output  [31:0]  s5_hwdata;      
output          s5_hwrite;      
output  [6 :0]  s5_req;         
output  [31:0]  s6_haddr;       
output  [2 :0]  s6_hburst;      
output  [3 :0]  s6_hprot;       
output          s6_hselx;       
output  [2 :0]  s6_hsize;       
output  [1 :0]  s6_htrans;      
output  [31:0]  s6_hwdata;      
output          s6_hwrite;      
output  [6 :0]  s6_req;         
output  [31:0]  s7_haddr;       
output  [2 :0]  s7_hburst;      
output  [3 :0]  s7_hprot;       
output          s7_hselx;       
output  [2 :0]  s7_hsize;       
output  [1 :0]  s7_htrans;      
output  [31:0]  s7_hwdata;      
output          s7_hwrite;      
output  [6 :0]  s7_req;         
output  [31:0]  s8_haddr;       
output  [2 :0]  s8_hburst;      
output  [3 :0]  s8_hprot;       
output          s8_hselx;       
output  [2 :0]  s8_hsize;       
output  [1 :0]  s8_htrans;      
output  [31:0]  s8_hwdata;      
output          s8_hwrite;      
output  [6 :0]  s8_req;         
output  [31:0]  s9_haddr;       
output  [2 :0]  s9_hburst;      
output  [3 :0]  s9_hprot;       
output          s9_hselx;       
output  [2 :0]  s9_hsize;       
output  [1 :0]  s9_htrans;      
output  [31:0]  s9_hwdata;      
output          s9_hwrite;      
output  [6 :0]  s9_req;         
reg             m0_addr_err_d;  
reg             m0_addr_err_d2; 
reg     [44:0]  m0_ctrl_bus_ff; 
reg             m1_addr_err_d;  
reg             m1_addr_err_d2; 
reg     [44:0]  m1_ctrl_bus_ff; 
reg             m2_addr_err_d;  
reg             m2_addr_err_d2; 
reg     [44:0]  m2_ctrl_bus_ff; 
reg             m3_addr_err_d;  
reg             m3_addr_err_d2; 
reg     [44:0]  m3_ctrl_bus_ff; 
reg             m4_addr_err_d;  
reg             m4_addr_err_d2; 
reg     [44:0]  m4_ctrl_bus_ff; 
reg             m5_addr_err_d;  
reg             m5_addr_err_d2; 
reg     [44:0]  m5_ctrl_bus_ff; 
reg             m6_addr_err_d;  
reg             m6_addr_err_d2; 
reg     [44:0]  m6_ctrl_bus_ff; 
wire            hclk;           
wire            hresetn;        
wire            m0_addr_err;    
wire    [44:0]  m0_ctrl_bus;    
wire            m0_err_hready;  
wire    [1 :0]  m0_err_hresp;   
wire    [31:0]  m0_haddr;       
wire    [2 :0]  m0_hburst;      
wire            m0_hgrant;      
wire    [3 :0]  m0_hprot;       
wire    [31:0]  m0_hrdata;      
wire            m0_hready;      
wire    [1 :0]  m0_hresp;       
wire    [2 :0]  m0_hsize;       
wire    [1 :0]  m0_htrans;      
wire    [31:0]  m0_hwdata;      
wire            m0_hwrite;      
wire            m0_latch_cmd;   
wire            m0_nor_hready;  
wire            m0_s0_cmd_cur;  
wire            m0_s0_cmd_last; 
wire    [44:0]  m0_s0_ctrl_bus; 
wire            m0_s0_data;     
wire            m0_s0_req;      
wire            m0_s10_cmd_cur; 
wire            m0_s10_cmd_last; 
wire    [44:0]  m0_s10_ctrl_bus; 
wire            m0_s10_data;    
wire            m0_s10_req;     
wire            m0_s11_cmd_cur; 
wire            m0_s11_cmd_last; 
wire    [44:0]  m0_s11_ctrl_bus; 
wire            m0_s11_data;    
wire            m0_s11_req;     
wire            m0_s1_cmd_cur;  
wire            m0_s1_cmd_last; 
wire    [44:0]  m0_s1_ctrl_bus; 
wire            m0_s1_data;     
wire            m0_s1_req;      
wire            m0_s2_cmd_cur;  
wire            m0_s2_cmd_last; 
wire    [44:0]  m0_s2_ctrl_bus; 
wire            m0_s2_data;     
wire            m0_s2_req;      
wire            m0_s3_cmd_cur;  
wire            m0_s3_cmd_last; 
wire    [44:0]  m0_s3_ctrl_bus; 
wire            m0_s3_data;     
wire            m0_s3_req;      
wire            m0_s4_cmd_cur;  
wire            m0_s4_cmd_last; 
wire    [44:0]  m0_s4_ctrl_bus; 
wire            m0_s4_data;     
wire            m0_s4_req;      
wire            m0_s5_cmd_cur;  
wire            m0_s5_cmd_last; 
wire    [44:0]  m0_s5_ctrl_bus; 
wire            m0_s5_data;     
wire            m0_s5_req;      
wire            m0_s6_cmd_cur;  
wire            m0_s6_cmd_last; 
wire    [44:0]  m0_s6_ctrl_bus; 
wire            m0_s6_data;     
wire            m0_s6_req;      
wire            m0_s7_cmd_cur;  
wire            m0_s7_cmd_last; 
wire    [44:0]  m0_s7_ctrl_bus; 
wire            m0_s7_data;     
wire            m0_s7_req;      
wire            m0_s8_cmd_cur;  
wire            m0_s8_cmd_last; 
wire    [44:0]  m0_s8_ctrl_bus; 
wire            m0_s8_data;     
wire            m0_s8_req;      
wire            m0_s9_cmd_cur;  
wire            m0_s9_cmd_last; 
wire    [44:0]  m0_s9_ctrl_bus; 
wire            m0_s9_data;     
wire            m0_s9_req;      
wire            m0_s_req;       
wire            m1_addr_err;    
wire    [44:0]  m1_ctrl_bus;    
wire            m1_err_hready;  
wire    [1 :0]  m1_err_hresp;   
wire    [31:0]  m1_haddr;       
wire    [2 :0]  m1_hburst;      
wire            m1_hgrant;      
wire    [3 :0]  m1_hprot;       
wire    [31:0]  m1_hrdata;      
wire            m1_hready;      
wire    [1 :0]  m1_hresp;       
wire    [2 :0]  m1_hsize;       
wire    [1 :0]  m1_htrans;      
wire    [31:0]  m1_hwdata;      
wire            m1_hwrite;      
wire            m1_latch_cmd;   
wire            m1_nor_hready;  
wire            m1_s0_cmd_cur;  
wire            m1_s0_cmd_last; 
wire    [44:0]  m1_s0_ctrl_bus; 
wire            m1_s0_data;     
wire            m1_s0_req;      
wire            m1_s10_cmd_cur; 
wire            m1_s10_cmd_last; 
wire    [44:0]  m1_s10_ctrl_bus; 
wire            m1_s10_data;    
wire            m1_s10_req;     
wire            m1_s11_cmd_cur; 
wire            m1_s11_cmd_last; 
wire    [44:0]  m1_s11_ctrl_bus; 
wire            m1_s11_data;    
wire            m1_s11_req;     
wire            m1_s1_cmd_cur;  
wire            m1_s1_cmd_last; 
wire    [44:0]  m1_s1_ctrl_bus; 
wire            m1_s1_data;     
wire            m1_s1_req;      
wire            m1_s2_cmd_cur;  
wire            m1_s2_cmd_last; 
wire    [44:0]  m1_s2_ctrl_bus; 
wire            m1_s2_data;     
wire            m1_s2_req;      
wire            m1_s3_cmd_cur;  
wire            m1_s3_cmd_last; 
wire    [44:0]  m1_s3_ctrl_bus; 
wire            m1_s3_data;     
wire            m1_s3_req;      
wire            m1_s4_cmd_cur;  
wire            m1_s4_cmd_last; 
wire    [44:0]  m1_s4_ctrl_bus; 
wire            m1_s4_data;     
wire            m1_s4_req;      
wire            m1_s5_cmd_cur;  
wire            m1_s5_cmd_last; 
wire    [44:0]  m1_s5_ctrl_bus; 
wire            m1_s5_data;     
wire            m1_s5_req;      
wire            m1_s6_cmd_cur;  
wire            m1_s6_cmd_last; 
wire    [44:0]  m1_s6_ctrl_bus; 
wire            m1_s6_data;     
wire            m1_s6_req;      
wire            m1_s7_cmd_cur;  
wire            m1_s7_cmd_last; 
wire    [44:0]  m1_s7_ctrl_bus; 
wire            m1_s7_data;     
wire            m1_s7_req;      
wire            m1_s8_cmd_cur;  
wire            m1_s8_cmd_last; 
wire    [44:0]  m1_s8_ctrl_bus; 
wire            m1_s8_data;     
wire            m1_s8_req;      
wire            m1_s9_cmd_cur;  
wire            m1_s9_cmd_last; 
wire    [44:0]  m1_s9_ctrl_bus; 
wire            m1_s9_data;     
wire            m1_s9_req;      
wire            m1_s_req;       
wire            m2_addr_err;    
wire    [44:0]  m2_ctrl_bus;    
wire            m2_err_hready;  
wire    [1 :0]  m2_err_hresp;   
wire    [31:0]  m2_haddr;       
wire    [2 :0]  m2_hburst;      
wire            m2_hgrant;      
wire    [3 :0]  m2_hprot;       
wire    [31:0]  m2_hrdata;      
wire            m2_hready;      
wire    [1 :0]  m2_hresp;       
wire    [2 :0]  m2_hsize;       
wire    [1 :0]  m2_htrans;      
wire    [31:0]  m2_hwdata;      
wire            m2_hwrite;      
wire            m2_latch_cmd;   
wire            m2_nor_hready;  
wire            m2_s0_cmd_cur;  
wire            m2_s0_cmd_last; 
wire    [44:0]  m2_s0_ctrl_bus; 
wire            m2_s0_data;     
wire            m2_s0_req;      
wire            m2_s10_cmd_cur; 
wire            m2_s10_cmd_last; 
wire    [44:0]  m2_s10_ctrl_bus; 
wire            m2_s10_data;    
wire            m2_s10_req;     
wire            m2_s11_cmd_cur; 
wire            m2_s11_cmd_last; 
wire    [44:0]  m2_s11_ctrl_bus; 
wire            m2_s11_data;    
wire            m2_s11_req;     
wire            m2_s1_cmd_cur;  
wire            m2_s1_cmd_last; 
wire    [44:0]  m2_s1_ctrl_bus; 
wire            m2_s1_data;     
wire            m2_s1_req;      
wire            m2_s2_cmd_cur;  
wire            m2_s2_cmd_last; 
wire    [44:0]  m2_s2_ctrl_bus; 
wire            m2_s2_data;     
wire            m2_s2_req;      
wire            m2_s3_cmd_cur;  
wire            m2_s3_cmd_last; 
wire    [44:0]  m2_s3_ctrl_bus; 
wire            m2_s3_data;     
wire            m2_s3_req;      
wire            m2_s4_cmd_cur;  
wire            m2_s4_cmd_last; 
wire    [44:0]  m2_s4_ctrl_bus; 
wire            m2_s4_data;     
wire            m2_s4_req;      
wire            m2_s5_cmd_cur;  
wire            m2_s5_cmd_last; 
wire    [44:0]  m2_s5_ctrl_bus; 
wire            m2_s5_data;     
wire            m2_s5_req;      
wire            m2_s6_cmd_cur;  
wire            m2_s6_cmd_last; 
wire    [44:0]  m2_s6_ctrl_bus; 
wire            m2_s6_data;     
wire            m2_s6_req;      
wire            m2_s7_cmd_cur;  
wire            m2_s7_cmd_last; 
wire    [44:0]  m2_s7_ctrl_bus; 
wire            m2_s7_data;     
wire            m2_s7_req;      
wire            m2_s8_cmd_cur;  
wire            m2_s8_cmd_last; 
wire    [44:0]  m2_s8_ctrl_bus; 
wire            m2_s8_data;     
wire            m2_s8_req;      
wire            m2_s9_cmd_cur;  
wire            m2_s9_cmd_last; 
wire    [44:0]  m2_s9_ctrl_bus; 
wire            m2_s9_data;     
wire            m2_s9_req;      
wire            m2_s_req;       
wire            m3_addr_err;    
wire    [44:0]  m3_ctrl_bus;    
wire            m3_err_hready;  
wire    [1 :0]  m3_err_hresp;   
wire    [31:0]  m3_haddr;       
wire    [2 :0]  m3_hburst;      
wire            m3_hgrant;      
wire    [3 :0]  m3_hprot;       
wire    [31:0]  m3_hrdata;      
wire            m3_hready;      
wire    [1 :0]  m3_hresp;       
wire    [2 :0]  m3_hsize;       
wire    [1 :0]  m3_htrans;      
wire    [31:0]  m3_hwdata;      
wire            m3_hwrite;      
wire            m3_latch_cmd;   
wire            m3_nor_hready;  
wire            m3_s0_cmd_cur;  
wire            m3_s0_cmd_last; 
wire    [44:0]  m3_s0_ctrl_bus; 
wire            m3_s0_data;     
wire            m3_s0_req;      
wire            m3_s10_cmd_cur; 
wire            m3_s10_cmd_last; 
wire    [44:0]  m3_s10_ctrl_bus; 
wire            m3_s10_data;    
wire            m3_s10_req;     
wire            m3_s11_cmd_cur; 
wire            m3_s11_cmd_last; 
wire    [44:0]  m3_s11_ctrl_bus; 
wire            m3_s11_data;    
wire            m3_s11_req;     
wire            m3_s1_cmd_cur;  
wire            m3_s1_cmd_last; 
wire    [44:0]  m3_s1_ctrl_bus; 
wire            m3_s1_data;     
wire            m3_s1_req;      
wire            m3_s2_cmd_cur;  
wire            m3_s2_cmd_last; 
wire    [44:0]  m3_s2_ctrl_bus; 
wire            m3_s2_data;     
wire            m3_s2_req;      
wire            m3_s3_cmd_cur;  
wire            m3_s3_cmd_last; 
wire    [44:0]  m3_s3_ctrl_bus; 
wire            m3_s3_data;     
wire            m3_s3_req;      
wire            m3_s4_cmd_cur;  
wire            m3_s4_cmd_last; 
wire    [44:0]  m3_s4_ctrl_bus; 
wire            m3_s4_data;     
wire            m3_s4_req;      
wire            m3_s5_cmd_cur;  
wire            m3_s5_cmd_last; 
wire    [44:0]  m3_s5_ctrl_bus; 
wire            m3_s5_data;     
wire            m3_s5_req;      
wire            m3_s6_cmd_cur;  
wire            m3_s6_cmd_last; 
wire    [44:0]  m3_s6_ctrl_bus; 
wire            m3_s6_data;     
wire            m3_s6_req;      
wire            m3_s7_cmd_cur;  
wire            m3_s7_cmd_last; 
wire    [44:0]  m3_s7_ctrl_bus; 
wire            m3_s7_data;     
wire            m3_s7_req;      
wire            m3_s8_cmd_cur;  
wire            m3_s8_cmd_last; 
wire    [44:0]  m3_s8_ctrl_bus; 
wire            m3_s8_data;     
wire            m3_s8_req;      
wire            m3_s9_cmd_cur;  
wire            m3_s9_cmd_last; 
wire    [44:0]  m3_s9_ctrl_bus; 
wire            m3_s9_data;     
wire            m3_s9_req;      
wire            m3_s_req;       
wire            m4_addr_err;    
wire    [44:0]  m4_ctrl_bus;    
wire            m4_err_hready;  
wire    [1 :0]  m4_err_hresp;   
wire    [31:0]  m4_haddr;       
wire    [2 :0]  m4_hburst;      
wire            m4_hgrant;      
wire    [3 :0]  m4_hprot;       
wire    [31:0]  m4_hrdata;      
wire            m4_hready;      
wire    [1 :0]  m4_hresp;       
wire    [2 :0]  m4_hsize;       
wire    [1 :0]  m4_htrans;      
wire    [31:0]  m4_hwdata;      
wire            m4_hwrite;      
wire            m4_latch_cmd;   
wire            m4_nor_hready;  
wire            m4_s0_cmd_cur;  
wire            m4_s0_cmd_last; 
wire    [44:0]  m4_s0_ctrl_bus; 
wire            m4_s0_data;     
wire            m4_s0_req;      
wire            m4_s10_cmd_cur; 
wire            m4_s10_cmd_last; 
wire    [44:0]  m4_s10_ctrl_bus; 
wire            m4_s10_data;    
wire            m4_s10_req;     
wire            m4_s11_cmd_cur; 
wire            m4_s11_cmd_last; 
wire    [44:0]  m4_s11_ctrl_bus; 
wire            m4_s11_data;    
wire            m4_s11_req;     
wire            m4_s1_cmd_cur;  
wire            m4_s1_cmd_last; 
wire    [44:0]  m4_s1_ctrl_bus; 
wire            m4_s1_data;     
wire            m4_s1_req;      
wire            m4_s2_cmd_cur;  
wire            m4_s2_cmd_last; 
wire    [44:0]  m4_s2_ctrl_bus; 
wire            m4_s2_data;     
wire            m4_s2_req;      
wire            m4_s3_cmd_cur;  
wire            m4_s3_cmd_last; 
wire    [44:0]  m4_s3_ctrl_bus; 
wire            m4_s3_data;     
wire            m4_s3_req;      
wire            m4_s4_cmd_cur;  
wire            m4_s4_cmd_last; 
wire    [44:0]  m4_s4_ctrl_bus; 
wire            m4_s4_data;     
wire            m4_s4_req;      
wire            m4_s5_cmd_cur;  
wire            m4_s5_cmd_last; 
wire    [44:0]  m4_s5_ctrl_bus; 
wire            m4_s5_data;     
wire            m4_s5_req;      
wire            m4_s6_cmd_cur;  
wire            m4_s6_cmd_last; 
wire    [44:0]  m4_s6_ctrl_bus; 
wire            m4_s6_data;     
wire            m4_s6_req;      
wire            m4_s7_cmd_cur;  
wire            m4_s7_cmd_last; 
wire    [44:0]  m4_s7_ctrl_bus; 
wire            m4_s7_data;     
wire            m4_s7_req;      
wire            m4_s8_cmd_cur;  
wire            m4_s8_cmd_last; 
wire    [44:0]  m4_s8_ctrl_bus; 
wire            m4_s8_data;     
wire            m4_s8_req;      
wire            m4_s9_cmd_cur;  
wire            m4_s9_cmd_last; 
wire    [44:0]  m4_s9_ctrl_bus; 
wire            m4_s9_data;     
wire            m4_s9_req;      
wire            m4_s_req;       
wire            m5_addr_err;    
wire    [44:0]  m5_ctrl_bus;    
wire            m5_err_hready;  
wire    [1 :0]  m5_err_hresp;   
wire    [31:0]  m5_haddr;       
wire    [2 :0]  m5_hburst;      
wire            m5_hgrant;      
wire    [3 :0]  m5_hprot;       
wire    [31:0]  m5_hrdata;      
wire            m5_hready;      
wire    [1 :0]  m5_hresp;       
wire    [2 :0]  m5_hsize;       
wire    [1 :0]  m5_htrans;      
wire    [31:0]  m5_hwdata;      
wire            m5_hwrite;      
wire            m5_latch_cmd;   
wire            m5_nor_hready;  
wire            m5_s0_cmd_cur;  
wire            m5_s0_cmd_last; 
wire    [44:0]  m5_s0_ctrl_bus; 
wire            m5_s0_data;     
wire            m5_s0_req;      
wire            m5_s10_cmd_cur; 
wire            m5_s10_cmd_last; 
wire    [44:0]  m5_s10_ctrl_bus; 
wire            m5_s10_data;    
wire            m5_s10_req;     
wire            m5_s11_cmd_cur; 
wire            m5_s11_cmd_last; 
wire    [44:0]  m5_s11_ctrl_bus; 
wire            m5_s11_data;    
wire            m5_s11_req;     
wire            m5_s1_cmd_cur;  
wire            m5_s1_cmd_last; 
wire    [44:0]  m5_s1_ctrl_bus; 
wire            m5_s1_data;     
wire            m5_s1_req;      
wire            m5_s2_cmd_cur;  
wire            m5_s2_cmd_last; 
wire    [44:0]  m5_s2_ctrl_bus; 
wire            m5_s2_data;     
wire            m5_s2_req;      
wire            m5_s3_cmd_cur;  
wire            m5_s3_cmd_last; 
wire    [44:0]  m5_s3_ctrl_bus; 
wire            m5_s3_data;     
wire            m5_s3_req;      
wire            m5_s4_cmd_cur;  
wire            m5_s4_cmd_last; 
wire    [44:0]  m5_s4_ctrl_bus; 
wire            m5_s4_data;     
wire            m5_s4_req;      
wire            m5_s5_cmd_cur;  
wire            m5_s5_cmd_last; 
wire    [44:0]  m5_s5_ctrl_bus; 
wire            m5_s5_data;     
wire            m5_s5_req;      
wire            m5_s6_cmd_cur;  
wire            m5_s6_cmd_last; 
wire    [44:0]  m5_s6_ctrl_bus; 
wire            m5_s6_data;     
wire            m5_s6_req;      
wire            m5_s7_cmd_cur;  
wire            m5_s7_cmd_last; 
wire    [44:0]  m5_s7_ctrl_bus; 
wire            m5_s7_data;     
wire            m5_s7_req;      
wire            m5_s8_cmd_cur;  
wire            m5_s8_cmd_last; 
wire    [44:0]  m5_s8_ctrl_bus; 
wire            m5_s8_data;     
wire            m5_s8_req;      
wire            m5_s9_cmd_cur;  
wire            m5_s9_cmd_last; 
wire    [44:0]  m5_s9_ctrl_bus; 
wire            m5_s9_data;     
wire            m5_s9_req;      
wire            m5_s_req;       
wire            m6_addr_err;    
wire    [44:0]  m6_ctrl_bus;    
wire            m6_err_hready;  
wire    [1 :0]  m6_err_hresp;   
wire    [31:0]  m6_haddr;       
wire    [2 :0]  m6_hburst;      
wire            m6_hgrant;      
wire    [3 :0]  m6_hprot;       
wire    [31:0]  m6_hrdata;      
wire            m6_hready;      
wire    [1 :0]  m6_hresp;       
wire    [2 :0]  m6_hsize;       
wire    [1 :0]  m6_htrans;      
wire    [31:0]  m6_hwdata;      
wire            m6_hwrite;      
wire            m6_latch_cmd;   
wire            m6_nor_hready;  
wire            m6_s0_cmd_cur;  
wire            m6_s0_cmd_last; 
wire    [44:0]  m6_s0_ctrl_bus; 
wire            m6_s0_data;     
wire            m6_s0_req;      
wire            m6_s10_cmd_cur; 
wire            m6_s10_cmd_last; 
wire    [44:0]  m6_s10_ctrl_bus; 
wire            m6_s10_data;    
wire            m6_s10_req;     
wire            m6_s11_cmd_cur; 
wire            m6_s11_cmd_last; 
wire    [44:0]  m6_s11_ctrl_bus; 
wire            m6_s11_data;    
wire            m6_s11_req;     
wire            m6_s1_cmd_cur;  
wire            m6_s1_cmd_last; 
wire    [44:0]  m6_s1_ctrl_bus; 
wire            m6_s1_data;     
wire            m6_s1_req;      
wire            m6_s2_cmd_cur;  
wire            m6_s2_cmd_last; 
wire    [44:0]  m6_s2_ctrl_bus; 
wire            m6_s2_data;     
wire            m6_s2_req;      
wire            m6_s3_cmd_cur;  
wire            m6_s3_cmd_last; 
wire    [44:0]  m6_s3_ctrl_bus; 
wire            m6_s3_data;     
wire            m6_s3_req;      
wire            m6_s4_cmd_cur;  
wire            m6_s4_cmd_last; 
wire    [44:0]  m6_s4_ctrl_bus; 
wire            m6_s4_data;     
wire            m6_s4_req;      
wire            m6_s5_cmd_cur;  
wire            m6_s5_cmd_last; 
wire    [44:0]  m6_s5_ctrl_bus; 
wire            m6_s5_data;     
wire            m6_s5_req;      
wire            m6_s6_cmd_cur;  
wire            m6_s6_cmd_last; 
wire    [44:0]  m6_s6_ctrl_bus; 
wire            m6_s6_data;     
wire            m6_s6_req;      
wire            m6_s7_cmd_cur;  
wire            m6_s7_cmd_last; 
wire    [44:0]  m6_s7_ctrl_bus; 
wire            m6_s7_data;     
wire            m6_s7_req;      
wire            m6_s8_cmd_cur;  
wire            m6_s8_cmd_last; 
wire    [44:0]  m6_s8_ctrl_bus; 
wire            m6_s8_data;     
wire            m6_s8_req;      
wire            m6_s9_cmd_cur;  
wire            m6_s9_cmd_last; 
wire    [44:0]  m6_s9_ctrl_bus; 
wire            m6_s9_data;     
wire            m6_s9_req;      
wire            m6_s_req;       
wire    [44:0]  s0_ctrl_bus;    
wire    [31:0]  s0_haddr;       
wire    [2 :0]  s0_hburst;      
wire    [3 :0]  s0_hprot;       
wire    [31:0]  s0_hrdata;      
wire    [1 :0]  s0_hresp;       
wire            s0_hselx;       
wire    [2 :0]  s0_hsize;       
wire    [1 :0]  s0_htrans;      
wire    [31:0]  s0_hwdata;      
wire            s0_hwrite;      
wire    [6 :0]  s0_req;         
wire    [44:0]  s10_ctrl_bus;   
wire    [31:0]  s10_haddr;      
wire    [2 :0]  s10_hburst;     
wire    [3 :0]  s10_hprot;      
wire    [31:0]  s10_hrdata;     
wire    [1 :0]  s10_hresp;      
wire            s10_hselx;      
wire    [2 :0]  s10_hsize;      
wire    [1 :0]  s10_htrans;     
wire    [31:0]  s10_hwdata;     
wire            s10_hwrite;     
wire    [6 :0]  s10_req;        
wire    [44:0]  s11_ctrl_bus;   
wire    [31:0]  s11_haddr;      
wire    [2 :0]  s11_hburst;     
wire    [3 :0]  s11_hprot;      
wire    [31:0]  s11_hrdata;     
wire    [1 :0]  s11_hresp;      
wire            s11_hselx;      
wire    [2 :0]  s11_hsize;      
wire    [1 :0]  s11_htrans;     
wire    [31:0]  s11_hwdata;     
wire            s11_hwrite;     
wire    [6 :0]  s11_req;        
wire    [44:0]  s1_ctrl_bus;    
wire    [31:0]  s1_haddr;       
wire    [2 :0]  s1_hburst;      
wire    [3 :0]  s1_hprot;       
wire    [31:0]  s1_hrdata;      
wire    [1 :0]  s1_hresp;       
wire            s1_hselx;       
wire    [2 :0]  s1_hsize;       
wire    [1 :0]  s1_htrans;      
wire    [31:0]  s1_hwdata;      
wire            s1_hwrite;      
wire    [6 :0]  s1_req;         
wire    [44:0]  s2_ctrl_bus;    
wire    [31:0]  s2_haddr;       
wire    [2 :0]  s2_hburst;      
wire    [3 :0]  s2_hprot;       
wire    [31:0]  s2_hrdata;      
wire    [1 :0]  s2_hresp;       
wire            s2_hselx;       
wire    [2 :0]  s2_hsize;       
wire    [1 :0]  s2_htrans;      
wire    [31:0]  s2_hwdata;      
wire            s2_hwrite;      
wire    [6 :0]  s2_req;         
wire    [44:0]  s3_ctrl_bus;    
wire    [31:0]  s3_haddr;       
wire    [2 :0]  s3_hburst;      
wire    [3 :0]  s3_hprot;       
wire    [31:0]  s3_hrdata;      
wire    [1 :0]  s3_hresp;       
wire            s3_hselx;       
wire    [2 :0]  s3_hsize;       
wire    [1 :0]  s3_htrans;      
wire    [31:0]  s3_hwdata;      
wire            s3_hwrite;      
wire    [6 :0]  s3_req;         
wire    [44:0]  s4_ctrl_bus;    
wire    [31:0]  s4_haddr;       
wire    [2 :0]  s4_hburst;      
wire    [3 :0]  s4_hprot;       
wire    [31:0]  s4_hrdata;      
wire    [1 :0]  s4_hresp;       
wire            s4_hselx;       
wire    [2 :0]  s4_hsize;       
wire    [1 :0]  s4_htrans;      
wire    [31:0]  s4_hwdata;      
wire            s4_hwrite;      
wire    [6 :0]  s4_req;         
wire    [44:0]  s5_ctrl_bus;    
wire    [31:0]  s5_haddr;       
wire    [2 :0]  s5_hburst;      
wire    [3 :0]  s5_hprot;       
wire    [31:0]  s5_hrdata;      
wire    [1 :0]  s5_hresp;       
wire            s5_hselx;       
wire    [2 :0]  s5_hsize;       
wire    [1 :0]  s5_htrans;      
wire    [31:0]  s5_hwdata;      
wire            s5_hwrite;      
wire    [6 :0]  s5_req;         
wire    [44:0]  s6_ctrl_bus;    
wire    [31:0]  s6_haddr;       
wire    [2 :0]  s6_hburst;      
wire    [3 :0]  s6_hprot;       
wire    [31:0]  s6_hrdata;      
wire    [1 :0]  s6_hresp;       
wire            s6_hselx;       
wire    [2 :0]  s6_hsize;       
wire    [1 :0]  s6_htrans;      
wire    [31:0]  s6_hwdata;      
wire            s6_hwrite;      
wire    [6 :0]  s6_req;         
wire    [44:0]  s7_ctrl_bus;    
wire    [31:0]  s7_haddr;       
wire    [2 :0]  s7_hburst;      
wire    [3 :0]  s7_hprot;       
wire    [31:0]  s7_hrdata;      
wire    [1 :0]  s7_hresp;       
wire            s7_hselx;       
wire    [2 :0]  s7_hsize;       
wire    [1 :0]  s7_htrans;      
wire    [31:0]  s7_hwdata;      
wire            s7_hwrite;      
wire    [6 :0]  s7_req;         
wire    [44:0]  s8_ctrl_bus;    
wire    [31:0]  s8_haddr;       
wire    [2 :0]  s8_hburst;      
wire    [3 :0]  s8_hprot;       
wire    [31:0]  s8_hrdata;      
wire    [1 :0]  s8_hresp;       
wire            s8_hselx;       
wire    [2 :0]  s8_hsize;       
wire    [1 :0]  s8_htrans;      
wire    [31:0]  s8_hwdata;      
wire            s8_hwrite;      
wire    [6 :0]  s8_req;         
wire    [44:0]  s9_ctrl_bus;    
wire    [31:0]  s9_haddr;       
wire    [2 :0]  s9_hburst;      
wire    [3 :0]  s9_hprot;       
wire    [31:0]  s9_hrdata;      
wire    [1 :0]  s9_hresp;       
wire            s9_hselx;       
wire    [2 :0]  s9_hsize;       
wire    [1 :0]  s9_htrans;      
wire    [31:0]  s9_hwdata;      
wire            s9_hwrite;      
wire    [6 :0]  s9_req;         
parameter BUS_WIDTH = 45;
assign m0_s0_req =( m0_haddr[31:0] >= 32'h00000000) & (m0_haddr[31:0] <= 32'h0000ffff) & (m0_htrans[1]);
assign m0_s1_req =( m0_haddr[31:0] >= 32'h10000000) & (m0_haddr[31:0] <= 32'h1007ffff) & (m0_htrans[1]);
assign m0_s2_req =( m0_haddr[31:0] >= 32'h20000000) & (m0_haddr[31:0] <= 32'h2000ffff) & (m0_htrans[1]);
assign m0_s3_req =( m0_haddr[31:0] >= 32'h20010000) & (m0_haddr[31:0] <= 32'h2001ffff) & (m0_htrans[1]);
assign m0_s4_req =( m0_haddr[31:0] >= 32'h20020000) & (m0_haddr[31:0] <= 32'h2002ffff) & (m0_htrans[1]);
assign m0_s5_req =( m0_haddr[31:0] >= 32'h30000000) & (m0_haddr[31:0] <= 32'h3fffffff) & (m0_htrans[1]);
assign m0_s6_req =( m0_haddr[31:0] >= 32'h40000000) & (m0_haddr[31:0] <= 32'h40003fff) & (m0_htrans[1]);
assign m0_s7_req =( m0_haddr[31:0] >= 32'h40010000) & (m0_haddr[31:0] <= 32'h4001ffff) & (m0_htrans[1]);
assign m0_s8_req =( m0_haddr[31:0] >= 32'h40020000) & (m0_haddr[31:0] <= 32'h4002ffff) & (m0_htrans[1]);
assign m0_s9_req =( m0_haddr[31:0] >= 32'h40100000) & (m0_haddr[31:0] <= 32'h401fffff) & (m0_htrans[1]);
assign m0_s10_req =( m0_haddr[31:0] >= 32'h40200000) & (m0_haddr[31:0] <= 32'h7fffffff) & (m0_htrans[1]);
assign m0_s11_req =( m0_haddr[31:0] >= 32'h80000000) & (m0_haddr[31:0] <= 32'h9fffffff) & (m0_htrans[1]);
assign m1_s0_req =( m1_haddr[31:0] >= 32'h00000000) & (m1_haddr[31:0] <= 32'h0000ffff) & (m1_htrans[1]);
assign m1_s1_req =( m1_haddr[31:0] >= 32'h10000000) & (m1_haddr[31:0] <= 32'h1007ffff) & (m1_htrans[1]);
assign m1_s2_req =( m1_haddr[31:0] >= 32'h20000000) & (m1_haddr[31:0] <= 32'h2000ffff) & (m1_htrans[1]);
assign m1_s3_req =( m1_haddr[31:0] >= 32'h20010000) & (m1_haddr[31:0] <= 32'h2001ffff) & (m1_htrans[1]);
assign m1_s4_req =( m1_haddr[31:0] >= 32'h20020000) & (m1_haddr[31:0] <= 32'h2002ffff) & (m1_htrans[1]);
assign m1_s5_req =( m1_haddr[31:0] >= 32'h30000000) & (m1_haddr[31:0] <= 32'h3fffffff) & (m1_htrans[1]);
assign m1_s6_req =( m1_haddr[31:0] >= 32'h40000000) & (m1_haddr[31:0] <= 32'h40003fff) & (m1_htrans[1]);
assign m1_s7_req =( m1_haddr[31:0] >= 32'h40010000) & (m1_haddr[31:0] <= 32'h4001ffff) & (m1_htrans[1]);
assign m1_s8_req =( m1_haddr[31:0] >= 32'h40020000) & (m1_haddr[31:0] <= 32'h4002ffff) & (m1_htrans[1]);
assign m1_s9_req =( m1_haddr[31:0] >= 32'h40100000) & (m1_haddr[31:0] <= 32'h401fffff) & (m1_htrans[1]);
assign m1_s10_req =( m1_haddr[31:0] >= 32'h40200000) & (m1_haddr[31:0] <= 32'h7fffffff) & (m1_htrans[1]);
assign m1_s11_req =( m1_haddr[31:0] >= 32'h80000000) & (m1_haddr[31:0] <= 32'h9fffffff) & (m1_htrans[1]);
assign m2_s0_req =( m2_haddr[31:0] >= 32'h00000000) & (m2_haddr[31:0] <= 32'h0000ffff) & (m2_htrans[1]);
assign m2_s1_req =( m2_haddr[31:0] >= 32'h10000000) & (m2_haddr[31:0] <= 32'h1007ffff) & (m2_htrans[1]);
assign m2_s2_req =( m2_haddr[31:0] >= 32'h20000000) & (m2_haddr[31:0] <= 32'h2000ffff) & (m2_htrans[1]);
assign m2_s3_req =( m2_haddr[31:0] >= 32'h20010000) & (m2_haddr[31:0] <= 32'h2001ffff) & (m2_htrans[1]);
assign m2_s4_req =( m2_haddr[31:0] >= 32'h20020000) & (m2_haddr[31:0] <= 32'h2002ffff) & (m2_htrans[1]);
assign m2_s5_req =( m2_haddr[31:0] >= 32'h30000000) & (m2_haddr[31:0] <= 32'h3fffffff) & (m2_htrans[1]);
assign m2_s6_req =( m2_haddr[31:0] >= 32'h40000000) & (m2_haddr[31:0] <= 32'h40003fff) & (m2_htrans[1]);
assign m2_s7_req =( m2_haddr[31:0] >= 32'h40010000) & (m2_haddr[31:0] <= 32'h4001ffff) & (m2_htrans[1]);
assign m2_s8_req =( m2_haddr[31:0] >= 32'h40020000) & (m2_haddr[31:0] <= 32'h4002ffff) & (m2_htrans[1]);
assign m2_s9_req =( m2_haddr[31:0] >= 32'h40100000) & (m2_haddr[31:0] <= 32'h401fffff) & (m2_htrans[1]);
assign m2_s10_req =( m2_haddr[31:0] >= 32'h40200000) & (m2_haddr[31:0] <= 32'h7fffffff) & (m2_htrans[1]);
assign m2_s11_req =( m2_haddr[31:0] >= 32'h80000000) & (m2_haddr[31:0] <= 32'h9fffffff) & (m2_htrans[1]);
assign m3_s0_req =( m3_haddr[31:0] >= 32'h00000000) & (m3_haddr[31:0] <= 32'h0000ffff) & (m3_htrans[1]);
assign m3_s1_req =( m3_haddr[31:0] >= 32'h10000000) & (m3_haddr[31:0] <= 32'h1007ffff) & (m3_htrans[1]);
assign m3_s2_req =( m3_haddr[31:0] >= 32'h20000000) & (m3_haddr[31:0] <= 32'h2000ffff) & (m3_htrans[1]);
assign m3_s3_req =( m3_haddr[31:0] >= 32'h20010000) & (m3_haddr[31:0] <= 32'h2001ffff) & (m3_htrans[1]);
assign m3_s4_req =( m3_haddr[31:0] >= 32'h20020000) & (m3_haddr[31:0] <= 32'h2002ffff) & (m3_htrans[1]);
assign m3_s5_req =( m3_haddr[31:0] >= 32'h30000000) & (m3_haddr[31:0] <= 32'h3fffffff) & (m3_htrans[1]);
assign m3_s6_req =( m3_haddr[31:0] >= 32'h40000000) & (m3_haddr[31:0] <= 32'h40003fff) & (m3_htrans[1]);
assign m3_s7_req =( m3_haddr[31:0] >= 32'h40010000) & (m3_haddr[31:0] <= 32'h4001ffff) & (m3_htrans[1]);
assign m3_s8_req =( m3_haddr[31:0] >= 32'h40020000) & (m3_haddr[31:0] <= 32'h4002ffff) & (m3_htrans[1]);
assign m3_s9_req =( m3_haddr[31:0] >= 32'h40100000) & (m3_haddr[31:0] <= 32'h401fffff) & (m3_htrans[1]);
assign m3_s10_req =( m3_haddr[31:0] >= 32'h40200000) & (m3_haddr[31:0] <= 32'h7fffffff) & (m3_htrans[1]);
assign m3_s11_req =( m3_haddr[31:0] >= 32'h80000000) & (m3_haddr[31:0] <= 32'h9fffffff) & (m3_htrans[1]);
assign m4_s0_req =( m4_haddr[31:0] >= 32'h00000000) & (m4_haddr[31:0] <= 32'h0000ffff) & (m4_htrans[1]);
assign m4_s1_req =( m4_haddr[31:0] >= 32'h10000000) & (m4_haddr[31:0] <= 32'h1007ffff) & (m4_htrans[1]);
assign m4_s2_req =( m4_haddr[31:0] >= 32'h20000000) & (m4_haddr[31:0] <= 32'h2000ffff) & (m4_htrans[1]);
assign m4_s3_req =( m4_haddr[31:0] >= 32'h20010000) & (m4_haddr[31:0] <= 32'h2001ffff) & (m4_htrans[1]);
assign m4_s4_req =( m4_haddr[31:0] >= 32'h20020000) & (m4_haddr[31:0] <= 32'h2002ffff) & (m4_htrans[1]);
assign m4_s5_req =( m4_haddr[31:0] >= 32'h30000000) & (m4_haddr[31:0] <= 32'h3fffffff) & (m4_htrans[1]);
assign m4_s6_req =( m4_haddr[31:0] >= 32'h40000000) & (m4_haddr[31:0] <= 32'h40003fff) & (m4_htrans[1]);
assign m4_s7_req =( m4_haddr[31:0] >= 32'h40010000) & (m4_haddr[31:0] <= 32'h4001ffff) & (m4_htrans[1]);
assign m4_s8_req =( m4_haddr[31:0] >= 32'h40020000) & (m4_haddr[31:0] <= 32'h4002ffff) & (m4_htrans[1]);
assign m4_s9_req =( m4_haddr[31:0] >= 32'h40100000) & (m4_haddr[31:0] <= 32'h401fffff) & (m4_htrans[1]);
assign m4_s10_req =( m4_haddr[31:0] >= 32'h40200000) & (m4_haddr[31:0] <= 32'h7fffffff) & (m4_htrans[1]);
assign m4_s11_req =( m4_haddr[31:0] >= 32'h80000000) & (m4_haddr[31:0] <= 32'h9fffffff) & (m4_htrans[1]);
assign m5_s0_req =( m5_haddr[31:0] >= 32'h00000000) & (m5_haddr[31:0] <= 32'h0000ffff) & (m5_htrans[1]);
assign m5_s1_req =( m5_haddr[31:0] >= 32'h10000000) & (m5_haddr[31:0] <= 32'h1007ffff) & (m5_htrans[1]);
assign m5_s2_req =( m5_haddr[31:0] >= 32'h20000000) & (m5_haddr[31:0] <= 32'h2000ffff) & (m5_htrans[1]);
assign m5_s3_req =( m5_haddr[31:0] >= 32'h20010000) & (m5_haddr[31:0] <= 32'h2001ffff) & (m5_htrans[1]);
assign m5_s4_req =( m5_haddr[31:0] >= 32'h20020000) & (m5_haddr[31:0] <= 32'h2002ffff) & (m5_htrans[1]);
assign m5_s5_req =( m5_haddr[31:0] >= 32'h30000000) & (m5_haddr[31:0] <= 32'h3fffffff) & (m5_htrans[1]);
assign m5_s6_req =( m5_haddr[31:0] >= 32'h40000000) & (m5_haddr[31:0] <= 32'h40003fff) & (m5_htrans[1]);
assign m5_s7_req =( m5_haddr[31:0] >= 32'h40010000) & (m5_haddr[31:0] <= 32'h4001ffff) & (m5_htrans[1]);
assign m5_s8_req =( m5_haddr[31:0] >= 32'h40020000) & (m5_haddr[31:0] <= 32'h4002ffff) & (m5_htrans[1]);
assign m5_s9_req =( m5_haddr[31:0] >= 32'h40100000) & (m5_haddr[31:0] <= 32'h401fffff) & (m5_htrans[1]);
assign m5_s10_req =( m5_haddr[31:0] >= 32'h40200000) & (m5_haddr[31:0] <= 32'h7fffffff) & (m5_htrans[1]);
assign m5_s11_req =( m5_haddr[31:0] >= 32'h80000000) & (m5_haddr[31:0] <= 32'h9fffffff) & (m5_htrans[1]);
assign m6_s0_req =( m6_haddr[31:0] >= 32'h00000000) & (m6_haddr[31:0] <= 32'h0000ffff) & (m6_htrans[1]);
assign m6_s1_req =( m6_haddr[31:0] >= 32'h10000000) & (m6_haddr[31:0] <= 32'h1007ffff) & (m6_htrans[1]);
assign m6_s2_req =( m6_haddr[31:0] >= 32'h20000000) & (m6_haddr[31:0] <= 32'h2000ffff) & (m6_htrans[1]);
assign m6_s3_req =( m6_haddr[31:0] >= 32'h20010000) & (m6_haddr[31:0] <= 32'h2001ffff) & (m6_htrans[1]);
assign m6_s4_req =( m6_haddr[31:0] >= 32'h20020000) & (m6_haddr[31:0] <= 32'h2002ffff) & (m6_htrans[1]);
assign m6_s5_req =( m6_haddr[31:0] >= 32'h30000000) & (m6_haddr[31:0] <= 32'h3fffffff) & (m6_htrans[1]);
assign m6_s6_req =( m6_haddr[31:0] >= 32'h40000000) & (m6_haddr[31:0] <= 32'h40003fff) & (m6_htrans[1]);
assign m6_s7_req =( m6_haddr[31:0] >= 32'h40010000) & (m6_haddr[31:0] <= 32'h4001ffff) & (m6_htrans[1]);
assign m6_s8_req =( m6_haddr[31:0] >= 32'h40020000) & (m6_haddr[31:0] <= 32'h4002ffff) & (m6_htrans[1]);
assign m6_s9_req =( m6_haddr[31:0] >= 32'h40100000) & (m6_haddr[31:0] <= 32'h401fffff) & (m6_htrans[1]);
assign m6_s10_req =( m6_haddr[31:0] >= 32'h40200000) & (m6_haddr[31:0] <= 32'h7fffffff) & (m6_htrans[1]);
assign m6_s11_req =( m6_haddr[31:0] >= 32'h80000000) & (m6_haddr[31:0] <= 32'h9fffffff) & (m6_htrans[1]);
assign m0_s_req = 
                    m0_s0_req |
                    m0_s1_req |
                    m0_s2_req |
                    m0_s3_req |
                    m0_s4_req |
                    m0_s5_req |
                    m0_s6_req |
                    m0_s7_req |
                    m0_s8_req |
                    m0_s9_req |
                    m0_s10_req |
                    m0_s11_req ;
assign m0_addr_err = m0_htrans[1] & (~m0_s_req) & m0_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m0_addr_err_d <= 1'b0;
         m0_addr_err_d2 <= 1'b0;
      end
      else begin
         m0_addr_err_d <= m0_addr_err;
         m0_addr_err_d2 <= m0_addr_err_d;
      end
   end
assign m0_err_hresp[1:0] = (m0_addr_err_d|m0_addr_err_d2) ? 2'b01: 2'b00;
assign m0_err_hready = (m0_addr_err_d & (~m0_addr_err_d2));
assign m1_s_req = 
                    m1_s0_req |
                    m1_s1_req |
                    m1_s2_req |
                    m1_s3_req |
                    m1_s4_req |
                    m1_s5_req |
                    m1_s6_req |
                    m1_s7_req |
                    m1_s8_req |
                    m1_s9_req |
                    m1_s10_req |
                    m1_s11_req ;
assign m1_addr_err = m1_htrans[1] & (~m1_s_req) & m1_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m1_addr_err_d <= 1'b0;
         m1_addr_err_d2 <= 1'b0;
      end
      else begin
         m1_addr_err_d <= m1_addr_err;
         m1_addr_err_d2 <= m1_addr_err_d;
      end
   end
assign m1_err_hresp[1:0] = (m1_addr_err_d|m1_addr_err_d2) ? 2'b01: 2'b00;
assign m1_err_hready = (m1_addr_err_d & (~m1_addr_err_d2));
assign m2_s_req = 
                    m2_s0_req |
                    m2_s1_req |
                    m2_s2_req |
                    m2_s3_req |
                    m2_s4_req |
                    m2_s5_req |
                    m2_s6_req |
                    m2_s7_req |
                    m2_s8_req |
                    m2_s9_req |
                    m2_s10_req |
                    m2_s11_req ;
assign m2_addr_err = m2_htrans[1] & (~m2_s_req) & m2_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m2_addr_err_d <= 1'b0;
         m2_addr_err_d2 <= 1'b0;
      end
      else begin
         m2_addr_err_d <= m2_addr_err;
         m2_addr_err_d2 <= m2_addr_err_d;
      end
   end
assign m2_err_hresp[1:0] = (m2_addr_err_d|m2_addr_err_d2) ? 2'b01: 2'b00;
assign m2_err_hready = (m2_addr_err_d & (~m2_addr_err_d2));
assign m3_s_req = 
                    m3_s0_req |
                    m3_s1_req |
                    m3_s2_req |
                    m3_s3_req |
                    m3_s4_req |
                    m3_s5_req |
                    m3_s6_req |
                    m3_s7_req |
                    m3_s8_req |
                    m3_s9_req |
                    m3_s10_req |
                    m3_s11_req ;
assign m3_addr_err = m3_htrans[1] & (~m3_s_req) & m3_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m3_addr_err_d <= 1'b0;
         m3_addr_err_d2 <= 1'b0;
      end
      else begin
         m3_addr_err_d <= m3_addr_err;
         m3_addr_err_d2 <= m3_addr_err_d;
      end
   end
assign m3_err_hresp[1:0] = (m3_addr_err_d|m3_addr_err_d2) ? 2'b01: 2'b00;
assign m3_err_hready = (m3_addr_err_d & (~m3_addr_err_d2));
assign m4_s_req = 
                    m4_s0_req |
                    m4_s1_req |
                    m4_s2_req |
                    m4_s3_req |
                    m4_s4_req |
                    m4_s5_req |
                    m4_s6_req |
                    m4_s7_req |
                    m4_s8_req |
                    m4_s9_req |
                    m4_s10_req |
                    m4_s11_req ;
assign m4_addr_err = m4_htrans[1] & (~m4_s_req) & m4_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m4_addr_err_d <= 1'b0;
         m4_addr_err_d2 <= 1'b0;
      end
      else begin
         m4_addr_err_d <= m4_addr_err;
         m4_addr_err_d2 <= m4_addr_err_d;
      end
   end
assign m4_err_hresp[1:0] = (m4_addr_err_d|m4_addr_err_d2) ? 2'b01: 2'b00;
assign m4_err_hready = (m4_addr_err_d & (~m4_addr_err_d2));
assign m5_s_req = 
                    m5_s0_req |
                    m5_s1_req |
                    m5_s2_req |
                    m5_s3_req |
                    m5_s4_req |
                    m5_s5_req |
                    m5_s6_req |
                    m5_s7_req |
                    m5_s8_req |
                    m5_s9_req |
                    m5_s10_req |
                    m5_s11_req ;
assign m5_addr_err = m5_htrans[1] & (~m5_s_req) & m5_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m5_addr_err_d <= 1'b0;
         m5_addr_err_d2 <= 1'b0;
      end
      else begin
         m5_addr_err_d <= m5_addr_err;
         m5_addr_err_d2 <= m5_addr_err_d;
      end
   end
assign m5_err_hresp[1:0] = (m5_addr_err_d|m5_addr_err_d2) ? 2'b01: 2'b00;
assign m5_err_hready = (m5_addr_err_d & (~m5_addr_err_d2));
assign m6_s_req = 
                    m6_s0_req |
                    m6_s1_req |
                    m6_s2_req |
                    m6_s3_req |
                    m6_s4_req |
                    m6_s5_req |
                    m6_s6_req |
                    m6_s7_req |
                    m6_s8_req |
                    m6_s9_req |
                    m6_s10_req |
                    m6_s11_req ;
assign m6_addr_err = m6_htrans[1] & (~m6_s_req) & m6_hready ;
always @ (posedge hclk or negedge hresetn)
   begin
      if(!hresetn) begin
         m6_addr_err_d <= 1'b0;
         m6_addr_err_d2 <= 1'b0;
      end
      else begin
         m6_addr_err_d <= m6_addr_err;
         m6_addr_err_d2 <= m6_addr_err_d;
      end
   end
assign m6_err_hresp[1:0] = (m6_addr_err_d|m6_addr_err_d2) ? 2'b01: 2'b00;
assign m6_err_hready = (m6_addr_err_d & (~m6_addr_err_d2));
assign s0_req[7-1:0] = {
                        m0_s0_req,
                        m1_s0_req,
                        m2_s0_req,
                        m3_s0_req,
                        m4_s0_req,
                        m5_s0_req,
                        m6_s0_req};
assign s1_req[7-1:0] = {
                        m0_s1_req,
                        m1_s1_req,
                        m2_s1_req,
                        m3_s1_req,
                        m4_s1_req,
                        m5_s1_req,
                        m6_s1_req};
assign s2_req[7-1:0] = {
                        m0_s2_req,
                        m1_s2_req,
                        m2_s2_req,
                        m3_s2_req,
                        m4_s2_req,
                        m5_s2_req,
                        m6_s2_req};
assign s3_req[7-1:0] = {
                        m0_s3_req,
                        m1_s3_req,
                        m2_s3_req,
                        m3_s3_req,
                        m4_s3_req,
                        m5_s3_req,
                        m6_s3_req};
assign s4_req[7-1:0] = {
                        m0_s4_req,
                        m1_s4_req,
                        m2_s4_req,
                        m3_s4_req,
                        m4_s4_req,
                        m5_s4_req,
                        m6_s4_req};
assign s5_req[7-1:0] = {
                        m0_s5_req,
                        m1_s5_req,
                        m2_s5_req,
                        m3_s5_req,
                        m4_s5_req,
                        m5_s5_req,
                        m6_s5_req};
assign s6_req[7-1:0] = {
                        m0_s6_req,
                        m1_s6_req,
                        m2_s6_req,
                        m3_s6_req,
                        m4_s6_req,
                        m5_s6_req,
                        m6_s6_req};
assign s7_req[7-1:0] = {
                        m0_s7_req,
                        m1_s7_req,
                        m2_s7_req,
                        m3_s7_req,
                        m4_s7_req,
                        m5_s7_req,
                        m6_s7_req};
assign s8_req[7-1:0] = {
                        m0_s8_req,
                        m1_s8_req,
                        m2_s8_req,
                        m3_s8_req,
                        m4_s8_req,
                        m5_s8_req,
                        m6_s8_req};
assign s9_req[7-1:0] = {
                        m0_s9_req,
                        m1_s9_req,
                        m2_s9_req,
                        m3_s9_req,
                        m4_s9_req,
                        m5_s9_req,
                        m6_s9_req};
assign s10_req[7-1:0] = {
                        m0_s10_req,
                        m1_s10_req,
                        m2_s10_req,
                        m3_s10_req,
                        m4_s10_req,
                        m5_s10_req,
                        m6_s10_req};
assign s11_req[7-1:0] = {
                        m0_s11_req,
                        m1_s11_req,
                        m2_s11_req,
                        m3_s11_req,
                        m4_s11_req,
                        m5_s11_req,
                        m6_s11_req};
assign m0_ctrl_bus[BUS_WIDTH-1:0] = {m0_haddr[32-1:0],m0_htrans[1:0],m0_hsize[2:0],m0_hburst[2:0],m0_hprot[3:0],m0_hwrite};
assign m1_ctrl_bus[BUS_WIDTH-1:0] = {m1_haddr[32-1:0],m1_htrans[1:0],m1_hsize[2:0],m1_hburst[2:0],m1_hprot[3:0],m1_hwrite};
assign m2_ctrl_bus[BUS_WIDTH-1:0] = {m2_haddr[32-1:0],m2_htrans[1:0],m2_hsize[2:0],m2_hburst[2:0],m2_hprot[3:0],m2_hwrite};
assign m3_ctrl_bus[BUS_WIDTH-1:0] = {m3_haddr[32-1:0],m3_htrans[1:0],m3_hsize[2:0],m3_hburst[2:0],m3_hprot[3:0],m3_hwrite};
assign m4_ctrl_bus[BUS_WIDTH-1:0] = {m4_haddr[32-1:0],m4_htrans[1:0],m4_hsize[2:0],m4_hburst[2:0],m4_hprot[3:0],m4_hwrite};
assign m5_ctrl_bus[BUS_WIDTH-1:0] = {m5_haddr[32-1:0],m5_htrans[1:0],m5_hsize[2:0],m5_hburst[2:0],m5_hprot[3:0],m5_hwrite};
assign m6_ctrl_bus[BUS_WIDTH-1:0] = {m6_haddr[32-1:0],m6_htrans[1:0],m6_hsize[2:0],m6_hburst[2:0],m6_hprot[3:0],m6_hwrite};
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m0_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m0_latch_cmd)
       m0_ctrl_bus_ff[BUS_WIDTH-1:0] <= m0_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m1_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m1_latch_cmd)
       m1_ctrl_bus_ff[BUS_WIDTH-1:0] <= m1_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m2_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m2_latch_cmd)
       m2_ctrl_bus_ff[BUS_WIDTH-1:0] <= m2_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m3_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m3_latch_cmd)
       m3_ctrl_bus_ff[BUS_WIDTH-1:0] <= m3_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m4_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m4_latch_cmd)
       m4_ctrl_bus_ff[BUS_WIDTH-1:0] <= m4_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m5_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m5_latch_cmd)
       m5_ctrl_bus_ff[BUS_WIDTH-1:0] <= m5_ctrl_bus[BUS_WIDTH-1:0];
  end
always @ (posedge hclk or negedge hresetn)
  begin
    if(!hresetn)
       m6_ctrl_bus_ff[BUS_WIDTH-1:0] <= 0;
    else if(m6_latch_cmd)
       m6_ctrl_bus_ff[BUS_WIDTH-1:0] <= m6_ctrl_bus[BUS_WIDTH-1:0];
  end
assign m0_s0_ctrl_bus[BUS_WIDTH-1:0] = m0_s0_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s0_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s1_ctrl_bus[BUS_WIDTH-1:0] = m0_s1_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s1_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s2_ctrl_bus[BUS_WIDTH-1:0] = m0_s2_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s2_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s3_ctrl_bus[BUS_WIDTH-1:0] = m0_s3_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s3_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s4_ctrl_bus[BUS_WIDTH-1:0] = m0_s4_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s4_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s5_ctrl_bus[BUS_WIDTH-1:0] = m0_s5_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s5_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s6_ctrl_bus[BUS_WIDTH-1:0] = m0_s6_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s6_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s7_ctrl_bus[BUS_WIDTH-1:0] = m0_s7_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s7_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s8_ctrl_bus[BUS_WIDTH-1:0] = m0_s8_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s8_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s9_ctrl_bus[BUS_WIDTH-1:0] = m0_s9_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s9_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s10_ctrl_bus[BUS_WIDTH-1:0] = m0_s10_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s10_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m0_s11_ctrl_bus[BUS_WIDTH-1:0] = m0_s11_cmd_cur  ?  m0_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m0_s11_cmd_last ?  m0_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s0_ctrl_bus[BUS_WIDTH-1:0] = m1_s0_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s0_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s1_ctrl_bus[BUS_WIDTH-1:0] = m1_s1_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s1_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s2_ctrl_bus[BUS_WIDTH-1:0] = m1_s2_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s2_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s3_ctrl_bus[BUS_WIDTH-1:0] = m1_s3_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s3_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s4_ctrl_bus[BUS_WIDTH-1:0] = m1_s4_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s4_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s5_ctrl_bus[BUS_WIDTH-1:0] = m1_s5_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s5_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s6_ctrl_bus[BUS_WIDTH-1:0] = m1_s6_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s6_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s7_ctrl_bus[BUS_WIDTH-1:0] = m1_s7_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s7_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s8_ctrl_bus[BUS_WIDTH-1:0] = m1_s8_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s8_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s9_ctrl_bus[BUS_WIDTH-1:0] = m1_s9_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s9_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s10_ctrl_bus[BUS_WIDTH-1:0] = m1_s10_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s10_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m1_s11_ctrl_bus[BUS_WIDTH-1:0] = m1_s11_cmd_cur  ?  m1_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m1_s11_cmd_last ?  m1_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s0_ctrl_bus[BUS_WIDTH-1:0] = m2_s0_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s0_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s1_ctrl_bus[BUS_WIDTH-1:0] = m2_s1_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s1_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s2_ctrl_bus[BUS_WIDTH-1:0] = m2_s2_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s2_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s3_ctrl_bus[BUS_WIDTH-1:0] = m2_s3_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s3_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s4_ctrl_bus[BUS_WIDTH-1:0] = m2_s4_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s4_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s5_ctrl_bus[BUS_WIDTH-1:0] = m2_s5_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s5_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s6_ctrl_bus[BUS_WIDTH-1:0] = m2_s6_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s6_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s7_ctrl_bus[BUS_WIDTH-1:0] = m2_s7_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s7_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s8_ctrl_bus[BUS_WIDTH-1:0] = m2_s8_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s8_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s9_ctrl_bus[BUS_WIDTH-1:0] = m2_s9_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s9_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s10_ctrl_bus[BUS_WIDTH-1:0] = m2_s10_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s10_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m2_s11_ctrl_bus[BUS_WIDTH-1:0] = m2_s11_cmd_cur  ?  m2_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m2_s11_cmd_last ?  m2_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s0_ctrl_bus[BUS_WIDTH-1:0] = m3_s0_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s0_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s1_ctrl_bus[BUS_WIDTH-1:0] = m3_s1_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s1_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s2_ctrl_bus[BUS_WIDTH-1:0] = m3_s2_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s2_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s3_ctrl_bus[BUS_WIDTH-1:0] = m3_s3_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s3_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s4_ctrl_bus[BUS_WIDTH-1:0] = m3_s4_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s4_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s5_ctrl_bus[BUS_WIDTH-1:0] = m3_s5_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s5_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s6_ctrl_bus[BUS_WIDTH-1:0] = m3_s6_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s6_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s7_ctrl_bus[BUS_WIDTH-1:0] = m3_s7_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s7_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s8_ctrl_bus[BUS_WIDTH-1:0] = m3_s8_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s8_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s9_ctrl_bus[BUS_WIDTH-1:0] = m3_s9_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s9_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s10_ctrl_bus[BUS_WIDTH-1:0] = m3_s10_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s10_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m3_s11_ctrl_bus[BUS_WIDTH-1:0] = m3_s11_cmd_cur  ?  m3_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m3_s11_cmd_last ?  m3_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s0_ctrl_bus[BUS_WIDTH-1:0] = m4_s0_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s0_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s1_ctrl_bus[BUS_WIDTH-1:0] = m4_s1_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s1_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s2_ctrl_bus[BUS_WIDTH-1:0] = m4_s2_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s2_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s3_ctrl_bus[BUS_WIDTH-1:0] = m4_s3_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s3_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s4_ctrl_bus[BUS_WIDTH-1:0] = m4_s4_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s4_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s5_ctrl_bus[BUS_WIDTH-1:0] = m4_s5_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s5_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s6_ctrl_bus[BUS_WIDTH-1:0] = m4_s6_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s6_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s7_ctrl_bus[BUS_WIDTH-1:0] = m4_s7_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s7_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s8_ctrl_bus[BUS_WIDTH-1:0] = m4_s8_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s8_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s9_ctrl_bus[BUS_WIDTH-1:0] = m4_s9_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s9_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s10_ctrl_bus[BUS_WIDTH-1:0] = m4_s10_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s10_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m4_s11_ctrl_bus[BUS_WIDTH-1:0] = m4_s11_cmd_cur  ?  m4_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m4_s11_cmd_last ?  m4_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s0_ctrl_bus[BUS_WIDTH-1:0] = m5_s0_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s0_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s1_ctrl_bus[BUS_WIDTH-1:0] = m5_s1_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s1_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s2_ctrl_bus[BUS_WIDTH-1:0] = m5_s2_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s2_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s3_ctrl_bus[BUS_WIDTH-1:0] = m5_s3_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s3_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s4_ctrl_bus[BUS_WIDTH-1:0] = m5_s4_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s4_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s5_ctrl_bus[BUS_WIDTH-1:0] = m5_s5_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s5_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s6_ctrl_bus[BUS_WIDTH-1:0] = m5_s6_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s6_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s7_ctrl_bus[BUS_WIDTH-1:0] = m5_s7_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s7_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s8_ctrl_bus[BUS_WIDTH-1:0] = m5_s8_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s8_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s9_ctrl_bus[BUS_WIDTH-1:0] = m5_s9_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s9_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s10_ctrl_bus[BUS_WIDTH-1:0] = m5_s10_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s10_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m5_s11_ctrl_bus[BUS_WIDTH-1:0] = m5_s11_cmd_cur  ?  m5_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m5_s11_cmd_last ?  m5_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s0_ctrl_bus[BUS_WIDTH-1:0] = m6_s0_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s0_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s1_ctrl_bus[BUS_WIDTH-1:0] = m6_s1_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s1_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s2_ctrl_bus[BUS_WIDTH-1:0] = m6_s2_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s2_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s3_ctrl_bus[BUS_WIDTH-1:0] = m6_s3_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s3_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s4_ctrl_bus[BUS_WIDTH-1:0] = m6_s4_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s4_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s5_ctrl_bus[BUS_WIDTH-1:0] = m6_s5_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s5_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s6_ctrl_bus[BUS_WIDTH-1:0] = m6_s6_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s6_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s7_ctrl_bus[BUS_WIDTH-1:0] = m6_s7_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s7_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s8_ctrl_bus[BUS_WIDTH-1:0] = m6_s8_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s8_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s9_ctrl_bus[BUS_WIDTH-1:0] = m6_s9_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s9_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s10_ctrl_bus[BUS_WIDTH-1:0] = m6_s10_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s10_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign m6_s11_ctrl_bus[BUS_WIDTH-1:0] = m6_s11_cmd_cur  ?  m6_ctrl_bus[BUS_WIDTH-1:0] : 
                                       m6_s11_cmd_last ?  m6_ctrl_bus_ff[BUS_WIDTH-1:0] : 0;
assign s0_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s0_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s0_ctrl_bus[BUS_WIDTH-1:0];
assign s1_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s1_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s1_ctrl_bus[BUS_WIDTH-1:0];
assign s2_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s2_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s2_ctrl_bus[BUS_WIDTH-1:0];
assign s3_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s3_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s3_ctrl_bus[BUS_WIDTH-1:0];
assign s4_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s4_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s4_ctrl_bus[BUS_WIDTH-1:0];
assign s5_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s5_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s5_ctrl_bus[BUS_WIDTH-1:0];
assign s6_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s6_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s6_ctrl_bus[BUS_WIDTH-1:0];
assign s7_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s7_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s7_ctrl_bus[BUS_WIDTH-1:0];
assign s8_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s8_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s8_ctrl_bus[BUS_WIDTH-1:0];
assign s9_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s9_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s9_ctrl_bus[BUS_WIDTH-1:0];
assign s10_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s10_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s10_ctrl_bus[BUS_WIDTH-1:0];
assign s11_ctrl_bus[BUS_WIDTH-1:0] = 
                                    m0_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m1_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m2_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m3_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m4_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m5_s11_ctrl_bus[BUS_WIDTH-1:0] |
                                    m6_s11_ctrl_bus[BUS_WIDTH-1:0];
assign {s0_haddr[31:0],s0_htrans[1:0],s0_hsize[2:0],s0_hburst[2:0],s0_hprot[3:0],s0_hwrite} = s0_ctrl_bus[BUS_WIDTH-1:0];
assign {s1_haddr[31:0],s1_htrans[1:0],s1_hsize[2:0],s1_hburst[2:0],s1_hprot[3:0],s1_hwrite} = s1_ctrl_bus[BUS_WIDTH-1:0];
assign {s2_haddr[31:0],s2_htrans[1:0],s2_hsize[2:0],s2_hburst[2:0],s2_hprot[3:0],s2_hwrite} = s2_ctrl_bus[BUS_WIDTH-1:0];
assign {s3_haddr[31:0],s3_htrans[1:0],s3_hsize[2:0],s3_hburst[2:0],s3_hprot[3:0],s3_hwrite} = s3_ctrl_bus[BUS_WIDTH-1:0];
assign {s4_haddr[31:0],s4_htrans[1:0],s4_hsize[2:0],s4_hburst[2:0],s4_hprot[3:0],s4_hwrite} = s4_ctrl_bus[BUS_WIDTH-1:0];
assign {s5_haddr[31:0],s5_htrans[1:0],s5_hsize[2:0],s5_hburst[2:0],s5_hprot[3:0],s5_hwrite} = s5_ctrl_bus[BUS_WIDTH-1:0];
assign {s6_haddr[31:0],s6_htrans[1:0],s6_hsize[2:0],s6_hburst[2:0],s6_hprot[3:0],s6_hwrite} = s6_ctrl_bus[BUS_WIDTH-1:0];
assign {s7_haddr[31:0],s7_htrans[1:0],s7_hsize[2:0],s7_hburst[2:0],s7_hprot[3:0],s7_hwrite} = s7_ctrl_bus[BUS_WIDTH-1:0];
assign {s8_haddr[31:0],s8_htrans[1:0],s8_hsize[2:0],s8_hburst[2:0],s8_hprot[3:0],s8_hwrite} = s8_ctrl_bus[BUS_WIDTH-1:0];
assign {s9_haddr[31:0],s9_htrans[1:0],s9_hsize[2:0],s9_hburst[2:0],s9_hprot[3:0],s9_hwrite} = s9_ctrl_bus[BUS_WIDTH-1:0];
assign {s10_haddr[31:0],s10_htrans[1:0],s10_hsize[2:0],s10_hburst[2:0],s10_hprot[3:0],s10_hwrite} = s10_ctrl_bus[BUS_WIDTH-1:0];
assign {s11_haddr[31:0],s11_htrans[1:0],s11_hsize[2:0],s11_hburst[2:0],s11_hprot[3:0],s11_hwrite} = s11_ctrl_bus[BUS_WIDTH-1:0];
assign s0_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s0_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s0_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s0_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s0_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s0_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s0_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s0_data}});
assign s1_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s1_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s1_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s1_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s1_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s1_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s1_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s1_data}});
assign s2_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s2_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s2_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s2_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s2_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s2_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s2_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s2_data}});
assign s3_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s3_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s3_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s3_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s3_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s3_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s3_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s3_data}});
assign s4_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s4_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s4_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s4_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s4_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s4_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s4_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s4_data}});
assign s5_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s5_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s5_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s5_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s5_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s5_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s5_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s5_data}});
assign s6_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s6_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s6_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s6_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s6_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s6_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s6_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s6_data}});
assign s7_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s7_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s7_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s7_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s7_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s7_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s7_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s7_data}});
assign s8_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s8_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s8_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s8_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s8_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s8_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s8_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s8_data}});
assign s9_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s9_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s9_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s9_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s9_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s9_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s9_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s9_data}});
assign s10_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s10_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s10_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s10_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s10_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s10_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s10_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s10_data}});
assign s11_hwdata[31:0] = 
                           (m0_hwdata[31:0] & {32{m0_s11_data}}) |
                           (m1_hwdata[31:0] & {32{m1_s11_data}}) |
                           (m2_hwdata[31:0] & {32{m2_s11_data}}) |
                           (m3_hwdata[31:0] & {32{m3_s11_data}}) |
                           (m4_hwdata[31:0] & {32{m4_s11_data}}) |
                           (m5_hwdata[31:0] & {32{m5_s11_data}}) |
                           (m6_hwdata[31:0] & {32{m6_s11_data}});
assign m0_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m0_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m0_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m0_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m0_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m0_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m0_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m0_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m0_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m0_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m0_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m0_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m0_s11_data}});
assign m1_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m1_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m1_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m1_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m1_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m1_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m1_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m1_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m1_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m1_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m1_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m1_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m1_s11_data}});
assign m2_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m2_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m2_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m2_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m2_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m2_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m2_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m2_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m2_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m2_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m2_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m2_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m2_s11_data}});
assign m3_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m3_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m3_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m3_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m3_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m3_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m3_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m3_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m3_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m3_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m3_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m3_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m3_s11_data}});
assign m4_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m4_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m4_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m4_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m4_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m4_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m4_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m4_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m4_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m4_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m4_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m4_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m4_s11_data}});
assign m5_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m5_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m5_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m5_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m5_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m5_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m5_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m5_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m5_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m5_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m5_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m5_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m5_s11_data}});
assign m6_hrdata[32-1:0] = 
                           (s0_hrdata[32-1:0] & {32{m6_s0_data}}) |
                           (s1_hrdata[32-1:0] & {32{m6_s1_data}}) |
                           (s2_hrdata[32-1:0] & {32{m6_s2_data}}) |
                           (s3_hrdata[32-1:0] & {32{m6_s3_data}}) |
                           (s4_hrdata[32-1:0] & {32{m6_s4_data}}) |
                           (s5_hrdata[32-1:0] & {32{m6_s5_data}}) |
                           (s6_hrdata[32-1:0] & {32{m6_s6_data}}) |
                           (s7_hrdata[32-1:0] & {32{m6_s7_data}}) |
                           (s8_hrdata[32-1:0] & {32{m6_s8_data}}) |
                           (s9_hrdata[32-1:0] & {32{m6_s9_data}}) |
                           (s10_hrdata[32-1:0] & {32{m6_s10_data}}) |
                           (s11_hrdata[32-1:0] & {32{m6_s11_data}});
assign m0_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m0_s0_data}}) |
                       (s1_hresp[1:0] & {2{m0_s1_data}}) |
                       (s2_hresp[1:0] & {2{m0_s2_data}}) |
                       (s3_hresp[1:0] & {2{m0_s3_data}}) |
                       (s4_hresp[1:0] & {2{m0_s4_data}}) |
                       (s5_hresp[1:0] & {2{m0_s5_data}}) |
                       (s6_hresp[1:0] & {2{m0_s6_data}}) |
                       (s7_hresp[1:0] & {2{m0_s7_data}}) |
                       (s8_hresp[1:0] & {2{m0_s8_data}}) |
                       (s9_hresp[1:0] & {2{m0_s9_data}}) |
                       (s10_hresp[1:0] & {2{m0_s10_data}}) |
                       (s11_hresp[1:0] & {2{m0_s11_data}}) |
                       m0_err_hresp[1:0];
assign m1_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m1_s0_data}}) |
                       (s1_hresp[1:0] & {2{m1_s1_data}}) |
                       (s2_hresp[1:0] & {2{m1_s2_data}}) |
                       (s3_hresp[1:0] & {2{m1_s3_data}}) |
                       (s4_hresp[1:0] & {2{m1_s4_data}}) |
                       (s5_hresp[1:0] & {2{m1_s5_data}}) |
                       (s6_hresp[1:0] & {2{m1_s6_data}}) |
                       (s7_hresp[1:0] & {2{m1_s7_data}}) |
                       (s8_hresp[1:0] & {2{m1_s8_data}}) |
                       (s9_hresp[1:0] & {2{m1_s9_data}}) |
                       (s10_hresp[1:0] & {2{m1_s10_data}}) |
                       (s11_hresp[1:0] & {2{m1_s11_data}}) |
                       m1_err_hresp[1:0];
assign m2_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m2_s0_data}}) |
                       (s1_hresp[1:0] & {2{m2_s1_data}}) |
                       (s2_hresp[1:0] & {2{m2_s2_data}}) |
                       (s3_hresp[1:0] & {2{m2_s3_data}}) |
                       (s4_hresp[1:0] & {2{m2_s4_data}}) |
                       (s5_hresp[1:0] & {2{m2_s5_data}}) |
                       (s6_hresp[1:0] & {2{m2_s6_data}}) |
                       (s7_hresp[1:0] & {2{m2_s7_data}}) |
                       (s8_hresp[1:0] & {2{m2_s8_data}}) |
                       (s9_hresp[1:0] & {2{m2_s9_data}}) |
                       (s10_hresp[1:0] & {2{m2_s10_data}}) |
                       (s11_hresp[1:0] & {2{m2_s11_data}}) |
                       m2_err_hresp[1:0];
assign m3_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m3_s0_data}}) |
                       (s1_hresp[1:0] & {2{m3_s1_data}}) |
                       (s2_hresp[1:0] & {2{m3_s2_data}}) |
                       (s3_hresp[1:0] & {2{m3_s3_data}}) |
                       (s4_hresp[1:0] & {2{m3_s4_data}}) |
                       (s5_hresp[1:0] & {2{m3_s5_data}}) |
                       (s6_hresp[1:0] & {2{m3_s6_data}}) |
                       (s7_hresp[1:0] & {2{m3_s7_data}}) |
                       (s8_hresp[1:0] & {2{m3_s8_data}}) |
                       (s9_hresp[1:0] & {2{m3_s9_data}}) |
                       (s10_hresp[1:0] & {2{m3_s10_data}}) |
                       (s11_hresp[1:0] & {2{m3_s11_data}}) |
                       m3_err_hresp[1:0];
assign m4_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m4_s0_data}}) |
                       (s1_hresp[1:0] & {2{m4_s1_data}}) |
                       (s2_hresp[1:0] & {2{m4_s2_data}}) |
                       (s3_hresp[1:0] & {2{m4_s3_data}}) |
                       (s4_hresp[1:0] & {2{m4_s4_data}}) |
                       (s5_hresp[1:0] & {2{m4_s5_data}}) |
                       (s6_hresp[1:0] & {2{m4_s6_data}}) |
                       (s7_hresp[1:0] & {2{m4_s7_data}}) |
                       (s8_hresp[1:0] & {2{m4_s8_data}}) |
                       (s9_hresp[1:0] & {2{m4_s9_data}}) |
                       (s10_hresp[1:0] & {2{m4_s10_data}}) |
                       (s11_hresp[1:0] & {2{m4_s11_data}}) |
                       m4_err_hresp[1:0];
assign m5_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m5_s0_data}}) |
                       (s1_hresp[1:0] & {2{m5_s1_data}}) |
                       (s2_hresp[1:0] & {2{m5_s2_data}}) |
                       (s3_hresp[1:0] & {2{m5_s3_data}}) |
                       (s4_hresp[1:0] & {2{m5_s4_data}}) |
                       (s5_hresp[1:0] & {2{m5_s5_data}}) |
                       (s6_hresp[1:0] & {2{m5_s6_data}}) |
                       (s7_hresp[1:0] & {2{m5_s7_data}}) |
                       (s8_hresp[1:0] & {2{m5_s8_data}}) |
                       (s9_hresp[1:0] & {2{m5_s9_data}}) |
                       (s10_hresp[1:0] & {2{m5_s10_data}}) |
                       (s11_hresp[1:0] & {2{m5_s11_data}}) |
                       m5_err_hresp[1:0];
assign m6_hresp[1:0] = 
                       (s0_hresp[1:0] & {2{m6_s0_data}}) |
                       (s1_hresp[1:0] & {2{m6_s1_data}}) |
                       (s2_hresp[1:0] & {2{m6_s2_data}}) |
                       (s3_hresp[1:0] & {2{m6_s3_data}}) |
                       (s4_hresp[1:0] & {2{m6_s4_data}}) |
                       (s5_hresp[1:0] & {2{m6_s5_data}}) |
                       (s6_hresp[1:0] & {2{m6_s6_data}}) |
                       (s7_hresp[1:0] & {2{m6_s7_data}}) |
                       (s8_hresp[1:0] & {2{m6_s8_data}}) |
                       (s9_hresp[1:0] & {2{m6_s9_data}}) |
                       (s10_hresp[1:0] & {2{m6_s10_data}}) |
                       (s11_hresp[1:0] & {2{m6_s11_data}}) |
                       m6_err_hresp[1:0];
assign m0_hready = (~m0_err_hready) & m0_nor_hready;
assign m1_hready = (~m1_err_hready) & m1_nor_hready;
assign m2_hready = (~m2_err_hready) & m2_nor_hready;
assign m3_hready = (~m3_err_hready) & m3_nor_hready;
assign m4_hready = (~m4_err_hready) & m4_nor_hready;
assign m5_hready = (~m5_err_hready) & m5_nor_hready;
assign m6_hready = (~m6_err_hready) & m6_nor_hready;
assign s0_hselx = 
                  m0_s0_cmd_last | m0_s0_cmd_cur |
                  m1_s0_cmd_last | m1_s0_cmd_cur |
                  m2_s0_cmd_last | m2_s0_cmd_cur |
                  m3_s0_cmd_last | m3_s0_cmd_cur |
                  m4_s0_cmd_last | m4_s0_cmd_cur |
                  m5_s0_cmd_last | m5_s0_cmd_cur |
                  m6_s0_cmd_last | m6_s0_cmd_cur;
assign s1_hselx = 
                  m0_s1_cmd_last | m0_s1_cmd_cur |
                  m1_s1_cmd_last | m1_s1_cmd_cur |
                  m2_s1_cmd_last | m2_s1_cmd_cur |
                  m3_s1_cmd_last | m3_s1_cmd_cur |
                  m4_s1_cmd_last | m4_s1_cmd_cur |
                  m5_s1_cmd_last | m5_s1_cmd_cur |
                  m6_s1_cmd_last | m6_s1_cmd_cur;
assign s2_hselx = 
                  m0_s2_cmd_last | m0_s2_cmd_cur |
                  m1_s2_cmd_last | m1_s2_cmd_cur |
                  m2_s2_cmd_last | m2_s2_cmd_cur |
                  m3_s2_cmd_last | m3_s2_cmd_cur |
                  m4_s2_cmd_last | m4_s2_cmd_cur |
                  m5_s2_cmd_last | m5_s2_cmd_cur |
                  m6_s2_cmd_last | m6_s2_cmd_cur;
assign s3_hselx = 
                  m0_s3_cmd_last | m0_s3_cmd_cur |
                  m1_s3_cmd_last | m1_s3_cmd_cur |
                  m2_s3_cmd_last | m2_s3_cmd_cur |
                  m3_s3_cmd_last | m3_s3_cmd_cur |
                  m4_s3_cmd_last | m4_s3_cmd_cur |
                  m5_s3_cmd_last | m5_s3_cmd_cur |
                  m6_s3_cmd_last | m6_s3_cmd_cur;
assign s4_hselx = 
                  m0_s4_cmd_last | m0_s4_cmd_cur |
                  m1_s4_cmd_last | m1_s4_cmd_cur |
                  m2_s4_cmd_last | m2_s4_cmd_cur |
                  m3_s4_cmd_last | m3_s4_cmd_cur |
                  m4_s4_cmd_last | m4_s4_cmd_cur |
                  m5_s4_cmd_last | m5_s4_cmd_cur |
                  m6_s4_cmd_last | m6_s4_cmd_cur;
assign s5_hselx = 
                  m0_s5_cmd_last | m0_s5_cmd_cur |
                  m1_s5_cmd_last | m1_s5_cmd_cur |
                  m2_s5_cmd_last | m2_s5_cmd_cur |
                  m3_s5_cmd_last | m3_s5_cmd_cur |
                  m4_s5_cmd_last | m4_s5_cmd_cur |
                  m5_s5_cmd_last | m5_s5_cmd_cur |
                  m6_s5_cmd_last | m6_s5_cmd_cur;
assign s6_hselx = 
                  m0_s6_cmd_last | m0_s6_cmd_cur |
                  m1_s6_cmd_last | m1_s6_cmd_cur |
                  m2_s6_cmd_last | m2_s6_cmd_cur |
                  m3_s6_cmd_last | m3_s6_cmd_cur |
                  m4_s6_cmd_last | m4_s6_cmd_cur |
                  m5_s6_cmd_last | m5_s6_cmd_cur |
                  m6_s6_cmd_last | m6_s6_cmd_cur;
assign s7_hselx = 
                  m0_s7_cmd_last | m0_s7_cmd_cur |
                  m1_s7_cmd_last | m1_s7_cmd_cur |
                  m2_s7_cmd_last | m2_s7_cmd_cur |
                  m3_s7_cmd_last | m3_s7_cmd_cur |
                  m4_s7_cmd_last | m4_s7_cmd_cur |
                  m5_s7_cmd_last | m5_s7_cmd_cur |
                  m6_s7_cmd_last | m6_s7_cmd_cur;
assign s8_hselx = 
                  m0_s8_cmd_last | m0_s8_cmd_cur |
                  m1_s8_cmd_last | m1_s8_cmd_cur |
                  m2_s8_cmd_last | m2_s8_cmd_cur |
                  m3_s8_cmd_last | m3_s8_cmd_cur |
                  m4_s8_cmd_last | m4_s8_cmd_cur |
                  m5_s8_cmd_last | m5_s8_cmd_cur |
                  m6_s8_cmd_last | m6_s8_cmd_cur;
assign s9_hselx = 
                  m0_s9_cmd_last | m0_s9_cmd_cur |
                  m1_s9_cmd_last | m1_s9_cmd_cur |
                  m2_s9_cmd_last | m2_s9_cmd_cur |
                  m3_s9_cmd_last | m3_s9_cmd_cur |
                  m4_s9_cmd_last | m4_s9_cmd_cur |
                  m5_s9_cmd_last | m5_s9_cmd_cur |
                  m6_s9_cmd_last | m6_s9_cmd_cur;
assign s10_hselx = 
                  m0_s10_cmd_last | m0_s10_cmd_cur |
                  m1_s10_cmd_last | m1_s10_cmd_cur |
                  m2_s10_cmd_last | m2_s10_cmd_cur |
                  m3_s10_cmd_last | m3_s10_cmd_cur |
                  m4_s10_cmd_last | m4_s10_cmd_cur |
                  m5_s10_cmd_last | m5_s10_cmd_cur |
                  m6_s10_cmd_last | m6_s10_cmd_cur;
assign s11_hselx = 
                  m0_s11_cmd_last | m0_s11_cmd_cur |
                  m1_s11_cmd_last | m1_s11_cmd_cur |
                  m2_s11_cmd_last | m2_s11_cmd_cur |
                  m3_s11_cmd_last | m3_s11_cmd_cur |
                  m4_s11_cmd_last | m4_s11_cmd_cur |
                  m5_s11_cmd_last | m5_s11_cmd_cur |
                  m6_s11_cmd_last | m6_s11_cmd_cur;
assign m0_hgrant = 1'b1;
assign m1_hgrant = 1'b1;
assign m2_hgrant = 1'b1;
assign m3_hgrant = 1'b1;
assign m4_hgrant = 1'b1;
assign m5_hgrant = 1'b1;
assign m6_hgrant = 1'b1;
endmodule
