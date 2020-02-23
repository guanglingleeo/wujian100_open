/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_aou_apbif(
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  cnt_en,
  etb_rtc_trig,
  intr_en,
  intr_mask,
  match_val,
  pclk,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  presetn,
  pwdata,
  rtcclkdivcfg,
  test_mode,
  wrap_en
);
input           etb_rtc_trig;     
input           pclk;             
input           pdu_aou_wen_cr;   
input           pdu_aou_wen_div;  
input           pdu_aou_wen_mr;   
input           presetn;          
input   [31:0]  pwdata;           
input           test_mode;        
output  [3 :0]  aou_pdu_cr_reg;   
output  [19:0]  aou_pdu_div_reg;  
output          aou_pdu_intr_mask; 
output  [31:0]  aou_pdu_mr_reg;   
output          cnt_en;           
output          intr_en;          
output          intr_mask;        
output  [31:0]  match_val;        
output  [19:0]  rtcclkdivcfg;     
output          wrap_en;          
reg     [3 :0]  cr_reg;           
reg     [19:0]  div_reg;          
reg     [31:0]  mr_reg;           
wire    [3 :0]  aou_pdu_cr_reg;   
wire    [19:0]  aou_pdu_div_reg;  
wire            aou_pdu_intr_mask; 
wire    [31:0]  aou_pdu_mr_reg;   
wire            cnt_en;           
wire            etb_rtc_trig;     
wire            gate_en;          
wire            intr_en;          
wire            intr_mask;        
wire    [31:0]  match_val;        
wire            pclk;             
wire            pclk_gate;        
wire            pdu_aou_wen_cr;   
wire            pdu_aou_wen_div;  
wire            pdu_aou_wen_mr;   
wire            presetn;          
wire    [31:0]  pwdata;           
wire    [19:0]  rtcclkdivcfg;     
wire            test_mode;        
wire            wrap_en;          
assign gate_en = pdu_aou_wen_mr|pdu_aou_wen_cr|etb_rtc_trig|pdu_aou_wen_div;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_gate           ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     mr_reg[31:0] <= 32'b0;
   else if(pdu_aou_wen_mr)
     mr_reg[31:0] <= pwdata[31:0];
 end
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     cr_reg[3:0] <= 4'b0;
   else if(pdu_aou_wen_cr)
     cr_reg[3:0] <= pwdata[3:0];
   else if(etb_rtc_trig)
     cr_reg[2] <= 1'b1;
 end
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     div_reg[19:0] <= 20'b1;
   else if(pdu_aou_wen_div)
     div_reg[19:0] <= pwdata[19:0];
 end
 assign aou_pdu_mr_reg[31:0] = mr_reg[31:0];
 assign aou_pdu_cr_reg[ 3:0] = cr_reg[ 3:0];
 assign aou_pdu_div_reg[19:0] = div_reg[19:0];
 assign match_val[31:0] = mr_reg[31:0];
 assign wrap_en = cr_reg[3];
 assign cnt_en = cr_reg[2];
 assign aou_pdu_intr_mask = cr_reg[1];
 assign intr_mask = cr_reg[1];
 assign intr_en = cr_reg[0];
 assign rtcclkdivcfg[19:0] = div_reg[19:0];
endmodule
