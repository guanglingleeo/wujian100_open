/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A1867b(
  A110,
  A18591,
  A111,
  A18590,
  A112,
  A1858f,
  A113,
  A1858e,
  A114,
  A1858d,
  A117,
  A1858a,
  A118,
  A18589,
  A119,
  A18588,
  A11a,
  had_ifu_inst_bkpt_dbq_req,
  had_ifu_inst_bkpt_dbqexp_req,
  had_iu_bkpt_trace_en,
  had_iu_dr_set_req,
  had_iu_mbkpt_fsm_index_mbee,
  had_iu_mem_bkpt_exp_req,
  had_iu_mem_bkpt_mask,
  had_iu_mem_bkpt_req,
  had_iu_trace_req,
  had_iu_trace_req_for_dbg_disable,
  had_iu_xx_jdbreq,
  had_yy_xx_dbg,
  had_yy_xx_dp_index_mbee,
  had_yy_xx_exit_dbg,
  hadrst_b,
  iu_had_adr_dbg_ack,
  iu_had_chgflw_dst_pc,
  iu_had_chgflw_vld,
  iu_had_data_bkpt_occur_vld,
  iu_had_dbg_disable_for_tee,
  iu_had_dr_dbg_ack,
  iu_had_inst_bkpt_occur_vld,
  iu_had_trace_occur_vld,
  iu_had_xx_bkpt_inst,
  iu_yy_xx_dbgon,
  A18563,
  A1855e,
  A1855c,
  A18556,
  A14c,
  A18555,
  A14d,
  A18554,
  A14e,
  A18553,
  A161,
  A162,
  A1853f
);
input           A110;   
input           A18591;                  
input           A111;   
input           A18590;                  
input           A112;   
input           A1858f;                  
input           A113;   
input           A1858e;                  
input           A114;   
input           A1858d;                  
input           A117;                          
input           hadrst_b;                        
input           iu_had_adr_dbg_ack;              
input   [31:0]  iu_had_chgflw_dst_pc;            
input           iu_had_chgflw_vld;               
input           iu_had_data_bkpt_occur_vld;      
input           iu_had_dbg_disable_for_tee;      
input           iu_had_dr_dbg_ack;               
input           iu_had_inst_bkpt_occur_vld;      
input           iu_had_trace_occur_vld;          
input           iu_had_xx_bkpt_inst;             
input           iu_yy_xx_dbgon;                  
input           A18563;               
input           A1855e;                
input           A1855c;             
input           A18556;                   
input           A14c;                    
input           A18555;              
input           A14d;               
input           A18554;               
input           A14e;            
input   [8 :0]  A18553;                  
input           A161;                   
input           A162;                  
input           A1853f;  
output          A1858a;              
output          A118;           
output          A18589;            
output          A119;            
output          A18588;            
output          A11a;             
output          had_ifu_inst_bkpt_dbq_req;       
output          had_ifu_inst_bkpt_dbqexp_req;    
output          had_iu_bkpt_trace_en;            
output          had_iu_dr_set_req;               
output          had_iu_mbkpt_fsm_index_mbee;     
output          had_iu_mem_bkpt_exp_req;         
output          had_iu_mem_bkpt_mask;            
output          had_iu_mem_bkpt_req;             
output          had_iu_trace_req;                
output          had_iu_trace_req_for_dbg_disable; 
output          had_iu_xx_jdbreq;                
output          had_yy_xx_dbg;                   
output          had_yy_xx_dp_index_mbee;         
output          had_yy_xx_exit_dbg;              
reg             A27;                   
wire            A1867a;                     
wire            A110;   
wire            A18591;                  
wire            A111;   
wire            A18590;                  
wire            A112;   
wire            A1858f;                  
wire            A113;   
wire            A1858e;                  
wire            A114;   
wire            A1858d;                  
wire            A117;                          
wire            A1858a;              
wire            A118;           
wire            A18589;            
wire            A119;            
wire            A18588;            
wire            A11a;             
wire            A18671;                      
wire            A31;                        
wire            had_ifu_inst_bkpt_dbq_req;       
wire            had_ifu_inst_bkpt_dbqexp_req;    
wire            had_iu_bkpt_trace_en;            
wire            had_iu_dr_set_req;               
wire            had_iu_mbkpt_fsm_index_mbee;     
wire            had_iu_mem_bkpt_exp_req;         
wire            had_iu_mem_bkpt_mask;            
wire            had_iu_mem_bkpt_req;             
wire            had_iu_trace_req;                
wire            had_iu_trace_req_for_dbg_disable; 
wire            had_iu_xx_jdbreq;                
wire            had_yy_xx_dbg;                   
wire            had_yy_xx_dp_index_mbee;         
wire            had_yy_xx_exit_dbg;              
wire            hadrst_b;                        
wire            iu_had_adr_dbg_ack;              
wire            iu_had_data_bkpt_occur_vld;      
wire            iu_had_dbg_disable_for_tee;      
wire            iu_had_dr_dbg_ack;               
wire            iu_had_inst_bkpt_occur_vld;      
wire            iu_had_trace_occur_vld;          
wire            iu_had_xx_bkpt_inst;             
wire            iu_yy_xx_dbgon;                  
wire            A18563;               
wire            A18664;                
wire            A3e;             
wire            A1855e;                
wire            A1855c;             
wire            A18556;                   
wire            A14c;                    
wire            A18555;              
wire            A14d;               
wire            A18554;               
wire            A14e;            
wire    [8 :0]  A18553;                  
wire            A161;                   
wire            A162;                  
wire            A1853f;  
wire            A1865d;                       
assign A1865d = A162;
assign A18664    = (A18591 && !A18553[0])
                          || (A18590 && !A18553[1])
                          || (A1858f && !A18553[2])
                          || (A1858e && !A18553[3])
                          || (A1858d && !A18553[4]);
assign A3e = (A18591 &&  A18553[0])
                          || (A18590 &&  A18553[1])
                          || (A1858f &&  A18553[2])
                          || (A1858e &&  A18553[3])
                          || (A1858d &&  A18553[4]);
assign had_ifu_inst_bkpt_dbq_req = ((A110
                                 && !A18553[0])
                                 || (A111
                                 && !A18553[1])
                                 || (A112
                                 && !A18553[2])
                                 || (A113
                                 && !A18553[3])
                                 || (A114
                                 && !A18553[4])
                                   ) && !A14e
                                     && !iu_had_dbg_disable_for_tee;
assign had_ifu_inst_bkpt_dbqexp_req = ((A110
                                    &&  A18553[0])
                                    || (A111
                                    &&  A18553[1])
                                    || (A112
                                    &&  A18553[2])
                                    || (A113
                                    &&  A18553[3])
                                    || (A114
                                    &&  A18553[4])
                                      ) && !A14e
                                        && !iu_had_dbg_disable_for_tee;
assign A18671  = A14c;
assign A1867a = A18556;
assign had_iu_dr_set_req = A18671 && !iu_yy_xx_dbgon;
assign had_iu_trace_req = A1865d && !iu_yy_xx_dbgon;
assign had_iu_mem_bkpt_req = A18664 && !iu_yy_xx_dbgon;
assign had_iu_mem_bkpt_mask = (A18664 || A3e) && !iu_yy_xx_dbgon;
assign had_iu_mem_bkpt_exp_req = 1'b0;
assign had_iu_xx_jdbreq =  (A1855e || A1867a) 
                        && !iu_yy_xx_dbgon;
assign had_iu_trace_req_for_dbg_disable = A1853f
                                       && !iu_yy_xx_dbgon;
assign had_iu_bkpt_trace_en = A1855c || A161;
assign had_yy_xx_dbg = A18671
                    || A1855e
                    || A1867a;
assign A118 = iu_had_adr_dbg_ack;
assign A18589 = iu_had_dr_dbg_ack;
assign A119 = iu_had_data_bkpt_occur_vld 
                           || iu_had_inst_bkpt_occur_vld;
assign A18588 = iu_had_xx_bkpt_inst;
assign A11a = iu_had_trace_occur_vld;
assign A31 = (A14d && A18554) &&
                  A18563 && A18555  &&
                  iu_yy_xx_dbgon;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A27 <= 1'b0;
  else 
    A27 <= A31;
end
assign A1858a = A27;
assign had_yy_xx_exit_dbg = A27;
  assign had_iu_mbkpt_fsm_index_mbee = 1'b0;
assign had_yy_xx_dp_index_mbee = 1'b0;
endmodule
