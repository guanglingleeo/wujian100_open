/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_retire(
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clk_en,
  cp0_iu_dbg_disable_for_tee,
  cp0_iu_il,
  cp0_iu_meie,
  cp0_iu_mie_for_int,
  cp0_iu_vec_mode,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_branch_ex_sel,
  ctrl_retire_ni_vld,
  decd_retire_cp0_inst,
  decd_retire_inst_mret,
  forever_cpuclk,
  had_core_dbg_mode_req,
  had_iu_bkpt_trace_en,
  had_iu_dr_set_req,
  had_iu_force_dbg_en,
  had_iu_int_vld,
  had_iu_mbkpt_fsm_index_mbee,
  had_iu_mem_bkpt_exp_req,
  had_iu_mem_bkpt_mask,
  had_iu_mem_bkpt_req,
  had_iu_rte_pc_sel,
  had_iu_trace_req,
  had_iu_trace_req_for_dbg_disable,
  had_iu_xx_fdb,
  had_iu_xx_jdbreq,
  had_yy_xx_exit_dbg,
  hs_split_iu_hs_retire_mask,
  hs_split_iu_hs_switch_se,
  ifu_iu_ex_inst_dbg_disable,
  ifu_iu_ex_sp_oper,
  ifu_iu_ex_split_on,
  ifu_iu_ibus_idle,
  ifu_iu_inst_bkpt_dbg_occur_vld,
  ifu_iu_inst_bkpt_dbgexp_occur_vld,
  ifu_iu_inst_buf_inst_dbg_disable,
  ifu_iu_inst_buf_inst_vld,
  iu_cp0_epc,
  iu_cp0_epc_update,
  iu_cp0_expt_vld,
  iu_cp0_int_vld,
  iu_cp0_lp_wk_int,
  iu_cp0_mtval_updt_vld,
  iu_cp0_nt_int_pending_vld,
  iu_had_adr_dbg_ack,
  iu_had_data_bkpt_occur_vld,
  iu_had_dbg_disable_for_tee,
  iu_had_dr_dbg_ack,
  iu_had_expt_vld,
  iu_had_fast_retire_acc_err_pc_update,
  iu_had_fast_retire_acc_err_pc_val,
  iu_had_inst_bkpt_occur_vld,
  iu_had_int_ack,
  iu_had_retire_with_had_int,
  iu_had_trace_occur_vld,
  iu_had_xx_bkpt_inst,
  iu_had_xx_dbg_ack,
  iu_had_xx_mldst,
  iu_had_xx_retire,
  iu_had_xx_retire_normal,
  iu_had_xx_retire_pc,
  iu_ifu_kill_inst,
  iu_ifu_spcu_int_en,
  iu_pad_inst_retire,
  iu_pad_inst_split,
  iu_pad_retire_pc,
  iu_sys_lp_wk_int,
  iu_yy_xx_dbgon,
  iu_yy_xx_expt_vec,
  iu_yy_xx_flush,
  iu_yy_xx_int_hv,
  iu_yy_xx_int_il,
  iu_yy_xx_int_pending_hv,
  iu_yy_xx_int_pending_id,
  iu_yy_xx_int_pending_il,
  iu_yy_xx_int_pending_priv,
  iu_yy_xx_reg_rst_b,
  iu_yy_xx_retire,
  lsu_iu_wb_acc_err,
  lsu_iu_wb_cmplt,
  nie_flush_chgflw,
  pad_cpu_ext_int_b,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pcgen_retire_updt_pc,
  pcgen_xx_cur_pc,
  randclk_retire_mod_en_w2,
  rbus_retire_cmplt,
  rbus_retire_expt_vec,
  rbus_retire_expt_vld,
  rbus_retire_flush,
  rbus_retire_split_inst,
  rbus_wb_load,
  rbus_wb_store,
  retire_branch_stall,
  retire_mad_ex_cancel,
  retire_pcgen_curpc_update,
  retire_vector_expt_int_hv,
  retire_vector_expt_vld,
  retire_wb_dbg_in_ack,
  retire_wb_hs_err_epc_sel,
  retire_wb_mem_bkpt_fast_retire,
  retire_xx_normal_retire,
  special_retire_inst_wsc,
  wb_retire_fast_retire_load_pc,
  wb_xx_acc_err_after_retire,
  wb_xx_lsu_check_fail_after_retire
);
input           clic_cpu_int_hv;                     
input   [9 :0]  clic_cpu_int_id;                     
input   [7 :0]  clic_cpu_int_il;                     
input   [1 :0]  clic_cpu_int_priv;                   
input           clk_en;                              
input           cp0_iu_dbg_disable_for_tee;          
input   [7 :0]  cp0_iu_il;                           
input           cp0_iu_meie;                         
input           cp0_iu_mie_for_int;                  
input   [1 :0]  cp0_iu_vec_mode;                     
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           ctrl_branch_ex_sel;                  
input           ctrl_retire_ni_vld;                  
input           decd_retire_cp0_inst;                
input           decd_retire_inst_mret;               
input           forever_cpuclk;                      
input           had_core_dbg_mode_req;               
input           had_iu_bkpt_trace_en;                
input           had_iu_dr_set_req;                   
input           had_iu_force_dbg_en;                 
input           had_iu_int_vld;                      
input           had_iu_mbkpt_fsm_index_mbee;         
input           had_iu_mem_bkpt_exp_req;             
input           had_iu_mem_bkpt_mask;                
input           had_iu_mem_bkpt_req;                 
input           had_iu_rte_pc_sel;                   
input           had_iu_trace_req;                    
input           had_iu_trace_req_for_dbg_disable;    
input           had_iu_xx_fdb;                       
input           had_iu_xx_jdbreq;                    
input           had_yy_xx_exit_dbg;                  
input           hs_split_iu_hs_retire_mask;          
input           hs_split_iu_hs_switch_se;            
input           ifu_iu_ex_inst_dbg_disable;          
input           ifu_iu_ex_sp_oper;                   
input           ifu_iu_ex_split_on;                  
input           ifu_iu_ibus_idle;                    
input           ifu_iu_inst_bkpt_dbg_occur_vld;      
input           ifu_iu_inst_bkpt_dbgexp_occur_vld;   
input           ifu_iu_inst_buf_inst_dbg_disable;    
input           ifu_iu_inst_buf_inst_vld;            
input           iu_yy_xx_reg_rst_b;                  
input           lsu_iu_wb_acc_err;                   
input           lsu_iu_wb_cmplt;                     
input           pad_cpu_ext_int_b;                   
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
input   [30:0]  pcgen_retire_updt_pc;                
input   [30:0]  pcgen_xx_cur_pc;                     
input           randclk_retire_mod_en_w2;            
input           rbus_retire_cmplt;                   
input   [4 :0]  rbus_retire_expt_vec;                
input           rbus_retire_expt_vld;                
input           rbus_retire_flush;                   
input           rbus_retire_split_inst;              
input           rbus_wb_load;                        
input           rbus_wb_store;                       
input           special_retire_inst_wsc;             
input   [30:0]  wb_retire_fast_retire_load_pc;       
input           wb_xx_acc_err_after_retire;          
input           wb_xx_lsu_check_fail_after_retire;   
output  [30:0]  iu_cp0_epc;                          
output          iu_cp0_epc_update;                   
output          iu_cp0_expt_vld;                     
output          iu_cp0_int_vld;                      
output          iu_cp0_lp_wk_int;                    
output          iu_cp0_mtval_updt_vld;               
output          iu_cp0_nt_int_pending_vld;           
output          iu_had_adr_dbg_ack;                  
output          iu_had_data_bkpt_occur_vld;          
output          iu_had_dbg_disable_for_tee;          
output          iu_had_dr_dbg_ack;                   
output          iu_had_expt_vld;                     
output          iu_had_fast_retire_acc_err_pc_update; 
output  [30:0]  iu_had_fast_retire_acc_err_pc_val;   
output          iu_had_inst_bkpt_occur_vld;          
output          iu_had_int_ack;                      
output          iu_had_retire_with_had_int;          
output          iu_had_trace_occur_vld;              
output          iu_had_xx_bkpt_inst;                 
output          iu_had_xx_dbg_ack;                   
output          iu_had_xx_mldst;                     
output          iu_had_xx_retire;                    
output          iu_had_xx_retire_normal;             
output  [31:0]  iu_had_xx_retire_pc;                 
output          iu_ifu_kill_inst;                    
output          iu_ifu_spcu_int_en;                  
output          iu_pad_inst_retire;                  
output          iu_pad_inst_split;                   
output  [31:0]  iu_pad_retire_pc;                    
output          iu_sys_lp_wk_int;                    
output          iu_yy_xx_dbgon;                      
output  [9 :0]  iu_yy_xx_expt_vec;                   
output          iu_yy_xx_flush;                      
output          iu_yy_xx_int_hv;                     
output  [7 :0]  iu_yy_xx_int_il;                     
output          iu_yy_xx_int_pending_hv;             
output  [9 :0]  iu_yy_xx_int_pending_id;             
output  [7 :0]  iu_yy_xx_int_pending_il;             
output  [1 :0]  iu_yy_xx_int_pending_priv;           
output          iu_yy_xx_retire;                     
output          nie_flush_chgflw;                    
output          retire_branch_stall;                 
output          retire_mad_ex_cancel;                
output          retire_pcgen_curpc_update;           
output          retire_vector_expt_int_hv;           
output          retire_vector_expt_vld;              
output          retire_wb_dbg_in_ack;                
output          retire_wb_hs_err_epc_sel;            
output          retire_wb_mem_bkpt_fast_retire;      
output          retire_xx_normal_retire;             
reg             bkpt_cur_state;                      
reg             bkpt_next_state;                     
reg     [1 :0]  br_cur_state;                        
reg     [1 :0]  br_next_state;                       
reg             cpu_ext_int_b;                       
reg             dbg_mode_on;                         
reg             dbgreq_ack_ff;                       
reg     [9 :0]  expt_vec;                            
reg             retire_ack_expt;                     
reg             retire_ack_int;                      
reg             retire_with_ack_dbg;                 
reg             retire_with_ack_int;                 
reg             trace_cur_state;                     
reg             trace_next_state;                    
reg             wb_split_inst;                       
wire            bctm_retire_epc_updt_vld;            
wire            bctm_retire_had_pc_updt_vld;         
wire            bkpt_fsm_trigger;                    
wire            clic_cpu_int_hv;                     
wire    [9 :0]  clic_cpu_int_id;                     
wire    [7 :0]  clic_cpu_int_il;                     
wire    [1 :0]  clic_cpu_int_priv;                   
wire            clic_int_pending_vld;                
wire            clic_lp_wk_int;                      
wire            clic_pending_int_need_ack;           
wire            clint_lp_wk_int;                     
wire            clk_en;                              
wire            cp0_iu_dbg_disable_for_tee;          
wire            cp0_iu_ee;                           
wire            cp0_iu_ic;                           
wire    [7 :0]  cp0_iu_il;                           
wire            cp0_iu_int_spcu_en;                  
wire            cp0_iu_meie;                         
wire            cp0_iu_mie_for_int;                  
wire    [1 :0]  cp0_iu_vec_mode;                     
wire            cp0_yy_clk_en;                       
wire            cpu_int_vld;                         
wire            cpurst_b;                            
wire            ctrl_branch_ex_sel;                  
wire            ctrl_retire_ni_vld;                  
wire            dbg_clk;                             
wire            dbg_clk_en;                          
wire            dbgreq_ack;                          
wire            dbgreq_ack_aft_force;                
wire            decd_retire_cp0_inst;                
wire            decd_retire_inst_mret;               
wire            epc_update_after_retire;             
wire            ex_inst_dbg_disable;                 
wire    [30:0]  fast_retire_acc_err_epc;             
wire            forever_cpuclk;                      
wire            had_core_dbg_mode_req;               
wire            had_iu_bkpt_trace_en;                
wire            had_iu_dr_set_req;                   
wire            had_iu_force_dbg_en;                 
wire            had_iu_int_vld;                      
wire            had_iu_mbkpt_fsm_index_mbee;         
wire            had_iu_mem_bkpt_exp_req;             
wire            had_iu_mem_bkpt_mask;                
wire            had_iu_mem_bkpt_req;                 
wire            had_iu_rte_pc_sel;                   
wire            had_iu_trace_req;                    
wire            had_iu_trace_req_for_dbg_disable;    
wire            had_iu_xx_fdb;                       
wire            had_iu_xx_jdbreq;                    
wire            had_yy_xx_exit_dbg;                  
wire            hadpc_update_after_retire;           
wire            hs_split_iu_hs_retire_mask;          
wire            hs_split_iu_hs_switch_se;            
wire            ifu_iu_ex_inst_dbg_disable;          
wire            ifu_iu_ex_sp_oper;                   
wire            ifu_iu_ex_split_on;                  
wire            ifu_iu_ibus_idle;                    
wire            ifu_iu_inst_bkpt_dbg_occur_vld;      
wire            ifu_iu_inst_bkpt_dbgexp_occur_vld;   
wire            ifu_iu_inst_buf_inst_dbg_disable;    
wire            ifu_iu_inst_buf_inst_vld;            
wire            inst_dbg_disable;                    
wire            int_cpuclk;                          
wire            int_enable_with_ee_ie;               
wire            int_ic_aft_sec_sel;                  
wire            int_wakeup_vld;                      
wire            intc_cpu_int_vld;                    
wire    [30:0]  iu_cp0_epc;                          
wire            iu_cp0_epc_update;                   
wire            iu_cp0_expt_vld;                     
wire            iu_cp0_int_vld;                      
wire            iu_cp0_lp_wk_int;                    
wire            iu_cp0_mtval_updt_vld;               
wire            iu_cp0_nt_int_pending_vld;           
wire            iu_had_adr_dbg_ack;                  
wire            iu_had_data_bkpt_occur_vld;          
wire            iu_had_dbg_disable_for_tee;          
wire            iu_had_dr_dbg_ack;                   
wire            iu_had_expt_vld;                     
wire            iu_had_fast_retire_acc_err_pc_update; 
wire    [30:0]  iu_had_fast_retire_acc_err_pc_val;   
wire            iu_had_inst_bkpt_occur_vld;          
wire            iu_had_int_ack;                      
wire            iu_had_retire_with_had_int;          
wire            iu_had_trace_occur_vld;              
wire            iu_had_xx_bkpt_inst;                 
wire            iu_had_xx_dbg_ack;                   
wire            iu_had_xx_mldst;                     
wire            iu_had_xx_retire;                    
wire            iu_had_xx_retire_normal;             
wire    [31:0]  iu_had_xx_retire_pc;                 
wire            iu_ifu_kill_inst;                    
wire            iu_ifu_spcu_int_en;                  
wire            iu_pad_inst_retire;                  
wire            iu_pad_inst_split;                   
wire    [31:0]  iu_pad_retire_pc;                    
wire            iu_sys_lp_wk_int;                    
wire            iu_yy_xx_dbgon;                      
wire    [9 :0]  iu_yy_xx_expt_vec;                   
wire            iu_yy_xx_flush;                      
wire            iu_yy_xx_int_hv;                     
wire    [7 :0]  iu_yy_xx_int_il;                     
wire            iu_yy_xx_int_pending_hv;             
wire    [9 :0]  iu_yy_xx_int_pending_id;             
wire    [7 :0]  iu_yy_xx_int_pending_il;             
wire    [1 :0]  iu_yy_xx_int_pending_priv;           
wire            iu_yy_xx_reg_rst_b;                  
wire            iu_yy_xx_retire;                     
wire            load_store_fast_retire;              
wire            lsu_iu_wb_acc_err;                   
wire            lsu_iu_wb_cmplt;                     
wire            nie_flush;                           
wire            nie_flush_chgflw;                    
wire            pad_cpu_ext_int_b;                   
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire    [30:0]  pcgen_retire_updt_pc;                
wire    [30:0]  pcgen_xx_cur_pc;                     
wire            randclk_retire_mod_en_w2;            
wire            rbus_flush;                          
wire            rbus_retire_cmplt;                   
wire    [4 :0]  rbus_retire_expt_vec;                
wire            rbus_retire_expt_vld;                
wire            rbus_retire_flush;                   
wire            rbus_retire_split_inst;              
wire            rbus_wb_load;                        
wire            rbus_wb_store;                       
wire            retire_ack_bkpt;                     
wire            retire_ack_dr_set_req;               
wire            retire_ack_expt_vld;                 
wire            retire_ack_int_vld;                  
wire            retire_ack_jdbreq;                   
wire            retire_ack_mem_bkpt_fast_retire;     
wire            retire_ack_mem_bkpt_req;             
wire            retire_ack_mem_bkpt_vld;             
wire            retire_ack_mem_bkpt_vld_idle;        
wire            retire_ack_trace_fast_retire;        
wire            retire_ack_trace_req;                
wire            retire_ack_trace_vld;                
wire            retire_ack_trace_vld_idle;           
wire            retire_branch_dbg_idle;              
wire            retire_branch_stall;                 
wire            retire_dbg_disable;                  
wire            retire_dbg_disable_pre;              
wire            retire_dbg_expt;                     
wire            retire_dbg_mask;                     
wire    [30:0]  retire_epc_or_hadpc;                 
wire            retire_expt_int_vld;                 
wire            retire_expt_vld;                     
wire            retire_hs_acc_err;                   
wire            retire_hs_err_epc_sel;               
wire            retire_inst_expt;                    
wire            retire_int;                          
wire            retire_int_mask_from_had;            
wire            retire_int_vld;                      
wire            retire_mad_ex_cancel;                
wire            retire_pc_expt_vld;                  
wire            retire_pcgen_curpc_update;           
wire            retire_split_inst_no_dbg;            
wire            retire_split_inst_no_dbg_for_pad;    
wire            retire_split_inst_with_dbg_ack;      
wire            retire_vector_expt_int_hv;           
wire            retire_vector_expt_vld;              
wire            retire_wb_dbg_in_ack;                
wire            retire_wb_hs_err_epc_sel;            
wire            retire_wb_mem_bkpt_fast_retire;      
wire            retire_with_ack_had_int;             
wire            retire_with_ack_vic_int;             
wire            retire_xx_normal_retire;             
wire            sec_retire_flush;                    
wire            soft_reset_vld;                      
wire            special_retire_inst_wsc;             
wire            wb_dbg_exp_after_retire;             
wire    [30:0]  wb_retire_fast_retire_load_pc;       
wire            wb_split_inst_clk_en;                
wire            wb_xx_acc_err_after_retire;          
wire            wb_xx_lsu_check_fail_after_retire;   
assign cp0_iu_ee = 1'b1;
assign cp0_iu_int_spcu_en = 1'b0;
assign dbg_clk_en = dbgreq_ack_aft_force || dbg_mode_on || dbgreq_ack_ff
                 || retire_int_vld
                 || retire_with_ack_int || retire_with_ack_dbg
                 || wb_split_inst_clk_en
                 || had_iu_mem_bkpt_req || had_iu_trace_req
                 || had_iu_trace_req_for_dbg_disable
                 || retire_wb_dbg_in_ack || had_iu_mem_bkpt_exp_req;
gated_clk_cell  x_dbg_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (dbg_clk                 ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (dbg_clk_en              ),
  .module_en                (randclk_retire_mod_en_w2),
  .pad_yy_gate_clk_en_b     (pad_yy_gate_clk_en_b    ),
  .pad_yy_test_mode         (pad_yy_test_mode        )
);
assign iu_yy_xx_retire      = rbus_retire_cmplt;
gated_clk_cell  x_ext_int_gated_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (int_cpuclk          ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (1'b0                ),
  .module_en            (int_wakeup_vld      ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign int_wakeup_vld = clk_en && 
                        (!(pad_cpu_ext_int_b && cpu_ext_int_b));
always@ (posedge int_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    cpu_ext_int_b     <= 1'b1;
  end
  else if(clk_en)
  begin
    cpu_ext_int_b     <= pad_cpu_ext_int_b;
  end
end
assign cpu_int_vld = cp0_iu_vec_mode[1] ? clic_pending_int_need_ack : intc_cpu_int_vld && (int_enable_with_ee_ie);
assign clic_pending_int_need_ack = clic_int_pending_vld && 
                                   (
                                   (int_enable_with_ee_ie && 
                                   (clic_cpu_int_il[7:0] > cp0_iu_il[7:0])));
assign clic_int_pending_vld      = |clic_cpu_int_il[7:0];
assign clint_lp_wk_int                = !cpu_ext_int_b && cp0_iu_meie;
assign iu_cp0_nt_int_pending_vld      = !cpu_ext_int_b;
assign iu_yy_xx_int_pending_priv[1:0] = clic_cpu_int_priv[1:0];
assign iu_yy_xx_int_pending_hv        = clic_cpu_int_hv;
assign iu_yy_xx_int_pending_il[7:0]   = clic_cpu_int_il[7:0];
assign iu_yy_xx_int_pending_id[9:0]   = clic_cpu_int_id[9:0];
assign iu_yy_xx_int_il[7:0]           = clic_cpu_int_il[7:0];
assign iu_yy_xx_int_hv                = clic_cpu_int_hv;
assign iu_cp0_lp_wk_int               = cp0_iu_vec_mode[1] ? clic_lp_wk_int : clint_lp_wk_int;
assign iu_sys_lp_wk_int               = iu_cp0_lp_wk_int;
assign clic_lp_wk_int                 = clic_int_pending_vld ;
assign int_enable_with_ee_ie = cp0_iu_mie_for_int;
assign intc_cpu_int_vld      = !cpu_ext_int_b && cp0_iu_meie;
assign int_ic_aft_sec_sel = cp0_iu_ic;
assign cp0_iu_ic = 1'b0;
assign retire_int = (cpu_int_vld && !had_iu_int_vld
                  || had_iu_int_vld
                       && !decd_retire_cp0_inst
                    )
                && !special_retire_inst_wsc
                && !decd_retire_inst_mret
                && !had_iu_rte_pc_sel
                && !(ctrl_retire_ni_vld || wb_xx_acc_err_after_retire)
                && (  !int_ic_aft_sec_sel && !rbus_retire_split_inst 
                    || int_ic_aft_sec_sel);
assign retire_inst_expt     =  rbus_retire_expt_vld;
assign retire_dbg_expt = 1'b0;
assign iu_ifu_kill_inst = 1'b0;
always @( rbus_retire_expt_vec[4:0]
       or retire_dbg_expt
       or retire_int
       or retire_inst_expt
       or had_iu_int_vld
       or cp0_iu_vec_mode[1]
       or clic_cpu_int_id[9:0])
begin
  expt_vec[9:0]   = 10'b0;
  retire_ack_expt = 1'b0;
  retire_ack_int  = 1'b0;
  if(retire_dbg_expt)
  begin
    retire_ack_expt = 1'b1;
    expt_vec[9:0] = {7'b0,3'b11};
  end
  else if(retire_int)
  begin
    retire_ack_int  = 1'b1;
    expt_vec[9:0]   =  had_iu_int_vld ? {6'b0,4'b1101} : cp0_iu_vec_mode[1] ? clic_cpu_int_id[9:0] : {6'b0,4'b1011};
  end
  else if(retire_inst_expt)
  begin
    retire_ack_expt = 1'b1;
    expt_vec[9:0] = {5'b0,rbus_retire_expt_vec[4:0]};
  end
end
assign retire_hs_acc_err = 1'b0;
assign retire_ack_expt_vld = (retire_ack_expt && iu_yy_xx_retire)
                          || (wb_xx_acc_err_after_retire
                              && !retire_with_ack_int)
                          || wb_dbg_exp_after_retire && cp0_iu_ee;
assign retire_ack_int_vld  = retire_ack_int && iu_yy_xx_retire;
assign retire_expt_vld = retire_ack_expt_vld && (!dbg_mode_on || soft_reset_vld)
                      && !dbgreq_ack_aft_force;
assign retire_int_mask_from_had = had_iu_mem_bkpt_mask || had_iu_trace_req;
assign retire_int_vld  = retire_ack_int_vld  && !dbg_mode_on && !dbgreq_ack_aft_force
                         && !retire_int_mask_from_had;
assign iu_yy_xx_expt_vec[9:0] = retire_hs_acc_err ? {5'b0,rbus_retire_expt_vec[4:0]}: expt_vec[9:0];
assign retire_expt_int_vld = retire_expt_vld || retire_int_vld;
assign retire_split_inst_no_dbg = rbus_retire_split_inst
                                  && !(iu_yy_xx_retire && retire_int);
assign retire_split_inst_no_dbg_for_pad = rbus_retire_split_inst
                                          && !(retire_ack_expt_vld || retire_ack_int_vld);
assign retire_split_inst_with_dbg_ack = retire_split_inst_no_dbg_for_pad && !dbgreq_ack_aft_force;
assign retire_pc_expt_vld = retire_inst_expt && !dbg_mode_on;
assign iu_cp0_expt_vld             = retire_expt_int_vld;
assign iu_cp0_mtval_updt_vld       = retire_expt_int_vld && !special_retire_inst_wsc 
                                    || retire_hs_acc_err
                                    ||(iu_yy_xx_retire && ifu_iu_inst_bkpt_dbg_occur_vld)
                                    || retire_ack_mem_bkpt_req 
                                    || retire_ack_mem_bkpt_fast_retire;
assign retire_wb_mem_bkpt_fast_retire = retire_ack_mem_bkpt_fast_retire;
assign iu_cp0_int_vld              = retire_int_vld;
assign iu_ifu_spcu_int_en          = retire_int_vld && !had_iu_bkpt_trace_en
                                     && cp0_iu_int_spcu_en;
assign retire_vector_expt_vld      = retire_expt_int_vld;
assign retire_vector_expt_int_hv   = retire_ack_int ? 
                                     cp0_iu_vec_mode[1] && (clic_cpu_int_hv || (cp0_iu_vec_mode[1:0] == 2'b11))
                                     : 1'b0;
assign soft_reset_vld              = 1'b0;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_with_ack_int <= 1'b0;
  else if(retire_int_vld)
    retire_with_ack_int <= 1'b1;
  else if(iu_yy_xx_retire)
    retire_with_ack_int <= 1'b0;
end
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_with_ack_dbg <= 1'b0;
  else if(dbgreq_ack_aft_force)
    retire_with_ack_dbg <= 1'b1;
  else if(iu_yy_xx_retire)
    retire_with_ack_dbg <= 1'b0;
end
assign retire_with_ack_vic_int = retire_with_ack_int && !had_iu_rte_pc_sel;
assign retire_with_ack_had_int = retire_with_ack_int && had_iu_rte_pc_sel;
assign bctm_retire_epc_updt_vld = 1'b0;
assign bctm_retire_had_pc_updt_vld = 1'b0;
assign fast_retire_acc_err_epc[30:0] = wb_retire_fast_retire_load_pc[30:0];
assign retire_hs_err_epc_sel         = retire_hs_acc_err && !retire_with_ack_int;
assign retire_wb_hs_err_epc_sel      = retire_hs_err_epc_sel;
assign retire_epc_or_hadpc[30:0] = (wb_xx_acc_err_after_retire 
                                     && !retire_hs_acc_err
                                   || retire_hs_err_epc_sel)
                                      ? fast_retire_acc_err_epc[30:0]
                                      : pcgen_retire_updt_pc[30:0];
assign iu_cp0_epc[30:0] = retire_epc_or_hadpc[30:0];
assign epc_update_after_retire = wb_xx_acc_err_after_retire && retire_with_ack_vic_int
                              || bctm_retire_epc_updt_vld;
assign iu_cp0_epc_update = epc_update_after_retire
                        && !hs_split_iu_hs_retire_mask;
assign retire_pcgen_curpc_update = (epc_update_after_retire
                                      || hadpc_update_after_retire)
                                && hs_split_iu_hs_retire_mask && !retire_hs_acc_err;
assign inst_dbg_disable    = 1'b0;
assign retire_ack_jdbreq  = had_iu_xx_jdbreq
                          && !hs_split_iu_hs_switch_se
                          && !inst_dbg_disable
                          && !retire_dbg_disable;
assign retire_dbg_mask = ifu_iu_ex_sp_oper && ifu_iu_ex_split_on;
assign retire_ack_dr_set_req   = iu_yy_xx_retire && had_iu_dr_set_req
                                 && !retire_dbg_mask
                                 && !inst_dbg_disable
                                 && !had_iu_rte_pc_sel
                                 && !retire_dbg_disable;
assign retire_ack_bkpt    =  iu_yy_xx_retire && rbus_retire_expt_vld
                          && (rbus_retire_expt_vec[4:0] == 5'b00011)
                          && (had_iu_xx_fdb || had_core_dbg_mode_req
                          ||  ifu_iu_inst_bkpt_dbg_occur_vld)
                          && !dbg_mode_on
                          && !inst_dbg_disable
                          && !had_iu_rte_pc_sel
                          && !retire_dbg_disable
                          && !(ifu_iu_inst_bkpt_dbgexp_occur_vld
                          &&  !ifu_iu_inst_bkpt_dbg_occur_vld);
assign retire_ack_mem_bkpt_req         = retire_ack_mem_bkpt_vld_idle 
                                         && had_iu_mem_bkpt_req
                                         && !inst_dbg_disable
                                         && !had_iu_rte_pc_sel
                                         && !retire_dbg_disable;
assign retire_ack_mem_bkpt_fast_retire = retire_ack_mem_bkpt_vld
                                     && !had_iu_mbkpt_fsm_index_mbee;
assign retire_ack_trace_req            = retire_ack_trace_vld_idle    
                                         && had_iu_trace_req
                                         && !inst_dbg_disable
                                         && !had_iu_rte_pc_sel
                                         && !retire_dbg_disable;
assign retire_ack_trace_fast_retire    = retire_ack_trace_vld; 
assign dbgreq_ack = retire_ack_jdbreq     || retire_ack_bkpt
                 || retire_ack_dr_set_req || retire_ack_mem_bkpt_req
                 || retire_ack_trace_req
                 || retire_ack_mem_bkpt_fast_retire
                 || retire_ack_trace_fast_retire;
assign dbgreq_ack_aft_force = dbgreq_ack || had_iu_force_dbg_en;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dbgreq_ack_ff <= 1'b0;
  else
    dbgreq_ack_ff <= dbgreq_ack_aft_force;
end
assign iu_had_xx_dbg_ack = dbgreq_ack_ff;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dbg_mode_on <= 1'b0;
  else if(had_yy_xx_exit_dbg || !iu_yy_xx_reg_rst_b)
    dbg_mode_on <= 1'b0;
  else if(dbgreq_ack_aft_force)
    dbg_mode_on <= 1'b1;
  else
    dbg_mode_on <= dbg_mode_on;
end
assign iu_yy_xx_dbgon            = dbg_mode_on;
assign iu_had_xx_retire          = iu_yy_xx_retire;
assign iu_had_xx_retire_pc[31:0] = {pcgen_xx_cur_pc[30:0],1'b0};
assign iu_had_xx_mldst           = retire_split_inst_no_dbg;
assign iu_had_xx_retire_normal   = !rbus_retire_expt_vld;
assign iu_had_int_ack = 1'b0;
assign iu_had_retire_with_had_int = 1'b0;
assign iu_had_dbg_disable_for_tee = cp0_iu_dbg_disable_for_tee;
assign iu_had_adr_dbg_ack = retire_ack_jdbreq;
assign iu_had_dr_dbg_ack  = retire_ack_dr_set_req;
assign iu_had_inst_bkpt_occur_vld = retire_ack_bkpt
                                 && ifu_iu_inst_bkpt_dbg_occur_vld;
assign iu_had_data_bkpt_occur_vld = retire_ack_mem_bkpt_req
                                 || retire_ack_mem_bkpt_fast_retire;
assign iu_had_xx_bkpt_inst       = retire_ack_bkpt
                               && !ifu_iu_inst_bkpt_dbg_occur_vld
                               && !had_core_dbg_mode_req;
assign iu_had_trace_occur_vld     = retire_ack_trace_req
                                 || retire_ack_trace_fast_retire;
assign iu_had_expt_vld            = retire_expt_int_vld;
assign wb_split_inst_clk_en = wb_split_inst ^ retire_split_inst_no_dbg;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_split_inst <= 1'b0;
  else if(iu_yy_xx_retire)
    wb_split_inst <= retire_split_inst_no_dbg;
end
assign hadpc_update_after_retire = wb_xx_acc_err_after_retire
                                     && (retire_with_ack_dbg
                                      || retire_with_ack_had_int)
                                || bctm_retire_had_pc_updt_vld;
assign iu_had_fast_retire_acc_err_pc_update = hadpc_update_after_retire
                                           && !retire_hs_acc_err;
assign iu_had_fast_retire_acc_err_pc_val[30:0] = retire_epc_or_hadpc[30:0];
assign load_store_fast_retire = rbus_wb_load || rbus_wb_store;
parameter BKPT_IDLE = 1'b0;
parameter BKPT_ACK  = 1'b1;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bkpt_cur_state <= BKPT_IDLE;
  else
    bkpt_cur_state <= bkpt_next_state;
end
assign bkpt_fsm_trigger = (had_iu_mem_bkpt_req
                        || had_iu_mem_bkpt_exp_req)
                        && load_store_fast_retire
                        && !ex_inst_dbg_disable && !had_iu_rte_pc_sel;
always @( bkpt_cur_state
       or bkpt_fsm_trigger
       or lsu_iu_wb_cmplt)
begin
  case(bkpt_cur_state)
  BKPT_IDLE : if(bkpt_fsm_trigger)
                bkpt_next_state = BKPT_ACK;
              else
                bkpt_next_state = BKPT_IDLE;
  BKPT_ACK  : if(lsu_iu_wb_cmplt)
                bkpt_next_state = BKPT_IDLE;
              else
                bkpt_next_state = BKPT_ACK;
  default   :   bkpt_next_state = BKPT_IDLE;
  endcase
end
assign retire_ack_mem_bkpt_vld_idle = (bkpt_cur_state == BKPT_IDLE)
                                      && !load_store_fast_retire;
assign retire_ack_mem_bkpt_vld = (bkpt_cur_state == BKPT_ACK)
                                 && lsu_iu_wb_cmplt
                                 && !lsu_iu_wb_acc_err;
assign wb_dbg_exp_after_retire = (bkpt_cur_state == BKPT_ACK) 
                                 && lsu_iu_wb_cmplt
                                 && !lsu_iu_wb_acc_err
                                 && had_iu_mbkpt_fsm_index_mbee;
parameter TRACE_IDLE = 1'b0;
parameter TRACE_ACK  = 1'b1;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    trace_cur_state <= TRACE_IDLE;
  else
    trace_cur_state <= trace_next_state;
end
always @( trace_cur_state
       or ex_inst_dbg_disable
       or load_store_fast_retire
       or had_iu_rte_pc_sel
       or had_iu_trace_req
       or lsu_iu_wb_cmplt)
begin
  case(trace_cur_state)
  TRACE_IDLE : if(had_iu_trace_req && load_store_fast_retire
                  && !ex_inst_dbg_disable && !had_iu_rte_pc_sel)
                trace_next_state = TRACE_ACK;
              else
                trace_next_state = TRACE_IDLE;
  TRACE_ACK  : if(lsu_iu_wb_cmplt)
                trace_next_state = TRACE_IDLE;
              else
                trace_next_state = TRACE_ACK;
  default    :  trace_next_state = TRACE_IDLE;
  endcase
end
assign retire_ack_trace_vld_idle = (trace_cur_state == TRACE_IDLE)
                                   && !load_store_fast_retire;
assign retire_ack_trace_vld = (trace_cur_state == TRACE_ACK)
                              && lsu_iu_wb_cmplt
                              && !lsu_iu_wb_acc_err;
assign retire_wb_dbg_in_ack = (bkpt_cur_state  == BKPT_ACK)
                           || (trace_cur_state == TRACE_ACK);
parameter BR_DBG_IDLE = 2'b00;
parameter BR_DBG_ACK  = 2'b10;
always @(posedge dbg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    br_cur_state[1:0] <= BR_DBG_IDLE;
  else
    br_cur_state[1:0] <= br_next_state[1:0];
end
always @( ctrl_branch_ex_sel
       or br_cur_state
       or ifu_iu_ibus_idle
       or had_iu_trace_req_for_dbg_disable
       or ifu_iu_inst_buf_inst_vld)
begin
  case(br_cur_state)
  BR_DBG_IDLE : if(ctrl_branch_ex_sel && ifu_iu_ibus_idle && had_iu_trace_req_for_dbg_disable)
                  br_next_state = BR_DBG_ACK;
                else
                  br_next_state = BR_DBG_IDLE;
  BR_DBG_ACK  : if(ifu_iu_inst_buf_inst_vld)
                  br_next_state = BR_DBG_IDLE;
                else
                  br_next_state = BR_DBG_ACK;
  default     :   br_next_state = BR_DBG_IDLE;
  endcase
end
assign retire_branch_stall = (br_cur_state == BR_DBG_IDLE)
                                && had_iu_trace_req_for_dbg_disable
                          || (br_cur_state == BR_DBG_ACK)
                                && !ifu_iu_inst_buf_inst_vld;
assign retire_branch_dbg_idle = (br_cur_state == BR_DBG_IDLE);
assign retire_dbg_disable = retire_dbg_disable_pre || cp0_iu_dbg_disable_for_tee;
assign retire_dbg_disable_pre = retire_branch_dbg_idle
                                  ? ex_inst_dbg_disable
                                  : ifu_iu_inst_buf_inst_dbg_disable;
assign ex_inst_dbg_disable = ifu_iu_ex_inst_dbg_disable || cp0_iu_dbg_disable_for_tee;
assign retire_xx_normal_retire = iu_yy_xx_retire
                                    && !rbus_retire_split_inst
                                    && !(retire_pc_expt_vld && !special_retire_inst_wsc);
assign sec_retire_flush = 1'b0;
assign rbus_flush      = iu_yy_xx_retire && rbus_retire_flush;
assign nie_flush = 1'b0;
assign nie_flush_chgflw = 1'b0;
assign retire_mad_ex_cancel = dbgreq_ack_aft_force;
assign iu_yy_xx_flush  = rbus_flush
                         || iu_cp0_expt_vld
                         || dbgreq_ack_aft_force
                         || wb_xx_lsu_check_fail_after_retire
                         || retire_hs_acc_err
                         || sec_retire_flush
                         || nie_flush;
assign iu_pad_inst_retire     = iu_yy_xx_retire && !retire_split_inst_with_dbg_ack;
assign iu_pad_inst_split      = retire_split_inst_with_dbg_ack;
assign iu_pad_retire_pc[31:0] = {pcgen_xx_cur_pc[30:0],1'b0};
endmodule
