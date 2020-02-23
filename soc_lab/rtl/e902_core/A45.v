/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A45(
  A117,
  A18587,
  A11b,
  A18586,
  A11c,
  hadrst_b,
  iu_had_xx_retire,
  A18563,
  A14f,
  A18552,
  A153
);
input           A117;             
input           hadrst_b;           
input           iu_had_xx_retire;   
input           A18563;  
input           A14f; 
input           A18552; 
input           A153;     
output          A18587;       
output  [31:0]  A11b;        
output          A18586; 
output          A11c; 
reg     [3 :0]  A1865c;             
reg     [3 :0]  A46;             
wire            A1865b;           
wire            A47;         
wire            A1865a;           
wire            A117;             
wire            A18659;     
wire            A49;         
wire            A18658;           
wire            A18587;       
wire    [31:0]  A11b;        
wire            A18586; 
wire            A11c; 
wire            hadrst_b;           
wire            iu_had_xx_retire;   
wire            A18563;  
wire            A14f; 
wire            A18552; 
wire            A153;     
wire            A4f;    
wire            A18652;            
parameter A50        = 4'h0;
parameter A18651   = 4'h1;
parameter A51     = 4'h2;
parameter A18650   = 4'h3;
parameter A52     = 4'h4;
parameter A1864f    = 4'h5;
parameter A53      = 4'h6;
parameter A1864e  = 4'h7;
parameter A54    = 4'h8;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A1865c[3:0] <= A50;
  else
    A1865c[3:0] <= A46[3:0];
end
always @( * )
begin
  case(A1865c[3:0])
    A50 : begin
      if (A153)
        A46[3:0] = A18651;
      else
        A46[3:0] = A50;
    end
    A18651 : begin  
      if (A47)
        A46[3:0] = A51;
      else
        A46[3:0] = A18651;
    end
    A51 : begin   
      A46[3:0] = A18650;
    end
    A18650 : begin
      if (A49)  
        A46[3:0] = A52;
      else if (A47)  
        A46[3:0] = A51;
      else if (!A153)
        A46[3:0] = A50;
      else
        A46[3:0] = A18650;
    end
    A52 : begin
      A46[3:0] = A1864f;  
    end
    A1864f : begin
      if (A18659)   
        A46[3:0] = A53;
      else
        A46[3:0] = A1864f;
    end
    A53 : begin       
      A46[3:0] = A1864e;
    end
    A1864e : begin  
      if (A4f)
        A46[3:0] = A54;
      else
        A46[3:0] = A1864e;
    end
    A54 : begin    
      A46[3:0] = A18650;
    end
    default : begin
      A46[3:0] = A50;
    end
  endcase
end
assign A18659 = iu_had_xx_retire;
assign A4f = iu_had_xx_retire;
assign A47 = A18563 && A14f;
assign A49 = A18563 && A18552;
assign A1865a   = A1865c[3:0] == A51;
assign A18658   = A1865c[3:0] == A52;
assign A18652    = A1865c[3:0] == A53;
assign A1865b   = A1865c[3:0] == A54;
assign A11c   = A1865a || A18658 || A18652 || A1865b;
assign A11b[31:0] = A1865a ? 32'h00008093   
                         : A18658 ? 32'h00010113   
                         : A18652  ? 32'h0020a023   
                         : 32'h00408093;   
assign A18586  = A1865a || A18658 || A18652 || A1865b;
assign A18587 = (A1865a || A18658) ? 1'b1 : 1'b0;
endmodule
