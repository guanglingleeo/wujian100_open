/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A15e(
  had_core_dbg_mode_req,
  iu_had_xx_mldst,
  iu_had_xx_retire,
  iu_had_xx_retire_normal,
  iu_yy_xx_dbgon,
  A161,
  A162,
  A1853f
);
input        had_core_dbg_mode_req;         
input        iu_had_xx_mldst;               
input        iu_had_xx_retire;              
input        iu_had_xx_retire_normal;       
input        iu_yy_xx_dbgon;                
input        A161;                 
output       A162;                
output       A1853f; 
wire         had_core_dbg_mode_req;         
wire         iu_had_xx_mldst;               
wire         iu_had_xx_retire;              
wire         iu_had_xx_retire_normal;       
wire         iu_yy_xx_dbgon;                
wire         A161;                 
wire         A18540;            
wire         A162;                
wire         A1853f; 
wire         A163;                      
wire         A1853e;                     
assign A163  = !iu_yy_xx_dbgon
                && A161
                && !had_core_dbg_mode_req;
assign A1853e =    iu_had_xx_retire
                  && !iu_had_xx_mldst
                  && A163;
assign A18540 = 1'b1;
assign A162 = A1853e && A18540
                        && iu_had_xx_retire_normal;
assign A1853f = 1'b0;
endmodule
