/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module gpio_top 
(
                   gpio_etb_trig      ,
                   pclk               ,
                   pclk_int           ,
                   dbclk              ,
                   dbclk_rstn         ,
                   scan_mode          ,                   
                   presetn            ,
                   penable            ,
                   pwrite             ,
                   pwdata             ,
                   paddr              ,
                   psel               ,
                   gpio_in_data       ,
                   gpio_out_data      ,
                   gpio_out_en        ,
                   gpio_int_flag      ,
                   gpio_int_clk_en    ,
                   prdata              
);
output              [31:0]     gpio_etb_trig        ;                   
input                                     pclk                 ;
input                                     pclk_int             ;
input                                     presetn              ;
input                                     dbclk                ; 
input                                     dbclk_rstn           ;
input                                     scan_mode            ;
input                                     penable              ;
input                                     pwrite               ;
input                          [31:0]     pwdata               ;
input               [6:0]     paddr                ;
input                                     psel                 ;
input               [31:0]     gpio_in_data         ;
output              [31:0]     gpio_out_data        ;
output              [31:0]     gpio_out_en          ;
output                                    gpio_int_flag        ;
output                                    gpio_int_clk_en      ;
output                         [31:0]     prdata               ;
wire                                      dbclk                ;
wire                                      dbclk_rstn           ;
wire                                      scan_mode            ;
wire                                      pclk_int             ;
wire                           [31:0]     prdata               ;
wire                [31:0]     gpio_sw_data         ;
wire                [31:0]     gpio_sw_dir          ;
wire                [31:0]     gpio_int_en          ;
wire                [31:0]     gpio_int_mask        ;
wire                [31:0]     gpio_int_type        ;
wire                [31:0]     gpio_int_pol         ;
wire                [31:0]     gpio_int             ;
wire                [31:0]     gpio_int_n           ;
wire                [31:0]     gpio_raw_int_status  ;
wire                [31:0]     gpio_debounce        ;
wire                                       gpio_int_level_sync  ;
wire                [31:0]     gpio_int_clr         ;
wire                [31:0]     gpio_in_data         ;
wire                [31:0]     gpio_ext_data        ;  
wire                [31:0]     gpio_out_data        ;
wire                [31:0]     gpio_out_en          ;
wire                                       gpio_int_flag        ;
wire                                       gpio_int_flag_n      ;
wire                [31:0]     gpio_int_status      ;
gpio_apbif U_GPIO_APBIF
(
    .pclk                          (pclk                      ),
    .presetn                       (presetn                   ),
    .penable                       (penable                   ),
    .pwrite                        (pwrite                    ),
    .pwdata                        (pwdata                    ),
    .paddr                         (paddr                     ),
    .psel                          (psel                      ),
    .gpio_sw_data                  (gpio_sw_data              ),
    .gpio_sw_dir                   (gpio_sw_dir               ),
    .gpio_int_en                   (gpio_int_en               ),
    .gpio_int_mask                 (gpio_int_mask             ),
    .gpio_int_type                 (gpio_int_type             ),
    .gpio_int_pol                  (gpio_int_pol              ),
    .gpio_int_status               (gpio_int_status           ),
    .gpio_raw_int_status           (gpio_raw_int_status       ),
    .gpio_debounce                 (gpio_debounce             ),
    .gpio_int_clr                  (gpio_int_clr              ),
    .gpio_ext_data                 (gpio_ext_data             ),
    .gpio_int_level_sync           (gpio_int_level_sync       ),
    .prdata                        (prdata                    )
);
gpio_ctrl U_GPIO_CTRL  
(
    .gpio_etb_trig                 (gpio_etb_trig             ),
    .pclk                          (pclk                      ),
    .pclk_int                      (pclk_int                  ),
    .dbclk                         (dbclk                     ),
    .presetn                       (presetn                   ),
    .dbclk_rstn                    (dbclk_rstn                ),
    .scan_mode                     (scan_mode                 ),
    .gpio_sw_data                  (gpio_sw_data              ),
    .gpio_sw_dir                   (gpio_sw_dir               ),
    .gpio_int_en                   (gpio_int_en               ),
    .gpio_int_mask                 (gpio_int_mask             ),
    .gpio_int_type                 (gpio_int_type             ),
    .gpio_int_pol                  (gpio_int_pol              ),
    .gpio_debounce                 (gpio_debounce             ),
    .gpio_int_clr                  (gpio_int_clr              ),
    .gpio_rx_data                  (gpio_in_data              ),
    .gpio_int_level_sync           (gpio_int_level_sync       ),
    .gpio_tx_data                  (gpio_out_data             ),
    .gpio_tx_en                    (gpio_out_en               ),
    .gpio_ext_data                 (gpio_ext_data             ),
    .gpio_int_flag                 (gpio_int_flag             ),
    .gpio_int                      (gpio_int                  ),
    .gpio_int_flag_n               (gpio_int_flag_n           ),
    .gpio_int_n                    (gpio_int_n                ),
    .gpio_int_status               (gpio_int_status           ),
    .gpio_raw_int_status           (gpio_raw_int_status       ),
    .gpio_int_clk_en               (gpio_int_clk_en           )
);
endmodule
