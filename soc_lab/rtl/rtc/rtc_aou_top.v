/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_aou_top(
  aou_pdu_cnt,
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  etb_rtc_trig,
  i_rtc_ext_clk,
  int_flag,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_pwdata,
  pdu_aou_wen_clr_sync,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  rtc0_vic_intr,
  rtc_clk,
  rtc_etb_trig,
  rtc_por_rst_n,
  test_mode
);
input           etb_rtc_trig;        
input           i_rtc_ext_clk;       
input           pclk;                
input   [31:0]  pdu_aou_clr_reg;     
input           pdu_aou_int_clr;     
input   [31:0]  pdu_aou_pwdata;      
input           pdu_aou_wen_clr_sync; 
input           pdu_aou_wen_cr;      
input           pdu_aou_wen_div;     
input           pdu_aou_wen_mr;      
input           rtc_por_rst_n;       
input           test_mode;           
output  [31:0]  aou_pdu_cnt;         
output  [3 :0]  aou_pdu_cr_reg;      
output  [19:0]  aou_pdu_div_reg;     
output          aou_pdu_intr_mask;   
output  [31:0]  aou_pdu_mr_reg;      
output          int_flag;            
output          rtc0_vic_intr;       
output          rtc_clk;             
output          rtc_etb_trig;        
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire            cnt_en;              
wire    [31:0]  count_val;           
wire            etb_rtc_trig;        
wire            i_rtc_ext_clk;       
wire            int_flag;            
wire            intr_en;             
wire            intr_mask;           
wire    [31:0]  match_val;           
wire            pclk;                
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire    [31:0]  pdu_aou_pwdata;      
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            presetn;             
wire    [31:0]  pwdata;              
wire            rtc0_vic_intr;       
wire            rtc_clk;             
wire            rtc_etb_trig;        
wire            rtc_por_rst_n;       
wire    [19:0]  rtcclkdivcfg;        
wire            test_mode;           
wire            wrap_en;             
rtc_cnt  x_rtc_cnt (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .cnt_en               (cnt_en              ),
  .count_val            (count_val           ),
  .match_val            (match_val           ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .presetn              (presetn             ),
  .rtc_clk              (rtc_clk             ),
  .wrap_en              (wrap_en             )
);
rtc_ig  x_rtc_ig (
  .cnt_en          (cnt_en         ),
  .count_val       (count_val      ),
  .i_rtc_ext_clk   (i_rtc_ext_clk  ),
  .int_flag        (int_flag       ),
  .intr_en         (intr_en        ),
  .intr_mask       (intr_mask      ),
  .match_val       (match_val      ),
  .pdu_aou_int_clr (pdu_aou_int_clr),
  .rtc0_vic_intr   (rtc0_vic_intr  ),
  .rtc_etb_trig    (rtc_etb_trig   ),
  .rtc_por_rst_n   (rtc_por_rst_n  )
);
rtc_clk_div  x_rtc_clk_div (
  .cnt_en        (cnt_en       ),
  .i_rtc_ext_clk (i_rtc_ext_clk),
  .pclk          (pclk         ),
  .presetn       (presetn      ),
  .rtc_clk       (rtc_clk      ),
  .rtcclkdivcfg  (rtcclkdivcfg ),
  .test_mode     (test_mode    )
);
rtc_aou_apbif  x_rtc_aou_apbif (
  .aou_pdu_cr_reg    (aou_pdu_cr_reg   ),
  .aou_pdu_div_reg   (aou_pdu_div_reg  ),
  .aou_pdu_intr_mask (aou_pdu_intr_mask),
  .aou_pdu_mr_reg    (aou_pdu_mr_reg   ),
  .cnt_en            (cnt_en           ),
  .etb_rtc_trig      (etb_rtc_trig     ),
  .intr_en           (intr_en          ),
  .intr_mask         (intr_mask        ),
  .match_val         (match_val        ),
  .pclk              (pclk             ),
  .pdu_aou_wen_cr    (pdu_aou_wen_cr   ),
  .pdu_aou_wen_div   (pdu_aou_wen_div  ),
  .pdu_aou_wen_mr    (pdu_aou_wen_mr   ),
  .presetn           (presetn          ),
  .pwdata            (pwdata           ),
  .rtcclkdivcfg      (rtcclkdivcfg     ),
  .test_mode         (test_mode        ),
  .wrap_en           (wrap_en          )
);
assign presetn = rtc_por_rst_n;
assign pwdata[31:0] = pdu_aou_pwdata[31:0];
endmodule
