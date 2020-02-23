/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_vector(
  bmu_xx_ibus_acc_err,
  bmu_xx_ibus_data_vld,
  bmu_xx_ibus_grnt,
  cp0_iu_vbr,
  cp0_vector_vec_err_vbr,
  cpurst_b,
  ifu_iu_vector_ibus_in_idle,
  iu_bmu_vec_redirect,
  iu_cp0_syc_rst_b,
  iu_ifu_inst_fetch_mask,
  iu_sysyio_soft_rst,
  iu_yy_xx_reg_rst_b,
  misc_clk,
  pcgen_vector_expt_taken,
  retire_vector_expt_int_hv,
  retire_vector_expt_vld,
  vec_top_clk_en,
  vector_cp0_vec_err,
  vector_cp0_vec_err_epc,
  vector_cp0_vec_succeed,
  vector_ctrl_stall,
  vector_pcgen_buf_vbr,
  vector_pcgen_chgflw_vld,
  vector_pcgen_cur_pc_vld,
  vector_pcgen_enter_addr,
  vector_pcgen_ibus_req,
  wb_vector_ldst_wait_cmplt
);
input           bmu_xx_ibus_acc_err;        
input           bmu_xx_ibus_data_vld;       
input           bmu_xx_ibus_grnt;           
input   [29:0]  cp0_iu_vbr;                 
input   [29:0]  cp0_vector_vec_err_vbr;     
input           cpurst_b;                   
input           ifu_iu_vector_ibus_in_idle; 
input           misc_clk;                   
input           pcgen_vector_expt_taken;    
input           retire_vector_expt_int_hv;  
input           retire_vector_expt_vld;     
input           wb_vector_ldst_wait_cmplt;  
output          iu_bmu_vec_redirect;        
output          iu_cp0_syc_rst_b;           
output          iu_ifu_inst_fetch_mask;     
output          iu_sysyio_soft_rst;         
output          iu_yy_xx_reg_rst_b;         
output          vec_top_clk_en;             
output          vector_cp0_vec_err;         
output  [29:0]  vector_cp0_vec_err_epc;     
output          vector_cp0_vec_succeed;     
output          vector_ctrl_stall;          
output          vector_pcgen_buf_vbr;       
output          vector_pcgen_chgflw_vld;    
output          vector_pcgen_cur_pc_vld;    
output  [30:0]  vector_pcgen_enter_addr;    
output          vector_pcgen_ibus_req;      
reg     [3 :0]  cur_state;                  
reg     [3 :0]  next_state;                 
wire            bmu_xx_ibus_acc_err;        
wire            bmu_xx_ibus_data_vld;       
wire            bmu_xx_ibus_grnt;           
wire    [29:0]  cp0_iu_vbr;                 
wire    [29:0]  cp0_vector_vec_err_vbr;     
wire            cpurst_b;                   
wire            expt_non_vec;               
wire            hs_split_iu_hs_stall_vector; 
wire            ifu_iu_vector_ibus_in_idle; 
wire            iu_bmu_vec_redirect;        
wire            iu_cp0_syc_rst_b;           
wire            iu_ifu_inst_fetch_mask;     
wire            iu_sysyio_soft_rst;         
wire            iu_yy_xx_hs_acc_err;        
wire            iu_yy_xx_reg_rst_b;         
wire            misc_clk;                   
wire            pcgen_vector_expt_taken;    
wire            reg_rst_b;                  
wire            retire_vector_expt_int_hv;  
wire            retire_vector_expt_vld;     
wire            vec_top_clk_en;             
wire            vector_cp0_vec_err;         
wire    [29:0]  vector_cp0_vec_err_epc;     
wire            vector_cp0_vec_succeed;     
wire            vector_ctrl_stall;          
wire            vector_cur_pc_vld;          
wire            vector_pcgen_buf_vbr;       
wire            vector_pcgen_chgflw_vld;    
wire            vector_pcgen_cur_pc_vld;    
wire    [30:0]  vector_pcgen_enter_addr;    
wire            vector_pcgen_ibus_req;      
wire            wb_vector_ldst_wait_cmplt;  
parameter IDLE        = 4'b0000;
parameter BUF_VBR     = 4'b0001;
parameter WAIT_IDLE   = 4'b0010;
parameter WAIT_GRANT  = 4'b0011;
parameter WAIT_DATA   = 4'b0100;
parameter NONVEC_WAIT = 4'b0101;
parameter NONVEC_WAIT_IDLE = 4'b0110;
parameter VEC_ERR     = 4'b0111;
assign vector_pcgen_enter_addr[30:1] = (cur_state == VEC_ERR) ? 
                                        cp0_vector_vec_err_vbr[29:0] 
                                        : cp0_iu_vbr[29:0];
assign vector_pcgen_enter_addr[0]    = 1'b0;
assign iu_ifu_inst_fetch_mask = !(cur_state == IDLE);
assign vec_top_clk_en = (cur_state == IDLE)
                          && retire_vector_expt_vld
                     || (cur_state != IDLE)
                     || iu_yy_xx_hs_acc_err;
assign reg_rst_b =1'b1;
assign iu_yy_xx_reg_rst_b = reg_rst_b;
assign iu_cp0_syc_rst_b   = reg_rst_b;
assign iu_sysyio_soft_rst = 1'b1;
assign iu_bmu_vec_redirect = 1'b0;
assign iu_yy_xx_hs_acc_err =1'b0;
assign hs_split_iu_hs_stall_vector = 1'b0;
always @(posedge misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[3:0] <= IDLE;
  else
    cur_state[3:0] <= next_state[3:0];
end
assign expt_non_vec  = !retire_vector_expt_int_hv ;
always @( cur_state
       or iu_yy_xx_hs_acc_err
       or ifu_iu_vector_ibus_in_idle
       or bmu_xx_ibus_data_vld
       or pcgen_vector_expt_taken
       or bmu_xx_ibus_acc_err
       or expt_non_vec
       or hs_split_iu_hs_stall_vector
       or retire_vector_expt_vld
       or wb_vector_ldst_wait_cmplt
       or bmu_xx_ibus_grnt)
begin
  case(cur_state)
  IDLE        : if((retire_vector_expt_vld))
                  next_state = expt_non_vec ? NONVEC_WAIT : BUF_VBR;
                else if(iu_yy_xx_hs_acc_err)
                  next_state = NONVEC_WAIT;
                else
                  next_state = IDLE;
  NONVEC_WAIT:  if(wb_vector_ldst_wait_cmplt)
                  next_state = NONVEC_WAIT;
                else if(iu_yy_xx_hs_acc_err)
                  next_state = NONVEC_WAIT;
                else if(hs_split_iu_hs_stall_vector)
                  next_state = NONVEC_WAIT;
                else 
                  next_state = NONVEC_WAIT_IDLE;
  NONVEC_WAIT_IDLE: if(pcgen_vector_expt_taken)
                  next_state = IDLE;
                    else
                  next_state = NONVEC_WAIT_IDLE;
  BUF_VBR     : if(wb_vector_ldst_wait_cmplt)
                  next_state = BUF_VBR;
                else if(iu_yy_xx_hs_acc_err)
                  next_state = NONVEC_WAIT;
                else if(hs_split_iu_hs_stall_vector)
                  next_state = BUF_VBR;
                else 
                  next_state = WAIT_IDLE;
  WAIT_IDLE   : if(ifu_iu_vector_ibus_in_idle && !bmu_xx_ibus_grnt)
                  next_state = WAIT_GRANT;
                else if(ifu_iu_vector_ibus_in_idle)
                  next_state = WAIT_DATA;
                else 
                  next_state = WAIT_IDLE;
  WAIT_GRANT  : if(bmu_xx_ibus_grnt)
                  next_state = WAIT_DATA;
                else
                  next_state = WAIT_GRANT;
  WAIT_DATA   : if(bmu_xx_ibus_data_vld)
                  next_state = IDLE;
                else if(bmu_xx_ibus_acc_err)
                  next_state = VEC_ERR;
                else
                  next_state = WAIT_DATA;
  VEC_ERR     : next_state   = IDLE;
  default     : next_state   = IDLE;
  endcase
end
assign vector_pcgen_buf_vbr = ((cur_state == BUF_VBR)
                           && (next_state == WAIT_IDLE))
                           || ((cur_state == NONVEC_WAIT_IDLE)      
                               && (next_state == IDLE)) 
                           ||
                           (cur_state == VEC_ERR);            
assign vector_pcgen_ibus_req = (cur_state == WAIT_IDLE)
                                && ifu_iu_vector_ibus_in_idle
                            || (cur_state == WAIT_GRANT);
assign vector_cur_pc_vld = (cur_state == VEC_ERR) ||    
                           (cur_state == WAIT_DATA)
                           && bmu_xx_ibus_data_vld ||   
                           ((cur_state == NONVEC_WAIT_IDLE)  
                           && (next_state == IDLE))
                           ;
assign vector_pcgen_cur_pc_vld = (cur_state == WAIT_DATA)
                                 && bmu_xx_ibus_data_vld;
assign vector_pcgen_chgflw_vld = vector_cur_pc_vld;
assign vector_ctrl_stall       = (cur_state!=IDLE);
assign vector_cp0_vec_err      = (cur_state == VEC_ERR);      
assign vector_cp0_vec_err_epc[29:0] = cp0_iu_vbr[29:0];
assign vector_cp0_vec_succeed   = (cur_state == WAIT_DATA)
                                 && bmu_xx_ibus_data_vld;
endmodule
