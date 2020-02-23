/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ifu_ifctrl(
  cpuclk,
  cpurst_b,
  had_ifu_ir_vld,
  ibuf_ifctrl_inst32_low,
  ibuf_ifctrl_inst_vld,
  ibuf_ifctrl_pop0_mad32_low,
  ibuf_ifdp_inst_dbg_disable,
  ibuf_xx_empty,
  ibusif_ifctrl_inst_mad32_high,
  ibusif_ifctrl_inst_no_bypass,
  ibusif_xx_16bit_inst,
  ibusif_xx_trans_cmplt,
  ibusif_xx_unalign_fetch,
  ifctrl_ibuf_bypass_vld,
  ifctrl_ibuf_inst_pipe_down,
  ifctrl_ibuf_pop_en,
  ifctrl_xx_ifcancel,
  ifu_iu_ex_inst_vld,
  ifu_iu_inst_buf_inst_dbg_disable,
  ifu_iu_inst_buf_inst_vld,
  iu_ifu_ex_stall,
  iu_ifu_inst_fetch,
  iu_ifu_inst_fetch_without_dbg_disable,
  iu_ifu_wb_stall,
  iu_yy_xx_dbgon,
  iu_yy_xx_flush,
  split_ifctrl_hs_stall,
  split_ifctrl_hs_stall_part
);
input        cpuclk;                               
input        cpurst_b;                             
input        had_ifu_ir_vld;                       
input        ibuf_ifctrl_inst32_low;               
input        ibuf_ifctrl_inst_vld;                 
input        ibuf_ifctrl_pop0_mad32_low;           
input        ibuf_ifdp_inst_dbg_disable;           
input        ibuf_xx_empty;                        
input        ibusif_ifctrl_inst_mad32_high;        
input        ibusif_ifctrl_inst_no_bypass;         
input        ibusif_xx_16bit_inst;                 
input        ibusif_xx_trans_cmplt;                
input        ibusif_xx_unalign_fetch;              
input        iu_ifu_ex_stall;                      
input        iu_ifu_inst_fetch;                    
input        iu_ifu_inst_fetch_without_dbg_disable; 
input        iu_ifu_wb_stall;                      
input        iu_yy_xx_dbgon;                       
input        iu_yy_xx_flush;                       
input        split_ifctrl_hs_stall;                
input        split_ifctrl_hs_stall_part;           
output       ifctrl_ibuf_bypass_vld;               
output       ifctrl_ibuf_inst_pipe_down;           
output       ifctrl_ibuf_pop_en;                   
output       ifctrl_xx_ifcancel;                   
output       ifu_iu_ex_inst_vld;                   
output       ifu_iu_inst_buf_inst_dbg_disable;     
output       ifu_iu_inst_buf_inst_vld;             
reg          ex_inst_vld;                          
wire         cpuclk;                               
wire         cpurst_b;                             
wire         had_ifu_ir_vld;                       
wire         ibuf_bypass_vld;                      
wire         ibuf_ifctrl_inst32_low;               
wire         ibuf_ifctrl_inst_vld;                 
wire         ibuf_ifctrl_pop0_mad32_low;           
wire         ibuf_ifdp_inst_dbg_disable;           
wire         ibuf_inst_vld;                        
wire         ibuf_pop_en;                          
wire         ibuf_xx_empty;                        
wire         ibus_bypass_inst_vld;                 
wire         ibusif_ifctrl_inst_mad32_high;        
wire         ibusif_ifctrl_inst_no_bypass;         
wire         ibusif_xx_16bit_inst;                 
wire         ibusif_xx_trans_cmplt;                
wire         ibusif_xx_unalign_fetch;              
wire         if_cancel;                            
wire         if_cancel_for_pipeline;               
wire         if_inst_stall;                        
wire         if_inst_vld;                          
wire         if_inst_vld_for_ex;                   
wire         if_inst_vld_for_ex_aft_hs;            
wire         if_pipe_down;                         
wire         ifctrl_ibuf_bypass_vld;               
wire         ifctrl_ibuf_inst_pipe_down;           
wire         ifctrl_ibuf_pop_en;                   
wire         ifctrl_xx_ifcancel;                   
wire         ifu_iu_ex_inst_vld;                   
wire         ifu_iu_inst_buf_inst_dbg_disable;     
wire         ifu_iu_inst_buf_inst_vld;             
wire         inst_vld;                             
wire         iu_ifu_ex_stall;                      
wire         iu_ifu_inst_fetch;                    
wire         iu_ifu_inst_fetch_without_dbg_disable; 
wire         iu_ifu_wb_stall;                      
wire         iu_yy_xx_dbgon;                       
wire         iu_yy_xx_flush;                       
wire         random_inst_vld;                      
wire         split_ifctrl_hs_inst_vld;             
wire         split_ifctrl_hs_stall;                
wire         split_ifctrl_hs_stall_part;           
wire         split_ifctrl_mad_stall;               
wire         split_ifctrl_push_pop_stall;          
assign ibuf_inst_vld = ibuf_ifctrl_inst_vld && !split_ifctrl_hs_stall;
assign inst_vld = ibuf_inst_vld || ibus_bypass_inst_vld
               || iu_yy_xx_dbgon && had_ifu_ir_vld;
assign ibus_bypass_inst_vld = ibusif_xx_trans_cmplt &&
                              !split_ifctrl_hs_stall_part && 
                              ( (ibuf_xx_empty &&
                                 (!ibusif_xx_unalign_fetch ||
                                  ibusif_xx_16bit_inst 
                                 ) &&
                                 !ibusif_ifctrl_inst_no_bypass
                                ) ||
                                (ibuf_ifctrl_inst32_low &&
                                 !(ibuf_ifctrl_pop0_mad32_low &&
                                   ibusif_ifctrl_inst_mad32_high
                                  )
                                )
                              );
assign if_inst_vld = inst_vld && !if_cancel; 
assign if_inst_vld_for_ex = if_inst_vld && !if_inst_stall;
assign if_inst_stall = split_ifctrl_push_pop_stall ||
                       split_ifctrl_mad_stall;
assign if_cancel = iu_ifu_inst_fetch || iu_yy_xx_flush;
assign if_cancel_for_pipeline = iu_ifu_inst_fetch_without_dbg_disable 
                                && !split_ifctrl_hs_stall_part 
                             || iu_yy_xx_flush;
assign if_pipe_down = ex_inst_vld && !iu_ifu_ex_stall;
assign split_ifctrl_hs_inst_vld = 1'b0;
assign split_ifctrl_mad_stall = 1'b0;
assign split_ifctrl_push_pop_stall = 1'b0;
assign if_inst_vld_for_ex_aft_hs = if_inst_vld_for_ex
                                || split_ifctrl_hs_inst_vld;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex_inst_vld <= 1'b0;
  else if(if_cancel_for_pipeline)
    ex_inst_vld <= 1'b0;
  else if(!iu_ifu_ex_stall)
    ex_inst_vld <= if_inst_vld_for_ex_aft_hs;
end
assign ifu_iu_ex_inst_vld = ex_inst_vld;
assign ifu_iu_inst_buf_inst_vld = ibuf_inst_vld;
assign ifu_iu_inst_buf_inst_dbg_disable = ibuf_ifdp_inst_dbg_disable;
assign ibuf_bypass_vld = if_pipe_down &&
                         ibus_bypass_inst_vld &&
                         !random_inst_vld;
assign ibuf_pop_en = if_pipe_down &&
                     !random_inst_vld;
assign random_inst_vld = 1'b0;
assign ifctrl_xx_ifcancel = iu_yy_xx_flush || iu_ifu_inst_fetch && !iu_ifu_wb_stall;
assign ifctrl_ibuf_bypass_vld = ibuf_bypass_vld && 1'b0;
assign ifctrl_ibuf_inst_pipe_down = if_pipe_down && !random_inst_vld;
assign ifctrl_ibuf_pop_en = ibuf_pop_en;
endmodule
