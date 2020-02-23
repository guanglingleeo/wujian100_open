/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_ig(
  cnt_en,
  count_val,
  i_rtc_ext_clk,
  int_flag,
  intr_en,
  intr_mask,
  match_val,
  pdu_aou_int_clr,
  rtc0_vic_intr,
  rtc_etb_trig,
  rtc_por_rst_n
);
input           cnt_en;         
input   [31:0]  count_val;      
input           i_rtc_ext_clk;  
input           intr_en;        
input           intr_mask;      
input   [31:0]  match_val;      
input           pdu_aou_int_clr; 
input           rtc_por_rst_n;  
output          int_flag;       
output          rtc0_vic_intr;  
output          rtc_etb_trig;   
reg             cmp_res;        
reg             int_flag;       
reg             rtc_etb_trig;   
wire            cnt_en;         
wire    [31:0]  count_val;      
wire            i_rtc_ext_clk;  
wire            int_intr;       
wire            intr_en;        
wire            intr_mask;      
wire    [31:0]  match_val;      
wire            pdu_aou_int_clr; 
wire            rtc0_vic_intr;  
wire            rtc_por_rst_n;  
 always @ (match_val[31:0] or count_val[31:0] or cnt_en)
 begin
   if((match_val[31:0] == count_val[31:0]) && cnt_en)
     begin
       cmp_res = 1'b1;
     end
   else
     begin
       cmp_res = 1'b0;
     end
 end
assign int_intr = cmp_res && intr_en;
assign rtc0_vic_intr = intr_mask ? 1'b0 : (int_flag && ~pdu_aou_int_clr);
 always @ (posedge i_rtc_ext_clk or negedge rtc_por_rst_n)
 begin
   if(!rtc_por_rst_n)
     begin
       int_flag <= 1'b0;
     end
   else if(int_intr)
     begin
       int_flag <= 1'b1;
     end
   else if (pdu_aou_int_clr)
     begin
       int_flag <= 1'b0;
     end
 end
 always @ (posedge i_rtc_ext_clk or negedge rtc_por_rst_n)
 begin
   if(!rtc_por_rst_n)
     begin
       rtc_etb_trig <= 1'b0;
     end
   else if(cmp_res)
     begin
       rtc_etb_trig <= 1'b1;
     end
   else
     begin
       rtc_etb_trig <= 1'b0;
     end
 end
endmodule
