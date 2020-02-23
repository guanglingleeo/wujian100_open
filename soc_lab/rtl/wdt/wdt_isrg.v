/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_isrg #
(
   `include     "wdt_params.v"
)
(
   input  wire                         clk            ,
   input  wire    	                   rst_n          ,
   input  wire                         clk_en         ,
   input  wire  [WDT_CNT_WIDTH-1:0]    cnt_val        ,
   input  wire    	                   eoi_en         ,
   input  wire    	                   restart        ,
   input  wire                [7:0]    rst_pulse_len  ,
   input  wire                         resp_mod       ,
   input  wire                         pause          ,
   output reg   		               wdt_int        ,
   output reg                          sys_rst         
);
reg    [7:0]                rst_cnt         ;
reg                         extend          ;
wire                        clr_int         ;
wire                        ext_clr_int     ;
wire                        clr_sys_rst     ;
wire                        zero_cnt        ;
reg                         prev_zero_cnt   ;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        wdt_int <= 1'b0;
    else if(resp_mod) begin
        if(ext_clr_int)
            wdt_int <= 1'b0;
        else if(zero_cnt & clk_en & (~pause))
            wdt_int <= 1'b1;
        else ;
    end
    else
        wdt_int <= 1'b0;
end
assign  ext_clr_int = (WDT_CLK_EN == 1) ? (clr_int | extend) : clr_int;
assign  clr_int = restart | eoi_en;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        extend <= 1'b0;
    else
        extend <= ((clr_int & (~clk_en)) | ext_clr_int) & ~(clk_en & ext_clr_int);
end 
assign  zero_cnt = (cnt_val == {WDT_CNT_WIDTH{1'b0}}) ? 1'b1 : 1'b0;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        sys_rst <= 1'b0;
    else begin
        if(clr_sys_rst)
            sys_rst <= 1'b0;
        else if(zero_cnt & clk_en & (~pause) & (~ext_clr_int)) begin
            if(resp_mod)
                sys_rst <= wdt_int;
            else
                sys_rst <= 1'b1;
        end
        else ;
    end
end 
assign  clr_sys_rst = (rst_cnt >= rst_pulse_len) ? 1'b1 : 1'b0;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        rst_cnt <= 8'b0;
    else begin
        if(sys_rst)
            rst_cnt <= rst_cnt + 1'b1;
        else
            rst_cnt <= 8'b0;
    end
end 
endmodule
