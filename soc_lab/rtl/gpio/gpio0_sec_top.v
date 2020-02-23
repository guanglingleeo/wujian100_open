/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module gpio0_sec_top(
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
  pprot,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  tipc_gpio0_trust
);
input   [31:0]  gpio_ext_porta;  
input   [31:0]  paddr;           
input           pclk;            
input           pclk_intr;       
input           penable;         
input   [2 :0]  pprot;           
input           presetn;         
input           psel;            
input   [31:0]  pwdata;          
input           pwrite;          
input           tipc_gpio0_trust; 
output  [31:0]  gpio0_etb_trig;  
output          gpio_intr_flag;  
output          gpio_intrclk_en; 
output  [31:0]  gpio_porta_ddr;  
output  [31:0]  gpio_porta_dr;   
output  [31:0]  prdata;          
wire    [31:0]  gpio0_etb_trig;  
wire    [31:0]  gpio_ext_porta;  
wire            gpio_intr_flag;  
wire            gpio_intrclk_en; 
wire    [31:0]  gpio_porta_ddr;  
wire    [31:0]  gpio_porta_dr;   
wire    [31:0]  i_prdata;        
wire            i_psel;          
wire            i_pwrite;        
wire    [31:0]  paddr;           
wire            pclk;            
wire            pclk_intr;       
wire            penable;         
wire    [2 :0]  pprot;           
wire    [31:0]  prdata;          
wire            presetn;         
wire            psel;            
wire    [31:0]  pwdata;          
wire            pwrite;          
wire            tipc_gpio0_trust; 
gpio0  x_gpio0 (
  .gpio0_etb_trig  (gpio0_etb_trig ),
  .gpio_ext_porta  (gpio_ext_porta ),
  .gpio_intr_flag  (gpio_intr_flag ),
  .gpio_intrclk_en (gpio_intrclk_en),
  .gpio_porta_ddr  (gpio_porta_ddr ),
  .gpio_porta_dr   (gpio_porta_dr  ),
  .paddr           (paddr          ),
  .pclk            (pclk           ),
  .pclk_intr       (pclk_intr      ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .presetn         (presetn        ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;
endmodule
