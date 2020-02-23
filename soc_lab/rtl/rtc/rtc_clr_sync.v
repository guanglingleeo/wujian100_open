/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_clr_sync(
  pclk,
  pdu_aou_wen_clr_sync,
  presetn,
  rtc_clk,
  test_mode,
  wen_clr
);
input        pclk;                
input        presetn;             
input        rtc_clk;             
input        test_mode;           
input        wen_clr;             
output       pdu_aou_wen_clr_sync; 
reg          pclk_load_sync1;     
reg          pclk_load_sync2;     
reg          rtc_load_sync1;      
reg          rtc_load_sync2;      
reg          wen_clr_hold;        
wire         gate_en;             
wire         load_done;           
wire         pclk;                
wire         pclk_sync;           
wire         pdu_aou_wen_clr_sync; 
wire         presetn;             
wire         rtc_clk;             
wire         test_mode;           
wire         wen_clr;             
assign gate_en = wen_clr | wen_clr_hold | pclk_load_sync2;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_sync           ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @(posedge pclk_sync or negedge presetn)
 begin
   if(~presetn)
     begin
       wen_clr_hold <= 1'b0;
     end
   else if(load_done)
     begin
       wen_clr_hold <= 1'b0;
     end
   else if(wen_clr)
     begin
       wen_clr_hold <= 1'b1;
     end
 end
 always @(posedge rtc_clk or negedge presetn)
 begin
   if(~presetn)
     begin
       rtc_load_sync1 <= 1'b0;
       rtc_load_sync2 <= 1'b0;
     end
   else
     begin
       rtc_load_sync1 <= wen_clr_hold;
       rtc_load_sync2 <= rtc_load_sync1;
     end
 end
 always @(posedge pclk_sync or negedge presetn)
 begin
   if(~presetn)
     begin
       pclk_load_sync1 <= 1'b0;
       pclk_load_sync2 <= 1'b0;
     end
   else
     begin
       pclk_load_sync1 <= rtc_load_sync2;
       pclk_load_sync2 <= pclk_load_sync1;
     end
 end
assign load_done = pclk_load_sync2;
assign pdu_aou_wen_clr_sync = rtc_load_sync2;
endmodule
