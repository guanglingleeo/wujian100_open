/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_cnt(
  aou_pdu_cnt,
  cnt_en,
  count_val,
  match_val,
  pdu_aou_clr_reg,
  pdu_aou_wen_clr_sync,
  presetn,
  rtc_clk,
  wrap_en
);
input           cnt_en;              
input   [31:0]  match_val;           
input   [31:0]  pdu_aou_clr_reg;     
input           pdu_aou_wen_clr_sync; 
input           presetn;             
input           rtc_clk;             
input           wrap_en;             
output  [31:0]  aou_pdu_cnt;         
output  [31:0]  count_val;           
reg     [31:0]  cnt;                 
wire    [31:0]  aou_pdu_cnt;         
wire            cnt_en;              
wire    [31:0]  count_val;           
wire    [31:0]  match_val;           
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_wen_clr_sync; 
wire            presetn;             
wire            rtc_clk;             
wire            wrap_en;             
 always @ (posedge rtc_clk or negedge presetn)
 begin
   if(~presetn)
     begin
         cnt[31:0] <= {32{1'b0}};
     end
   else if(pdu_aou_wen_clr_sync)
     begin
         cnt[31:0] <= pdu_aou_clr_reg[31:0];
     end
   else if(cnt_en)
     begin
        if((cnt[31:0] == match_val[31:0]) && wrap_en)
           begin
             cnt[31:0] <= {32{1'b0}};
           end
	else
	   begin
             cnt[31:0] <= cnt[31:0] + 1'b1;
           end
     end
 end 
 assign aou_pdu_cnt[31:0] = cnt[31:0];
 assign count_val[31:0] = cnt[31:0];
endmodule
