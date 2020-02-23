/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ifu_ifdp(
  had_core_dbg_mode_req,
  had_ifu_inst_bkpt_dbq_req,
  had_ifu_inst_bkpt_dbqexp_req,
  had_yy_xx_dp_index_mbee,
  ifu_had_inst_dbg_disable,
  ifu_had_split_first,
  ifu_iu_ex_inst_bkpt,
  ifu_iu_ex_inst_dbg_disable,
  ifu_iu_ex_int_spcu_mask,
  ifu_iu_ex_int_spcu_vld,
  ifu_iu_ex_ni,
  ifu_iu_ex_prvlg_expt_vld,
  ifu_iu_ex_rand_vld,
  ifu_iu_ex_sp_oper,
  ifu_iu_inst_bkpt_dbg_occur_vld,
  ifu_iu_inst_bkpt_dbgexp_occur_vld,
  ifu_iu_spcu_retire_mask,
  iu_ifu_kill_inst
);
input        had_core_dbg_mode_req;            
input        had_ifu_inst_bkpt_dbq_req;        
input        had_ifu_inst_bkpt_dbqexp_req;     
input        had_yy_xx_dp_index_mbee;          
input        iu_ifu_kill_inst;                 
output       ifu_had_inst_dbg_disable;         
output       ifu_had_split_first;              
output       ifu_iu_ex_inst_bkpt;              
output       ifu_iu_ex_inst_dbg_disable;       
output       ifu_iu_ex_int_spcu_mask;          
output       ifu_iu_ex_int_spcu_vld;           
output       ifu_iu_ex_ni;                     
output       ifu_iu_ex_prvlg_expt_vld;         
output       ifu_iu_ex_rand_vld;               
output       ifu_iu_ex_sp_oper;                
output       ifu_iu_inst_bkpt_dbg_occur_vld;   
output       ifu_iu_inst_bkpt_dbgexp_occur_vld; 
output       ifu_iu_spcu_retire_mask;          
wire         had_core_dbg_mode_req;            
wire         had_ifu_inst_bkpt_dbq_req;        
wire         had_ifu_inst_bkpt_dbqexp_req;     
wire         had_yy_xx_dp_index_mbee;          
wire         if_bkpt_vld;                      
wire         ifu_had_inst_dbg_disable;         
wire         ifu_had_split_first;              
wire         ifu_iu_ex_inst_bkpt;              
wire         ifu_iu_ex_inst_dbg_disable;       
wire         ifu_iu_ex_int_spcu_mask;          
wire         ifu_iu_ex_int_spcu_vld;           
wire         ifu_iu_ex_ni;                     
wire         ifu_iu_ex_prvlg_expt_vld;         
wire         ifu_iu_ex_rand_vld;               
wire         ifu_iu_ex_sp_oper;                
wire         ifu_iu_inst_bkpt_dbg_occur_vld;   
wire         ifu_iu_inst_bkpt_dbgexp_occur_vld; 
wire         ifu_iu_spcu_retire_mask;          
wire         inst_bkpt;                        
wire         inst_bkpt_aft_hs;                 
wire         iu_ifu_kill_inst;                 
parameter EBREAK = 32'h00100073;
assign if_bkpt_vld = had_core_dbg_mode_req || had_ifu_inst_bkpt_dbq_req
                  || had_ifu_inst_bkpt_dbqexp_req
                  || iu_ifu_kill_inst && had_yy_xx_dp_index_mbee;
assign inst_bkpt = if_bkpt_vld;
assign ifu_iu_ex_inst_dbg_disable  = 1'b0;
assign inst_bkpt_aft_hs = inst_bkpt;
assign ifu_iu_ex_inst_bkpt = inst_bkpt_aft_hs;
assign ifu_iu_ex_int_spcu_mask = 1'b0;
assign ifu_iu_ex_int_spcu_vld = 1'b0;
assign ifu_iu_ex_ni = 1'b0;
assign ifu_iu_ex_prvlg_expt_vld = 1'b0;
assign ifu_iu_ex_rand_vld = 1'b0;
assign ifu_iu_ex_sp_oper = 1'b0;
assign ifu_iu_spcu_retire_mask = 1'b0;
assign ifu_had_split_first    = 1'b1;
assign ifu_had_inst_dbg_disable = 1'b0;
assign ifu_iu_inst_bkpt_dbg_occur_vld = had_ifu_inst_bkpt_dbq_req;
assign ifu_iu_inst_bkpt_dbgexp_occur_vld = 1'b0;
endmodule
