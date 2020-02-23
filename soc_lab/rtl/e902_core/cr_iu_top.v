/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_top(
  bmu_xx_ibus_acc_err,
  bmu_xx_ibus_data_vld,
  bmu_xx_ibus_grnt,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clk_en,
  cp0_iu_data,
  cp0_iu_data_vld,
  cp0_iu_dbg_disable_for_tee,
  cp0_iu_epc_for_chgflw,
  cp0_iu_expt_vec,
  cp0_iu_expt_vld,
  cp0_iu_flush,
  cp0_iu_flush_chgflw_vld,
  cp0_iu_il,
  cp0_iu_meie,
  cp0_iu_mie_for_int,
  cp0_iu_req,
  cp0_iu_rte_chgflw_vld,
  cp0_iu_rte_chgflw_vld_for_data,
  cp0_iu_stall,
  cp0_iu_vbr,
  cp0_iu_vec_mode,
  cp0_vector_vec_err_vbr,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  had_core_dbg_mode_req,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_iu_bkpt_trace_en,
  had_iu_dr_set_req,
  had_iu_force_dbg_en,
  had_iu_int_vld,
  had_iu_mbkpt_fsm_index_mbee,
  had_iu_mem_bkpt_exp_req,
  had_iu_mem_bkpt_mask,
  had_iu_mem_bkpt_req,
  had_iu_pc,
  had_iu_rte_pc_sel,
  had_iu_trace_req,
  had_iu_trace_req_for_dbg_disable,
  had_iu_xx_fdb,
  had_iu_xx_jdbreq,
  had_yy_xx_exit_dbg,
  ifu_had_chg_flw_inst,
  ifu_had_match_pc,
  ifu_iu_ex_expt_cur,
  ifu_iu_ex_expt_vld,
  ifu_iu_ex_inst,
  ifu_iu_ex_inst_bkpt,
  ifu_iu_ex_inst_dbg_disable,
  ifu_iu_ex_inst_vld,
  ifu_iu_ex_int_spcu_mask,
  ifu_iu_ex_int_spcu_vld,
  ifu_iu_ex_ni,
  ifu_iu_ex_prvlg_expt_vld,
  ifu_iu_ex_rand_vld,
  ifu_iu_ex_sp_oper,
  ifu_iu_ibus_idle,
  ifu_iu_inst_bkpt_dbg_occur_vld,
  ifu_iu_inst_bkpt_dbgexp_occur_vld,
  ifu_iu_inst_buf_inst_dbg_disable,
  ifu_iu_inst_buf_inst_vld,
  ifu_iu_spcu_retire_mask,
  ifu_iu_vector_ibus_in_idle,
  ifu_iu_xx_ibus_data,
  iu_bmu_vec_redirect,
  iu_cp0_ecall,
  iu_cp0_epc,
  iu_cp0_epc_update,
  iu_cp0_ex_csrrc,
  iu_cp0_ex_csrrci,
  iu_cp0_ex_csrrs,
  iu_cp0_ex_csrrsi,
  iu_cp0_ex_csrrw,
  iu_cp0_ex_csrrwi,
  iu_cp0_ex_data_sel,
  iu_cp0_ex_func3,
  iu_cp0_ex_mret,
  iu_cp0_ex_rd_reg,
  iu_cp0_ex_rs1_reg,
  iu_cp0_ex_sel,
  iu_cp0_ex_wfi,
  iu_cp0_expt_tval,
  iu_cp0_expt_vld,
  iu_cp0_imm,
  iu_cp0_int_vld,
  iu_cp0_lp_wk_int,
  iu_cp0_mtval_updt_vld,
  iu_cp0_nt_int_pending_vld,
  iu_cp0_oper_mux_en,
  iu_cp0_rs1,
  iu_cp0_syc_rst_b,
  iu_had_adr_dbg_ack,
  iu_had_chgflw_dst_pc,
  iu_had_chgflw_vld,
  iu_had_data_bkpt_occur_vld,
  iu_had_dbg_disable_for_tee,
  iu_had_dr_dbg_ack,
  iu_had_expt_vld,
  iu_had_fast_retire_acc_err_pc_update,
  iu_had_fast_retire_acc_err_pc_val,
  iu_had_flush,
  iu_had_inst_bkpt_occur_vld,
  iu_had_int_ack,
  iu_had_retire_with_had_int,
  iu_had_trace_occur_vld,
  iu_had_xx_bkpt_inst,
  iu_had_xx_data,
  iu_had_xx_data_vld,
  iu_had_xx_dbg_ack,
  iu_had_xx_mldst,
  iu_had_xx_retire,
  iu_had_xx_retire_normal,
  iu_had_xx_retire_pc,
  iu_ifu_addr,
  iu_ifu_data_fetch,
  iu_ifu_data_fetch_for_data,
  iu_ifu_ex_stall,
  iu_ifu_ex_stall_noinput,
  iu_ifu_ex_vld,
  iu_ifu_inst_fetch,
  iu_ifu_inst_fetch_for_data,
  iu_ifu_inst_fetch_mask,
  iu_ifu_inst_fetch_without_dbg_disable,
  iu_ifu_kill_inst,
  iu_ifu_lsu_inst,
  iu_ifu_security_violation,
  iu_ifu_wb_ldst,
  iu_ifu_wb_stall,
  iu_lsu_base,
  iu_lsu_cmp,
  iu_lsu_data,
  iu_lsu_ex_byte,
  iu_lsu_ex_data_sel,
  iu_lsu_ex_half,
  iu_lsu_ex_sel,
  iu_lsu_ex_store,
  iu_lsu_ex_uns,
  iu_lsu_imm_data,
  iu_lsu_imm_sel,
  iu_lsu_imm_write_en,
  iu_lsu_offset,
  iu_lsu_oper_mux_en,
  iu_lsu_pc,
  iu_lsu_pc_sel,
  iu_lsu_rs1_sel,
  iu_lsu_rs2,
  iu_lsu_stall_without_hready,
  iu_lsu_wb_ldst,
  iu_lsu_wb_load,
  iu_lsu_wb_store,
  iu_pad_gpr_data,
  iu_pad_gpr_index,
  iu_pad_gpr_we,
  iu_pad_inst_retire,
  iu_pad_inst_split,
  iu_pad_retire_pc,
  iu_sys_lp_wk_int,
  iu_sysyio_soft_rst,
  iu_yy_xx_dbgon,
  iu_yy_xx_expt_vec,
  iu_yy_xx_flush,
  iu_yy_xx_int_hv,
  iu_yy_xx_int_il,
  iu_yy_xx_int_pending_hv,
  iu_yy_xx_int_pending_id,
  iu_yy_xx_int_pending_il,
  iu_yy_xx_int_pending_priv,
  lsu_iu_addr,
  lsu_iu_addr_vld,
  lsu_iu_alu_sel,
  lsu_iu_branch_cout,
  lsu_iu_branch_rst,
  lsu_iu_data,
  lsu_iu_data_vld,
  lsu_iu_expt_vec,
  lsu_iu_expt_vld,
  lsu_iu_fast_retire,
  lsu_iu_mad_buf,
  lsu_iu_req,
  lsu_iu_stall,
  lsu_iu_stall_noinput,
  lsu_iu_store,
  lsu_iu_wb_acc_err,
  lsu_iu_wb_bstack_chk_fail,
  lsu_iu_wb_cmplt,
  lsu_iu_wb_data_vld,
  lsu_iu_wb_load_data,
  lsu_iu_wfd,
  pad_cpu_ext_int_b,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  split_ifctrl_hs_stall,
  split_ifctrl_hs_stall_part,
  vector_cp0_vec_err,
  vector_cp0_vec_err_epc,
  vector_cp0_vec_succeed
);
input           bmu_xx_ibus_acc_err;                    
input           bmu_xx_ibus_data_vld;                   
input           bmu_xx_ibus_grnt;                       
input           clic_cpu_int_hv;                        
input   [9 :0]  clic_cpu_int_id;                        
input   [7 :0]  clic_cpu_int_il;                        
input   [1 :0]  clic_cpu_int_priv;                      
input           clk_en;                                 
input   [31:0]  cp0_iu_data;                            
input           cp0_iu_data_vld;                        
input           cp0_iu_dbg_disable_for_tee;             
input   [30:0]  cp0_iu_epc_for_chgflw;                  
input   [4 :0]  cp0_iu_expt_vec;                        
input           cp0_iu_expt_vld;                        
input           cp0_iu_flush;                           
input           cp0_iu_flush_chgflw_vld;                
input   [7 :0]  cp0_iu_il;                              
input           cp0_iu_meie;                            
input           cp0_iu_mie_for_int;                     
input           cp0_iu_req;                             
input           cp0_iu_rte_chgflw_vld;                  
input           cp0_iu_rte_chgflw_vld_for_data;         
input           cp0_iu_stall;                           
input   [29:0]  cp0_iu_vbr;                             
input   [1 :0]  cp0_iu_vec_mode;                        
input   [29:0]  cp0_vector_vec_err_vbr;                 
input           cp0_yy_clk_en;                          
input   [1 :0]  cp0_yy_priv_mode;                       
input           cpurst_b;                               
input           forever_cpuclk;                         
input           had_core_dbg_mode_req;                  
input   [31:0]  had_idu_wbbr_data;                      
input           had_idu_wbbr_vld;                       
input           had_iu_bkpt_trace_en;                   
input           had_iu_dr_set_req;                      
input           had_iu_force_dbg_en;                    
input           had_iu_int_vld;                         
input           had_iu_mbkpt_fsm_index_mbee;            
input           had_iu_mem_bkpt_exp_req;                
input           had_iu_mem_bkpt_mask;                   
input           had_iu_mem_bkpt_req;                    
input   [30:0]  had_iu_pc;                              
input           had_iu_rte_pc_sel;                      
input           had_iu_trace_req;                       
input           had_iu_trace_req_for_dbg_disable;       
input           had_iu_xx_fdb;                          
input           had_iu_xx_jdbreq;                       
input           had_yy_xx_exit_dbg;                     
input           ifu_iu_ex_expt_cur;                     
input           ifu_iu_ex_expt_vld;                     
input   [31:0]  ifu_iu_ex_inst;                         
input           ifu_iu_ex_inst_bkpt;                    
input           ifu_iu_ex_inst_dbg_disable;             
input           ifu_iu_ex_inst_vld;                     
input           ifu_iu_ex_int_spcu_mask;                
input           ifu_iu_ex_int_spcu_vld;                 
input           ifu_iu_ex_ni;                           
input           ifu_iu_ex_prvlg_expt_vld;               
input           ifu_iu_ex_rand_vld;                     
input           ifu_iu_ex_sp_oper;                      
input           ifu_iu_ibus_idle;                       
input           ifu_iu_inst_bkpt_dbg_occur_vld;         
input           ifu_iu_inst_bkpt_dbgexp_occur_vld;      
input           ifu_iu_inst_buf_inst_dbg_disable;       
input           ifu_iu_inst_buf_inst_vld;               
input           ifu_iu_spcu_retire_mask;                
input           ifu_iu_vector_ibus_in_idle;             
input   [31:0]  ifu_iu_xx_ibus_data;                    
input   [31:0]  lsu_iu_addr;                            
input           lsu_iu_addr_vld;                        
input           lsu_iu_alu_sel;                         
input           lsu_iu_branch_cout;                     
input   [31:0]  lsu_iu_branch_rst;                      
input   [31:0]  lsu_iu_data;                            
input           lsu_iu_data_vld;                        
input   [4 :0]  lsu_iu_expt_vec;                        
input           lsu_iu_expt_vld;                        
input           lsu_iu_fast_retire;                     
input   [31:0]  lsu_iu_mad_buf;                         
input           lsu_iu_req;                             
input           lsu_iu_stall;                           
input           lsu_iu_stall_noinput;                   
input           lsu_iu_store;                           
input           lsu_iu_wb_acc_err;                      
input           lsu_iu_wb_bstack_chk_fail;              
input           lsu_iu_wb_cmplt;                        
input           lsu_iu_wb_data_vld;                     
input   [31:0]  lsu_iu_wb_load_data;                    
input           lsu_iu_wfd;                             
input           pad_cpu_ext_int_b;                      
input           pad_yy_gate_clk_en_b;                   
input           pad_yy_test_mode;                       
output          ifu_had_chg_flw_inst;                   
output  [31:0]  ifu_had_match_pc;                       
output          iu_bmu_vec_redirect;                    
output          iu_cp0_ecall;                           
output  [30:0]  iu_cp0_epc;                             
output          iu_cp0_epc_update;                      
output          iu_cp0_ex_csrrc;                        
output          iu_cp0_ex_csrrci;                       
output          iu_cp0_ex_csrrs;                        
output          iu_cp0_ex_csrrsi;                       
output          iu_cp0_ex_csrrw;                        
output          iu_cp0_ex_csrrwi;                       
output          iu_cp0_ex_data_sel;                     
output  [2 :0]  iu_cp0_ex_func3;                        
output          iu_cp0_ex_mret;                         
output  [4 :0]  iu_cp0_ex_rd_reg;                       
output  [4 :0]  iu_cp0_ex_rs1_reg;                      
output          iu_cp0_ex_sel;                          
output          iu_cp0_ex_wfi;                          
output  [31:0]  iu_cp0_expt_tval;                       
output          iu_cp0_expt_vld;                        
output  [11:0]  iu_cp0_imm;                             
output          iu_cp0_int_vld;                         
output          iu_cp0_lp_wk_int;                       
output          iu_cp0_mtval_updt_vld;                  
output          iu_cp0_nt_int_pending_vld;              
output          iu_cp0_oper_mux_en;                     
output  [31:0]  iu_cp0_rs1;                             
output          iu_cp0_syc_rst_b;                       
output          iu_had_adr_dbg_ack;                     
output  [31:0]  iu_had_chgflw_dst_pc;                   
output          iu_had_chgflw_vld;                      
output          iu_had_data_bkpt_occur_vld;             
output          iu_had_dbg_disable_for_tee;             
output          iu_had_dr_dbg_ack;                      
output          iu_had_expt_vld;                        
output          iu_had_fast_retire_acc_err_pc_update;   
output  [30:0]  iu_had_fast_retire_acc_err_pc_val;      
output          iu_had_flush;                           
output          iu_had_inst_bkpt_occur_vld;             
output          iu_had_int_ack;                         
output          iu_had_retire_with_had_int;             
output          iu_had_trace_occur_vld;                 
output          iu_had_xx_bkpt_inst;                    
output  [31:0]  iu_had_xx_data;                         
output          iu_had_xx_data_vld;                     
output          iu_had_xx_dbg_ack;                      
output          iu_had_xx_mldst;                        
output          iu_had_xx_retire;                       
output          iu_had_xx_retire_normal;                
output  [31:0]  iu_had_xx_retire_pc;                    
output  [30:0]  iu_ifu_addr;                            
output          iu_ifu_data_fetch;                      
output          iu_ifu_data_fetch_for_data;             
output          iu_ifu_ex_stall;                        
output          iu_ifu_ex_stall_noinput;                
output          iu_ifu_ex_vld;                          
output          iu_ifu_inst_fetch;                      
output          iu_ifu_inst_fetch_for_data;             
output          iu_ifu_inst_fetch_mask;                 
output          iu_ifu_inst_fetch_without_dbg_disable;  
output          iu_ifu_kill_inst;                       
output          iu_ifu_lsu_inst;                        
output          iu_ifu_security_violation;              
output          iu_ifu_wb_ldst;                         
output          iu_ifu_wb_stall;                        
output  [31:0]  iu_lsu_base;                            
output          iu_lsu_cmp;                             
output  [31:0]  iu_lsu_data;                            
output          iu_lsu_ex_byte;                         
output          iu_lsu_ex_data_sel;                     
output          iu_lsu_ex_half;                         
output          iu_lsu_ex_sel;                          
output          iu_lsu_ex_store;                        
output          iu_lsu_ex_uns;                          
output  [31:0]  iu_lsu_imm_data;                        
output          iu_lsu_imm_sel;                         
output          iu_lsu_imm_write_en;                    
output  [31:0]  iu_lsu_offset;                          
output          iu_lsu_oper_mux_en;                     
output  [31:0]  iu_lsu_pc;                              
output          iu_lsu_pc_sel;                          
output          iu_lsu_rs1_sel;                         
output  [31:0]  iu_lsu_rs2;                             
output          iu_lsu_stall_without_hready;            
output          iu_lsu_wb_ldst;                         
output          iu_lsu_wb_load;                         
output          iu_lsu_wb_store;                        
output  [31:0]  iu_pad_gpr_data;                        
output  [4 :0]  iu_pad_gpr_index;                       
output          iu_pad_gpr_we;                          
output          iu_pad_inst_retire;                     
output          iu_pad_inst_split;                      
output  [31:0]  iu_pad_retire_pc;                       
output          iu_sys_lp_wk_int;                       
output          iu_sysyio_soft_rst;                     
output          iu_yy_xx_dbgon;                         
output  [9 :0]  iu_yy_xx_expt_vec;                      
output          iu_yy_xx_flush;                         
output          iu_yy_xx_int_hv;                        
output  [7 :0]  iu_yy_xx_int_il;                        
output          iu_yy_xx_int_pending_hv;                
output  [9 :0]  iu_yy_xx_int_pending_id;                
output  [7 :0]  iu_yy_xx_int_pending_il;                
output  [1 :0]  iu_yy_xx_int_pending_priv;              
output          split_ifctrl_hs_stall;                  
output          split_ifctrl_hs_stall_part;             
output          vector_cp0_vec_err;                     
output  [29:0]  vector_cp0_vec_err_epc;                 
output          vector_cp0_vec_succeed;                 
wire            alu_mad_adder_of;                       
wire    [31:0]  alu_mad_adder_rst;                      
wire            alu_mad_rst_cout;                       
wire    [31:0]  alu_rbus_data;                          
wire            alu_rbus_data_vld;                      
wire            alu_rbus_req;                           
wire            bctm_top_clk_en;                        
wire            bmu_xx_ibus_acc_err;                    
wire            bmu_xx_ibus_data_vld;                   
wire            bmu_xx_ibus_grnt;                       
wire            branch_alu_adder_cmp;                   
wire            branch_alu_adder_sel;                   
wire            branch_alu_logic_nz;                    
wire            branch_alu_logic_sel;                   
wire            branch_alu_pc_sel;                      
wire            branch_ctrl_stall;                      
wire    [30:0]  branch_pcgen_add_pc;                    
wire            branch_pcgen_br_chgflw_vld;             
wire            branch_pcgen_br_chgflw_vld_for_data;    
wire            branch_pcgen_br_pc_chgflw_vld;          
wire            branch_pcgen_branch_chgflw_vld_for_data; 
wire            branch_pcgen_jmp_chgflw_vld_for_data;   
wire    [30:0]  branch_pcgen_reg_pc;                    
wire    [31:0]  branch_rbus_data;                       
wire            branch_rbus_data_vld;                   
wire            branch_rbus_req;                        
wire            branch_wb_cmp;                          
wire            branch_wb_jmp_reg;                      
wire            clic_cpu_int_hv;                        
wire    [9 :0]  clic_cpu_int_id;                        
wire    [7 :0]  clic_cpu_int_il;                        
wire    [1 :0]  clic_cpu_int_priv;                      
wire            clk_en;                                 
wire    [31:0]  cp0_iu_data;                            
wire            cp0_iu_data_vld;                        
wire            cp0_iu_dbg_disable_for_tee;             
wire    [30:0]  cp0_iu_epc_for_chgflw;                  
wire    [4 :0]  cp0_iu_expt_vec;                        
wire            cp0_iu_expt_vld;                        
wire            cp0_iu_flush;                           
wire            cp0_iu_flush_chgflw_vld;                
wire    [7 :0]  cp0_iu_il;                              
wire            cp0_iu_meie;                            
wire            cp0_iu_mie_for_int;                     
wire            cp0_iu_req;                             
wire            cp0_iu_rte_chgflw_vld;                  
wire            cp0_iu_rte_chgflw_vld_for_data;         
wire            cp0_iu_stall;                           
wire    [29:0]  cp0_iu_vbr;                             
wire    [1 :0]  cp0_iu_vec_mode;                        
wire    [29:0]  cp0_vector_vec_err_vbr;                 
wire            cp0_yy_clk_en;                          
wire    [1 :0]  cp0_yy_priv_mode;                       
wire            cpurst_b;                               
wire            ctrl_alu_ex_data_sel;                   
wire            ctrl_alu_ex_sel;                        
wire            ctrl_alu_mad_oper_mux_en;               
wire            ctrl_alu_oper_mux_en;                   
wire            ctrl_branch_ex_data_sel;                
wire            ctrl_branch_ex_sel;                     
wire            ctrl_cp0_ex_data_sel;                   
wire            ctrl_lsu_ex_data_sel;                   
wire            ctrl_mad_ex_data_sel;                   
wire            ctrl_mad_ex_sel;                        
wire            ctrl_mad_oper_mux_en;                   
wire            ctrl_oper_lsu_data_sel;                 
wire            ctrl_retire_ni_vld;                     
wire            ctrl_special_ex_data_sel;               
wire            ctrl_special_ex_sel;                    
wire    [4 :0]  ctrl_special_expt_vec;                  
wire            ctrl_special_expt_vld;                  
wire            ctrl_xx_sp_adjust;                      
wire            decd_alu_dst_vld;                       
wire    [2 :0]  decd_alu_func;                          
wire            decd_alu_rs2_imm_vld;                   
wire    [3 :0]  decd_alu_sub_func;                      
wire            decd_branch_auipc;                      
wire            decd_branch_beq;                        
wire            decd_branch_bge;                        
wire            decd_branch_bgeu;                       
wire            decd_branch_blt;                        
wire            decd_branch_bltu;                       
wire            decd_branch_bne;                        
wire            decd_branch_cbeqz;                      
wire            decd_branch_cbnez;                      
wire            decd_branch_cj;                         
wire            decd_branch_cjal;                       
wire            decd_branch_cjalr;                      
wire            decd_branch_cjr;                        
wire            decd_branch_jal;                        
wire            decd_branch_jalr;                       
wire            decd_ctrl_alu_sel;                      
wire            decd_ctrl_branch_sel;                   
wire            decd_ctrl_cp0_sel;                      
wire            decd_ctrl_expt_bkpt;                    
wire            decd_ctrl_expt_ecall;                   
wire            decd_ctrl_expt_inv;                     
wire            decd_ctrl_expt_wsc;                     
wire            decd_ctrl_lsu_sel;                      
wire            decd_ctrl_mad_sel;                      
wire            decd_mad_inst_div;                      
wire            decd_mad_inst_divu;                     
wire            decd_mad_inst_mul;                      
wire            decd_mad_inst_mulh;                     
wire            decd_mad_inst_mulhsu;                   
wire            decd_mad_inst_mulhu;                    
wire            decd_mad_inst_rem;                      
wire            decd_mad_inst_remu;                     
wire    [31:0]  decd_oper_alu_imm;                      
wire    [31:0]  decd_oper_branch_imm;                   
wire    [11:0]  decd_oper_cp0_imm;                      
wire    [31:0]  decd_oper_lsu_imm;                      
wire            decd_retire_cp0_inst;                   
wire            decd_retire_inst_mret;                  
wire            decd_special_fencei;                    
wire    [31:0]  decd_wb_tval;                           
wire            decd_xx_inst_32bit;                     
wire            decd_xx_unit_special_sel;               
wire            forever_cpuclk;                         
wire            had_core_dbg_mode_req;                  
wire    [31:0]  had_idu_wbbr_data;                      
wire            had_idu_wbbr_vld;                       
wire            had_iu_bkpt_trace_en;                   
wire            had_iu_dr_set_req;                      
wire            had_iu_force_dbg_en;                    
wire            had_iu_int_vld;                         
wire            had_iu_mbkpt_fsm_index_mbee;            
wire            had_iu_mem_bkpt_exp_req;                
wire            had_iu_mem_bkpt_mask;                   
wire            had_iu_mem_bkpt_req;                    
wire    [30:0]  had_iu_pc;                              
wire            had_iu_rte_pc_sel;                      
wire            had_iu_trace_req;                       
wire            had_iu_trace_req_for_dbg_disable;       
wire            had_iu_xx_fdb;                          
wire            had_iu_xx_jdbreq;                       
wire            had_yy_xx_exit_dbg;                     
wire            hs_split_iu_ctrl_inst_vld;              
wire    [31:0]  hs_split_iu_dp_inst_op;                 
wire            hs_split_iu_hs_retire_mask;             
wire            hs_split_iu_hs_switch_se;               
wire            hs_split_iu_nsinst_gpr_rst_b;           
wire            hs_split_iu_unstack_chgflw;             
wire            ifu_had_chg_flw_inst;                   
wire    [31:0]  ifu_had_match_pc;                       
wire    [4 :0]  ifu_iu_ex_cnt;                          
wire            ifu_iu_ex_expt_cur;                     
wire            ifu_iu_ex_expt_vld;                     
wire    [31:0]  ifu_iu_ex_inst;                         
wire            ifu_iu_ex_inst_bkpt;                    
wire            ifu_iu_ex_inst_dbg_disable;             
wire            ifu_iu_ex_inst_vld;                     
wire            ifu_iu_ex_int_spcu_mask;                
wire            ifu_iu_ex_int_spcu_vld;                 
wire            ifu_iu_ex_ni;                           
wire            ifu_iu_ex_prvlg_expt_vld;               
wire            ifu_iu_ex_rand_vld;                     
wire    [4 :0]  ifu_iu_ex_rd_reg;                       
wire    [4 :0]  ifu_iu_ex_rs1_reg;                      
wire    [4 :0]  ifu_iu_ex_rs2_reg;                      
wire            ifu_iu_ex_sp_oper;                      
wire            ifu_iu_ex_split_on;                     
wire            ifu_iu_ibus_idle;                       
wire            ifu_iu_inst_bkpt_dbg_occur_vld;         
wire            ifu_iu_inst_bkpt_dbgexp_occur_vld;      
wire            ifu_iu_inst_buf_inst_dbg_disable;       
wire            ifu_iu_inst_buf_inst_vld;               
wire            ifu_iu_spcu_retire_mask;                
wire            ifu_iu_vector_ibus_in_idle;             
wire    [31:0]  ifu_iu_xx_ibus_data;                    
wire            iu_bmu_vec_redirect;                    
wire            iu_cp0_ecall;                           
wire    [30:0]  iu_cp0_epc;                             
wire            iu_cp0_epc_update;                      
wire            iu_cp0_ex_csrrc;                        
wire            iu_cp0_ex_csrrci;                       
wire            iu_cp0_ex_csrrs;                        
wire            iu_cp0_ex_csrrsi;                       
wire            iu_cp0_ex_csrrw;                        
wire            iu_cp0_ex_csrrwi;                       
wire            iu_cp0_ex_data_sel;                     
wire    [2 :0]  iu_cp0_ex_func3;                        
wire            iu_cp0_ex_mret;                         
wire    [4 :0]  iu_cp0_ex_rd_reg;                       
wire    [4 :0]  iu_cp0_ex_rs1_reg;                      
wire            iu_cp0_ex_sel;                          
wire            iu_cp0_ex_wfi;                          
wire    [31:0]  iu_cp0_expt_tval;                       
wire            iu_cp0_expt_vld;                        
wire    [11:0]  iu_cp0_imm;                             
wire            iu_cp0_int_vld;                         
wire            iu_cp0_lp_wk_int;                       
wire            iu_cp0_mtval_updt_vld;                  
wire            iu_cp0_nt_int_pending_vld;              
wire            iu_cp0_oper_mux_en;                     
wire    [31:0]  iu_cp0_rs1;                             
wire            iu_cp0_syc_rst_b;                       
wire            iu_had_adr_dbg_ack;                     
wire    [31:0]  iu_had_chgflw_dst_pc;                   
wire            iu_had_chgflw_vld;                      
wire            iu_had_data_bkpt_occur_vld;             
wire            iu_had_dbg_disable_for_tee;             
wire            iu_had_dr_dbg_ack;                      
wire            iu_had_expt_vld;                        
wire            iu_had_fast_retire_acc_err_pc_update;   
wire    [30:0]  iu_had_fast_retire_acc_err_pc_val;      
wire            iu_had_flush;                           
wire            iu_had_inst_bkpt_occur_vld;             
wire            iu_had_int_ack;                         
wire            iu_had_retire_with_had_int;             
wire            iu_had_trace_occur_vld;                 
wire            iu_had_xx_bkpt_inst;                    
wire    [31:0]  iu_had_xx_data;                         
wire            iu_had_xx_data_vld;                     
wire            iu_had_xx_dbg_ack;                      
wire            iu_had_xx_mldst;                        
wire            iu_had_xx_retire;                       
wire            iu_had_xx_retire_normal;                
wire    [31:0]  iu_had_xx_retire_pc;                    
wire            iu_hs_split_ex_stall;                   
wire    [30:0]  iu_ifu_addr;                            
wire            iu_ifu_data_fetch;                      
wire            iu_ifu_data_fetch_for_data;             
wire            iu_ifu_ex_stall;                        
wire            iu_ifu_ex_stall_noinput;                
wire            iu_ifu_ex_vld;                          
wire            iu_ifu_inst_fetch;                      
wire            iu_ifu_inst_fetch_for_data;             
wire            iu_ifu_inst_fetch_mask;                 
wire            iu_ifu_inst_fetch_without_dbg_disable;  
wire            iu_ifu_kill_inst;                       
wire            iu_ifu_lsu_inst;                        
wire            iu_ifu_security_violation;              
wire            iu_ifu_spcu_int_en;                     
wire            iu_ifu_wb_ldst;                         
wire            iu_ifu_wb_stall;                        
wire    [31:0]  iu_lsu_base;                            
wire            iu_lsu_cmp;                             
wire    [31:0]  iu_lsu_data;                            
wire            iu_lsu_ex_byte;                         
wire            iu_lsu_ex_data_sel;                     
wire            iu_lsu_ex_half;                         
wire            iu_lsu_ex_sel;                          
wire            iu_lsu_ex_store;                        
wire            iu_lsu_ex_uns;                          
wire    [31:0]  iu_lsu_imm_data;                        
wire            iu_lsu_imm_sel;                         
wire            iu_lsu_imm_write_en;                    
wire    [31:0]  iu_lsu_offset;                          
wire            iu_lsu_oper_mux_en;                     
wire    [31:0]  iu_lsu_pc;                              
wire            iu_lsu_pc_sel;                          
wire            iu_lsu_rs1_sel;                         
wire    [31:0]  iu_lsu_rs2;                             
wire            iu_lsu_stall_without_hready;            
wire            iu_lsu_wb_ldst;                         
wire            iu_lsu_wb_load;                         
wire            iu_lsu_wb_store;                        
wire    [31:0]  iu_pad_gpr_data;                        
wire    [4 :0]  iu_pad_gpr_index;                       
wire            iu_pad_gpr_we;                          
wire            iu_pad_inst_retire;                     
wire            iu_pad_inst_split;                      
wire    [31:0]  iu_pad_retire_pc;                       
wire            iu_sys_lp_wk_int;                       
wire            iu_sysyio_soft_rst;                     
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
wire    [31:0]  lsu_iu_addr;                            
wire            lsu_iu_addr_vld;                        
wire            lsu_iu_alu_sel;                         
wire            lsu_iu_branch_cout;                     
wire    [31:0]  lsu_iu_branch_rst;                      
wire    [31:0]  lsu_iu_data;                            
wire            lsu_iu_data_vld;                        
wire    [4 :0]  lsu_iu_expt_vec;                        
wire            lsu_iu_expt_vld;                        
wire            lsu_iu_fast_retire;                     
wire    [31:0]  lsu_iu_mad_buf;                         
wire            lsu_iu_req;                             
wire            lsu_iu_stall;                           
wire            lsu_iu_stall_noinput;                   
wire            lsu_iu_store;                           
wire            lsu_iu_wb_acc_err;                      
wire            lsu_iu_wb_bstack_chk_fail;              
wire            lsu_iu_wb_cmplt;                        
wire            lsu_iu_wb_data_vld;                     
wire    [31:0]  lsu_iu_wb_load_data;                    
wire            lsu_iu_wfd;                             
wire            mad_alu_data_vld;                       
wire    [31:0]  mad_alu_div_rs2;                        
wire            mad_alu_div_shift;                      
wire            mad_alu_fst_add;                        
wire            mad_alu_imm_vld;                        
wire    [31:0]  mad_alu_rs1;                            
wire            mad_alu_rs1_cst_0;                      
wire            mad_alu_rs1_vld;                        
wire            mad_alu_rs2_cst_0;                      
wire    [31:0]  mad_alu_rst;                            
wire            mad_alu_rst_vld;                        
wire            mad_ctrl_stall;                         
wire            mad_ctrl_stall_noinput;                 
wire            mad_rbus_req;                           
wire            misc_clk;                               
wire            misc_clk_en;                            
wire            nie_flush_chgflw;                       
wire    [31:0]  oper_alu_rs1_reg;                       
wire    [31:0]  oper_alu_rs2_imm;                       
wire    [31:0]  oper_alu_rs2_reg;                       
wire    [31:0]  oper_branch_rs1_reg;                    
wire    [31:0]  oper_branch_rs2_imm;                    
wire    [31:0]  oper_branch_rs2_reg;                    
wire    [31:0]  oper_mad_rs1;                           
wire    [31:0]  oper_mad_rs2;                           
wire            oper_wb_rs1_equal_to_dst;               
wire            oper_wb_rs2_equal_to_dst;               
wire            pad_cpu_ext_int_b;                      
wire            pad_yy_gate_clk_en_b;                   
wire            pad_yy_test_mode;                       
wire            pcgen_ctrl_stall;                       
wire    [30:0]  pcgen_retire_updt_pc;                   
wire            pcgen_top_abort_clk_en;                 
wire            pcgen_vector_expt_taken;                
wire    [30:0]  pcgen_xx_cur_pc;                        
wire            pcgen_xx_ibus_idle;                     
wire            randclk_mad_mod_en_w2;                  
wire    [20:0]  randclk_oper_gpr_mod_en_w32;            
wire            randclk_pcgen_mod_en_w32;               
wire            randclk_retire_mod_en_w2;               
wire            randclk_wb_buf_mod_en_w32;              
wire            randclk_wb_ctrl_mod_en_w2;              
wire            randclk_wb_idx_mod_en_w5;               
wire            rbus_retire_cmplt;                      
wire    [4 :0]  rbus_retire_expt_vec;                   
wire            rbus_retire_expt_vld;                   
wire            rbus_retire_flush;                      
wire            rbus_retire_split_inst;                 
wire            rbus_wb_cmplt;                          
wire    [31:0]  rbus_wb_data;                           
wire    [4 :0]  rbus_wb_dst_reg;                        
wire            rbus_wb_inst_cmplt;                     
wire            rbus_wb_load;                           
wire            rbus_wb_store;                          
wire            retire_branch_stall;                    
wire            retire_mad_ex_cancel;                   
wire            retire_pcgen_curpc_update;              
wire            retire_vector_expt_int_hv;              
wire            retire_vector_expt_vld;                 
wire            retire_wb_dbg_in_ack;                   
wire            retire_wb_hs_err_epc_sel;               
wire            retire_wb_mem_bkpt_fast_retire;         
wire            retire_xx_normal_retire;                
wire            sec_top_clk_en;                         
wire            special_pcgen_chgflw_vld;               
wire    [4 :0]  special_rbus_expt_vec;                  
wire            special_rbus_expt_vld;                  
wire            special_rbus_flush;                     
wire            special_rbus_req;                       
wire            special_retire_inst_wsc;                
wire            split_ifctrl_hs_stall;                  
wire            split_ifctrl_hs_stall_part;             
wire            vec_top_clk_en;                         
wire            vector_cp0_vec_err;                     
wire    [29:0]  vector_cp0_vec_err_epc;                 
wire            vector_cp0_vec_succeed;                 
wire            vector_ctrl_stall;                      
wire            vector_pcgen_buf_vbr;                   
wire            vector_pcgen_chgflw_vld;                
wire            vector_pcgen_cur_pc_vld;                
wire    [30:0]  vector_pcgen_enter_addr;                
wire            vector_pcgen_ibus_req;                  
wire            wb_branch_dep_ld;                       
wire            wb_ctrl_stall;                          
wire            wb_ctrl_stall_without_hready;           
wire    [31:0]  wb_oper_fwd_data_no_load;               
wire            wb_oper_fwd_en;                         
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
wire            wb_special_st_uncmplt;                  
wire            wb_special_store;                       
wire            wb_top_machine_mode_clk_en;             
wire            wb_top_machine_sp_en_clk_en;            
wire            wb_top_secu_mode_clk_en;                
wire            wb_top_sp_adjust_clk_en;                
wire            wb_vector_ldst_wait_cmplt;              
wire            wb_xx_acc_err_after_retire;             
wire            wb_xx_lsu_check_fail_after_retire;      
gated_clk_cell  x_misc_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (misc_clk            ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (misc_clk_en         ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign bctm_top_clk_en = 1'b0;
assign sec_top_clk_en = 1'b0;
assign misc_clk_en = bctm_top_clk_en
                  || pcgen_top_abort_clk_en
                  || sec_top_clk_en
                  || wb_top_secu_mode_clk_en
                  || wb_top_machine_mode_clk_en
                  || wb_top_sp_adjust_clk_en
                  || vec_top_clk_en
                  || wb_top_machine_sp_en_clk_en;
cr_iu_decd  x_cr_iu_decd (
  .branch_pcgen_add_pc       (branch_pcgen_add_pc      ),
  .cp0_yy_priv_mode          (cp0_yy_priv_mode         ),
  .decd_alu_dst_vld          (decd_alu_dst_vld         ),
  .decd_alu_func             (decd_alu_func            ),
  .decd_alu_rs2_imm_vld      (decd_alu_rs2_imm_vld     ),
  .decd_alu_sub_func         (decd_alu_sub_func        ),
  .decd_branch_auipc         (decd_branch_auipc        ),
  .decd_branch_beq           (decd_branch_beq          ),
  .decd_branch_bge           (decd_branch_bge          ),
  .decd_branch_bgeu          (decd_branch_bgeu         ),
  .decd_branch_blt           (decd_branch_blt          ),
  .decd_branch_bltu          (decd_branch_bltu         ),
  .decd_branch_bne           (decd_branch_bne          ),
  .decd_branch_cbeqz         (decd_branch_cbeqz        ),
  .decd_branch_cbnez         (decd_branch_cbnez        ),
  .decd_branch_cj            (decd_branch_cj           ),
  .decd_branch_cjal          (decd_branch_cjal         ),
  .decd_branch_cjalr         (decd_branch_cjalr        ),
  .decd_branch_cjr           (decd_branch_cjr          ),
  .decd_branch_jal           (decd_branch_jal          ),
  .decd_branch_jalr          (decd_branch_jalr         ),
  .decd_ctrl_alu_sel         (decd_ctrl_alu_sel        ),
  .decd_ctrl_branch_sel      (decd_ctrl_branch_sel     ),
  .decd_ctrl_cp0_sel         (decd_ctrl_cp0_sel        ),
  .decd_ctrl_expt_bkpt       (decd_ctrl_expt_bkpt      ),
  .decd_ctrl_expt_ecall      (decd_ctrl_expt_ecall     ),
  .decd_ctrl_expt_inv        (decd_ctrl_expt_inv       ),
  .decd_ctrl_expt_wsc        (decd_ctrl_expt_wsc       ),
  .decd_ctrl_lsu_sel         (decd_ctrl_lsu_sel        ),
  .decd_ctrl_mad_sel         (decd_ctrl_mad_sel        ),
  .decd_mad_inst_div         (decd_mad_inst_div        ),
  .decd_mad_inst_divu        (decd_mad_inst_divu       ),
  .decd_mad_inst_mul         (decd_mad_inst_mul        ),
  .decd_mad_inst_mulh        (decd_mad_inst_mulh       ),
  .decd_mad_inst_mulhsu      (decd_mad_inst_mulhsu     ),
  .decd_mad_inst_mulhu       (decd_mad_inst_mulhu      ),
  .decd_mad_inst_rem         (decd_mad_inst_rem        ),
  .decd_mad_inst_remu        (decd_mad_inst_remu       ),
  .decd_oper_alu_imm         (decd_oper_alu_imm        ),
  .decd_oper_branch_imm      (decd_oper_branch_imm     ),
  .decd_oper_cp0_imm         (decd_oper_cp0_imm        ),
  .decd_oper_lsu_imm         (decd_oper_lsu_imm        ),
  .decd_retire_cp0_inst      (decd_retire_cp0_inst     ),
  .decd_retire_inst_mret     (decd_retire_inst_mret    ),
  .decd_special_fencei       (decd_special_fencei      ),
  .decd_wb_tval              (decd_wb_tval             ),
  .decd_xx_inst_32bit        (decd_xx_inst_32bit       ),
  .decd_xx_unit_special_sel  (decd_xx_unit_special_sel ),
  .hs_split_iu_ctrl_inst_vld (hs_split_iu_ctrl_inst_vld),
  .hs_split_iu_dp_inst_op    (hs_split_iu_dp_inst_op   ),
  .ifu_had_chg_flw_inst      (ifu_had_chg_flw_inst     ),
  .ifu_had_match_pc          (ifu_had_match_pc         ),
  .ifu_iu_ex_expt_cur        (ifu_iu_ex_expt_cur       ),
  .ifu_iu_ex_expt_vld        (ifu_iu_ex_expt_vld       ),
  .ifu_iu_ex_inst            (ifu_iu_ex_inst           ),
  .ifu_iu_ex_inst_bkpt       (ifu_iu_ex_inst_bkpt      ),
  .ifu_iu_ex_prvlg_expt_vld  (ifu_iu_ex_prvlg_expt_vld ),
  .ifu_iu_ex_rd_reg          (ifu_iu_ex_rd_reg         ),
  .ifu_iu_ex_rs1_reg         (ifu_iu_ex_rs1_reg        ),
  .ifu_iu_ex_rs2_reg         (ifu_iu_ex_rs2_reg        ),
  .iu_cp0_ex_csrrc           (iu_cp0_ex_csrrc          ),
  .iu_cp0_ex_csrrci          (iu_cp0_ex_csrrci         ),
  .iu_cp0_ex_csrrs           (iu_cp0_ex_csrrs          ),
  .iu_cp0_ex_csrrsi          (iu_cp0_ex_csrrsi         ),
  .iu_cp0_ex_csrrw           (iu_cp0_ex_csrrw          ),
  .iu_cp0_ex_csrrwi          (iu_cp0_ex_csrrwi         ),
  .iu_cp0_ex_func3           (iu_cp0_ex_func3          ),
  .iu_cp0_ex_mret            (iu_cp0_ex_mret           ),
  .iu_cp0_ex_rd_reg          (iu_cp0_ex_rd_reg         ),
  .iu_cp0_ex_rs1_reg         (iu_cp0_ex_rs1_reg        ),
  .iu_cp0_ex_wfi             (iu_cp0_ex_wfi            ),
  .iu_ifu_lsu_inst           (iu_ifu_lsu_inst          ),
  .iu_lsu_ex_byte            (iu_lsu_ex_byte           ),
  .iu_lsu_ex_half            (iu_lsu_ex_half           ),
  .iu_lsu_ex_store           (iu_lsu_ex_store          ),
  .iu_lsu_ex_uns             (iu_lsu_ex_uns            ),
  .lsu_iu_wfd                (lsu_iu_wfd               ),
  .pcgen_xx_cur_pc           (pcgen_xx_cur_pc          )
);
cr_iu_oper  x_cr_iu_oper (
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .ctrl_oper_lsu_data_sel       (ctrl_oper_lsu_data_sel      ),
  .decd_oper_alu_imm            (decd_oper_alu_imm           ),
  .decd_oper_branch_imm         (decd_oper_branch_imm        ),
  .decd_oper_cp0_imm            (decd_oper_cp0_imm           ),
  .decd_oper_lsu_imm            (decd_oper_lsu_imm           ),
  .forever_cpuclk               (forever_cpuclk              ),
  .had_idu_wbbr_data            (had_idu_wbbr_data           ),
  .had_idu_wbbr_vld             (had_idu_wbbr_vld            ),
  .hs_split_iu_nsinst_gpr_rst_b (hs_split_iu_nsinst_gpr_rst_b),
  .ifu_iu_ex_rs1_reg            (ifu_iu_ex_rs1_reg           ),
  .ifu_iu_ex_rs2_reg            (ifu_iu_ex_rs2_reg           ),
  .iu_cp0_imm                   (iu_cp0_imm                  ),
  .iu_cp0_rs1                   (iu_cp0_rs1                  ),
  .iu_lsu_base                  (iu_lsu_base                 ),
  .iu_lsu_data                  (iu_lsu_data                 ),
  .iu_lsu_offset                (iu_lsu_offset               ),
  .iu_lsu_rs2                   (iu_lsu_rs2                  ),
  .iu_yy_xx_reg_rst_b           (iu_yy_xx_reg_rst_b          ),
  .oper_alu_rs1_reg             (oper_alu_rs1_reg            ),
  .oper_alu_rs2_imm             (oper_alu_rs2_imm            ),
  .oper_alu_rs2_reg             (oper_alu_rs2_reg            ),
  .oper_branch_rs1_reg          (oper_branch_rs1_reg         ),
  .oper_branch_rs2_imm          (oper_branch_rs2_imm         ),
  .oper_branch_rs2_reg          (oper_branch_rs2_reg         ),
  .oper_mad_rs1                 (oper_mad_rs1                ),
  .oper_mad_rs2                 (oper_mad_rs2                ),
  .oper_wb_rs1_equal_to_dst     (oper_wb_rs1_equal_to_dst    ),
  .oper_wb_rs2_equal_to_dst     (oper_wb_rs2_equal_to_dst    ),
  .pad_yy_gate_clk_en_b         (pad_yy_gate_clk_en_b        ),
  .pad_yy_test_mode             (pad_yy_test_mode            ),
  .randclk_oper_gpr_mod_en_w32  (randclk_oper_gpr_mod_en_w32 ),
  .wb_oper_fwd_data_no_load     (wb_oper_fwd_data_no_load    ),
  .wb_oper_fwd_en               (wb_oper_fwd_en              ),
  .wb_oper_write_data           (wb_oper_write_data          ),
  .wb_oper_write_en             (wb_oper_write_en            ),
  .wb_oper_write_idx            (wb_oper_write_idx           ),
  .wb_oper_write_idx_for_dep    (wb_oper_write_idx_for_dep   )
);
cr_iu_alu  x_cr_iu_alu (
  .alu_mad_adder_of         (alu_mad_adder_of        ),
  .alu_mad_adder_rst        (alu_mad_adder_rst       ),
  .alu_mad_rst_cout         (alu_mad_rst_cout        ),
  .alu_rbus_data            (alu_rbus_data           ),
  .alu_rbus_data_vld        (alu_rbus_data_vld       ),
  .alu_rbus_req             (alu_rbus_req            ),
  .branch_alu_adder_cmp     (branch_alu_adder_cmp    ),
  .branch_alu_adder_sel     (branch_alu_adder_sel    ),
  .branch_alu_logic_nz      (branch_alu_logic_nz     ),
  .branch_alu_logic_sel     (branch_alu_logic_sel    ),
  .branch_alu_pc_sel        (branch_alu_pc_sel       ),
  .ctrl_alu_ex_sel          (ctrl_alu_ex_sel         ),
  .ctrl_alu_mad_oper_mux_en (ctrl_alu_mad_oper_mux_en),
  .ctrl_alu_oper_mux_en     (ctrl_alu_oper_mux_en    ),
  .ctrl_mad_ex_data_sel     (ctrl_mad_ex_data_sel    ),
  .decd_alu_dst_vld         (decd_alu_dst_vld        ),
  .decd_alu_func            (decd_alu_func           ),
  .decd_alu_rs2_imm_vld     (decd_alu_rs2_imm_vld    ),
  .decd_alu_sub_func        (decd_alu_sub_func       ),
  .ifu_iu_ex_cnt            (ifu_iu_ex_cnt           ),
  .lsu_iu_alu_sel           (lsu_iu_alu_sel          ),
  .lsu_iu_mad_buf           (lsu_iu_mad_buf          ),
  .mad_alu_data_vld         (mad_alu_data_vld        ),
  .mad_alu_div_rs2          (mad_alu_div_rs2         ),
  .mad_alu_div_shift        (mad_alu_div_shift       ),
  .mad_alu_fst_add          (mad_alu_fst_add         ),
  .mad_alu_imm_vld          (mad_alu_imm_vld         ),
  .mad_alu_rs1              (mad_alu_rs1             ),
  .mad_alu_rs1_cst_0        (mad_alu_rs1_cst_0       ),
  .mad_alu_rs1_vld          (mad_alu_rs1_vld         ),
  .mad_alu_rs2_cst_0        (mad_alu_rs2_cst_0       ),
  .mad_alu_rst              (mad_alu_rst             ),
  .mad_alu_rst_vld          (mad_alu_rst_vld         ),
  .oper_alu_rs1_reg         (oper_alu_rs1_reg        ),
  .oper_alu_rs2_imm         (oper_alu_rs2_imm        ),
  .oper_alu_rs2_reg         (oper_alu_rs2_reg        ),
  .pcgen_xx_cur_pc          (pcgen_xx_cur_pc         )
);
cr_iu_mad  x_cr_iu_mad (
  .alu_mad_adder_of       (alu_mad_adder_of      ),
  .alu_mad_adder_rst      (alu_mad_adder_rst     ),
  .alu_mad_rst_cout       (alu_mad_rst_cout      ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .ctrl_mad_ex_data_sel   (ctrl_mad_ex_data_sel  ),
  .ctrl_mad_ex_sel        (ctrl_mad_ex_sel       ),
  .ctrl_mad_oper_mux_en   (ctrl_mad_oper_mux_en  ),
  .decd_mad_inst_div      (decd_mad_inst_div     ),
  .decd_mad_inst_divu     (decd_mad_inst_divu    ),
  .decd_mad_inst_mul      (decd_mad_inst_mul     ),
  .decd_mad_inst_mulh     (decd_mad_inst_mulh    ),
  .decd_mad_inst_mulhsu   (decd_mad_inst_mulhsu  ),
  .decd_mad_inst_mulhu    (decd_mad_inst_mulhu   ),
  .decd_mad_inst_rem      (decd_mad_inst_rem     ),
  .decd_mad_inst_remu     (decd_mad_inst_remu    ),
  .forever_cpuclk         (forever_cpuclk        ),
  .ifu_iu_ex_cnt          (ifu_iu_ex_cnt         ),
  .ifu_iu_ex_split_on     (ifu_iu_ex_split_on    ),
  .iu_lsu_imm_data        (iu_lsu_imm_data       ),
  .iu_lsu_imm_write_en    (iu_lsu_imm_write_en   ),
  .iu_yy_xx_flush         (iu_yy_xx_flush        ),
  .lsu_iu_mad_buf         (lsu_iu_mad_buf        ),
  .mad_alu_data_vld       (mad_alu_data_vld      ),
  .mad_alu_div_rs2        (mad_alu_div_rs2       ),
  .mad_alu_div_shift      (mad_alu_div_shift     ),
  .mad_alu_fst_add        (mad_alu_fst_add       ),
  .mad_alu_imm_vld        (mad_alu_imm_vld       ),
  .mad_alu_rs1            (mad_alu_rs1           ),
  .mad_alu_rs1_cst_0      (mad_alu_rs1_cst_0     ),
  .mad_alu_rs1_vld        (mad_alu_rs1_vld       ),
  .mad_alu_rs2_cst_0      (mad_alu_rs2_cst_0     ),
  .mad_alu_rst            (mad_alu_rst           ),
  .mad_alu_rst_vld        (mad_alu_rst_vld       ),
  .mad_ctrl_stall         (mad_ctrl_stall        ),
  .mad_ctrl_stall_noinput (mad_ctrl_stall_noinput),
  .mad_rbus_req           (mad_rbus_req          ),
  .oper_mad_rs1           (oper_mad_rs1          ),
  .oper_mad_rs2           (oper_mad_rs2          ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .randclk_mad_mod_en_w2  (randclk_mad_mod_en_w2 ),
  .retire_mad_ex_cancel   (retire_mad_ex_cancel  ),
  .wb_ctrl_stall          (wb_ctrl_stall         )
);
cr_iu_branch  x_cr_iu_branch (
  .branch_alu_adder_cmp                    (branch_alu_adder_cmp                   ),
  .branch_alu_adder_sel                    (branch_alu_adder_sel                   ),
  .branch_alu_logic_nz                     (branch_alu_logic_nz                    ),
  .branch_alu_logic_sel                    (branch_alu_logic_sel                   ),
  .branch_alu_pc_sel                       (branch_alu_pc_sel                      ),
  .branch_ctrl_stall                       (branch_ctrl_stall                      ),
  .branch_pcgen_add_pc                     (branch_pcgen_add_pc                    ),
  .branch_pcgen_br_chgflw_vld              (branch_pcgen_br_chgflw_vld             ),
  .branch_pcgen_br_chgflw_vld_for_data     (branch_pcgen_br_chgflw_vld_for_data    ),
  .branch_pcgen_br_pc_chgflw_vld           (branch_pcgen_br_pc_chgflw_vld          ),
  .branch_pcgen_branch_chgflw_vld_for_data (branch_pcgen_branch_chgflw_vld_for_data),
  .branch_pcgen_jmp_chgflw_vld_for_data    (branch_pcgen_jmp_chgflw_vld_for_data   ),
  .branch_pcgen_reg_pc                     (branch_pcgen_reg_pc                    ),
  .branch_rbus_data                        (branch_rbus_data                       ),
  .branch_rbus_data_vld                    (branch_rbus_data_vld                   ),
  .branch_rbus_req                         (branch_rbus_req                        ),
  .branch_wb_cmp                           (branch_wb_cmp                          ),
  .branch_wb_jmp_reg                       (branch_wb_jmp_reg                      ),
  .ctrl_branch_ex_data_sel                 (ctrl_branch_ex_data_sel                ),
  .ctrl_branch_ex_sel                      (ctrl_branch_ex_sel                     ),
  .decd_branch_auipc                       (decd_branch_auipc                      ),
  .decd_branch_beq                         (decd_branch_beq                        ),
  .decd_branch_bge                         (decd_branch_bge                        ),
  .decd_branch_bgeu                        (decd_branch_bgeu                       ),
  .decd_branch_blt                         (decd_branch_blt                        ),
  .decd_branch_bltu                        (decd_branch_bltu                       ),
  .decd_branch_bne                         (decd_branch_bne                        ),
  .decd_branch_cbeqz                       (decd_branch_cbeqz                      ),
  .decd_branch_cbnez                       (decd_branch_cbnez                      ),
  .decd_branch_cj                          (decd_branch_cj                         ),
  .decd_branch_cjal                        (decd_branch_cjal                       ),
  .decd_branch_cjalr                       (decd_branch_cjalr                      ),
  .decd_branch_cjr                         (decd_branch_cjr                        ),
  .decd_branch_jal                         (decd_branch_jal                        ),
  .decd_branch_jalr                        (decd_branch_jalr                       ),
  .decd_xx_inst_32bit                      (decd_xx_inst_32bit                     ),
  .iu_had_chgflw_dst_pc                    (iu_had_chgflw_dst_pc                   ),
  .iu_had_chgflw_vld                       (iu_had_chgflw_vld                      ),
  .iu_lsu_cmp                              (iu_lsu_cmp                             ),
  .iu_lsu_imm_sel                          (iu_lsu_imm_sel                         ),
  .iu_lsu_pc                               (iu_lsu_pc                              ),
  .iu_lsu_pc_sel                           (iu_lsu_pc_sel                          ),
  .iu_lsu_rs1_sel                          (iu_lsu_rs1_sel                         ),
  .lsu_iu_branch_cout                      (lsu_iu_branch_cout                     ),
  .lsu_iu_branch_rst                       (lsu_iu_branch_rst                      ),
  .oper_branch_rs1_reg                     (oper_branch_rs1_reg                    ),
  .oper_branch_rs2_imm                     (oper_branch_rs2_imm                    ),
  .oper_branch_rs2_reg                     (oper_branch_rs2_reg                    ),
  .pcgen_xx_cur_pc                         (pcgen_xx_cur_pc                        ),
  .pcgen_xx_ibus_idle                      (pcgen_xx_ibus_idle                     ),
  .retire_branch_stall                     (retire_branch_stall                    ),
  .wb_branch_dep_ld                        (wb_branch_dep_ld                       ),
  .wb_ctrl_stall_without_hready            (wb_ctrl_stall_without_hready           )
);
cr_iu_special  x_cr_iu_special (
  .ctrl_special_ex_sel      (ctrl_special_ex_sel     ),
  .ctrl_special_expt_vec    (ctrl_special_expt_vec   ),
  .ctrl_special_expt_vld    (ctrl_special_expt_vld   ),
  .decd_special_fencei      (decd_special_fencei     ),
  .special_pcgen_chgflw_vld (special_pcgen_chgflw_vld),
  .special_rbus_expt_vec    (special_rbus_expt_vec   ),
  .special_rbus_expt_vld    (special_rbus_expt_vld   ),
  .special_rbus_flush       (special_rbus_flush      ),
  .special_rbus_req         (special_rbus_req        ),
  .special_retire_inst_wsc  (special_retire_inst_wsc ),
  .wb_special_st_uncmplt    (wb_special_st_uncmplt   ),
  .wb_special_store         (wb_special_store        )
);
cr_iu_rbus  x_cr_iu_rbus (
  .alu_rbus_data              (alu_rbus_data             ),
  .alu_rbus_data_vld          (alu_rbus_data_vld         ),
  .alu_rbus_req               (alu_rbus_req              ),
  .branch_rbus_data           (branch_rbus_data          ),
  .branch_rbus_data_vld       (branch_rbus_data_vld      ),
  .branch_rbus_req            (branch_rbus_req           ),
  .cp0_iu_data                (cp0_iu_data               ),
  .cp0_iu_data_vld            (cp0_iu_data_vld           ),
  .cp0_iu_expt_vec            (cp0_iu_expt_vec           ),
  .cp0_iu_expt_vld            (cp0_iu_expt_vld           ),
  .cp0_iu_flush               (cp0_iu_flush              ),
  .cp0_iu_req                 (cp0_iu_req                ),
  .ctrl_alu_ex_data_sel       (ctrl_alu_ex_data_sel      ),
  .ctrl_branch_ex_data_sel    (ctrl_branch_ex_data_sel   ),
  .ctrl_cp0_ex_data_sel       (ctrl_cp0_ex_data_sel      ),
  .ctrl_lsu_ex_data_sel       (ctrl_lsu_ex_data_sel      ),
  .ctrl_mad_ex_data_sel       (ctrl_mad_ex_data_sel      ),
  .ctrl_special_ex_data_sel   (ctrl_special_ex_data_sel  ),
  .ctrl_xx_sp_adjust          (ctrl_xx_sp_adjust         ),
  .decd_xx_unit_special_sel   (decd_xx_unit_special_sel  ),
  .hs_split_iu_hs_retire_mask (hs_split_iu_hs_retire_mask),
  .ifu_iu_ex_int_spcu_mask    (ifu_iu_ex_int_spcu_mask   ),
  .ifu_iu_ex_rd_reg           (ifu_iu_ex_rd_reg          ),
  .lsu_iu_data                (lsu_iu_data               ),
  .lsu_iu_data_vld            (lsu_iu_data_vld           ),
  .lsu_iu_expt_vec            (lsu_iu_expt_vec           ),
  .lsu_iu_expt_vld            (lsu_iu_expt_vld           ),
  .lsu_iu_fast_retire         (lsu_iu_fast_retire        ),
  .lsu_iu_req                 (lsu_iu_req                ),
  .lsu_iu_store               (lsu_iu_store              ),
  .mad_alu_data_vld           (mad_alu_data_vld          ),
  .mad_ctrl_stall             (mad_ctrl_stall            ),
  .mad_rbus_req               (mad_rbus_req              ),
  .rbus_retire_cmplt          (rbus_retire_cmplt         ),
  .rbus_retire_expt_vec       (rbus_retire_expt_vec      ),
  .rbus_retire_expt_vld       (rbus_retire_expt_vld      ),
  .rbus_retire_flush          (rbus_retire_flush         ),
  .rbus_retire_split_inst     (rbus_retire_split_inst    ),
  .rbus_wb_cmplt              (rbus_wb_cmplt             ),
  .rbus_wb_data               (rbus_wb_data              ),
  .rbus_wb_dst_reg            (rbus_wb_dst_reg           ),
  .rbus_wb_inst_cmplt         (rbus_wb_inst_cmplt        ),
  .rbus_wb_load               (rbus_wb_load              ),
  .rbus_wb_store              (rbus_wb_store             ),
  .special_rbus_expt_vec      (special_rbus_expt_vec     ),
  .special_rbus_expt_vld      (special_rbus_expt_vld     ),
  .special_rbus_flush         (special_rbus_flush        ),
  .special_rbus_req           (special_rbus_req          ),
  .wb_rbus_lsu_vec            (wb_rbus_lsu_vec           ),
  .wb_rbus_st_aft_load        (wb_rbus_st_aft_load       ),
  .wb_xx_acc_err_after_retire (wb_xx_acc_err_after_retire)
);
cr_iu_retire  x_cr_iu_retire (
  .clic_cpu_int_hv                      (clic_cpu_int_hv                     ),
  .clic_cpu_int_id                      (clic_cpu_int_id                     ),
  .clic_cpu_int_il                      (clic_cpu_int_il                     ),
  .clic_cpu_int_priv                    (clic_cpu_int_priv                   ),
  .clk_en                               (clk_en                              ),
  .cp0_iu_dbg_disable_for_tee           (cp0_iu_dbg_disable_for_tee          ),
  .cp0_iu_il                            (cp0_iu_il                           ),
  .cp0_iu_meie                          (cp0_iu_meie                         ),
  .cp0_iu_mie_for_int                   (cp0_iu_mie_for_int                  ),
  .cp0_iu_vec_mode                      (cp0_iu_vec_mode                     ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .ctrl_branch_ex_sel                   (ctrl_branch_ex_sel                  ),
  .ctrl_retire_ni_vld                   (ctrl_retire_ni_vld                  ),
  .decd_retire_cp0_inst                 (decd_retire_cp0_inst                ),
  .decd_retire_inst_mret                (decd_retire_inst_mret               ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_core_dbg_mode_req                (had_core_dbg_mode_req               ),
  .had_iu_bkpt_trace_en                 (had_iu_bkpt_trace_en                ),
  .had_iu_dr_set_req                    (had_iu_dr_set_req                   ),
  .had_iu_force_dbg_en                  (had_iu_force_dbg_en                 ),
  .had_iu_int_vld                       (had_iu_int_vld                      ),
  .had_iu_mbkpt_fsm_index_mbee          (had_iu_mbkpt_fsm_index_mbee         ),
  .had_iu_mem_bkpt_exp_req              (had_iu_mem_bkpt_exp_req             ),
  .had_iu_mem_bkpt_mask                 (had_iu_mem_bkpt_mask                ),
  .had_iu_mem_bkpt_req                  (had_iu_mem_bkpt_req                 ),
  .had_iu_rte_pc_sel                    (had_iu_rte_pc_sel                   ),
  .had_iu_trace_req                     (had_iu_trace_req                    ),
  .had_iu_trace_req_for_dbg_disable     (had_iu_trace_req_for_dbg_disable    ),
  .had_iu_xx_fdb                        (had_iu_xx_fdb                       ),
  .had_iu_xx_jdbreq                     (had_iu_xx_jdbreq                    ),
  .had_yy_xx_exit_dbg                   (had_yy_xx_exit_dbg                  ),
  .hs_split_iu_hs_retire_mask           (hs_split_iu_hs_retire_mask          ),
  .hs_split_iu_hs_switch_se             (hs_split_iu_hs_switch_se            ),
  .ifu_iu_ex_inst_dbg_disable           (ifu_iu_ex_inst_dbg_disable          ),
  .ifu_iu_ex_sp_oper                    (ifu_iu_ex_sp_oper                   ),
  .ifu_iu_ex_split_on                   (ifu_iu_ex_split_on                  ),
  .ifu_iu_ibus_idle                     (ifu_iu_ibus_idle                    ),
  .ifu_iu_inst_bkpt_dbg_occur_vld       (ifu_iu_inst_bkpt_dbg_occur_vld      ),
  .ifu_iu_inst_bkpt_dbgexp_occur_vld    (ifu_iu_inst_bkpt_dbgexp_occur_vld   ),
  .ifu_iu_inst_buf_inst_dbg_disable     (ifu_iu_inst_buf_inst_dbg_disable    ),
  .ifu_iu_inst_buf_inst_vld             (ifu_iu_inst_buf_inst_vld            ),
  .iu_cp0_epc                           (iu_cp0_epc                          ),
  .iu_cp0_epc_update                    (iu_cp0_epc_update                   ),
  .iu_cp0_expt_vld                      (iu_cp0_expt_vld                     ),
  .iu_cp0_int_vld                       (iu_cp0_int_vld                      ),
  .iu_cp0_lp_wk_int                     (iu_cp0_lp_wk_int                    ),
  .iu_cp0_mtval_updt_vld                (iu_cp0_mtval_updt_vld               ),
  .iu_cp0_nt_int_pending_vld            (iu_cp0_nt_int_pending_vld           ),
  .iu_had_adr_dbg_ack                   (iu_had_adr_dbg_ack                  ),
  .iu_had_data_bkpt_occur_vld           (iu_had_data_bkpt_occur_vld          ),
  .iu_had_dbg_disable_for_tee           (iu_had_dbg_disable_for_tee          ),
  .iu_had_dr_dbg_ack                    (iu_had_dr_dbg_ack                   ),
  .iu_had_expt_vld                      (iu_had_expt_vld                     ),
  .iu_had_fast_retire_acc_err_pc_update (iu_had_fast_retire_acc_err_pc_update),
  .iu_had_fast_retire_acc_err_pc_val    (iu_had_fast_retire_acc_err_pc_val   ),
  .iu_had_inst_bkpt_occur_vld           (iu_had_inst_bkpt_occur_vld          ),
  .iu_had_int_ack                       (iu_had_int_ack                      ),
  .iu_had_retire_with_had_int           (iu_had_retire_with_had_int          ),
  .iu_had_trace_occur_vld               (iu_had_trace_occur_vld              ),
  .iu_had_xx_bkpt_inst                  (iu_had_xx_bkpt_inst                 ),
  .iu_had_xx_dbg_ack                    (iu_had_xx_dbg_ack                   ),
  .iu_had_xx_mldst                      (iu_had_xx_mldst                     ),
  .iu_had_xx_retire                     (iu_had_xx_retire                    ),
  .iu_had_xx_retire_normal              (iu_had_xx_retire_normal             ),
  .iu_had_xx_retire_pc                  (iu_had_xx_retire_pc                 ),
  .iu_ifu_kill_inst                     (iu_ifu_kill_inst                    ),
  .iu_ifu_spcu_int_en                   (iu_ifu_spcu_int_en                  ),
  .iu_pad_inst_retire                   (iu_pad_inst_retire                  ),
  .iu_pad_inst_split                    (iu_pad_inst_split                   ),
  .iu_pad_retire_pc                     (iu_pad_retire_pc                    ),
  .iu_sys_lp_wk_int                     (iu_sys_lp_wk_int                    ),
  .iu_yy_xx_dbgon                       (iu_yy_xx_dbgon                      ),
  .iu_yy_xx_expt_vec                    (iu_yy_xx_expt_vec                   ),
  .iu_yy_xx_flush                       (iu_yy_xx_flush                      ),
  .iu_yy_xx_int_hv                      (iu_yy_xx_int_hv                     ),
  .iu_yy_xx_int_il                      (iu_yy_xx_int_il                     ),
  .iu_yy_xx_int_pending_hv              (iu_yy_xx_int_pending_hv             ),
  .iu_yy_xx_int_pending_id              (iu_yy_xx_int_pending_id             ),
  .iu_yy_xx_int_pending_il              (iu_yy_xx_int_pending_il             ),
  .iu_yy_xx_int_pending_priv            (iu_yy_xx_int_pending_priv           ),
  .iu_yy_xx_reg_rst_b                   (iu_yy_xx_reg_rst_b                  ),
  .iu_yy_xx_retire                      (iu_yy_xx_retire                     ),
  .lsu_iu_wb_acc_err                    (lsu_iu_wb_acc_err                   ),
  .lsu_iu_wb_cmplt                      (lsu_iu_wb_cmplt                     ),
  .nie_flush_chgflw                     (nie_flush_chgflw                    ),
  .pad_cpu_ext_int_b                    (pad_cpu_ext_int_b                   ),
  .pad_yy_gate_clk_en_b                 (pad_yy_gate_clk_en_b                ),
  .pad_yy_test_mode                     (pad_yy_test_mode                    ),
  .pcgen_retire_updt_pc                 (pcgen_retire_updt_pc                ),
  .pcgen_xx_cur_pc                      (pcgen_xx_cur_pc                     ),
  .randclk_retire_mod_en_w2             (randclk_retire_mod_en_w2            ),
  .rbus_retire_cmplt                    (rbus_retire_cmplt                   ),
  .rbus_retire_expt_vec                 (rbus_retire_expt_vec                ),
  .rbus_retire_expt_vld                 (rbus_retire_expt_vld                ),
  .rbus_retire_flush                    (rbus_retire_flush                   ),
  .rbus_retire_split_inst               (rbus_retire_split_inst              ),
  .rbus_wb_load                         (rbus_wb_load                        ),
  .rbus_wb_store                        (rbus_wb_store                       ),
  .retire_branch_stall                  (retire_branch_stall                 ),
  .retire_mad_ex_cancel                 (retire_mad_ex_cancel                ),
  .retire_pcgen_curpc_update            (retire_pcgen_curpc_update           ),
  .retire_vector_expt_int_hv            (retire_vector_expt_int_hv           ),
  .retire_vector_expt_vld               (retire_vector_expt_vld              ),
  .retire_wb_dbg_in_ack                 (retire_wb_dbg_in_ack                ),
  .retire_wb_hs_err_epc_sel             (retire_wb_hs_err_epc_sel            ),
  .retire_wb_mem_bkpt_fast_retire       (retire_wb_mem_bkpt_fast_retire      ),
  .retire_xx_normal_retire              (retire_xx_normal_retire             ),
  .special_retire_inst_wsc              (special_retire_inst_wsc             ),
  .wb_retire_fast_retire_load_pc        (wb_retire_fast_retire_load_pc       ),
  .wb_xx_acc_err_after_retire           (wb_xx_acc_err_after_retire          ),
  .wb_xx_lsu_check_fail_after_retire    (wb_xx_lsu_check_fail_after_retire   )
);
cr_iu_wb  x_cr_iu_wb (
  .branch_wb_cmp                     (branch_wb_cmp                    ),
  .branch_wb_jmp_reg                 (branch_wb_jmp_reg                ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_cp0_ex_data_sel              (ctrl_cp0_ex_data_sel             ),
  .ctrl_lsu_ex_data_sel              (ctrl_lsu_ex_data_sel             ),
  .decd_wb_tval                      (decd_wb_tval                     ),
  .decd_xx_inst_32bit                (decd_xx_inst_32bit               ),
  .decd_xx_unit_special_sel          (decd_xx_unit_special_sel         ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .ifu_iu_ex_int_spcu_mask           (ifu_iu_ex_int_spcu_mask          ),
  .ifu_iu_ex_int_spcu_vld            (ifu_iu_ex_int_spcu_vld           ),
  .ifu_iu_ex_split_on                (ifu_iu_ex_split_on               ),
  .iu_cp0_expt_tval                  (iu_cp0_expt_tval                 ),
  .iu_had_flush                      (iu_had_flush                     ),
  .iu_had_xx_data                    (iu_had_xx_data                   ),
  .iu_had_xx_data_vld                (iu_had_xx_data_vld               ),
  .iu_ifu_wb_ldst                    (iu_ifu_wb_ldst                   ),
  .iu_lsu_stall_without_hready       (iu_lsu_stall_without_hready      ),
  .iu_lsu_wb_ldst                    (iu_lsu_wb_ldst                   ),
  .iu_lsu_wb_load                    (iu_lsu_wb_load                   ),
  .iu_lsu_wb_store                   (iu_lsu_wb_store                  ),
  .iu_pad_gpr_data                   (iu_pad_gpr_data                  ),
  .iu_pad_gpr_index                  (iu_pad_gpr_index                 ),
  .iu_pad_gpr_we                     (iu_pad_gpr_we                    ),
  .iu_yy_xx_dbgon                    (iu_yy_xx_dbgon                   ),
  .iu_yy_xx_flush                    (iu_yy_xx_flush                   ),
  .lsu_iu_addr                       (lsu_iu_addr                      ),
  .lsu_iu_addr_vld                   (lsu_iu_addr_vld                  ),
  .lsu_iu_fast_retire                (lsu_iu_fast_retire               ),
  .lsu_iu_wb_acc_err                 (lsu_iu_wb_acc_err                ),
  .lsu_iu_wb_bstack_chk_fail         (lsu_iu_wb_bstack_chk_fail        ),
  .lsu_iu_wb_cmplt                   (lsu_iu_wb_cmplt                  ),
  .lsu_iu_wb_data_vld                (lsu_iu_wb_data_vld               ),
  .lsu_iu_wb_load_data               (lsu_iu_wb_load_data              ),
  .misc_clk                          (misc_clk                         ),
  .oper_wb_rs1_equal_to_dst          (oper_wb_rs1_equal_to_dst         ),
  .oper_wb_rs2_equal_to_dst          (oper_wb_rs2_equal_to_dst         ),
  .pad_yy_gate_clk_en_b              (pad_yy_gate_clk_en_b             ),
  .pad_yy_test_mode                  (pad_yy_test_mode                 ),
  .pcgen_xx_cur_pc                   (pcgen_xx_cur_pc                  ),
  .randclk_wb_buf_mod_en_w32         (randclk_wb_buf_mod_en_w32        ),
  .randclk_wb_ctrl_mod_en_w2         (randclk_wb_ctrl_mod_en_w2        ),
  .randclk_wb_idx_mod_en_w5          (randclk_wb_idx_mod_en_w5         ),
  .rbus_wb_cmplt                     (rbus_wb_cmplt                    ),
  .rbus_wb_data                      (rbus_wb_data                     ),
  .rbus_wb_dst_reg                   (rbus_wb_dst_reg                  ),
  .rbus_wb_inst_cmplt                (rbus_wb_inst_cmplt               ),
  .rbus_wb_load                      (rbus_wb_load                     ),
  .rbus_wb_store                     (rbus_wb_store                    ),
  .retire_wb_dbg_in_ack              (retire_wb_dbg_in_ack             ),
  .retire_wb_hs_err_epc_sel          (retire_wb_hs_err_epc_sel         ),
  .retire_wb_mem_bkpt_fast_retire    (retire_wb_mem_bkpt_fast_retire   ),
  .wb_branch_dep_ld                  (wb_branch_dep_ld                 ),
  .wb_ctrl_stall                     (wb_ctrl_stall                    ),
  .wb_ctrl_stall_without_hready      (wb_ctrl_stall_without_hready     ),
  .wb_oper_fwd_data_no_load          (wb_oper_fwd_data_no_load         ),
  .wb_oper_fwd_en                    (wb_oper_fwd_en                   ),
  .wb_oper_write_data                (wb_oper_write_data               ),
  .wb_oper_write_en                  (wb_oper_write_en                 ),
  .wb_oper_write_idx                 (wb_oper_write_idx                ),
  .wb_oper_write_idx_for_dep         (wb_oper_write_idx_for_dep        ),
  .wb_pcgen_ldst_stall               (wb_pcgen_ldst_stall              ),
  .wb_pcgen_pc_updt_val              (wb_pcgen_pc_updt_val             ),
  .wb_pcgen_switch_ld_pc             (wb_pcgen_switch_ld_pc            ),
  .wb_rbus_lsu_vec                   (wb_rbus_lsu_vec                  ),
  .wb_rbus_st_aft_load               (wb_rbus_st_aft_load              ),
  .wb_retire_fast_retire_load_pc     (wb_retire_fast_retire_load_pc    ),
  .wb_special_st_uncmplt             (wb_special_st_uncmplt            ),
  .wb_special_store                  (wb_special_store                 ),
  .wb_top_machine_mode_clk_en        (wb_top_machine_mode_clk_en       ),
  .wb_top_machine_sp_en_clk_en       (wb_top_machine_sp_en_clk_en      ),
  .wb_top_secu_mode_clk_en           (wb_top_secu_mode_clk_en          ),
  .wb_top_sp_adjust_clk_en           (wb_top_sp_adjust_clk_en          ),
  .wb_vector_ldst_wait_cmplt         (wb_vector_ldst_wait_cmplt        ),
  .wb_xx_acc_err_after_retire        (wb_xx_acc_err_after_retire       ),
  .wb_xx_lsu_check_fail_after_retire (wb_xx_lsu_check_fail_after_retire)
);
cr_iu_pcgen  x_cr_iu_pcgen (
  .branch_pcgen_add_pc                     (branch_pcgen_add_pc                    ),
  .branch_pcgen_br_chgflw_vld              (branch_pcgen_br_chgflw_vld             ),
  .branch_pcgen_br_chgflw_vld_for_data     (branch_pcgen_br_chgflw_vld_for_data    ),
  .branch_pcgen_br_pc_chgflw_vld           (branch_pcgen_br_pc_chgflw_vld          ),
  .branch_pcgen_branch_chgflw_vld_for_data (branch_pcgen_branch_chgflw_vld_for_data),
  .branch_pcgen_jmp_chgflw_vld_for_data    (branch_pcgen_jmp_chgflw_vld_for_data   ),
  .branch_pcgen_reg_pc                     (branch_pcgen_reg_pc                    ),
  .cp0_iu_epc_for_chgflw                   (cp0_iu_epc_for_chgflw                  ),
  .cp0_iu_flush_chgflw_vld                 (cp0_iu_flush_chgflw_vld                ),
  .cp0_iu_rte_chgflw_vld                   (cp0_iu_rte_chgflw_vld                  ),
  .cp0_iu_rte_chgflw_vld_for_data          (cp0_iu_rte_chgflw_vld_for_data         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .had_iu_pc                               (had_iu_pc                              ),
  .had_iu_rte_pc_sel                       (had_iu_rte_pc_sel                      ),
  .had_yy_xx_exit_dbg                      (had_yy_xx_exit_dbg                     ),
  .hs_split_iu_unstack_chgflw              (hs_split_iu_unstack_chgflw             ),
  .ifu_iu_ibus_idle                        (ifu_iu_ibus_idle                       ),
  .ifu_iu_spcu_retire_mask                 (ifu_iu_spcu_retire_mask                ),
  .ifu_iu_xx_ibus_data                     (ifu_iu_xx_ibus_data                    ),
  .iu_ifu_addr                             (iu_ifu_addr                            ),
  .iu_ifu_data_fetch                       (iu_ifu_data_fetch                      ),
  .iu_ifu_data_fetch_for_data              (iu_ifu_data_fetch_for_data             ),
  .iu_ifu_inst_fetch                       (iu_ifu_inst_fetch                      ),
  .iu_ifu_inst_fetch_for_data              (iu_ifu_inst_fetch_for_data             ),
  .iu_ifu_inst_fetch_without_dbg_disable   (iu_ifu_inst_fetch_without_dbg_disable  ),
  .iu_yy_xx_flush                          (iu_yy_xx_flush                         ),
  .iu_yy_xx_retire                         (iu_yy_xx_retire                        ),
  .misc_clk                                (misc_clk                               ),
  .nie_flush_chgflw                        (nie_flush_chgflw                       ),
  .pad_yy_gate_clk_en_b                    (pad_yy_gate_clk_en_b                   ),
  .pad_yy_test_mode                        (pad_yy_test_mode                       ),
  .pcgen_ctrl_stall                        (pcgen_ctrl_stall                       ),
  .pcgen_retire_updt_pc                    (pcgen_retire_updt_pc                   ),
  .pcgen_top_abort_clk_en                  (pcgen_top_abort_clk_en                 ),
  .pcgen_vector_expt_taken                 (pcgen_vector_expt_taken                ),
  .pcgen_xx_cur_pc                         (pcgen_xx_cur_pc                        ),
  .pcgen_xx_ibus_idle                      (pcgen_xx_ibus_idle                     ),
  .randclk_pcgen_mod_en_w32                (randclk_pcgen_mod_en_w32               ),
  .retire_branch_stall                     (retire_branch_stall                    ),
  .retire_pcgen_curpc_update               (retire_pcgen_curpc_update              ),
  .retire_xx_normal_retire                 (retire_xx_normal_retire                ),
  .special_pcgen_chgflw_vld                (special_pcgen_chgflw_vld               ),
  .vector_pcgen_buf_vbr                    (vector_pcgen_buf_vbr                   ),
  .vector_pcgen_chgflw_vld                 (vector_pcgen_chgflw_vld                ),
  .vector_pcgen_cur_pc_vld                 (vector_pcgen_cur_pc_vld                ),
  .vector_pcgen_enter_addr                 (vector_pcgen_enter_addr                ),
  .vector_pcgen_ibus_req                   (vector_pcgen_ibus_req                  ),
  .wb_pcgen_ldst_stall                     (wb_pcgen_ldst_stall                    ),
  .wb_pcgen_pc_updt_val                    (wb_pcgen_pc_updt_val                   ),
  .wb_pcgen_switch_ld_pc                   (wb_pcgen_switch_ld_pc                  ),
  .wb_retire_fast_retire_load_pc           (wb_retire_fast_retire_load_pc          )
);
cr_iu_vector  x_cr_iu_vector (
  .bmu_xx_ibus_acc_err        (bmu_xx_ibus_acc_err       ),
  .bmu_xx_ibus_data_vld       (bmu_xx_ibus_data_vld      ),
  .bmu_xx_ibus_grnt           (bmu_xx_ibus_grnt          ),
  .cp0_iu_vbr                 (cp0_iu_vbr                ),
  .cp0_vector_vec_err_vbr     (cp0_vector_vec_err_vbr    ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_iu_vector_ibus_in_idle (ifu_iu_vector_ibus_in_idle),
  .iu_bmu_vec_redirect        (iu_bmu_vec_redirect       ),
  .iu_cp0_syc_rst_b           (iu_cp0_syc_rst_b          ),
  .iu_ifu_inst_fetch_mask     (iu_ifu_inst_fetch_mask    ),
  .iu_sysyio_soft_rst         (iu_sysyio_soft_rst        ),
  .iu_yy_xx_reg_rst_b         (iu_yy_xx_reg_rst_b        ),
  .misc_clk                   (misc_clk                  ),
  .pcgen_vector_expt_taken    (pcgen_vector_expt_taken   ),
  .retire_vector_expt_int_hv  (retire_vector_expt_int_hv ),
  .retire_vector_expt_vld     (retire_vector_expt_vld    ),
  .vec_top_clk_en             (vec_top_clk_en            ),
  .vector_cp0_vec_err         (vector_cp0_vec_err        ),
  .vector_cp0_vec_err_epc     (vector_cp0_vec_err_epc    ),
  .vector_cp0_vec_succeed     (vector_cp0_vec_succeed    ),
  .vector_ctrl_stall          (vector_ctrl_stall         ),
  .vector_pcgen_buf_vbr       (vector_pcgen_buf_vbr      ),
  .vector_pcgen_chgflw_vld    (vector_pcgen_chgflw_vld   ),
  .vector_pcgen_cur_pc_vld    (vector_pcgen_cur_pc_vld   ),
  .vector_pcgen_enter_addr    (vector_pcgen_enter_addr   ),
  .vector_pcgen_ibus_req      (vector_pcgen_ibus_req     ),
  .wb_vector_ldst_wait_cmplt  (wb_vector_ldst_wait_cmplt )
);
cr_iu_ctrl  x_cr_iu_ctrl (
  .branch_ctrl_stall         (branch_ctrl_stall        ),
  .cp0_iu_stall              (cp0_iu_stall             ),
  .cp0_yy_priv_mode          (cp0_yy_priv_mode         ),
  .ctrl_alu_ex_data_sel      (ctrl_alu_ex_data_sel     ),
  .ctrl_alu_ex_sel           (ctrl_alu_ex_sel          ),
  .ctrl_alu_mad_oper_mux_en  (ctrl_alu_mad_oper_mux_en ),
  .ctrl_alu_oper_mux_en      (ctrl_alu_oper_mux_en     ),
  .ctrl_branch_ex_data_sel   (ctrl_branch_ex_data_sel  ),
  .ctrl_branch_ex_sel        (ctrl_branch_ex_sel       ),
  .ctrl_cp0_ex_data_sel      (ctrl_cp0_ex_data_sel     ),
  .ctrl_lsu_ex_data_sel      (ctrl_lsu_ex_data_sel     ),
  .ctrl_mad_ex_data_sel      (ctrl_mad_ex_data_sel     ),
  .ctrl_mad_ex_sel           (ctrl_mad_ex_sel          ),
  .ctrl_mad_oper_mux_en      (ctrl_mad_oper_mux_en     ),
  .ctrl_oper_lsu_data_sel    (ctrl_oper_lsu_data_sel   ),
  .ctrl_retire_ni_vld        (ctrl_retire_ni_vld       ),
  .ctrl_special_ex_data_sel  (ctrl_special_ex_data_sel ),
  .ctrl_special_ex_sel       (ctrl_special_ex_sel      ),
  .ctrl_special_expt_vec     (ctrl_special_expt_vec    ),
  .ctrl_special_expt_vld     (ctrl_special_expt_vld    ),
  .ctrl_xx_sp_adjust         (ctrl_xx_sp_adjust        ),
  .decd_ctrl_alu_sel         (decd_ctrl_alu_sel        ),
  .decd_ctrl_branch_sel      (decd_ctrl_branch_sel     ),
  .decd_ctrl_cp0_sel         (decd_ctrl_cp0_sel        ),
  .decd_ctrl_expt_bkpt       (decd_ctrl_expt_bkpt      ),
  .decd_ctrl_expt_ecall      (decd_ctrl_expt_ecall     ),
  .decd_ctrl_expt_inv        (decd_ctrl_expt_inv       ),
  .decd_ctrl_expt_wsc        (decd_ctrl_expt_wsc       ),
  .decd_ctrl_lsu_sel         (decd_ctrl_lsu_sel        ),
  .decd_ctrl_mad_sel         (decd_ctrl_mad_sel        ),
  .decd_xx_unit_special_sel  (decd_xx_unit_special_sel ),
  .hs_split_iu_ctrl_inst_vld (hs_split_iu_ctrl_inst_vld),
  .ifu_iu_ex_expt_vld        (ifu_iu_ex_expt_vld       ),
  .ifu_iu_ex_inst_vld        (ifu_iu_ex_inst_vld       ),
  .ifu_iu_ex_ni              (ifu_iu_ex_ni             ),
  .ifu_iu_ex_prvlg_expt_vld  (ifu_iu_ex_prvlg_expt_vld ),
  .ifu_iu_ex_rand_vld        (ifu_iu_ex_rand_vld       ),
  .iu_cp0_ecall              (iu_cp0_ecall             ),
  .iu_cp0_ex_data_sel        (iu_cp0_ex_data_sel       ),
  .iu_cp0_ex_sel             (iu_cp0_ex_sel            ),
  .iu_cp0_oper_mux_en        (iu_cp0_oper_mux_en       ),
  .iu_hs_split_ex_stall      (iu_hs_split_ex_stall     ),
  .iu_ifu_ex_stall           (iu_ifu_ex_stall          ),
  .iu_ifu_ex_stall_noinput   (iu_ifu_ex_stall_noinput  ),
  .iu_ifu_ex_vld             (iu_ifu_ex_vld            ),
  .iu_ifu_wb_stall           (iu_ifu_wb_stall          ),
  .iu_lsu_ex_data_sel        (iu_lsu_ex_data_sel       ),
  .iu_lsu_ex_sel             (iu_lsu_ex_sel            ),
  .iu_lsu_oper_mux_en        (iu_lsu_oper_mux_en       ),
  .lsu_iu_stall              (lsu_iu_stall             ),
  .lsu_iu_stall_noinput      (lsu_iu_stall_noinput     ),
  .mad_ctrl_stall            (mad_ctrl_stall           ),
  .mad_ctrl_stall_noinput    (mad_ctrl_stall_noinput   ),
  .pcgen_ctrl_stall          (pcgen_ctrl_stall         ),
  .vector_ctrl_stall         (vector_ctrl_stall        ),
  .wb_ctrl_stall             (wb_ctrl_stall            )
);
cr_iu_randclk  x_cr_iu_randclk (
  .randclk_mad_mod_en_w2       (randclk_mad_mod_en_w2      ),
  .randclk_oper_gpr_mod_en_w32 (randclk_oper_gpr_mod_en_w32),
  .randclk_pcgen_mod_en_w32    (randclk_pcgen_mod_en_w32   ),
  .randclk_retire_mod_en_w2    (randclk_retire_mod_en_w2   ),
  .randclk_wb_buf_mod_en_w32   (randclk_wb_buf_mod_en_w32  ),
  .randclk_wb_ctrl_mod_en_w2   (randclk_wb_ctrl_mod_en_w2  ),
  .randclk_wb_idx_mod_en_w5    (randclk_wb_idx_mod_en_w5   )
);
cr_iu_hs_split  x_cr_iu_hs_split (
  .hs_split_iu_ctrl_inst_vld    (hs_split_iu_ctrl_inst_vld   ),
  .hs_split_iu_dp_inst_op       (hs_split_iu_dp_inst_op      ),
  .hs_split_iu_hs_retire_mask   (hs_split_iu_hs_retire_mask  ),
  .hs_split_iu_hs_switch_se     (hs_split_iu_hs_switch_se    ),
  .hs_split_iu_nsinst_gpr_rst_b (hs_split_iu_nsinst_gpr_rst_b),
  .hs_split_iu_unstack_chgflw   (hs_split_iu_unstack_chgflw  ),
  .iu_hs_split_ex_stall         (iu_hs_split_ex_stall        ),
  .iu_ifu_spcu_int_en           (iu_ifu_spcu_int_en          ),
  .split_ifctrl_hs_stall        (split_ifctrl_hs_stall       ),
  .split_ifctrl_hs_stall_part   (split_ifctrl_hs_stall_part  )
);
assign iu_ifu_security_violation = 1'b0;
endmodule
