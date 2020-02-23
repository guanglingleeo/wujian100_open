/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc0_sec_top(
  aortc_paddr,
  aortc_pclk,
  aortc_penable,
  aortc_pprot,
  aortc_prdata,
  aortc_psel,
  aortc_pwdata,
  aortc_pwrite,
  aortc_rst_n,
  etb_rtc_trig,
  i_rtc_ext_clk,
  rtc0_vic_intr,
  rtc_etb_trig,
  test_mode,
  tipc_rtc0_trust
);
input   [31:0]  aortc_paddr;         
input           aortc_pclk;          
input           aortc_penable;       
input   [2 :0]  aortc_pprot;         
input           aortc_psel;          
input   [31:0]  aortc_pwdata;        
input           aortc_pwrite;        
input           aortc_rst_n;         
input           etb_rtc_trig;        
input           i_rtc_ext_clk;       
input           test_mode;           
input           tipc_rtc0_trust;     
output  [31:0]  aortc_prdata;        
output          rtc0_vic_intr;       
output          rtc_etb_trig;        
wire    [31:0]  aortc_paddr;         
wire            aortc_pclk;          
wire            aortc_penable;       
wire    [2 :0]  aortc_pprot;         
wire    [31:0]  aortc_prdata;        
wire            aortc_psel;          
wire    [31:0]  aortc_pwdata;        
wire            aortc_pwrite;        
wire            aortc_rst_n;         
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire            etb_rtc_trig;        
wire            i_rtc_ext_clk;       
wire            int_flag;            
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            rtc0_vic_intr;       
wire            rtc_clk;             
wire            rtc_etb_trig;        
wire            test_mode;           
wire            tipc_rtc0_trust;     
wire    [31:0]  w_prdata;            
wire            w_psel;              
wire            w_pwrite;            
rtc_pdu_top  x_rtc_pdu_top (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .aou_pdu_cr_reg       (aou_pdu_cr_reg      ),
  .aou_pdu_div_reg      (aou_pdu_div_reg     ),
  .aou_pdu_intr_mask    (aou_pdu_intr_mask   ),
  .aou_pdu_mr_reg       (aou_pdu_mr_reg      ),
  .int_flag             (int_flag            ),
  .paddr                (aortc_paddr[31:0]   ),
  .pclk                 (aortc_pclk          ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_int_clr      (pdu_aou_int_clr     ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .pdu_aou_wen_cr       (pdu_aou_wen_cr      ),
  .pdu_aou_wen_div      (pdu_aou_wen_div     ),
  .pdu_aou_wen_mr       (pdu_aou_wen_mr      ),
  .penable              (aortc_penable       ),
  .prdata               (w_prdata[31:0]      ),
  .presetn              (aortc_rst_n         ),
  .psel                 (w_psel              ),
  .pwdata               (aortc_pwdata[31:0]  ),
  .pwrite               (w_pwrite            ),
  .rtc_clk              (rtc_clk             ),
  .test_mode            (test_mode           )
);
rtc_aou_top  x_rtc_aou_top (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .aou_pdu_cr_reg       (aou_pdu_cr_reg      ),
  .aou_pdu_div_reg      (aou_pdu_div_reg     ),
  .aou_pdu_intr_mask    (aou_pdu_intr_mask   ),
  .aou_pdu_mr_reg       (aou_pdu_mr_reg      ),
  .etb_rtc_trig         (etb_rtc_trig        ),
  .i_rtc_ext_clk        (i_rtc_ext_clk       ),
  .int_flag             (int_flag            ),
  .pclk                 (aortc_pclk          ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_int_clr      (pdu_aou_int_clr     ),
  .pdu_aou_pwdata       (aortc_pwdata[31:0]  ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .pdu_aou_wen_cr       (pdu_aou_wen_cr      ),
  .pdu_aou_wen_div      (pdu_aou_wen_div     ),
  .pdu_aou_wen_mr       (pdu_aou_wen_mr      ),
  .rtc0_vic_intr        (rtc0_vic_intr       ),
  .rtc_clk              (rtc_clk             ),
  .rtc_etb_trig         (rtc_etb_trig        ),
  .rtc_por_rst_n        (aortc_rst_n         ),
  .test_mode            (test_mode           )
);
assign aortc_prdata[31:0] = w_prdata[31:0];
assign w_pwrite = aortc_pwrite;
assign w_psel = aortc_psel;
endmodule
