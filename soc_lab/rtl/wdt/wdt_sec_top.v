/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_sec_top(
  intr,
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  prst_b,
  psel,
  pwdata,
  pwrite,
  scan_mode,
  sys_rst_b,
  tipc_wdt_trust
);
input   [31:0]  paddr;         
input           pclk;          
input           penable;       
input   [2 :0]  pprot;         
input           prst_b;        
input           psel;          
input   [31:0]  pwdata;        
input           pwrite;        
input           scan_mode;     
input           tipc_wdt_trust; 
output          intr;          
output  [31:0]  prdata;        
output          sys_rst_b;     
wire    [7 :0]  i_paddr;       
wire    [31:0]  i_prdata;      
wire            i_psel;        
wire            i_pwrite;      
wire            intr;          
wire    [31:0]  paddr;         
wire            pclk;          
wire            penable;       
wire    [2 :0]  pprot;         
wire    [31:0]  prdata;        
wire            prst_b;        
wire            psel;          
wire    [31:0]  pwdata;        
wire            pwrite;        
wire            scan_mode;     
wire            sys_rst_b;     
wire            tipc_wdt_trust; 
wire            wdt_int_n;     
wire            wdt_sys_rst;   
wdt  x_wdt (
  .paddr           (i_paddr        ),
  .pclk            (pclk           ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .presetn         (prst_b         ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       ),
  .scan_mode       (scan_mode      ),
  .speed_up        (1'b0           ),
  .wdt_en_external (1'b0           ),
  .wdt_int         (intr           ),
  .wdt_int_n       (wdt_int_n      ),
  .wdt_sys_rst     (wdt_sys_rst    ),
  .wdt_sys_rst_n   (sys_rst_b      )
);
assign i_paddr[7:0] = paddr[7:0];
assign prdata[31:0] = i_prdata[31:0] ;
assign i_pwrite = pwrite ;
assign i_psel = psel ;
endmodule
