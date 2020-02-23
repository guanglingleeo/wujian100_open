/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`include "gpio_defines.vh"
module gpio0(
  gpio0_etb_trig,
  gpio_ext_porta,
  gpio_intr_flag,
  gpio_intrclk_en,
  gpio_porta_ddr,
  gpio_porta_dr,
  paddr,
  pclk,
  pclk_intr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite
);
input   [31:0]  gpio_ext_porta; 
input   [31:0]  paddr;          
input           pclk;           
input           pclk_intr;      
input           penable;        
input           presetn;        
input           psel;           
input   [31:0]  pwdata;         
input           pwrite;         
output  [31:0]  gpio0_etb_trig; 
output          gpio_intr_flag; 
output          gpio_intrclk_en; 
output  [31:0]  gpio_porta_ddr; 
output  [31:0]  gpio_porta_dr;  
output  [31:0]  prdata;         
wire    [31:0]  gpio0_etb_trig; 
wire    [31:0]  gpio0_prdata;   
wire    [31:0]  gpio_ext_porta; 
wire            gpio_intr_flag; 
wire            gpio_intrclk_en; 
wire    [31:0]  gpio_porta_ddr; 
wire    [31:0]  gpio_porta_dr;  
wire    [31:0]  paddr;          
wire            pclk;           
wire            pclk_intr;      
wire            penable;        
wire    [31:0]  prdata;         
wire            presetn;        
wire            psel;           
wire    [31:0]  pwdata;         
wire            pwrite;         
gpio_top  x_gpio_top (
  .dbclk           (pclk           ),
  .dbclk_rstn      (presetn        ),
  .gpio_etb_trig   (gpio0_etb_trig ),
  .gpio_in_data    (gpio_ext_porta ),
  .gpio_int_clk_en (gpio_intrclk_en),
  .gpio_int_flag   (gpio_intr_flag ),
  .gpio_out_data   (gpio_porta_dr  ),
  .gpio_out_en     (gpio_porta_ddr ),
  .paddr           (paddr[6:0]     ),
  .pclk            (pclk           ),
  .pclk_int        (pclk_intr      ),
  .penable         (penable        ),
  .prdata          (gpio0_prdata   ),
  .presetn         (presetn        ),
  .psel            (psel           ),
  .pwdata          (pwdata         ),
  .pwrite          (pwrite         ),
  .scan_mode       (1'b0           )
);
assign prdata[31:0] = gpio0_prdata[31:0];
endmodule
