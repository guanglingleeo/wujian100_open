/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module chntrg_latch(
  chnc_gbc_chnen,
  chnc_gbc_sfwtrg,
  chnc_gbc_trgclr,
  chntrg_latch,
  etb_dmacchn_trg,
  hclk,
  hrst_n
);
input        chnc_gbc_chnen;  
input        chnc_gbc_sfwtrg; 
input        chnc_gbc_trgclr; 
input        etb_dmacchn_trg; 
input        hclk;            
input        hrst_n;          
output       chntrg_latch;    
reg          chntrg_latch;    
wire         chnc_gbc_chnen;  
wire         chnc_gbc_sfwtrg; 
wire         chnc_gbc_trgclr; 
wire         chntrg_latch_set; 
wire         etb_dmacchn_trg; 
wire         hclk;            
wire         hrst_n;          
assign    chntrg_latch_set = ( etb_dmacchn_trg | chnc_gbc_sfwtrg ) & chnc_gbc_chnen ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chntrg_latch <= 1'b0 ;
    end
    else if(~chnc_gbc_chnen)
        chntrg_latch <= 1'b0 ;
    else  if(chntrg_latch_set) 
        chntrg_latch <= 1'b1 ;
    else if(chnc_gbc_trgclr)
        chntrg_latch <= 1'b0 ;
end
endmodule
