/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ahbm_dummy_top(
hclk,
hrst_b,
mhrdata,
mhresp,
mhready,
mhgrant,
mhwdata,
mhburst,
mhtrans,
mhwrite,
mhaddr,
mhsize,
mhprot
);
output   [31:0]  mhaddr;       
output   [2 :0]  mhburst;      
output   [3 :0]  mhprot;       
output   [2 :0]  mhsize;       
output   [1 :0]  mhtrans;      
output   [31:0]  mhwdata;      
output           mhwrite; 
input          hclk;      
input          hrst_b;      
input          mhgrant;      
input  [31:0]  mhrdata;      
input          mhready;      
input  [1 :0]  mhresp;  
wire   [31:0]  mhaddr;       
wire   [2 :0]  mhburst;      
wire   [3 :0]  mhprot;       
wire   [2 :0]  mhsize;       
wire   [1 :0]  mhtrans;      
wire   [31:0]  mhwdata;      
wire           mhwrite; 
assign mhaddr[31:0]  = 32'b0; 
assign mhburst[2 :0] = 3'b0; 
assign mhprot[3 :0]  = 4'b0;
assign mhsize[2 :0]  = 3'b0;
assign mhtrans[1 :0] = 2'b0; 
assign mhwdata[31:0] = 32'b0; 
assign mhwrite       = 1'b0;
endmodule
