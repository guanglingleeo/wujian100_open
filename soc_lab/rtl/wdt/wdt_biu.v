/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_biu #
(
    parameter      WDT_ADDR_LHS = 5'd10
)
(
    input  wire                            pclk        ,
    input  wire                            presetn     ,
    input  wire                            psel        ,
    input  wire         [WDT_ADDR_LHS:0]   paddr       ,
    input  wire                            pwrite      ,
    input  wire                            penable     ,
    input  wire                   [31:0]   pwdata      ,
    output reg                    [31:0]   prdata      ,
    input  wire                   [31:0]   iprdata     ,
    output wire   			               wr_en       ,
    output wire   			               rd_en       ,
    output wire        [WDT_ADDR_LHS-2:0]  reg_addr    ,
    output wire                   [31:0]   ipwdata      
 );
assign  wr_en = psel &  penable &  pwrite;
assign  rd_en = psel & !penable & !pwrite;
assign reg_addr = paddr[WDT_ADDR_LHS:2];
assign  ipwdata = pwdata;
always @(posedge pclk or negedge presetn)
begin
   if(presetn == 1'b0)
       prdata <= 32'b0;
   else if(rd_en == 1'b1)	    
 	  prdata <= iprdata;
   else ;
end
endmodule
