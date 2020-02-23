/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clk_top(
  forever_cpuclk,
  forever_cpuclk_nogated,
  forever_jtgclk,
  pad_had_jtg_tclk,
  pad_yy_test_mode,
  pll_core_cpuclk
);
input        pad_had_jtg_tclk;      
input        pad_yy_test_mode;      
input        pll_core_cpuclk;       
output       forever_cpuclk;        
output       forever_cpuclk_nogated; 
output       forever_jtgclk;        
wire         forever_cpuclk;        
wire         forever_cpuclk_nogated; 
wire         forever_jtgclk;        
wire         pad_had_jtg_tclk;      
wire         pad_yy_test_mode;      
wire         pll_core_cpuclk;       
assign forever_jtgclk = pad_had_jtg_tclk;
assign forever_cpuclk = pad_yy_test_mode ? pad_had_jtg_tclk : pll_core_cpuclk;
assign forever_cpuclk_nogated = pad_yy_test_mode ? pad_had_jtg_tclk : pll_core_cpuclk;
endmodule
