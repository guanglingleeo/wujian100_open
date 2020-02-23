/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_isrc #
(
    `include     "wdt_params.v"
)
(
    input  wire                         pclk        ,
    input  wire   	                    presetn     ,
    input  wire   	                    wdt_clk_en  ,
    input  wire  [WDT_CNT_WIDTH-1:0]    top         ,
    input  wire                         restart     ,
    input  wire                         wdt_en      ,
    input  wire                         eoi_en      ,
    input  wire                [7:0]    rpl         ,
    input  wire                         rmod        ,
    input  wire                         pause       ,
    input  wire                         speed_up    ,
    input  wire                         scan_mode   ,
    output wire  [WDT_CNT_WIDTH-1:0]    cnt         ,
    output wire  		                wdt_int     ,
    output wire                         sys_rst      
);
   wdt_cnt U_WDT_CNT
   (
      .clk          (pclk          ),
      .clk_en       (wdt_clk_en    ),
      .rst_n        (presetn       ),
      .start_val    (top           ),
      .restart      (restart       ),
      .cnt_en       (wdt_en        ),
      .pause        (pause         ),
      .speed_up     (speed_up      ),
      .scan_mode    (scan_mode     ),
      .cnt          (cnt           )
   );
   wdt_isrg U_WDT_ISRG
   (
    .clk           (pclk           ),
    .clk_en        (wdt_clk_en     ),
    .rst_n         (presetn        ),
    .cnt_val       (cnt            ),
    .eoi_en        (eoi_en         ),
    .restart       (restart        ),
    .rst_pulse_len (rpl            ),
    .resp_mod      (rmod           ),
    .pause         (pause          ),
    .wdt_int       (wdt_int        ),
    .sys_rst       (sys_rst        )
    );
endmodule
