/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module rtc_clk_div(
  cnt_en,
  i_rtc_ext_clk,
  pclk,
  presetn,
  rtc_clk,
  rtcclkdivcfg,
  test_mode
);
input           cnt_en;       
input           i_rtc_ext_clk; 
input           pclk;         
input           presetn;      
input   [19:0]  rtcclkdivcfg; 
input           test_mode;    
output          rtc_clk;      
reg     [19:0]  cnt;          
wire            cntEq0;       
wire            cnt_en;       
wire            gate_en;      
wire            i_rtc_ext_clk; 
wire            pclk;         
wire            presetn;      
wire            rtc_clk;      
wire            rtc_clk_div;  
wire    [19:0]  rtcclkdivcfg; 
wire            test_mode;    
assign cntEq0 = cnt[19:0] == rtcclkdivcfg[19:0];
always @(posedge i_rtc_ext_clk or negedge presetn)
begin
	if(~presetn)
		cnt[19:0] <= 20'b0;
	else if(cntEq0)
		cnt[19:0] <= 20'b0;
	else if(cnt_en)
		cnt[19:0] <= cnt[19:0] + 20'b1;
end
assign gate_en = cntEq0;
gated_clk_cell  x_gatecell (
  .clk_in               (i_rtc_ext_clk       ),
  .clk_out              (rtc_clk_div         ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
assign rtc_clk = test_mode ? pclk : rtc_clk_div;
endmodule
