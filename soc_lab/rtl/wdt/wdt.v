/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt(
pclk,
presetn,
penable,
pwrite,
pwdata,
paddr,
psel,
speed_up,
scan_mode,
wdt_en_external,
wdt_int,
wdt_int_n,
wdt_sys_rst,
wdt_sys_rst_n,
prdata
);
input                              pclk             ;
input                              presetn          ;
input                              penable          ;
input                              pwrite           ;
input                    [31:0]    pwdata           ;
input          		[7:0]      paddr            ;
input                              psel             ;
input                              speed_up         ;
input                              scan_mode        ;
input                              wdt_en_external  ;
output                             wdt_int          ;
output                             wdt_int_n        ;
output                             wdt_sys_rst      ;
output                             wdt_sys_rst_n    ;
output                   [31:0]    prdata           ;
wire                               wr_en            ;
wire                               rd_en            ;
wire                      [3:0]    byte_en          ;
wire         [5:0]                 reg_addr         ;
wire                     [31:0]    ipwdata          ;
wire                     [31:0]    iprdata          ;
wire        [31:0]                 cnt              ;
wire                               wdt_int          ;
wire        [31:0]                 top              ;
wire                               restart          ;
wire                               wdt_en           ;
wire                               eoi_en           ;
wire                      [7:0]    rpl              ;
wire                               rmod             ;
wire                               sys_rst          ;
wire                               wdt_int_n        ;
wire                               wdt_sys_rst      ;
wire                               wdt_sys_rst_n    ;
wire                               wdt_clk_en       ;
wire                               int_wdt_clk_en   ;
wire                               pause            ;
wire                               int_pause        ;
parameter        WDT_ADDR_LHS = 5'd7;
parameter        WDT_CLK_EN = 1'b0;
parameter        WDT_PAUSE = 1'b0;
wdt_biu # 
(   
    .WDT_ADDR_LHS       (WDT_ADDR_LHS     )
)
U_WDT_BIU
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .psel               (psel             ),
    .penable            (penable          ),
    .pwrite             (pwrite           ),
    .paddr              (paddr            ),
    .pwdata             (pwdata           ),
    .prdata             (prdata           ),
    .wr_en              (wr_en            ),
    .rd_en              (rd_en            ),
    .reg_addr           (reg_addr         ),
    .ipwdata            (ipwdata          ),
    .iprdata            (iprdata          )
);
wdt_regfile U_WDT_REGFILE
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .clk_en             (int_wdt_clk_en   ),
    .wdt_en_external    (wdt_en_external  ),
    .wr_en              (wr_en            ),
    .rd_en              (rd_en            ),
    .reg_addr           (reg_addr         ),
    .cnt                (cnt              ),
    .wdt_int            (wdt_int          ),
    .ipwdata            (ipwdata          ),
    .iprdata            (iprdata          ),      
    .top                (top              ),
    .restart            (restart          ),
    .wdt_en             (wdt_en           ),
    .eoi_en             (eoi_en           ),
    .rpl                (rpl              ),
    .rmod               (rmod             ) 
);
wdt_isrc   
U_WDT_ISRC
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .wdt_clk_en         (int_wdt_clk_en   ),
    .top                (top              ),
    .restart            (restart          ),
    .wdt_en             (wdt_en           ),
    .eoi_en             (eoi_en           ),
    .rpl                (rpl              ),
    .rmod               (rmod             ),
    .pause              (int_pause        ),
    .speed_up           (speed_up         ),
    .scan_mode          (scan_mode        ),
    .cnt                (cnt              ),
    .wdt_int            (wdt_int          ),
    .sys_rst            (sys_rst          )
);
assign  int_wdt_clk_en = (WDT_CLK_EN == 1) ? wdt_clk_en : 1'b1;
assign  int_pause      = (WDT_PAUSE == 1)  ? pause : 1'b0;
assign  wdt_int_n      = ~wdt_int;
assign  wdt_sys_rst    = sys_rst;
assign  wdt_sys_rst_n  = ~sys_rst;
endmodule
