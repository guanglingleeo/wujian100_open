/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_rst_top(
  cpurst_b,
  hadrst_b,
  pad_cpu_rst_b,
  pad_had_jtg_trst_b,
  pad_had_rst_b,
  pad_yy_test_mode,
  trst_b
);
input        pad_cpu_rst_b;     
input        pad_had_jtg_trst_b; 
input        pad_had_rst_b;     
input        pad_yy_test_mode;  
output       cpurst_b;          
output       hadrst_b;          
output       trst_b;            
wire         cpurst_b;          
wire         hadrst_b;          
wire         pad_cpu_rst_b;     
wire         pad_had_jtg_trst_b; 
wire         pad_had_rst_b;     
wire         pad_yy_test_mode;  
wire         trst_b;            
assign cpurst_b = pad_yy_test_mode ? pad_had_jtg_trst_b : pad_cpu_rst_b;
assign hadrst_b = pad_yy_test_mode ? pad_had_jtg_trst_b : pad_had_rst_b;
assign trst_b = pad_had_jtg_trst_b;
endmodule
