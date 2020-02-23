/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_cnt #
(
   `include     "wdt_params.v"
)
(
   input  wire                       clk              ,
   input  wire                       clk_en           ,
   input  wire    	                 rst_n            ,
   input  wire  [WDT_CNT_WIDTH-1:0]  start_val        ,
   input  wire    	                 restart          ,
   input  wire    	                 cnt_en           ,
   input  wire    	                 pause            ,
   input  wire    	                 speed_up         ,
   input  wire                       scan_mode        ,
   output reg   [WDT_CNT_WIDTH-1:0]  cnt               
);
reg                           ext_rise_edge        ;
reg                           extend               ;
reg                           prev_cnt_en          ;
wire                          int_cnt_en           ;
wire   [WDT_CNT_WIDTH-1:0]    int_start_val        ;
wire                          ext_init_ld          ;
wire                          ext_restart          ;
wire                          initial_load         ;
wire                          rise_edge_cnt_en     ;
wire                          int_speed_up         ;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        cnt <= WDT_CNT_RST;
    else if(clk_en) begin
        if(initial_load)
            cnt <= int_start_val;
        else if(ext_restart || (cnt == {WDT_CNT_WIDTH{1'b0}} & (~pause)))
            cnt <= int_start_val;
        else if(int_cnt_en)
            cnt <= cnt - 1'b1;
        else ;
    end
    else ;
end
assign  int_start_val[WDT_CNT_WIDTH-1:8] = int_speed_up ? {(WDT_CNT_WIDTH-8){1'b0}} : 
                                                          start_val[WDT_CNT_WIDTH-1:8];
assign  int_start_val[7:0]               = int_speed_up ? 8'b11111111 : 
                                                          start_val[7:0];
assign  int_speed_up                     = scan_mode ? cnt[0] : speed_up;
assign  int_cnt_en                       = cnt_en & (~pause);
assign  initial_load                     = (WDT_DUAL_TOP == 1) ? ext_init_ld : 1'b0;
assign  ext_init_ld  = (WDT_CLK_EN == 1) ? (rise_edge_cnt_en | ext_rise_edge) : rise_edge_cnt_en;
always @ (posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        ext_rise_edge <= 1'b0;
    else
        ext_rise_edge <= ((rise_edge_cnt_en & (~clk_en)) | ext_init_ld) & ~(clk_en & ext_init_ld);
end
assign  rise_edge_cnt_en = cnt_en & ~prev_cnt_en;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0) 
        prev_cnt_en <= 1'b0;
    else
        prev_cnt_en <= cnt_en;
end
assign  ext_restart = (WDT_CLK_EN == 1) ? (restart | extend) : restart;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        extend <= 1'b0;
    else
        extend <= ((restart & (~clk_en)) | ext_restart) & ~(clk_en & ext_restart);
end
endmodule
