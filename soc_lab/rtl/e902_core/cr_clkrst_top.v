/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clkrst_top(
  cpurst_b,
  forever_cpuclk,
  forever_cpuclk_nogated,
  forever_jtgclk,
  hadrst_b,
  pad_cpu_rst_b,
  pad_had_jtg_tclk,
  pad_had_jtg_trst_b,
  pad_had_rst_b,
  pad_yy_test_mode,
  pll_core_cpuclk,
  trst_b
);
input        pad_cpu_rst_b;         
input        pad_had_jtg_tclk;      
input        pad_had_jtg_trst_b;    
input        pad_had_rst_b;         
input        pad_yy_test_mode;      
input        pll_core_cpuclk;       
output       cpurst_b;              
output       forever_cpuclk;        
output       forever_cpuclk_nogated; 
output       forever_jtgclk;        
output       hadrst_b;              
output       trst_b;                
wire         cpurst_b;              
wire         forever_cpuclk;        
wire         forever_cpuclk_nogated; 
wire         forever_jtgclk;        
wire         hadrst_b;              
wire         pad_cpu_rst_b;         
wire         pad_had_jtg_tclk;      
wire         pad_had_jtg_trst_b;    
wire         pad_had_rst_b;         
wire         pad_yy_test_mode;      
wire         pll_core_cpuclk;       
wire         trst_b;                
cr_clk_top  x_cr_clk_top (
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .forever_jtgclk         (forever_jtgclk        ),
  .pad_had_jtg_tclk       (pad_had_jtg_tclk      ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .pll_core_cpuclk        (pll_core_cpuclk       )
);
cr_rst_top  x_cr_rst_top (
  .cpurst_b           (cpurst_b          ),
  .hadrst_b           (hadrst_b          ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .pad_had_jtg_trst_b (pad_had_jtg_trst_b),
  .pad_had_rst_b      (pad_had_rst_b     ),
  .pad_yy_test_mode   (pad_yy_test_mode  ),
  .trst_b             (trst_b            )
);
endmodule
