/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_pdu_top(
  aou_pdu_cnt,
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  int_flag,
  paddr,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_wen_clr_sync,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  rtc_clk,
  test_mode
);
input   [31:0]  aou_pdu_cnt;         
input   [3 :0]  aou_pdu_cr_reg;      
input   [19:0]  aou_pdu_div_reg;     
input           aou_pdu_intr_mask;   
input   [31:0]  aou_pdu_mr_reg;      
input           int_flag;            
input   [31:0]  paddr;               
input           pclk;                
input           penable;             
input           presetn;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           rtc_clk;             
input           test_mode;           
output  [31:0]  pdu_aou_clr_reg;     
output          pdu_aou_int_clr;     
output          pdu_aou_wen_clr_sync; 
output          pdu_aou_wen_cr;      
output          pdu_aou_wen_div;     
output          pdu_aou_wen_mr;      
output  [31:0]  prdata;              
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire    [31:0]  cnt_sync;            
wire            int_flag;            
wire    [31:0]  paddr;               
wire            pclk;                
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            penable;             
wire    [31:0]  prdata;              
wire            presetn;             
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            rtc_clk;             
wire            test_mode;           
wire            wen_clr;             
rtc_pdu_apbif  x_rtc_pdu_apbif (
  .aou_pdu_cr_reg    (aou_pdu_cr_reg   ),
  .aou_pdu_div_reg   (aou_pdu_div_reg  ),
  .aou_pdu_intr_mask (aou_pdu_intr_mask),
  .aou_pdu_mr_reg    (aou_pdu_mr_reg   ),
  .cnt_sync          (cnt_sync         ),
  .int_flag          (int_flag         ),
  .paddr             (paddr            ),
  .pclk              (pclk             ),
  .pdu_aou_clr_reg   (pdu_aou_clr_reg  ),
  .pdu_aou_int_clr   (pdu_aou_int_clr  ),
  .pdu_aou_wen_cr    (pdu_aou_wen_cr   ),
  .pdu_aou_wen_div   (pdu_aou_wen_div  ),
  .pdu_aou_wen_mr    (pdu_aou_wen_mr   ),
  .penable           (penable          ),
  .prdata            (prdata           ),
  .presetn           (presetn          ),
  .psel              (psel             ),
  .pwdata            (pwdata           ),
  .pwrite            (pwrite           ),
  .test_mode         (test_mode        ),
  .wen_clr           (wen_clr          )
);
rtc_cdr_sync  x_rtc_cdr_sync (
  .aou_pdu_cnt (aou_pdu_cnt),
  .cnt_sync    (cnt_sync   ),
  .pclk        (pclk       ),
  .presetn     (presetn    ),
  .test_mode   (test_mode  )
);
rtc_clr_sync  x_rtc_clr_sync (
  .pclk                 (pclk                ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .presetn              (presetn             ),
  .rtc_clk              (rtc_clk             ),
  .test_mode            (test_mode           ),
  .wen_clr              (wen_clr             )
);
endmodule
