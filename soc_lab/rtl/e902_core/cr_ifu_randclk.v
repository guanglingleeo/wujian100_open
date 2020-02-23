/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ifu_randclk(
  randclk_ibuf_entry_data_mod_en_w16,
  randclk_ibuf_pop_mod_en_w3,
  randclk_ibuf_push_mod_en_w3
);
output  [3:0]  randclk_ibuf_entry_data_mod_en_w16; 
output         randclk_ibuf_pop_mod_en_w3;        
output         randclk_ibuf_push_mod_en_w3;       
wire    [3:0]  randclk_ibuf_entry_data_mod_en_w16; 
wire           randclk_ibuf_pop_mod_en_w3;        
wire           randclk_ibuf_push_mod_en_w3;       
assign randclk_ibuf_push_mod_en_w3             = 1'b0;
assign randclk_ibuf_pop_mod_en_w3              = 1'b0;
assign randclk_ibuf_entry_data_mod_en_w16[3:0] = 4'b0;
endmodule
