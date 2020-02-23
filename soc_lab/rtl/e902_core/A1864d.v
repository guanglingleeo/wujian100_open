/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A1864d(
  A117,
  forever_cpuclk_nogated,
  had_pad_wakeup_req_b,
  hadrst_b,
  A13c,
  A18565,
  A13d,
  A18564,
  A13e,
  A18563,
  A144,
  A1855d,
  A150,
  A18551,
  A151,
  A18550,
  A1854e,
  tclk,
  trst_b
);
input           A117;                
input           forever_cpuclk_nogated; 
input           hadrst_b;              
input           A144;         
input           A1855d;          
input   [31:0]  A150;        
input           A18551;     
input           A151;   
input           A18550;    
input           tclk;                  
input           trst_b;                
output          had_pad_wakeup_req_b;  
output          A13c;       
output          A18565;      
output          A13d;        
output          A18564; 
output  [31:0]  A13e;          
output          A18563;     
output          A1854e;          
reg             A55;                
reg     [31:0]  A1864c;               
reg     [31:0]  A56;           
reg     [3 :0]  A1864b;            
reg     [4 :0]  A57;      
reg     [3 :0]  A1864a;            
reg             A58;            
reg             A18649;          
reg     [1 :0]  A59;                
reg             A18648;        
reg     [6 :0]  A5a;           
reg             A1854e;          
reg             A5b;                   
reg             A18646;                
wire            A117;                
wire            forever_cpuclk_nogated; 
wire            had_pad_wakeup_req_b;  
wire            hadrst_b;              
wire            A13c;       
wire            A18565;      
wire            A13d;        
wire            A18564; 
wire    [31:0]  A13e;          
wire            A18563;     
wire            A144;         
wire            A1855d;          
wire    [31:0]  A150;        
wire            A1863f;        
wire            A63;           
wire            A1863e;        
wire            A64;    
wire            A1863d;     
wire            A65;     
wire            A1863c;           
wire            A66;       
wire            A1863b;          
wire            A67;          
wire            A1863a;         
wire            A68;        
wire            A18639;         
wire            A69;         
wire            A18638;          
wire            A6a;              
wire            A18637;              
wire            A6b;         
wire            A18636;     
wire            A6c;         
wire            A18635;     
wire            A6d;                
wire            tclk;                  
wire            A6e;                   
wire            A18633;                 
wire            trst_b;                
parameter A18632   = 4'b0000;
parameter A70  = 4'b0001;
parameter A18631     = 4'b0011;
parameter A71     = 4'b0010;
parameter A18630   = 4'b0110;
parameter A72   = 4'b0111;
parameter A1862f   = 4'b0101;
parameter A73 = 4'b0100;
parameter A1862e   = 4'b1100;
always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    A1864b[3:0] <= A18632;
  else if (A1863c && A18633)
    A1864b[3:0] <= A18632;
  else
    A1864b[3:0] <= A1864a[3:0];
end
always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    A5a[6:0] <= 7'd80;
  else begin
    if (!A18633)
      A5a[6:0] <= 7'd80;
    else if (A5a[6:0] != 7'd0)
      A5a[6:0] <= A5a[6:0] - 7'd1;
    else
      A5a[6:0] <= 7'd80;
  end
end
assign A1863c = (A5a[6:0] == 7'd00);
A10a  A74 (
  .A18595            (A117         ),
  .A10d            (tclk           ),
  .A18594          (hadrst_b       ),
  .A10e          (trst_b         ),
  .A18593         (A1863c    ),
  .A10f        (A66)
);
assign A13d = A66;
always @( * )
begin
  case (A1864b[3:0])
    A18632 : begin
      if (A144) begin
        if (!A18633)
          A1864a[3:0] = A18631;
        else
          A1864a[3:0] = A70;
      end
      else
        A1864a[3:0] = A18632;
    end
    A70 : begin
      if (!A18633)  
        A1864a[3:0] = A18631;
      else
        A1864a[3:0] = A70;
    end
    A18631 : begin   
      A1864a[3:0] = A71;
    end
    A71 : begin  
      if (A18648 == 1'b0)
        A1864a[3:0] = A18630;
      else
        A1864a[3:0] = A71;
    end
    A18630 : begin  
      if (A18649)   
        A1864a[3:0] = A1862f;
      else                
        A1864a[3:0] = A72;
    end
    A1862f : begin
      A1864a[3:0] = A72;
    end
    A72 : begin  
      if (A57[4:0] == 5'b0)
        A1864a[3:0] = A73;
      else
        A1864a[3:0] = A72;
    end
    A73 : begin
      A1864a[3:0] = A1862e;
    end
    A1862e : begin
      A1864a[3:0] = A70;
    end
    default : begin
      A1864a[3:0] = A18632;
    end
  endcase
end
assign A63    = A1864b[3:0] == A18631;
assign A6a       = A1864b[3:0] == A18630;
assign A18637       = A1864b[3:0] == A1862e;
assign A69  = A1864b[3:0] == A18631;
assign A18639  = A1864b[3:0] == A72;
assign A1863e = A1864b[3:0] == A73;
assign A18638   = A1864b[3:0] == A1862f;
assign A1863a  = A1863e;
assign A68 = A18638;
assign A67   = A65 && A18639;
assign A1863b   = A1863d && A18639;
assign A6c  = A65 && A18637      && (!A58);
assign A6b  = A1863d && !A18649 && A18637 && (!A58);
assign A1863f = A1863d &&  A18649 && A6a;
A10a  A1862d (
  .A18595              (A117           ),
  .A10d              (tclk             ),
  .A18594            (hadrst_b         ),
  .A10e            (trst_b           ),
  .A18593           (A6c    ),
  .A10f          (A18635)
);
A10a  A75 (
  .A18595              (A117           ),
  .A10d              (tclk             ),
  .A18594            (hadrst_b         ),
  .A10e            (trst_b           ),
  .A18593           (A6b    ),
  .A10f          (A18636)
);
assign A18564 = A18635;
assign A18563     = A18636;
assign had_pad_wakeup_req_b = (A1864b[3:0] == A18632)
                           || (A1864b[3:0] == A70);
always @(posedge tclk)
begin
  if (A63)
    A18649 <= A1855d;
end
always @(posedge tclk)
begin
  if (A69)
    A18648 <= 1'b1;
  else if (A1864b[3:0] == A71)
    A18648 <= 1'b0;
  else
    A18648 <= A18648;
end
always @(posedge tclk)
begin
  if (A1864b[3:0] == A71)
    A59[1:0] <= {A1855d, A59[1]};
  else
    A59[1:0] <= A59[1:0];
end
assign A64 = A59[1:0] == 2'b01;
assign A65  = A59[1:0] == 2'b10;
assign A1863d  = A59[1:0] == 2'b11;
always @(posedge tclk)
begin
  if (A1864b[3:0] == A18630) begin
    if (A1863d || A64)
      A57[4:0] <= 5'b11111;
    else
      A57[4:0] <= 5'b00111;
  end
  else if (A18639)
    A57[4:0] <= A57[4:0] - 5'b1;
end
always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    A18646 <= 1'b0;  
  else if (A1863c)
    A18646 <= 1'b0;
  else if (A6a && A18649)
    A18646 <= 1'b1;
  else if (A18637)
    A18646 <= 1'b0;
  else
    A18646 <= A18646;
end
always @(posedge tclk)
begin
  if (A69)
    A58 <= 1'b1;
  else if ((A1863d || A65) && A18639)
    A58 <= A58 ^ A1855d;  
  else if (A1863e)
    A58 <= A58 ^ A1855d;  
  else
    A58 <= A58;
end
assign A6d = !(A1864b[3:0] == A18632);
always @(posedge forever_cpuclk_nogated or negedge hadrst_b)
begin
  if (!hadrst_b)
    A1854e <= 1'b0;
  else if (A6d)
    A1854e <= 1'b1;
  else
    A1854e <= A1854e;
end
always @( * )
begin
  A56[31:0] = 32'b0;
  if (A67)         
    A56[7:0]  = {A6e, A1864c[7:1]};
  else if (A1863f)  
    A56[31:0] = A150[31:0];
  else if (A1863b)    
    A56[31:0] = {A6e, A1864c[31:1]};
  else 
    A56[31:0] = A1864c[31:0];
end
assign A13e[31:0] = A1864c[31:0];
always @(posedge tclk)
begin
  A1864c[31:0] <= A56[31:0];
end
always @(negedge tclk or negedge trst_b)
begin
  if (!trst_b)
    A5b <= 1'b1;
  else if (A68)
    A5b <= 1'b0;
  else if (A1863b && A18649)
    A5b <= A1864c[0];
  else if (A1863a && A18649)
    A5b <= A55;
  else
    A5b <= 1'b1;
end
always @(posedge tclk)
begin
  if (A1863f)
    A55 <= 1'b1;
  else if (A1863b && A18649)
    A55 <= A55 ^ A1864c[0];
  else
    A55 <= A55;
end
assign A18565 = A18646;
assign A13c  = A5b;
assign A18633            = A1855d;
assign A6e              = A1855d;
endmodule
