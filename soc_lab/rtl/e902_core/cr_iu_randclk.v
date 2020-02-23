/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_randclk(
  randclk_mad_mod_en_w2,
  randclk_oper_gpr_mod_en_w32,
  randclk_pcgen_mod_en_w32,
  randclk_retire_mod_en_w2,
  randclk_wb_buf_mod_en_w32,
  randclk_wb_ctrl_mod_en_w2,
  randclk_wb_idx_mod_en_w5
);
output          randclk_mad_mod_en_w2;      
output  [20:0]  randclk_oper_gpr_mod_en_w32; 
output          randclk_pcgen_mod_en_w32;   
output          randclk_retire_mod_en_w2;   
output          randclk_wb_buf_mod_en_w32;  
output          randclk_wb_ctrl_mod_en_w2;  
output          randclk_wb_idx_mod_en_w5;   
wire            randclk_mad_mod_en_w2;      
wire    [20:0]  randclk_oper_gpr_mod_en_w32; 
wire            randclk_pcgen_mod_en_w32;   
wire            randclk_retire_mod_en_w2;   
wire            randclk_wb_buf_mod_en_w32;  
wire            randclk_wb_ctrl_mod_en_w2;  
wire            randclk_wb_idx_mod_en_w5;   
assign randclk_mad_mod_en_w2             = 1'b0;
assign randclk_oper_gpr_mod_en_w32[20:0] = 21'b0;
assign randclk_pcgen_mod_en_w32          = 1'b0;
assign randclk_retire_mod_en_w2          = 1'b0;
assign randclk_wb_buf_mod_en_w32         = 1'b0;
assign randclk_wb_ctrl_mod_en_w2         = 1'b0;
assign randclk_wb_idx_mod_en_w5          = 1'b0;
endmodule
