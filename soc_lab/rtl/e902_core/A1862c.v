/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A1862c(
  had_pad_jdb_ack_b,
  had_pad_jdb_pm,
  had_pad_jtg_tap_on,
  had_pad_jtg_tms_o,
  had_pad_jtg_tms_oe,
  iu_yy_xx_dbgon,
  A13c,
  A18565,
  pad_had_jdb_req_b,
  pad_had_jtg_tap_en,
  pad_had_jtg_tms_i,
  A1855e,
  A144,
  A1855d,
  A152,
  tclk,
  trst_b
);
input          iu_yy_xx_dbgon;    
input          A13c;   
input          A18565;  
input          pad_had_jdb_req_b; 
input          pad_had_jtg_tap_en; 
input          pad_had_jtg_tms_i; 
input   [1:0]  A152;       
input          tclk;              
input          trst_b;            
output         had_pad_jdb_ack_b; 
output  [1:0]  had_pad_jdb_pm;    
output         had_pad_jtg_tap_on; 
output         had_pad_jtg_tms_o; 
output         had_pad_jtg_tms_oe; 
output         A1855e;  
output         A144;     
output         A1855d;      
reg            had_pad_jdb_ack_b; 
reg            A1862b;       
wire    [1:0]  had_pad_jdb_pm;    
wire           had_pad_jtg_tap_on; 
wire           had_pad_jtg_tms_o; 
wire           had_pad_jtg_tms_oe; 
wire           iu_yy_xx_dbgon;    
wire           A18628;        
wire           A13c;   
wire           A18565;  
wire           pad_had_jtg_tap_en; 
wire           pad_had_jtg_tms_i; 
wire           A1855e;  
wire           A144;     
wire           A1855d;      
wire    [1:0]  A152;       
wire           tclk;              
wire           trst_b;            
assign A18628 = 1'b0;
assign A1855e = 1'b0;
assign A144 = A18628 || pad_had_jtg_tap_en;
assign had_pad_jdb_pm[1:0] = A152[1:0];
always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    had_pad_jdb_ack_b <= 1'b1;
  else if (A1862b)
    had_pad_jdb_ack_b <= 1'b1;
  else if (iu_yy_xx_dbgon)
    had_pad_jdb_ack_b <= 1'b0;
  else
    had_pad_jdb_ack_b <= had_pad_jdb_ack_b;
end
always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    A1862b <= 1'b0;
  else if (!had_pad_jdb_ack_b)
    A1862b <= 1'b1;
  else if (!iu_yy_xx_dbgon)
    A1862b <= 1'b0;
  else
    A1862b <= A1862b;
end
assign had_pad_jtg_tap_on = A144;
assign A1855d = pad_had_jtg_tms_i;
assign had_pad_jtg_tms_o = A13c;
assign had_pad_jtg_tms_oe = A18565;
endmodule
