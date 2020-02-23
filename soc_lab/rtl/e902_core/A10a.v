/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A10a(
  A18595,
  A10d,
  A18594,
  A10e,
  A18593,
  A10f
);
input        A18595;         
input        A10d;         
input        A18594;       
input        A10e;       
input        A18593;      
output       A10f;     
reg          A18597; 
reg          A10b; 
reg          A18596; 
reg          A10c; 
wire         A18595;         
wire         A10d;         
wire         A18594;       
wire         A10e;       
wire         A18593;      
wire         A10f;     
always @(posedge A10d or negedge A10e)
begin
  if (!A10e)
    A10c <= 1'b0;
  else
    A10c <= A18593;
end
always @(posedge A18595 or negedge A18594)
begin
  if (!A18594) begin
    A18597 <= 1'b0;
    A10b <= 1'b0;
  end
  else begin
    A18597 <= A10c;
    A10b <= A18597;
  end   
end
always @(posedge A18595 or negedge A18594)
begin
  if (!A18594)
    A18596 <= 1'b0;
  else
    A18596 <= A10b;
end
assign A10f = !A18596 && A10b;
endmodule
