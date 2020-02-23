/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_wb(
  branch_wb_cmp,
  branch_wb_jmp_reg,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  ctrl_cp0_ex_data_sel,
  ctrl_lsu_ex_data_sel,
  decd_wb_tval,
  decd_xx_inst_32bit,
  decd_xx_unit_special_sel,
  forever_cpuclk,
  ifu_iu_ex_int_spcu_mask,
  ifu_iu_ex_int_spcu_vld,
  ifu_iu_ex_split_on,
  iu_cp0_expt_tval,
  iu_had_flush,
  iu_had_xx_data,
  iu_had_xx_data_vld,
  iu_ifu_wb_ldst,
  iu_lsu_stall_without_hready,
  iu_lsu_wb_ldst,
  iu_lsu_wb_load,
  iu_lsu_wb_store,
  iu_pad_gpr_data,
  iu_pad_gpr_index,
  iu_pad_gpr_we,
  iu_yy_xx_dbgon,
  iu_yy_xx_flush,
  lsu_iu_addr,
  lsu_iu_addr_vld,
  lsu_iu_fast_retire,
  lsu_iu_wb_acc_err,
  lsu_iu_wb_bstack_chk_fail,
  lsu_iu_wb_cmplt,
  lsu_iu_wb_data_vld,
  lsu_iu_wb_load_data,
  misc_clk,
  oper_wb_rs1_equal_to_dst,
  oper_wb_rs2_equal_to_dst,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pcgen_xx_cur_pc,
  randclk_wb_buf_mod_en_w32,
  randclk_wb_ctrl_mod_en_w2,
  randclk_wb_idx_mod_en_w5,
  rbus_wb_cmplt,
  rbus_wb_data,
  rbus_wb_dst_reg,
  rbus_wb_inst_cmplt,
  rbus_wb_load,
  rbus_wb_store,
  retire_wb_dbg_in_ack,
  retire_wb_hs_err_epc_sel,
  retire_wb_mem_bkpt_fast_retire,
  wb_branch_dep_ld,
  wb_ctrl_stall,
  wb_ctrl_stall_without_hready,
  wb_oper_fwd_data_no_load,
  wb_oper_fwd_en,
  wb_oper_write_data,
  wb_oper_write_en,
  wb_oper_write_idx,
  wb_oper_write_idx_for_dep,
  wb_pcgen_ldst_stall,
  wb_pcgen_pc_updt_val,
  wb_pcgen_switch_ld_pc,
  wb_rbus_lsu_vec,
  wb_rbus_st_aft_load,
  wb_retire_fast_retire_load_pc,
  wb_special_st_uncmplt,
  wb_special_store,
  wb_top_machine_mode_clk_en,
  wb_top_machine_sp_en_clk_en,
  wb_top_secu_mode_clk_en,
  wb_top_sp_adjust_clk_en,
  wb_vector_ldst_wait_cmplt,
  wb_xx_acc_err_after_retire,
  wb_xx_lsu_check_fail_after_retire
);
input           branch_wb_cmp;                            
input           branch_wb_jmp_reg;                        
input           cp0_yy_clk_en;                            
input   [1 :0]  cp0_yy_priv_mode;                         
input           cpurst_b;                                 
input           ctrl_cp0_ex_data_sel;                     
input           ctrl_lsu_ex_data_sel;                     
input   [31:0]  decd_wb_tval;                             
input           decd_xx_inst_32bit;                       
input           decd_xx_unit_special_sel;                 
input           forever_cpuclk;                           
input           ifu_iu_ex_int_spcu_mask;                  
input           ifu_iu_ex_int_spcu_vld;                   
input           ifu_iu_ex_split_on;                       
input           iu_yy_xx_dbgon;                           
input           iu_yy_xx_flush;                           
input   [31:0]  lsu_iu_addr;                              
input           lsu_iu_addr_vld;                          
input           lsu_iu_fast_retire;                       
input           lsu_iu_wb_acc_err;                        
input           lsu_iu_wb_bstack_chk_fail;                
input           lsu_iu_wb_cmplt;                          
input           lsu_iu_wb_data_vld;                       
input   [31:0]  lsu_iu_wb_load_data;                      
input           misc_clk;                                 
input           oper_wb_rs1_equal_to_dst;                 
input           oper_wb_rs2_equal_to_dst;                 
input           pad_yy_gate_clk_en_b;                     
input           pad_yy_test_mode;                         
input   [30:0]  pcgen_xx_cur_pc;                          
input           randclk_wb_buf_mod_en_w32;                
input           randclk_wb_ctrl_mod_en_w2;                
input           randclk_wb_idx_mod_en_w5;                 
input           rbus_wb_cmplt;                            
input   [31:0]  rbus_wb_data;                             
input   [4 :0]  rbus_wb_dst_reg;                          
input           rbus_wb_inst_cmplt;                       
input           rbus_wb_load;                             
input           rbus_wb_store;                            
input           retire_wb_dbg_in_ack;                     
input           retire_wb_hs_err_epc_sel;                 
input           retire_wb_mem_bkpt_fast_retire;           
output  [31:0]  iu_cp0_expt_tval;                         
output          iu_had_flush;                             
output  [31:0]  iu_had_xx_data;                           
output          iu_had_xx_data_vld;                       
output          iu_ifu_wb_ldst;                           
output          iu_lsu_stall_without_hready;              
output          iu_lsu_wb_ldst;                           
output          iu_lsu_wb_load;                           
output          iu_lsu_wb_store;                          
output  [31:0]  iu_pad_gpr_data;                          
output  [4 :0]  iu_pad_gpr_index;                         
output          iu_pad_gpr_we;                            
output          wb_branch_dep_ld;                         
output          wb_ctrl_stall;                            
output          wb_ctrl_stall_without_hready;             
output  [31:0]  wb_oper_fwd_data_no_load;                 
output          wb_oper_fwd_en;                           
output  [31:0]  wb_oper_write_data;                       
output          wb_oper_write_en;                         
output  [4 :0]  wb_oper_write_idx;                        
output  [4 :0]  wb_oper_write_idx_for_dep;                
output          wb_pcgen_ldst_stall;                      
output  [30:0]  wb_pcgen_pc_updt_val;                     
output          wb_pcgen_switch_ld_pc;                    
output  [4 :0]  wb_rbus_lsu_vec;                          
output          wb_rbus_st_aft_load;                      
output  [30:0]  wb_retire_fast_retire_load_pc;            
output          wb_special_st_uncmplt;                    
output          wb_special_store;                         
output          wb_top_machine_mode_clk_en;               
output          wb_top_machine_sp_en_clk_en;              
output          wb_top_secu_mode_clk_en;                  
output          wb_top_sp_adjust_clk_en;                  
output          wb_vector_ldst_wait_cmplt;                
output          wb_xx_acc_err_after_retire;               
output          wb_xx_lsu_check_fail_after_retire;        
reg     [1 :0]  cur_state;                                
reg             ex_wb_split_on;                           
reg     [1 :0]  next_state;                               
reg     [31:0]  wb_data_buffer;                           
reg     [4 :0]  wb_idx_buffer;                            
reg             wb_inst_32;                               
reg             wb_int_spcu_inst;                         
reg             wb_int_spcu_mask;                         
wire            branch_wb_cmp;                            
wire            branch_wb_jmp_reg;                        
wire            cp0_yy_clk_en;                            
wire            cp0_yy_machine_mode;                      
wire            cp0_yy_machine_mode_post;                 
wire    [1 :0]  cp0_yy_priv_mode;                         
wire            cpurst_b;                                 
wire            ctrl_cp0_ex_data_sel;                     
wire            ctrl_lsu_ex_data_sel;                     
wire    [31:0]  decd_wb_tval;                             
wire            decd_xx_inst_32bit;                       
wire            decd_xx_unit_special_sel;                 
wire            forever_cpuclk;                           
wire            ifu_iu_ex_int_spcu_mask;                  
wire            ifu_iu_ex_int_spcu_vld;                   
wire            ifu_iu_ex_split_on;                       
wire    [31:0]  iu_cp0_expt_tval;                         
wire            iu_had_flush;                             
wire    [31:0]  iu_had_xx_data;                           
wire            iu_had_xx_data_vld;                       
wire            iu_ifu_wb_ldst;                           
wire            iu_lsu_stall_without_hready;              
wire            iu_lsu_wb_ldst;                           
wire            iu_lsu_wb_load;                           
wire            iu_lsu_wb_store;                          
wire    [31:0]  iu_pad_gpr_data;                          
wire    [4 :0]  iu_pad_gpr_index;                         
wire            iu_pad_gpr_we;                            
wire            iu_yy_xx_dbgon;                           
wire            iu_yy_xx_flush;                           
wire            ldst_stall;                               
wire    [31:0]  lsu_iu_addr;                              
wire            lsu_iu_addr_vld;                          
wire            lsu_iu_fast_retire;                       
wire            lsu_iu_wb_acc_err;                        
wire            lsu_iu_wb_bstack_chk_fail;                
wire            lsu_iu_wb_cmplt;                          
wire            lsu_iu_wb_data_vld;                       
wire    [31:0]  lsu_iu_wb_load_data;                      
wire            misc_clk;                                 
wire    [1 :0]  next_cmplt_state;                         
wire            oper_wb_rs1_equal_to_dst;                 
wire            oper_wb_rs2_equal_to_dst;                 
wire            pad_yy_gate_clk_en_b;                     
wire            pad_yy_test_mode;                         
wire    [30:0]  pcgen_xx_cur_pc;                          
wire    [30:0]  pcgen_xx_cur_pc_mask;                     
wire            randclk_wb_buf_mod_en_w32;                
wire            randclk_wb_ctrl_mod_en_w2;                
wire            randclk_wb_idx_mod_en_w5;                 
wire            rbus_wb_cmplt;                            
wire    [31:0]  rbus_wb_data;                             
wire    [4 :0]  rbus_wb_dst_reg;                          
wire            rbus_wb_inst_cmplt;                       
wire            rbus_wb_load;                             
wire            rbus_wb_store;                            
wire            retire_wb_dbg_in_ack;                     
wire            retire_wb_hs_err_epc_sel;                 
wire            retire_wb_mem_bkpt_fast_retire;           
wire            wb_acc_err_after_retire;                  
wire            wb_alu_or_load_wen;                       
wire            wb_branch_dep_ld;                         
wire            wb_buf_stall;                             
wire            wb_buf_stall_without_hready;              
wire            wb_check_fail_after_retire;               
wire            wb_clk;                                   
wire            wb_clk_en;                                
wire            wb_cmplt_write_back;                      
wire            wb_ctrl_load_fwd_non_alu;                 
wire            wb_ctrl_stall;                            
wire            wb_ctrl_stall_without_bctm;               
wire            wb_ctrl_stall_without_bctm_without_hready; 
wire            wb_ctrl_stall_without_hready;             
wire            wb_data_buf_0_16_update;                  
wire            wb_data_buf_16_0_clk;                     
wire            wb_data_buf_16_0_clk_en;                  
wire    [31:0]  wb_data_buffer_post;                      
wire            wb_data_buffer_update;                    
wire            wb_dst_reg_22;                            
wire            wb_dst_reg_23;                            
wire            wb_dst_reg_24;                            
wire            wb_dst_reg_25;                            
wire            wb_dst_reg_30;                            
wire            wb_dst_reg_high_16;                       
wire            wb_dst_reg_valid;                         
wire            wb_ex_cmplt;                              
wire            wb_fast_retire_pc_mask;                   
wire    [1 :0]  wb_fast_retire_pc_offset;                 
wire            wb_idx_buf_3_0_clk;                       
wire            wb_idx_buf_3_0_clk_en;                    
wire            wb_idx_buf_3_0_update;                    
wire            wb_idx_buf_update;                        
wire    [4 :0]  wb_idx_for_dep;                           
wire            wb_int_spcu_epc_mask;                     
wire            wb_int_spcu_expt_mask;                    
wire            wb_ldst;                                  
wire            wb_load_fwd_mad;                          
wire    [31:0]  wb_oper_fwd_data_no_load;                 
wire            wb_oper_fwd_en;                           
wire            wb_oper_machine_mode;                     
wire    [31:0]  wb_oper_write_data;                       
wire            wb_oper_write_en;                         
wire    [4 :0]  wb_oper_write_idx;                        
wire    [4 :0]  wb_oper_write_idx_for_dep;                
wire            wb_pcgen_ldst_stall;                      
wire    [30:0]  wb_pcgen_pc_updt_val;                     
wire            wb_pcgen_switch_ld_pc;                    
wire    [4 :0]  wb_rbus_lsu_vec;                          
wire            wb_rbus_st_aft_load;                      
wire    [30:0]  wb_retire_fast_retire_load_pc;            
wire            wb_sp_wen_stall;                          
wire            wb_special_st_uncmplt;                    
wire            wb_special_store;                         
wire            wb_store_aft_load;                        
wire            wb_top_machine_mode_clk_en;               
wire            wb_top_machine_sp_en_clk_en;              
wire            wb_top_secu_mode_clk_en;                  
wire            wb_top_sp_adjust_clk_en;                  
wire            wb_uncmplt_load;                          
wire            wb_uncmplt_store;                         
wire            wb_vector_ldst_wait_cmplt;                
wire            wb_write_back;                            
wire    [31:0]  wb_write_back_data;                       
wire    [31:0]  wb_write_back_data_without_pol;           
wire            wb_write_back_en;                         
wire            wb_xx_acc_err_after_retire;               
wire            wb_xx_lsu_check_fail_after_retire;        
parameter IDLE  = 2'b00;
parameter LOAD  = 2'b11;
parameter STORE = 2'b10;
parameter ALU   = 2'b01;
assign wb_clk_en = (cur_state != IDLE) || wb_ex_cmplt;
gated_clk_cell  x_wb_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (wb_clk                   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (wb_clk_en                ),
  .module_en                 (randclk_wb_ctrl_mod_en_w2),
  .pad_yy_gate_clk_en_b      (pad_yy_gate_clk_en_b     ),
  .pad_yy_test_mode          (pad_yy_test_mode         )
);
assign wb_data_buf_16_0_clk_en = wb_data_buf_0_16_update;
gated_clk_cell  x_wb_data_buf_16_0_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (wb_data_buf_16_0_clk     ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (wb_data_buf_16_0_clk_en  ),
  .module_en                 (randclk_wb_buf_mod_en_w32),
  .pad_yy_gate_clk_en_b      (pad_yy_gate_clk_en_b     ),
  .pad_yy_test_mode          (pad_yy_test_mode         )
);
assign wb_idx_buf_update     = wb_cmplt_write_back || wb_uncmplt_load;
assign wb_idx_buf_3_0_update = wb_idx_buf_update;
assign wb_idx_buf_3_0_clk_en = wb_idx_buf_3_0_update;
gated_clk_cell  x_idx_buf_3_0_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (wb_idx_buf_3_0_clk      ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (wb_idx_buf_3_0_clk_en   ),
  .module_en                (randclk_wb_idx_mod_en_w5),
  .pad_yy_gate_clk_en_b     (pad_yy_gate_clk_en_b    ),
  .pad_yy_test_mode         (pad_yy_test_mode        )
);
always @(posedge wb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end
assign wb_uncmplt_load     = rbus_wb_load;
assign wb_uncmplt_store    = rbus_wb_store;
assign wb_cmplt_write_back = rbus_wb_cmplt;
assign wb_ex_cmplt         = wb_uncmplt_load
                             || wb_uncmplt_store
                             || wb_cmplt_write_back;
assign next_cmplt_state[1:0] = {2{wb_uncmplt_load}}     & LOAD
                             | {2{wb_uncmplt_store}}    & STORE
                             | {2{wb_cmplt_write_back}} & ALU;
always @( cur_state
       or wb_ex_cmplt
       or next_cmplt_state
       or lsu_iu_wb_cmplt)
begin
  case(cur_state)
  IDLE       : if(wb_ex_cmplt)
                 next_state = next_cmplt_state;
               else
                 next_state = IDLE;
  LOAD       : if(lsu_iu_wb_cmplt && wb_ex_cmplt)
                 next_state = next_cmplt_state;
               else if(lsu_iu_wb_cmplt && !wb_ex_cmplt)
                 next_state = IDLE;
               else
                 next_state = LOAD;
  STORE      : if(lsu_iu_wb_cmplt && wb_ex_cmplt)
                 next_state = next_cmplt_state;
               else if(lsu_iu_wb_cmplt && !wb_ex_cmplt)
                 next_state = IDLE;
               else
                 next_state = STORE;
  ALU        : if(wb_ex_cmplt)
                 next_state = next_cmplt_state;
               else
                 next_state = IDLE;
  default    :   next_state = IDLE;
  endcase
end
assign wb_alu_or_load_wen = ((cur_state == LOAD)
                               && lsu_iu_wb_cmplt
                               && lsu_iu_wb_data_vld
                          || (cur_state == ALU));
assign wb_write_back_en   = wb_alu_or_load_wen 
                            && wb_dst_reg_valid;
assign wb_write_back      = ((cur_state == ALU)
                             || (cur_state == LOAD))
                            && wb_dst_reg_valid;
assign wb_acc_err_after_retire = ((cur_state == LOAD) || (cur_state == STORE)) 
                                  && lsu_iu_wb_cmplt
                                  && lsu_iu_wb_acc_err
                                  && !wb_int_spcu_expt_mask;
assign wb_xx_acc_err_after_retire = wb_acc_err_after_retire;
assign wb_ldst = ((cur_state == LOAD) || (cur_state == STORE));
assign iu_lsu_wb_ldst = wb_ldst;
assign iu_ifu_wb_ldst = wb_ldst;
assign iu_lsu_wb_load  = cur_state == LOAD;
assign iu_lsu_wb_store = cur_state == STORE;
assign wb_special_store = cur_state == STORE;
assign wb_special_st_uncmplt = cur_state == STORE && !lsu_iu_wb_cmplt;
assign wb_oper_machine_mode = 1'b0;
assign cp0_yy_machine_mode_post   = cp0_yy_machine_mode;
assign wb_top_machine_mode_clk_en = cp0_yy_machine_mode_post ^ wb_oper_machine_mode;
assign cp0_yy_machine_mode        = cp0_yy_priv_mode[1:0] == 2'b11;
assign wb_top_secu_mode_clk_en = 1'b0;
assign wb_top_machine_sp_en_clk_en = 1'b0;
always @(posedge misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_int_spcu_inst <= 1'b0;
  else if(rbus_wb_inst_cmplt)
    wb_int_spcu_inst <= ifu_iu_ex_int_spcu_vld;
end
always @(posedge misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_int_spcu_mask <= 1'b0;
  else if(rbus_wb_inst_cmplt)
    wb_int_spcu_mask <= ifu_iu_ex_int_spcu_mask;
end
assign wb_int_spcu_epc_mask  = wb_int_spcu_inst;
assign wb_int_spcu_expt_mask = wb_int_spcu_mask;
assign wb_top_sp_adjust_clk_en = (ifu_iu_ex_int_spcu_vld ^ wb_int_spcu_inst)
                              || (ifu_iu_ex_int_spcu_mask ^ wb_int_spcu_mask);
always @(posedge wb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_inst_32 <= 1'b0;
  else if(lsu_iu_fast_retire)
    wb_inst_32 <= decd_xx_inst_32bit;
end
always @(posedge wb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex_wb_split_on <= 1'b0;
  else if(lsu_iu_fast_retire)
    ex_wb_split_on <= ifu_iu_ex_split_on;
end
assign wb_check_fail_after_retire = ((cur_state == LOAD) || (cur_state == STORE))
                                     && lsu_iu_wb_bstack_chk_fail;
assign wb_xx_lsu_check_fail_after_retire = wb_check_fail_after_retire;
assign wb_buf_stall  = ((cur_state == LOAD) || (cur_state == STORE))
                         && !(lsu_iu_wb_cmplt
                              && !lsu_iu_wb_acc_err 
                              && !lsu_iu_wb_bstack_chk_fail)
                    || retire_wb_dbg_in_ack;
assign wb_buf_stall_without_hready = ((cur_state == LOAD)    || (cur_state == STORE))
                                       && (lsu_iu_wb_acc_err || lsu_iu_wb_bstack_chk_fail)
                                  || retire_wb_dbg_in_ack;
assign ldst_stall = ((cur_state == LOAD) || (cur_state == STORE))
                             && !lsu_iu_wb_cmplt;
assign wb_pcgen_ldst_stall = ldst_stall;
assign wb_data_buffer_post[31:0]  = lsu_iu_addr_vld ? lsu_iu_addr[31:0]
                                                    : rbus_wb_data[31:0];
assign wb_data_buffer_update = wb_cmplt_write_back
                            || rbus_wb_inst_cmplt
                            || lsu_iu_addr_vld && !ldst_stall;
assign wb_store_aft_load     = (cur_state == LOAD)
                               && (wb_uncmplt_store || (next_state == IDLE));
assign wb_rbus_st_aft_load   = wb_store_aft_load;
assign wb_rbus_lsu_vec[4:0] = cur_state == LOAD ? 5'b00101 : 5'b00111;
assign wb_data_buf_0_16_update = wb_data_buffer_update || wb_store_aft_load;
always @(posedge wb_data_buf_16_0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_data_buffer[31:0] <= 32'b0;
  else if(wb_data_buf_0_16_update)
    wb_data_buffer[31:0] <= wb_data_buffer_post[31:0];
  else
    wb_data_buffer[31:0] <= wb_data_buffer[31:0];
end 
assign wb_fast_retire_pc_mask = !ex_wb_split_on && lsu_iu_wb_acc_err
                             && !wb_int_spcu_epc_mask;
assign wb_fast_retire_pc_offset[1:0] = {2{wb_fast_retire_pc_mask}}
                                     & {wb_inst_32,!wb_inst_32} | {retire_wb_hs_err_epc_sel,1'b0};
assign pcgen_xx_cur_pc_mask[30:8] = pcgen_xx_cur_pc[30:8];
assign pcgen_xx_cur_pc_mask[7:0]  = pcgen_xx_cur_pc[7:0]
                                  & {8{lsu_iu_wb_acc_err || retire_wb_hs_err_epc_sel}};
assign wb_retire_fast_retire_load_pc[30:0] = pcgen_xx_cur_pc_mask[30:0] 
                                              - wb_fast_retire_pc_offset[1:0];
assign wb_vector_ldst_wait_cmplt = ((cur_state == LOAD) || (cur_state == STORE))
                                   && !lsu_iu_wb_cmplt;
always @(posedge wb_idx_buf_3_0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_idx_buffer[4:0] <= 5'b0;
  else if(wb_idx_buf_3_0_update)
    wb_idx_buffer[4:0] <= rbus_wb_dst_reg[4:0];
  else
    wb_idx_buffer[4:0] <= wb_idx_buffer[4:0];
end
assign wb_dst_reg_30            = 1'b0;
assign wb_dst_reg_25            = 1'b0;
assign wb_dst_reg_24            = 1'b0;
assign wb_dst_reg_23            = 1'b0;
assign wb_dst_reg_22            = 1'b0;
assign wb_dst_reg_high_16       = wb_idx_buffer[4]
                               && !wb_dst_reg_30
                               && !wb_dst_reg_25
                               && !wb_dst_reg_24
                               && !wb_dst_reg_23
                               && !wb_dst_reg_22;
assign wb_dst_reg_valid         = !wb_dst_reg_high_16 && wb_idx_buffer[4:0] != 5'd0;
assign wb_write_back_data[31:0] = (cur_state == LOAD)
                                  ? lsu_iu_wb_load_data[31:0]
                                  : wb_data_buffer[31:0];
assign wb_write_back_data_without_pol[31:0] = wb_write_back_data[31:0];
assign wb_oper_write_en         = wb_write_back_en;
assign wb_pcgen_switch_ld_pc      = 1'b0;
assign wb_pcgen_pc_updt_val[30:0] = 31'b0;
assign wb_oper_write_idx[4:0]   = wb_idx_buffer[4:0];
assign wb_idx_for_dep[4:0] = wb_idx_buffer[4:0];
assign wb_oper_write_idx_for_dep[4:0] = wb_idx_for_dep[4:0];
assign wb_oper_write_data[31:0] = wb_write_back_data[31:0];
assign wb_oper_fwd_en           = wb_write_back;
assign wb_oper_fwd_data_no_load[31:0] = wb_data_buffer[31:0];
assign iu_pad_gpr_we            = wb_write_back_en;
assign iu_pad_gpr_index[4:0]    = wb_idx_buffer[4:0];
assign iu_pad_gpr_data[31:0]    = wb_write_back_data_without_pol[31:0];
assign iu_had_xx_data_vld       = wb_write_back_en && iu_yy_xx_dbgon;
assign iu_had_xx_data[31:0]     = wb_write_back_data_without_pol[31:0];
assign iu_had_flush             = iu_yy_xx_flush;
assign wb_ctrl_load_fwd_non_alu = (cur_state == LOAD)
                                  &&(oper_wb_rs1_equal_to_dst
                                     && (branch_wb_jmp_reg
                                      || ctrl_lsu_ex_data_sel
                                      || ctrl_cp0_ex_data_sel)
                                   || branch_wb_cmp 
                                      && (oper_wb_rs2_equal_to_dst
                                        || oper_wb_rs1_equal_to_dst));
assign wb_branch_dep_ld = wb_ctrl_load_fwd_non_alu || (cur_state == LOAD) 
                        || (cur_state == STORE);
assign wb_load_fwd_mad = 1'b0;
assign wb_sp_wen_stall = 1'b0;
assign wb_ctrl_stall_without_bctm = wb_buf_stall
                       || wb_ctrl_load_fwd_non_alu
                       || wb_load_fwd_mad
                       || wb_sp_wen_stall;
assign wb_ctrl_stall_without_bctm_without_hready = wb_buf_stall_without_hready
                                                || wb_ctrl_load_fwd_non_alu
                                                || wb_load_fwd_mad
                                                || wb_sp_wen_stall;
assign wb_ctrl_stall = wb_ctrl_stall_without_bctm;
assign wb_ctrl_stall_without_hready = wb_ctrl_stall_without_bctm_without_hready;
assign iu_lsu_stall_without_hready = wb_ctrl_stall_without_hready;
assign iu_cp0_expt_tval[31:0] = wb_acc_err_after_retire ? wb_data_buffer[31:0]:
                                decd_xx_unit_special_sel ? decd_wb_tval[31:0]:
                                retire_wb_mem_bkpt_fast_retire ? wb_data_buffer[31:0]:
                                                                 lsu_iu_addr[31:0];
endmodule
