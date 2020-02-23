/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A186a0(
  A1868b,
  A17,
  A117,
  had_core_dbg_mode_req,
  hadrst_b,
  ifu_had_chg_flw_inst,
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
  lsu_had_st,
  A1867c,
  A14,
  A1868d
);
input           A117;                      
input           had_core_dbg_mode_req;       
input           hadrst_b;                    
input           ifu_had_chg_flw_inst;        
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
input           lsu_had_st;                  
input   [31:0]  A1867c;              
input   [2 :0]  A14;              
input   [7 :0]  A1868d;              
output          A1868b; 
output          A17;               
reg             A1868c;                
reg             A1869f;           
reg             A3;         
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
wire            ifu_had_chg_flw_inst;        
wire            ifu_had_fetch_expt_vld;      
wire            ifu_had_inst_dbg_disable;    
wire    [31:0]  ifu_had_match_pc;            
wire            ifu_had_split_first;         
wire            A18694;       
wire            Ae;         
wire            iu_had_expt_vld;             
wire            iu_had_flush;                
wire            iu_had_xx_mldst;             
wire            iu_had_xx_retire;            
wire            iu_had_xx_retire_normal;     
wire            iu_yy_xx_dbgon;              
wire    [31:0]  lsu_had_addr;                
wire            lsu_had_addr_vld;            
wire            lsu_had_ex_cmplt;            
wire            lsu_had_st;                  
wire    [31:0]  A1867c;              
wire    [2 :0]  A14;              
wire    [7 :0]  A1868d;              
assign A1868a = |A14[2:0];
assign A18688 = ((lsu_had_addr[31:0] & {24'hFF_FFFF,A1868d[7:0]})
                           == A1867c[31:0]);
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
assign A18694 = ((ifu_had_match_pc[31:0]
                                 & {24'hFF_FFFF, A1868d[7:0]}
                                ) == A1867c[31:0]
                               ); 
assign Ae = A18694
                             && A1868a
                             && ifu_had_split_first
                             && !had_core_dbg_mode_req;
always @( A14[2:0]
       or ifu_had_chg_flw_inst
       or Ae
       or A18686
       or lsu_had_st)
begin
  A3 = 1'b0;
  A1869f = 1'b0;
  case (A14[2:0])
    3'b001: begin      
      A3 = Ae;
      A1869f = A18686;
    end
    3'b010:            
      A3 = Ae;
    3'b011:            
      A1869f = A18686;
    3'b100:            
      A3 = Ae && ifu_had_chg_flw_inst;
    3'b101:            
      A1869f = A18686 && lsu_had_st;
    3'b110:            
      A1869f = A18686 && !lsu_had_st;
    default: begin
      A3 = 1'b0;
      A1869f = 1'b0;
    end
  endcase
end
assign A1c = A1868a && A1869f;
assign A1868b = A3
                                  && !ifu_had_fetch_expt_vld
                                  && !ifu_had_inst_dbg_disable
                                  && !iu_yy_xx_dbgon;
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
assign A18689 = A1868c  && !iu_had_xx_mldst
                          && iu_had_xx_retire;
assign A17 =   (A1a || A18689)
                      && !iu_yy_xx_dbgon
                      && A1868a
                      && iu_had_xx_retire_normal;
endmodule
