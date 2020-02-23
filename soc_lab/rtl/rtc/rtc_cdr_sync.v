/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_cdr_sync(
  aou_pdu_cnt,
  cnt_sync,
  pclk,
  presetn,
  test_mode
);
input   [31:0]  aou_pdu_cnt; 
input           pclk;       
input           presetn;    
input           test_mode;  
output  [31:0]  cnt_sync;   
reg             cnt_reg1;   
reg             cnt_reg2;   
reg             cnt_reg3;   
reg     [31:0]  cnt_sync;   
wire    [31:0]  aou_pdu_cnt; 
wire            cnt_ed;     
wire            pclk;       
wire            pclk_sync;  
wire            presetn;    
wire            test_mode;  
 always @(posedge pclk or negedge presetn)
 begin
   if(~presetn)
     begin
       cnt_reg1 <= 1'b0;
       cnt_reg2 <= 1'b0;
       cnt_reg3 <= 1'b0;
     end
   else
     begin
       cnt_reg1 <= aou_pdu_cnt[0];
       cnt_reg2 <= cnt_reg1;
       cnt_reg3 <= cnt_reg2;
     end
 end
assign cnt_ed = cnt_reg2 ^ cnt_reg3;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_sync           ),
  .external_en          (cnt_ed              ),
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
       cnt_sync[31:0] <= 32'b0;
     end
   else 
     begin
       cnt_sync[31:0] <= aou_pdu_cnt[31:0];
     end
 end
endmodule
