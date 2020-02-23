/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module timers_apbif #
(
    `include              "timers_params.v"
)
(
    input  wire                                 pclk                  ,
    input  wire                                 presetn               ,
    input  wire                                 penable               ,
    input  wire                                 pwrite                ,
    input  wire                       [31:0]    pwdata                ,
    input  wire           [TIMER_ADDR_LHS:0]    paddr                 ,
    input  wire                                 psel                  ,
    output reg            [TIMER1_WIDTH-1:0]    timer1loadcount       ,
    output reg            [TIMER2_WIDTH-1:0]    timer2loadcount       ,
    output wire                       [ 1:0]    timer_en              ,
    output wire                       [ 1:0]    timer_mode            ,
    output wire                       [ 1:0]    timer_hwen            ,
    output wire                                 timer_int_flag        ,
    output wire                                 timer_int_flag_n      ,
    output wire                       [ 1:0]    timer_int             ,
    output wire                       [ 1:0]    timer_int_n           ,
    input  wire                       [63:0]    bus_current_value     ,
    input  wire                       [ 1:0]    bus_interrupts        ,
    output reg                        [31:0]    prdata                ,
    input  wire                                 etb_tim1_trig_en_on   ,
    input  wire                                 etb_tim2_trig_en_on   ,
    input  wire                                 etb_tim1_trig_en_off  ,
    input  wire                                 etb_tim2_trig_en_off  ,
    output reg                                  tim1_etb_trig         ,
    output reg                                  tim2_etb_trig
);
localparam           TIMER1LC_OFFSET      = 8'd0 ;
localparam           TIMER1CV_OFFSET      = 8'd1 ;
localparam           TIMER1CR_OFFSET      = 8'd2 ;
localparam           TIMER1EOI_OFFSET     = 8'd3 ;
localparam           TIMER1INTST_OFFSET   = 8'd4 ;
localparam           TIMER2LC_OFFSET      = 8'd5 ;
localparam           TIMER2CV_OFFSET      = 8'd6 ;
localparam           TIMER2CR_OFFSET      = 8'd7 ;
localparam           TIMER2EOI_OFFSET     = 8'd8 ;
localparam           TIMER2INTST_OFFSET   = 8'd9 ;
localparam           TIMERSINTST_OFFSET   = 8'd40;
localparam           TIMERSEOI_OFFSET     = 8'd41;
localparam           TIMERSRAW_OFFSET     = 8'd42;
reg     [TIMER_CTRL_WIDTH-1:0]    timer1controlreg       ;
reg     [TIMER_CTRL_WIDTH-1:0]    timer2controlreg       ;
reg                               timer1loadcount_wen    ;
reg                               timer1controlreg_wen   ;
reg                               timer1eoi_ren          ;
reg                               timer2loadcount_wen    ;
reg                               timer2controlreg_wen   ;
reg                               timer2eoi_ren          ;
reg                               timerseoi_ren          ;
reg                     [31:0]    ri_timer1loadcount     ;
reg                     [31:0]    ri_timer1currentvalue  ;
reg                     [31:0]    ri_timer1controlreg    ;
reg                     [31:0]    ri_timer1intstatus     ;
reg                     [31:0]    ri_timer2loadcount     ;
reg                     [31:0]    ri_timer2currentvalue  ;
reg                     [31:0]    ri_timer2controlreg    ;
reg                     [31:0]    ri_timer2intstatus     ;
reg                               timer1_int_ff1         ; 
reg                               timer1_int_ff2         ; 
reg                               timer2_int_ff1         ; 
reg                               timer2_int_ff2         ;
reg                     [ 1:0]    timer_int_tmp          ;
reg                     [ 1:0]    int_sync_ff1           ;
reg                     [31:0]    ri_timer_int           ;
reg                     [31:0]    ri_timersintstatus     ;
wire                    [31:0]    timer1currentvalue     ;  
wire                    [31:0]    timer2currentvalue     ;
wire                    [ 1:0]    int_sync               ;
wire                    [ 1:0]    timereoi               ;
wire                              timerseoi              ;
wire                    [ 1:0]    timeren                ; 
wire                    [ 1:0]    timermode              ;
wire                    [ 1:0]    timerhwen              ;
wire                    [ 1:0]    timerintmask           ;
wire                    [ 1:0]    edge_detected          ;
integer                           i;
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1LC_OFFSET)
            timer1loadcount_wen = 1'b1;
        else
            timer1loadcount_wen = 1'b0;
    end
    else
        timer1loadcount_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1CR_OFFSET)
            timer1controlreg_wen = 1'b1;
        else
            timer1controlreg_wen = 1'b0;
    end
    else
        timer1controlreg_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1EOI_OFFSET)
            timer1eoi_ren = 1'b1;
        else
            timer1eoi_ren = 1'b0;
    end
    else
        timer1eoi_ren = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2LC_OFFSET)
            timer2loadcount_wen = 1'b1;
        else
            timer2loadcount_wen = 1'b0;
    end
    else
        timer2loadcount_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2CR_OFFSET)
            timer2controlreg_wen = 1'b1;
        else
            timer2controlreg_wen = 1'b0;
    end
    else
        timer2controlreg_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2EOI_OFFSET)
            timer2eoi_ren = 1'b1;
        else
            timer2eoi_ren = 1'b0;
    end
    else
        timer2eoi_ren = 1'b0;
end
always @(*)
begin
  if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin
      if(paddr[TIMER_ADDR_LHS:0] == TIMERSEOI_OFFSET)
          timerseoi_ren = 1'b1;
      else
          timerseoi_ren = 1'b0;
  end
  else
      timerseoi_ren = 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        timer1loadcount <= {TIMER1_WIDTH{1'b0}};
    else if(timer1loadcount_wen == 1'b1)
        timer1loadcount <= pwdata[TIMER1_WIDTH-1:0];
    else ;
end
always @(*)
begin
    ri_timer1loadcount = 32'b0;
    ri_timer1loadcount[TIMER1_WIDTH-1:0] = timer1loadcount;
end
always @(*)
begin
    ri_timer1currentvalue = 32'b0;
    ri_timer1currentvalue[TIMER1_WIDTH-1:0] = timer1currentvalue[TIMER1_WIDTH-1:0];
end
always@(posedge pclk or negedge presetn)
begin
    if (presetn == 1'b0)
        timer1controlreg <= {TIMER_CTRL_WIDTH{1'b0}};
    else if(timer1controlreg_wen == 1'b1)
        timer1controlreg <= pwdata[TIMER_CTRL_WIDTH-1:0];
    else if(etb_tim1_trig_en_off == 1'b1)
        timer1controlreg[0] <= 1'b0;
    else if(etb_tim1_trig_en_on == 1'b1)
        timer1controlreg[0] <= 1'b1;
    else ;
end
always @(*)
begin
    ri_timer1controlreg = 32'b0;
    ri_timer1controlreg[TIMER_CTRL_WIDTH-1:0] = timer1controlreg;
end
always@(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        timer2loadcount <= {TIMER2_WIDTH{1'b0}};
    else if(timer2loadcount_wen == 1'b1)
        timer2loadcount <= pwdata[TIMER2_WIDTH-1:0];
    else ;
end
always @(*)
begin
    ri_timer2loadcount = 32'b0;
    ri_timer2loadcount[TIMER2_WIDTH-1:0] = timer2loadcount;
end
always @(*)
begin
    ri_timer2currentvalue = 32'b0;
    ri_timer2currentvalue[TIMER2_WIDTH-1:0] = timer2currentvalue[TIMER2_WIDTH-1:0];
end
always@(posedge pclk or negedge presetn)
begin
    if (presetn == 1'b0)
        timer2controlreg <= {TIMER_CTRL_WIDTH{1'b0}};
    else if(timer2controlreg_wen == 1'b1)
        timer2controlreg <= pwdata[TIMER_CTRL_WIDTH-1:0];
    else if(etb_tim2_trig_en_off == 1'b1)
        timer2controlreg[0] <= 1'b0;
    else if(etb_tim2_trig_en_on == 1'b1)
        timer2controlreg[0] <= 1'b1;
    else ;
end
always @(*)
begin
    ri_timer2controlreg = 32'b0;
    ri_timer2controlreg[TIMER_CTRL_WIDTH-1:0] = timer2controlreg;
end  
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        prdata <= 32'b0;
    else if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0)) begin
        case (paddr[TIMER_ADDR_LHS:2])
            TIMER1LC_OFFSET   : prdata <= ri_timer1loadcount;
            TIMER1CV_OFFSET   : prdata <= ri_timer1currentvalue;
            TIMER1CR_OFFSET   : prdata <= ri_timer1controlreg;
            TIMER1INTST_OFFSET: prdata <= ri_timer1intstatus;
            TIMER2LC_OFFSET   : prdata <= ri_timer2loadcount;
            TIMER2CV_OFFSET   : prdata <= ri_timer2currentvalue;
            TIMER2CR_OFFSET   : prdata <= ri_timer2controlreg;
            TIMER2INTST_OFFSET: prdata <= ri_timer2intstatus;
            TIMERSINTST_OFFSET: prdata <= ri_timersintstatus;
            TIMERSRAW_OFFSET  : prdata <= ri_timer_int;
            default           : prdata <= 32'b0;
        endcase
    end
    else ;
end
always @(posedge pclk or negedge presetn) 
begin
    if(presetn == 1'b0) begin
        timer1_int_ff1 <= 1'b0;
        timer1_int_ff2 <= 1'b0;
        timer2_int_ff1 <= 1'b0;
        timer2_int_ff2 <= 1'b0;
    end 
    else begin
        timer1_int_ff1 <= bus_interrupts[0];
        timer2_int_ff1 <= bus_interrupts[1];
        timer1_int_ff2 <= timer1_int_ff1;
        timer2_int_ff2 <= timer2_int_ff1;
    end
end
assign int_sync[0] = (TIMER1_METASTABLE==1) ? timer1_int_ff2 : bus_interrupts[0];
assign int_sync[1] = (TIMER2_METASTABLE==1) ? timer2_int_ff2 : bus_interrupts[1];
assign timer1currentvalue = bus_current_value[31:0];
assign timer2currentvalue = bus_current_value[63:32];
always @(posedge pclk or negedge presetn) 
begin
    if (presetn == 1'b0)
        int_sync_ff1 <= 2'b0;
    else
        int_sync_ff1 <= int_sync;
end
assign edge_detected = int_sync & (~int_sync_ff1);
assign timereoi = {timer2eoi_ren,timer1eoi_ren};
assign timerseoi = timerseoi_ren;
assign timeren = {timer2controlreg[0],timer1controlreg[0]};
assign timermode = {timer2controlreg[1],timer1controlreg[1]};
assign timerhwen = {timer2controlreg[4],timer1controlreg[4]};
always @(posedge pclk or negedge presetn) 
begin
    if(presetn == 1'b0)
      timer_int_tmp <= 2'b0;
    else begin
        for(i=0;i<2;i=i+1) begin
            if(edge_detected[i] == 1'b1) begin
                if(timeren[i]==1'b1)
                    timer_int_tmp[i] <= 1'b1;
                else
                    timer_int_tmp[i] <= 1'b0; 
            end
            else if((timereoi[i] == 1'b1) || (timerseoi == 1'b1) || (timeren[i]==1'b0))
                timer_int_tmp[i] <= 1'b0;
            else ; 
        end
    end
end
always @(*)
begin
    ri_timer_int = 32'b0;
    ri_timer_int[1:0] = timer_int_tmp;
end
always @(posedge pclk or negedge presetn) 
begin
   if(presetn == 1'b0)
       tim1_etb_trig <= 1'b0;
   else if(edge_detected[0] ==1'b1)
       tim1_etb_trig <= 1'b1;
   else
       tim1_etb_trig <= 1'b0;
end
always @(posedge pclk or negedge presetn) 
begin
   if(presetn == 1'b0)
       tim2_etb_trig <= 1'b0;
   else if(edge_detected[1] ==1'b1)
       tim2_etb_trig <= 1'b1;
   else
       tim2_etb_trig <= 1'b0;
end
assign  timerintmask[0] = timer1controlreg[2];
assign  timerintmask[1] = timer2controlreg[2];
always @(*) 
begin
    ri_timer1intstatus = 32'b0;
    ri_timer2intstatus = 32'b0;
    ri_timersintstatus = 32'b0;
    ri_timer1intstatus[0]   = ri_timer_int[0] & (~timerintmask[0]);
    ri_timer2intstatus[0]   = ri_timer_int[1] & (~timerintmask[1]);  
    ri_timersintstatus[1:0] = ri_timer_int[1:0] & (~timerintmask);
end
assign timer_int_flag   = |ri_timersintstatus;
assign timer_int_flag_n = ~timer_int_flag;
assign timer_int        = ri_timersintstatus[1:0];
assign timer_int_n      = ~timer_int;
assign timer_en         = timeren;
assign timer_mode       = timermode;
assign timer_hwen       = timerhwen;
endmodule
