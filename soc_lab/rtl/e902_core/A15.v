/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A15(
  A1868b,
  A17,
  A117,
  had_core_dbg_mode_req,
  hadrst_b,
  ifu_had_fetch_expt_vld,
  ifu_had_inst_dbg_disable,
  ifu_had_match_pc,
  ifu_had_split_first,
  iu_had_expt_vld,
  iu_had_flush,
  iu_had_xx_mldst,
  iu_had_xx_retire,
  iu_had_xx_retire_normal,
  iu_yy_xx_dbgon,
  lsu_had_addr,
  lsu_had_addr_vld,
  lsu_had_ex_cmplt,
  A1867c,
  A26
);
input           A117;                      
input           had_core_dbg_mode_req;       
input           hadrst_b;                    
input           ifu_had_fetch_expt_vld;      
input           ifu_had_inst_dbg_disable;    
input   [31:0]  ifu_had_match_pc;            
input           ifu_had_split_first;         
input           iu_had_expt_vld;             
input           iu_had_flush;                
input           iu_had_xx_mldst;             
input           iu_had_xx_retire;            
input           iu_had_xx_retire_normal;     
input           iu_yy_xx_dbgon;              
input   [31:0]  lsu_had_addr;                
input           lsu_had_addr_vld;            
input           lsu_had_ex_cmplt;            
input   [31:0]  A1867c;              
input           A26;                
output          A1868b; 
output          A17;               
reg             A1868c;                
reg             A16;      
wire            A1868b; 
wire            A17;               
wire            A1868a;                     
wire            A18;             
wire            A18689;         
wire            A117;                      
wire            A18688;             
wire            A1a;           
wire            A18687;             
wire            A1b;         
wire            A18686;             
wire            A1c;               
wire            had_core_dbg_mode_req;       
wire            hadrst_b;                    
wire            ifu_had_fetch_expt_vld;      
wire            ifu_had_inst_dbg_disable;    
wire    [31:0]  ifu_had_match_pc;            
wire            ifu_had_split_first;         
wire            A18682;             
wire            A20;             
wire            A18681;               
wire            iu_had_expt_vld;             
wire            iu_had_flush;                
wire            iu_had_xx_mldst;             
wire            iu_had_xx_retire;            
wire            iu_had_xx_retire_normal;     
wire            iu_yy_xx_dbgon;              
wire    [31:0]  lsu_had_addr;                
wire            lsu_had_addr_vld;            
wire            lsu_had_ex_cmplt;            
wire    [31:0]  A1867c;              
wire            A26;                
assign A1868a = A26;
assign A18688 = (lsu_had_addr[31:0] == A1867c[31:0]);                           
assign A18687     = A18688;
assign A1b = A18687 && lsu_had_addr_vld;
assign A18686 = (A1b || A16) &&
                         iu_had_xx_retire;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A16 <= 1'b0;
  else if (lsu_had_ex_cmplt || iu_had_flush)
    A16 <= 1'b0;
  else if (A1b)
    A16 <= 1'b1;
  else
    A16 <= A16;
end
assign A18682 = (ifu_had_match_pc[31:0] == A1867c[31:0]);                             
assign A20 = A18682
                         && !ifu_had_fetch_expt_vld
                         && !ifu_had_inst_dbg_disable
                         && ifu_had_split_first
                         && !iu_yy_xx_dbgon
                         && !had_core_dbg_mode_req;
assign A18681 = A1868a ? A20 : 1'b0;
assign A1c = A1868a ? A18686 : 1'b0;
assign A1868b = A18681;
assign A18 = iu_had_expt_vld;
always @(posedge A117 or negedge hadrst_b)
begin
  if(!hadrst_b)
    A1868c <= 1'b0;
  else if (A17 || A18)
    A1868c <= 1'b0;
  else if (!A1868c && A1c && iu_had_xx_mldst)
    A1868c <= 1'b1;
  else
    A1868c <= A1868c;
end
assign A1a   = !A1868c && A1c && !iu_had_xx_mldst;
assign A18689 = A1868c && !iu_had_xx_mldst
                             && iu_had_xx_retire;
assign A17 = (A1a || A18689)
                       && !iu_yy_xx_dbgon
                       && iu_had_xx_retire_normal
                       && A1868a;
endmodule
