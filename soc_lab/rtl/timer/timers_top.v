/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module timers_top #
(
    `include         "timers_params.v"
)
(
    pclk                   ,
    presetn                ,
    penable                ,
    psel                   ,
    pwrite                 ,
    paddr                  ,
    pwdata                 ,
    scan_mode              ,
    timer_1_clk            ,
    timer_2_clk            ,
    timer_1_resetn         ,
    timer_2_resetn         ,
    timer_en               ,
    timertrig              ,
    timer_int              ,
    timer_int_n            ,
    timer_int_flag         ,
    timer_int_flag_n       ,
    etb_tim1_trig_en_on    ,
    etb_tim1_trig_en_off   ,
    etb_tim2_trig_en_on    ,
    etb_tim2_trig_en_off   ,
    tim1_etb_trig          ,
    tim2_etb_trig          ,
    prdata
);
input                                           pclk                   ;
input                                           presetn                ;
input                                           penable                ;
input                                           psel                   ;
input                                           pwrite                 ;
input             [7:0]            paddr                  ;        
input                         [31:0]            pwdata                 ;
input                                           scan_mode              ; 
input                                           timer_1_clk            ;
input                                           timer_1_resetn         ;
input                                           timer_2_clk            ;
input                                           timer_2_resetn         ;
input                                           etb_tim1_trig_en_on    ;
input                                           etb_tim1_trig_en_off   ;
input                                           etb_tim2_trig_en_on    ;
input                                           etb_tim2_trig_en_off   ;
output                                          tim1_etb_trig          ;
output                                          tim2_etb_trig          ;
output                        [ 1:0]            timer_en               ;
output                        [ 1:0]            timertrig              ;
output                        [ 1:0]            timer_int              ;
output                        [ 1:0]            timer_int_n            ;
output                                          timer_int_flag         ;
output                                          timer_int_flag_n       ;         
output                        [31:0]            prdata                 ;
wire                                [63:0]    bus_load_value       ;
wire                                [63:0]    bus_current_value    ;
wire                                 [1:0]    bus_interrupt        ;
wire                                          timer_1_clk          ; 
wire                                          timer_1_resetn       ;
wire                                          timer_1_toggle       ;
wire                                          timer_2_clk          ; 
wire                                          timer_2_resetn       ;
wire                                          timer_2_toggle       ;
wire                    [TIMER1_WIDTH-1:0]    timer1loadcount      ;
wire                    [TIMER2_WIDTH-1:0]    timer2loadcount      ;
wire                                 [1:0]    timer_en             ;
wire                                 [1:0]    timer_mode           ;
wire                                 [1:0]    timer_hwen           ;
wire                                 [1:0]    timer_int            ;
wire                                 [1:0]    timer_int_n          ;
wire                                          timer_int_flag       ;
wire                                          timer_int_flag_n     ;
timers_apbif U_TIMERS_APBIF 
(   
    .pclk                    (pclk                     ),
    .presetn                 (presetn                  ),
    .penable                 (penable                  ),
    .pwrite                  (pwrite                   ),
    .pwdata                  (pwdata                   ),
    .paddr                   (paddr                    ),
    .psel                    (psel                     ),
    .timer1loadcount         (timer1loadcount          ), 
    .timer2loadcount         (timer2loadcount          ), 
    .etb_tim1_trig_en_on     (etb_tim1_trig_en_on      ),
    .etb_tim1_trig_en_off    (etb_tim1_trig_en_off     ),
    .etb_tim2_trig_en_on     (etb_tim2_trig_en_on      ),
    .etb_tim2_trig_en_off    (etb_tim2_trig_en_off     ),
    .tim1_etb_trig           (tim1_etb_trig            ),
    .tim2_etb_trig           (tim2_etb_trig            ),
    .timer_en                (timer_en                 ),
    .timer_mode              (timer_mode               ),
    .timer_hwen              (timer_hwen               ),
    .timer_int_flag          (timer_int_flag           ),
    .timer_int_flag_n        (timer_int_flag_n         ),
    .timer_int               (timer_int                ),
    .timer_int_n             (timer_int_n              ),
    .bus_current_value       (bus_current_value        ),
    .bus_interrupts          (bus_interrupt            ),
    .prdata                  (prdata                   )
);
timers_frc #
(    .TIMER_WIDTH            (TIMER1_WIDTH             ),
     .TIMER_PULSE_EXTD       (TIMER1_PULSE_EXTD        )
) 
U_TIMER0 
(   
    .timer_clk               (timer_1_clk              ),
    .timer_resetn            (timer_1_resetn           ),
    .timer_en                (timer_en[0]              ),
    .timer_mode              (timer_mode[0]            ),
    .load_value              (timer1loadcount          ),
    .current_value           (bus_current_value[31:0]  ),
    .toggle                  (timer_1_toggle           ),
    .interrupt               (bus_interrupt[0]         ),
    .timertrig               (timertrig[0]             ),
    .timerhwen               (timer_hwen[0]            )
 );
timers_frc #
(    .TIMER_WIDTH            (TIMER2_WIDTH             ),
     .TIMER_PULSE_EXTD       (TIMER2_PULSE_EXTD        )
) 
U_TIMER1 
(   
    .timer_clk               (timer_2_clk              ),
    .timer_resetn            (timer_2_resetn           ),
    .timer_en                (timer_en[1]              ),
    .timer_mode              (timer_mode[1]            ),
    .load_value              (timer2loadcount          ),
    .current_value           (bus_current_value[63:32] ),
    .toggle                  (timer_2_toggle           ),
    .interrupt               (bus_interrupt[1]         ),
    .timertrig               (timertrig[1]             ),
    .timerhwen               (timer_hwen[1]            )
 );
endmodule
