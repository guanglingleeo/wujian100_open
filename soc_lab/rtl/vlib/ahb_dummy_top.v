/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ahb_dummy_top(
  haddr,
  hclk,
  hprot,
  hrdata,
  hready,
  hresp,
  hrst_b,
  hsel,
  hsize,
  htrans,
  hwdata,
  hwrite,
  intr
);
input   [31:0]  haddr;        
input           hclk;         
input   [3 :0]  hprot;        
input           hrst_b;       
input           hsel;         
input   [2 :0]  hsize;        
input   [1 :0]  htrans;       
input   [31:0]  hwdata;       
input           hwrite;       
output  [31:0]  hrdata;       
output          hready;  
output  [1 :0]  hresp;    
output		intr;    
wire  [31:0]  hrdata;       
wire          hready;  
wire  [1 :0]  hresp;    
wire          intr;
assign hrdata[31:0] = 32'b0;       
assign hready = 1'b1;  
assign hresp[1:0] = 2'b0;    
assign intr = 1'b0;     
endmodule
