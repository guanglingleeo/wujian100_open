/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_core(
  bmu_lsu_acc_err,
  bmu_lsu_bstack_chk_fail,
  bmu_lsu_data,
  bmu_lsu_data_vld,
  bmu_lsu_grnt,
  bmu_lsu_trans_cmplt,
  bmu_xx_ibus_acc_err,
  bmu_xx_ibus_data,
  bmu_xx_ibus_data_vld,
  bmu_xx_ibus_grnt,
  bmu_xx_ibus_trans_cmplt,
  cache_cp0_lpmd_ack,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clk_en,
  cp0_cache_lpmd_req,
  cp0_had_cpuid_idx0,
  cp0_had_int_exit,
  cp0_had_lpmd_b,
  cp0_had_mcause_data,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pad_psr,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_yy_be_v2,
  cp0_yy_clk_en,
  cp0_yy_machine_mode_aft_dbg,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  forever_cpuclk,
  had_core_dbg_mode_req,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_ifu_inst_bkpt_dbq_req,
  had_ifu_inst_bkpt_dbqexp_req,
  had_ifu_ir,
  had_ifu_ir_vld,
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
  had_yy_xx_dbg,
  had_yy_xx_dp_index_mbee,
  had_yy_xx_exit_dbg,
  ifu_bmu_addr,
  ifu_bmu_idle,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_wfd1,
  ifu_had_chg_flw_inst,
  ifu_had_fetch_expt_vld,
  ifu_had_inst_dbg_disable,
  ifu_had_match_pc,
  ifu_had_split_first,
  iu_bmu_vec_redirect,
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
  iu_pad_gpr_data,
  iu_pad_gpr_index,
  iu_pad_gpr_we,
  iu_pad_inst_retire,
  iu_pad_inst_split,
  iu_pad_retire_pc,
  iu_sys_lp_wk_int,
  iu_sysyio_soft_rst,
  iu_yy_xx_dbgon,
  lsu_bmu_addr,
  lsu_bmu_addr_check_fail,
  lsu_bmu_idle,
  lsu_bmu_prot,
  lsu_bmu_req,
  lsu_bmu_req_without_cmplt,
  lsu_bmu_sg_chk_fail,
  lsu_bmu_size,
  lsu_bmu_store_error,
  lsu_bmu_wdata,
  lsu_bmu_wfd1,
  lsu_bmu_write,
  lsu_had_addr,
  lsu_had_addr_vld,
  lsu_had_ex_cmplt,
  lsu_had_st,
  pad_cpu_ext_int_b,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  sysio_cp0_bigend,
  sysio_cp0_clkratio,
  sysio_cp0_endian_v2,
  sysio_cp0_sys_view_lpmd_b
);
input           bmu_lsu_acc_err;                      
input           bmu_lsu_bstack_chk_fail;              
input   [31:0]  bmu_lsu_data;                         
input           bmu_lsu_data_vld;                     
input           bmu_lsu_grnt;                         
input           bmu_lsu_trans_cmplt;                  
input           bmu_xx_ibus_acc_err;                  
input   [31:0]  bmu_xx_ibus_data;                     
input           bmu_xx_ibus_data_vld;                 
input           bmu_xx_ibus_grnt;                     
input           bmu_xx_ibus_trans_cmplt;              
input           cache_cp0_lpmd_ack;                   
input           clic_cpu_int_hv;                      
input   [9 :0]  clic_cpu_int_id;                      
input   [7 :0]  clic_cpu_int_il;                      
input   [1 :0]  clic_cpu_int_priv;                    
input           clk_en;                               
input           cpurst_b;                             
input           forever_cpuclk;                       
input           had_core_dbg_mode_req;                
input   [31:0]  had_idu_wbbr_data;                    
input           had_idu_wbbr_vld;                     
input           had_ifu_inst_bkpt_dbq_req;            
input           had_ifu_inst_bkpt_dbqexp_req;         
input   [31:0]  had_ifu_ir;                           
input           had_ifu_ir_vld;                       
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
input           had_yy_xx_dbg;                        
input           had_yy_xx_dp_index_mbee;              
input           had_yy_xx_exit_dbg;                   
input           pad_cpu_ext_int_b;                    
input           pad_yy_gate_clk_en_b;                 
input           pad_yy_test_mode;                     
input           sysio_cp0_bigend;                     
input   [2 :0]  sysio_cp0_clkratio;                   
input           sysio_cp0_endian_v2;                  
input   [1 :0]  sysio_cp0_sys_view_lpmd_b;            
output          cp0_cache_lpmd_req;                   
output  [31:0]  cp0_had_cpuid_idx0;                   
output          cp0_had_int_exit;                     
output  [1 :0]  cp0_had_lpmd_b;                       
output  [31:0]  cp0_had_mcause_data;                  
output  [31:0]  cp0_pad_mintstatus;                   
output  [31:0]  cp0_pad_mstatus;                      
output  [31:0]  cp0_pad_psr;                          
output          cp0_sysio_ipend_b;                    
output  [1 :0]  cp0_sysio_lpmd_b;                     
output          cp0_yy_be_v2;                         
output          cp0_yy_clk_en;                        
output          cp0_yy_machine_mode_aft_dbg;          
output  [9 :0]  cpu_clic_curid;                       
output          cpu_clic_int_exit;                    
output  [31:0]  ifu_bmu_addr;                         
output          ifu_bmu_idle;                         
output  [3 :0]  ifu_bmu_prot;                         
output          ifu_bmu_req;                          
output          ifu_bmu_wfd1;                         
output          ifu_had_chg_flw_inst;                 
output          ifu_had_fetch_expt_vld;               
output          ifu_had_inst_dbg_disable;             
output  [31:0]  ifu_had_match_pc;                     
output          ifu_had_split_first;                  
output          iu_bmu_vec_redirect;                  
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
output  [31:0]  iu_pad_gpr_data;                      
output  [4 :0]  iu_pad_gpr_index;                     
output          iu_pad_gpr_we;                        
output          iu_pad_inst_retire;                   
output          iu_pad_inst_split;                    
output  [31:0]  iu_pad_retire_pc;                     
output          iu_sys_lp_wk_int;                     
output          iu_sysyio_soft_rst;                   
output          iu_yy_xx_dbgon;                       
output  [31:0]  lsu_bmu_addr;                         
output          lsu_bmu_addr_check_fail;              
output          lsu_bmu_idle;                         
output  [3 :0]  lsu_bmu_prot;                         
output          lsu_bmu_req;                          
output          lsu_bmu_req_without_cmplt;            
output          lsu_bmu_sg_chk_fail;                  
output  [1 :0]  lsu_bmu_size;                         
output          lsu_bmu_store_error;                  
output  [31:0]  lsu_bmu_wdata;                        
output          lsu_bmu_wfd1;                         
output          lsu_bmu_write;                        
output  [31:0]  lsu_had_addr;                         
output          lsu_had_addr_vld;                     
output          lsu_had_ex_cmplt;                     
output          lsu_had_st;                           
wire            bmu_lsu_acc_err;                      
wire            bmu_lsu_bstack_chk_fail;              
wire    [31:0]  bmu_lsu_data;                         
wire            bmu_lsu_data_vld;                     
wire            bmu_lsu_grnt;                         
wire            bmu_lsu_trans_cmplt;                  
wire            bmu_xx_ibus_acc_err;                  
wire    [31:0]  bmu_xx_ibus_data;                     
wire            bmu_xx_ibus_data_vld;                 
wire            bmu_xx_ibus_grnt;                     
wire            bmu_xx_ibus_trans_cmplt;              
wire            cache_cp0_lpmd_ack;                   
wire            clic_cpu_int_hv;                      
wire    [9 :0]  clic_cpu_int_id;                      
wire    [7 :0]  clic_cpu_int_il;                      
wire    [1 :0]  clic_cpu_int_priv;                    
wire            clk_en;                               
wire            cp0_cache_lpmd_req;                   
wire    [31:0]  cp0_had_cpuid_idx0;                   
wire            cp0_had_int_exit;                     
wire    [1 :0]  cp0_had_lpmd_b;                       
wire    [31:0]  cp0_had_mcause_data;                  
wire            cp0_ifu_in_lpmd;                      
wire            cp0_ifu_lpmd_req;                     
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
wire    [31:0]  cp0_pad_mintstatus;                   
wire    [31:0]  cp0_pad_mstatus;                      
wire    [31:0]  cp0_pad_psr;                          
wire            cp0_sysio_ipend_b;                    
wire    [1 :0]  cp0_sysio_lpmd_b;                     
wire    [29:0]  cp0_vector_vec_err_vbr;               
wire            cp0_yy_be_v1;                         
wire            cp0_yy_be_v2;                         
wire            cp0_yy_clk_en;                        
wire            cp0_yy_machine_mode_aft_dbg;          
wire    [1 :0]  cp0_yy_priv_mode;                     
wire    [9 :0]  cpu_clic_curid;                       
wire            cpu_clic_int_exit;                    
wire            cpurst_b;                             
wire            forever_cpuclk;                       
wire            had_core_dbg_mode_req;                
wire    [31:0]  had_idu_wbbr_data;                    
wire            had_idu_wbbr_vld;                     
wire            had_ifu_inst_bkpt_dbq_req;            
wire            had_ifu_inst_bkpt_dbqexp_req;         
wire    [31:0]  had_ifu_ir;                           
wire            had_ifu_ir_vld;                       
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
wire            had_yy_xx_dbg;                        
wire            had_yy_xx_dp_index_mbee;              
wire            had_yy_xx_exit_dbg;                   
wire    [31:0]  ifu_bmu_addr;                         
wire            ifu_bmu_idle;                         
wire    [3 :0]  ifu_bmu_prot;                         
wire            ifu_bmu_req;                          
wire            ifu_bmu_wfd1;                         
wire            ifu_cp0_lpmd_ack;                     
wire            ifu_had_chg_flw_inst;                 
wire            ifu_had_fetch_expt_vld;               
wire            ifu_had_inst_dbg_disable;             
wire    [31:0]  ifu_had_match_pc;                     
wire            ifu_had_split_first;                  
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
wire            ifu_iu_ex_sp_oper;                    
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
wire    [31:0]  lsu_bmu_addr;                         
wire            lsu_bmu_addr_check_fail;              
wire            lsu_bmu_idle;                         
wire    [3 :0]  lsu_bmu_prot;                         
wire            lsu_bmu_req;                          
wire            lsu_bmu_req_without_cmplt;            
wire            lsu_bmu_sg_chk_fail;                  
wire    [1 :0]  lsu_bmu_size;                         
wire            lsu_bmu_store_error;                  
wire    [31:0]  lsu_bmu_wdata;                        
wire            lsu_bmu_wfd1;                         
wire            lsu_bmu_write;                        
wire    [31:0]  lsu_had_addr;                         
wire            lsu_had_addr_vld;                     
wire            lsu_had_ex_cmplt;                     
wire            lsu_had_st;                           
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
wire            pad_cpu_ext_int_b;                    
wire            pad_yy_gate_clk_en_b;                 
wire            pad_yy_test_mode;                     
wire            split_ifctrl_hs_stall;                
wire            split_ifctrl_hs_stall_part;           
wire            sysio_cp0_bigend;                     
wire    [2 :0]  sysio_cp0_clkratio;                   
wire            sysio_cp0_endian_v2;                  
wire    [1 :0]  sysio_cp0_sys_view_lpmd_b;            
wire            vector_cp0_vec_err;                   
wire    [29:0]  vector_cp0_vec_err_epc;               
wire            vector_cp0_vec_succeed;               
cr_ifu_top  x_cr_ifu_top (
  .bmu_xx_ibus_acc_err                   (bmu_xx_ibus_acc_err                  ),
  .bmu_xx_ibus_data                      (bmu_xx_ibus_data                     ),
  .bmu_xx_ibus_grnt                      (bmu_xx_ibus_grnt                     ),
  .bmu_xx_ibus_trans_cmplt               (bmu_xx_ibus_trans_cmplt              ),
  .cp0_ifu_in_lpmd                       (cp0_ifu_in_lpmd                      ),
  .cp0_ifu_lpmd_req                      (cp0_ifu_lpmd_req                     ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_machine_mode_aft_dbg           (cp0_yy_machine_mode_aft_dbg          ),
  .cpurst_b                              (cpurst_b                             ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .had_core_dbg_mode_req                 (had_core_dbg_mode_req                ),
  .had_ifu_inst_bkpt_dbq_req             (had_ifu_inst_bkpt_dbq_req            ),
  .had_ifu_inst_bkpt_dbqexp_req          (had_ifu_inst_bkpt_dbqexp_req         ),
  .had_ifu_ir                            (had_ifu_ir                           ),
  .had_ifu_ir_vld                        (had_ifu_ir_vld                       ),
  .had_yy_xx_dp_index_mbee               (had_yy_xx_dp_index_mbee              ),
  .ifu_bmu_addr                          (ifu_bmu_addr                         ),
  .ifu_bmu_idle                          (ifu_bmu_idle                         ),
  .ifu_bmu_prot                          (ifu_bmu_prot                         ),
  .ifu_bmu_req                           (ifu_bmu_req                          ),
  .ifu_bmu_wfd1                          (ifu_bmu_wfd1                         ),
  .ifu_cp0_lpmd_ack                      (ifu_cp0_lpmd_ack                     ),
  .ifu_had_fetch_expt_vld                (ifu_had_fetch_expt_vld               ),
  .ifu_had_inst_dbg_disable              (ifu_had_inst_dbg_disable             ),
  .ifu_had_split_first                   (ifu_had_split_first                  ),
  .ifu_iu_ex_expt_cur                    (ifu_iu_ex_expt_cur                   ),
  .ifu_iu_ex_expt_vld                    (ifu_iu_ex_expt_vld                   ),
  .ifu_iu_ex_inst                        (ifu_iu_ex_inst                       ),
  .ifu_iu_ex_inst_bkpt                   (ifu_iu_ex_inst_bkpt                  ),
  .ifu_iu_ex_inst_dbg_disable            (ifu_iu_ex_inst_dbg_disable           ),
  .ifu_iu_ex_inst_vld                    (ifu_iu_ex_inst_vld                   ),
  .ifu_iu_ex_int_spcu_mask               (ifu_iu_ex_int_spcu_mask              ),
  .ifu_iu_ex_int_spcu_vld                (ifu_iu_ex_int_spcu_vld               ),
  .ifu_iu_ex_ni                          (ifu_iu_ex_ni                         ),
  .ifu_iu_ex_prvlg_expt_vld              (ifu_iu_ex_prvlg_expt_vld             ),
  .ifu_iu_ex_rand_vld                    (ifu_iu_ex_rand_vld                   ),
  .ifu_iu_ex_sp_oper                     (ifu_iu_ex_sp_oper                    ),
  .ifu_iu_ibus_idle                      (ifu_iu_ibus_idle                     ),
  .ifu_iu_inst_bkpt_dbg_occur_vld        (ifu_iu_inst_bkpt_dbg_occur_vld       ),
  .ifu_iu_inst_bkpt_dbgexp_occur_vld     (ifu_iu_inst_bkpt_dbgexp_occur_vld    ),
  .ifu_iu_inst_buf_inst_dbg_disable      (ifu_iu_inst_buf_inst_dbg_disable     ),
  .ifu_iu_inst_buf_inst_vld              (ifu_iu_inst_buf_inst_vld             ),
  .ifu_iu_spcu_retire_mask               (ifu_iu_spcu_retire_mask              ),
  .ifu_iu_vector_ibus_in_idle            (ifu_iu_vector_ibus_in_idle           ),
  .ifu_iu_xx_ibus_data                   (ifu_iu_xx_ibus_data                  ),
  .iu_ifu_addr                           (iu_ifu_addr                          ),
  .iu_ifu_data_fetch                     (iu_ifu_data_fetch                    ),
  .iu_ifu_data_fetch_for_data            (iu_ifu_data_fetch_for_data           ),
  .iu_ifu_ex_stall                       (iu_ifu_ex_stall                      ),
  .iu_ifu_ex_stall_noinput               (iu_ifu_ex_stall_noinput              ),
  .iu_ifu_ex_vld                         (iu_ifu_ex_vld                        ),
  .iu_ifu_inst_fetch                     (iu_ifu_inst_fetch                    ),
  .iu_ifu_inst_fetch_for_data            (iu_ifu_inst_fetch_for_data           ),
  .iu_ifu_inst_fetch_mask                (iu_ifu_inst_fetch_mask               ),
  .iu_ifu_inst_fetch_without_dbg_disable (iu_ifu_inst_fetch_without_dbg_disable),
  .iu_ifu_kill_inst                      (iu_ifu_kill_inst                     ),
  .iu_ifu_lsu_inst                       (iu_ifu_lsu_inst                      ),
  .iu_ifu_security_violation             (iu_ifu_security_violation            ),
  .iu_ifu_wb_ldst                        (iu_ifu_wb_ldst                       ),
  .iu_ifu_wb_stall                       (iu_ifu_wb_stall                      ),
  .iu_yy_xx_dbgon                        (iu_yy_xx_dbgon                       ),
  .iu_yy_xx_flush                        (iu_yy_xx_flush                       ),
  .pad_yy_gate_clk_en_b                  (pad_yy_gate_clk_en_b                 ),
  .pad_yy_test_mode                      (pad_yy_test_mode                     ),
  .split_ifctrl_hs_stall                 (split_ifctrl_hs_stall                ),
  .split_ifctrl_hs_stall_part            (split_ifctrl_hs_stall_part           )
);
cr_iu_top  x_cr_iu_top (
  .bmu_xx_ibus_acc_err                   (bmu_xx_ibus_acc_err                  ),
  .bmu_xx_ibus_data_vld                  (bmu_xx_ibus_data_vld                 ),
  .bmu_xx_ibus_grnt                      (bmu_xx_ibus_grnt                     ),
  .clic_cpu_int_hv                       (clic_cpu_int_hv                      ),
  .clic_cpu_int_id                       (clic_cpu_int_id                      ),
  .clic_cpu_int_il                       (clic_cpu_int_il                      ),
  .clic_cpu_int_priv                     (clic_cpu_int_priv                    ),
  .clk_en                                (clk_en                               ),
  .cp0_iu_data                           (cp0_iu_data                          ),
  .cp0_iu_data_vld                       (cp0_iu_data_vld                      ),
  .cp0_iu_dbg_disable_for_tee            (cp0_iu_dbg_disable_for_tee           ),
  .cp0_iu_epc_for_chgflw                 (cp0_iu_epc_for_chgflw                ),
  .cp0_iu_expt_vec                       (cp0_iu_expt_vec                      ),
  .cp0_iu_expt_vld                       (cp0_iu_expt_vld                      ),
  .cp0_iu_flush                          (cp0_iu_flush                         ),
  .cp0_iu_flush_chgflw_vld               (cp0_iu_flush_chgflw_vld              ),
  .cp0_iu_il                             (cp0_iu_il                            ),
  .cp0_iu_meie                           (cp0_iu_meie                          ),
  .cp0_iu_mie_for_int                    (cp0_iu_mie_for_int                   ),
  .cp0_iu_req                            (cp0_iu_req                           ),
  .cp0_iu_rte_chgflw_vld                 (cp0_iu_rte_chgflw_vld                ),
  .cp0_iu_rte_chgflw_vld_for_data        (cp0_iu_rte_chgflw_vld_for_data       ),
  .cp0_iu_stall                          (cp0_iu_stall                         ),
  .cp0_iu_vbr                            (cp0_iu_vbr                           ),
  .cp0_iu_vec_mode                       (cp0_iu_vec_mode                      ),
  .cp0_vector_vec_err_vbr                (cp0_vector_vec_err_vbr               ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .had_core_dbg_mode_req                 (had_core_dbg_mode_req                ),
  .had_idu_wbbr_data                     (had_idu_wbbr_data                    ),
  .had_idu_wbbr_vld                      (had_idu_wbbr_vld                     ),
  .had_iu_bkpt_trace_en                  (had_iu_bkpt_trace_en                 ),
  .had_iu_dr_set_req                     (had_iu_dr_set_req                    ),
  .had_iu_force_dbg_en                   (had_iu_force_dbg_en                  ),
  .had_iu_int_vld                        (had_iu_int_vld                       ),
  .had_iu_mbkpt_fsm_index_mbee           (had_iu_mbkpt_fsm_index_mbee          ),
  .had_iu_mem_bkpt_exp_req               (had_iu_mem_bkpt_exp_req              ),
  .had_iu_mem_bkpt_mask                  (had_iu_mem_bkpt_mask                 ),
  .had_iu_mem_bkpt_req                   (had_iu_mem_bkpt_req                  ),
  .had_iu_pc                             (had_iu_pc                            ),
  .had_iu_rte_pc_sel                     (had_iu_rte_pc_sel                    ),
  .had_iu_trace_req                      (had_iu_trace_req                     ),
  .had_iu_trace_req_for_dbg_disable      (had_iu_trace_req_for_dbg_disable     ),
  .had_iu_xx_fdb                         (had_iu_xx_fdb                        ),
  .had_iu_xx_jdbreq                      (had_iu_xx_jdbreq                     ),
  .had_yy_xx_exit_dbg                    (had_yy_xx_exit_dbg                   ),
  .ifu_had_chg_flw_inst                  (ifu_had_chg_flw_inst                 ),
  .ifu_had_match_pc                      (ifu_had_match_pc                     ),
  .ifu_iu_ex_expt_cur                    (ifu_iu_ex_expt_cur                   ),
  .ifu_iu_ex_expt_vld                    (ifu_iu_ex_expt_vld                   ),
  .ifu_iu_ex_inst                        (ifu_iu_ex_inst                       ),
  .ifu_iu_ex_inst_bkpt                   (ifu_iu_ex_inst_bkpt                  ),
  .ifu_iu_ex_inst_dbg_disable            (ifu_iu_ex_inst_dbg_disable           ),
  .ifu_iu_ex_inst_vld                    (ifu_iu_ex_inst_vld                   ),
  .ifu_iu_ex_int_spcu_mask               (ifu_iu_ex_int_spcu_mask              ),
  .ifu_iu_ex_int_spcu_vld                (ifu_iu_ex_int_spcu_vld               ),
  .ifu_iu_ex_ni                          (ifu_iu_ex_ni                         ),
  .ifu_iu_ex_prvlg_expt_vld              (ifu_iu_ex_prvlg_expt_vld             ),
  .ifu_iu_ex_rand_vld                    (ifu_iu_ex_rand_vld                   ),
  .ifu_iu_ex_sp_oper                     (ifu_iu_ex_sp_oper                    ),
  .ifu_iu_ibus_idle                      (ifu_iu_ibus_idle                     ),
  .ifu_iu_inst_bkpt_dbg_occur_vld        (ifu_iu_inst_bkpt_dbg_occur_vld       ),
  .ifu_iu_inst_bkpt_dbgexp_occur_vld     (ifu_iu_inst_bkpt_dbgexp_occur_vld    ),
  .ifu_iu_inst_buf_inst_dbg_disable      (ifu_iu_inst_buf_inst_dbg_disable     ),
  .ifu_iu_inst_buf_inst_vld              (ifu_iu_inst_buf_inst_vld             ),
  .ifu_iu_spcu_retire_mask               (ifu_iu_spcu_retire_mask              ),
  .ifu_iu_vector_ibus_in_idle            (ifu_iu_vector_ibus_in_idle           ),
  .ifu_iu_xx_ibus_data                   (ifu_iu_xx_ibus_data                  ),
  .iu_bmu_vec_redirect                   (iu_bmu_vec_redirect                  ),
  .iu_cp0_ecall                          (iu_cp0_ecall                         ),
  .iu_cp0_epc                            (iu_cp0_epc                           ),
  .iu_cp0_epc_update                     (iu_cp0_epc_update                    ),
  .iu_cp0_ex_csrrc                       (iu_cp0_ex_csrrc                      ),
  .iu_cp0_ex_csrrci                      (iu_cp0_ex_csrrci                     ),
  .iu_cp0_ex_csrrs                       (iu_cp0_ex_csrrs                      ),
  .iu_cp0_ex_csrrsi                      (iu_cp0_ex_csrrsi                     ),
  .iu_cp0_ex_csrrw                       (iu_cp0_ex_csrrw                      ),
  .iu_cp0_ex_csrrwi                      (iu_cp0_ex_csrrwi                     ),
  .iu_cp0_ex_data_sel                    (iu_cp0_ex_data_sel                   ),
  .iu_cp0_ex_func3                       (iu_cp0_ex_func3                      ),
  .iu_cp0_ex_mret                        (iu_cp0_ex_mret                       ),
  .iu_cp0_ex_rd_reg                      (iu_cp0_ex_rd_reg                     ),
  .iu_cp0_ex_rs1_reg                     (iu_cp0_ex_rs1_reg                    ),
  .iu_cp0_ex_sel                         (iu_cp0_ex_sel                        ),
  .iu_cp0_ex_wfi                         (iu_cp0_ex_wfi                        ),
  .iu_cp0_expt_tval                      (iu_cp0_expt_tval                     ),
  .iu_cp0_expt_vld                       (iu_cp0_expt_vld                      ),
  .iu_cp0_imm                            (iu_cp0_imm                           ),
  .iu_cp0_int_vld                        (iu_cp0_int_vld                       ),
  .iu_cp0_lp_wk_int                      (iu_cp0_lp_wk_int                     ),
  .iu_cp0_mtval_updt_vld                 (iu_cp0_mtval_updt_vld                ),
  .iu_cp0_nt_int_pending_vld             (iu_cp0_nt_int_pending_vld            ),
  .iu_cp0_oper_mux_en                    (iu_cp0_oper_mux_en                   ),
  .iu_cp0_rs1                            (iu_cp0_rs1                           ),
  .iu_cp0_syc_rst_b                      (iu_cp0_syc_rst_b                     ),
  .iu_had_adr_dbg_ack                    (iu_had_adr_dbg_ack                   ),
  .iu_had_chgflw_dst_pc                  (iu_had_chgflw_dst_pc                 ),
  .iu_had_chgflw_vld                     (iu_had_chgflw_vld                    ),
  .iu_had_data_bkpt_occur_vld            (iu_had_data_bkpt_occur_vld           ),
  .iu_had_dbg_disable_for_tee            (iu_had_dbg_disable_for_tee           ),
  .iu_had_dr_dbg_ack                     (iu_had_dr_dbg_ack                    ),
  .iu_had_expt_vld                       (iu_had_expt_vld                      ),
  .iu_had_fast_retire_acc_err_pc_update  (iu_had_fast_retire_acc_err_pc_update ),
  .iu_had_fast_retire_acc_err_pc_val     (iu_had_fast_retire_acc_err_pc_val    ),
  .iu_had_flush                          (iu_had_flush                         ),
  .iu_had_inst_bkpt_occur_vld            (iu_had_inst_bkpt_occur_vld           ),
  .iu_had_int_ack                        (iu_had_int_ack                       ),
  .iu_had_retire_with_had_int            (iu_had_retire_with_had_int           ),
  .iu_had_trace_occur_vld                (iu_had_trace_occur_vld               ),
  .iu_had_xx_bkpt_inst                   (iu_had_xx_bkpt_inst                  ),
  .iu_had_xx_data                        (iu_had_xx_data                       ),
  .iu_had_xx_data_vld                    (iu_had_xx_data_vld                   ),
  .iu_had_xx_dbg_ack                     (iu_had_xx_dbg_ack                    ),
  .iu_had_xx_mldst                       (iu_had_xx_mldst                      ),
  .iu_had_xx_retire                      (iu_had_xx_retire                     ),
  .iu_had_xx_retire_normal               (iu_had_xx_retire_normal              ),
  .iu_had_xx_retire_pc                   (iu_had_xx_retire_pc                  ),
  .iu_ifu_addr                           (iu_ifu_addr                          ),
  .iu_ifu_data_fetch                     (iu_ifu_data_fetch                    ),
  .iu_ifu_data_fetch_for_data            (iu_ifu_data_fetch_for_data           ),
  .iu_ifu_ex_stall                       (iu_ifu_ex_stall                      ),
  .iu_ifu_ex_stall_noinput               (iu_ifu_ex_stall_noinput              ),
  .iu_ifu_ex_vld                         (iu_ifu_ex_vld                        ),
  .iu_ifu_inst_fetch                     (iu_ifu_inst_fetch                    ),
  .iu_ifu_inst_fetch_for_data            (iu_ifu_inst_fetch_for_data           ),
  .iu_ifu_inst_fetch_mask                (iu_ifu_inst_fetch_mask               ),
  .iu_ifu_inst_fetch_without_dbg_disable (iu_ifu_inst_fetch_without_dbg_disable),
  .iu_ifu_kill_inst                      (iu_ifu_kill_inst                     ),
  .iu_ifu_lsu_inst                       (iu_ifu_lsu_inst                      ),
  .iu_ifu_security_violation             (iu_ifu_security_violation            ),
  .iu_ifu_wb_ldst                        (iu_ifu_wb_ldst                       ),
  .iu_ifu_wb_stall                       (iu_ifu_wb_stall                      ),
  .iu_lsu_base                           (iu_lsu_base                          ),
  .iu_lsu_cmp                            (iu_lsu_cmp                           ),
  .iu_lsu_data                           (iu_lsu_data                          ),
  .iu_lsu_ex_byte                        (iu_lsu_ex_byte                       ),
  .iu_lsu_ex_data_sel                    (iu_lsu_ex_data_sel                   ),
  .iu_lsu_ex_half                        (iu_lsu_ex_half                       ),
  .iu_lsu_ex_sel                         (iu_lsu_ex_sel                        ),
  .iu_lsu_ex_store                       (iu_lsu_ex_store                      ),
  .iu_lsu_ex_uns                         (iu_lsu_ex_uns                        ),
  .iu_lsu_imm_data                       (iu_lsu_imm_data                      ),
  .iu_lsu_imm_sel                        (iu_lsu_imm_sel                       ),
  .iu_lsu_imm_write_en                   (iu_lsu_imm_write_en                  ),
  .iu_lsu_offset                         (iu_lsu_offset                        ),
  .iu_lsu_oper_mux_en                    (iu_lsu_oper_mux_en                   ),
  .iu_lsu_pc                             (iu_lsu_pc                            ),
  .iu_lsu_pc_sel                         (iu_lsu_pc_sel                        ),
  .iu_lsu_rs1_sel                        (iu_lsu_rs1_sel                       ),
  .iu_lsu_rs2                            (iu_lsu_rs2                           ),
  .iu_lsu_stall_without_hready           (iu_lsu_stall_without_hready          ),
  .iu_lsu_wb_ldst                        (iu_lsu_wb_ldst                       ),
  .iu_lsu_wb_load                        (iu_lsu_wb_load                       ),
  .iu_lsu_wb_store                       (iu_lsu_wb_store                      ),
  .iu_pad_gpr_data                       (iu_pad_gpr_data                      ),
  .iu_pad_gpr_index                      (iu_pad_gpr_index                     ),
  .iu_pad_gpr_we                         (iu_pad_gpr_we                        ),
  .iu_pad_inst_retire                    (iu_pad_inst_retire                   ),
  .iu_pad_inst_split                     (iu_pad_inst_split                    ),
  .iu_pad_retire_pc                      (iu_pad_retire_pc                     ),
  .iu_sys_lp_wk_int                      (iu_sys_lp_wk_int                     ),
  .iu_sysyio_soft_rst                    (iu_sysyio_soft_rst                   ),
  .iu_yy_xx_dbgon                        (iu_yy_xx_dbgon                       ),
  .iu_yy_xx_expt_vec                     (iu_yy_xx_expt_vec                    ),
  .iu_yy_xx_flush                        (iu_yy_xx_flush                       ),
  .iu_yy_xx_int_hv                       (iu_yy_xx_int_hv                      ),
  .iu_yy_xx_int_il                       (iu_yy_xx_int_il                      ),
  .iu_yy_xx_int_pending_hv               (iu_yy_xx_int_pending_hv              ),
  .iu_yy_xx_int_pending_id               (iu_yy_xx_int_pending_id              ),
  .iu_yy_xx_int_pending_il               (iu_yy_xx_int_pending_il              ),
  .iu_yy_xx_int_pending_priv             (iu_yy_xx_int_pending_priv            ),
  .lsu_iu_addr                           (lsu_iu_addr                          ),
  .lsu_iu_addr_vld                       (lsu_iu_addr_vld                      ),
  .lsu_iu_alu_sel                        (lsu_iu_alu_sel                       ),
  .lsu_iu_branch_cout                    (lsu_iu_branch_cout                   ),
  .lsu_iu_branch_rst                     (lsu_iu_branch_rst                    ),
  .lsu_iu_data                           (lsu_iu_data                          ),
  .lsu_iu_data_vld                       (lsu_iu_data_vld                      ),
  .lsu_iu_expt_vec                       (lsu_iu_expt_vec                      ),
  .lsu_iu_expt_vld                       (lsu_iu_expt_vld                      ),
  .lsu_iu_fast_retire                    (lsu_iu_fast_retire                   ),
  .lsu_iu_mad_buf                        (lsu_iu_mad_buf                       ),
  .lsu_iu_req                            (lsu_iu_req                           ),
  .lsu_iu_stall                          (lsu_iu_stall                         ),
  .lsu_iu_stall_noinput                  (lsu_iu_stall_noinput                 ),
  .lsu_iu_store                          (lsu_iu_store                         ),
  .lsu_iu_wb_acc_err                     (lsu_iu_wb_acc_err                    ),
  .lsu_iu_wb_bstack_chk_fail             (lsu_iu_wb_bstack_chk_fail            ),
  .lsu_iu_wb_cmplt                       (lsu_iu_wb_cmplt                      ),
  .lsu_iu_wb_data_vld                    (lsu_iu_wb_data_vld                   ),
  .lsu_iu_wb_load_data                   (lsu_iu_wb_load_data                  ),
  .lsu_iu_wfd                            (lsu_iu_wfd                           ),
  .pad_cpu_ext_int_b                     (pad_cpu_ext_int_b                    ),
  .pad_yy_gate_clk_en_b                  (pad_yy_gate_clk_en_b                 ),
  .pad_yy_test_mode                      (pad_yy_test_mode                     ),
  .split_ifctrl_hs_stall                 (split_ifctrl_hs_stall                ),
  .split_ifctrl_hs_stall_part            (split_ifctrl_hs_stall_part           ),
  .vector_cp0_vec_err                    (vector_cp0_vec_err                   ),
  .vector_cp0_vec_err_epc                (vector_cp0_vec_err_epc               ),
  .vector_cp0_vec_succeed                (vector_cp0_vec_succeed               )
);
cr_lsu_top  x_cr_lsu_top (
  .bmu_lsu_acc_err             (bmu_lsu_acc_err            ),
  .bmu_lsu_bstack_chk_fail     (bmu_lsu_bstack_chk_fail    ),
  .bmu_lsu_data                (bmu_lsu_data               ),
  .bmu_lsu_data_vld            (bmu_lsu_data_vld           ),
  .bmu_lsu_grnt                (bmu_lsu_grnt               ),
  .bmu_lsu_trans_cmplt         (bmu_lsu_trans_cmplt        ),
  .cp0_yy_be_v1                (cp0_yy_be_v1               ),
  .cp0_yy_be_v2                (cp0_yy_be_v2               ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cp0_yy_machine_mode_aft_dbg (cp0_yy_machine_mode_aft_dbg),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .iu_lsu_base                 (iu_lsu_base                ),
  .iu_lsu_cmp                  (iu_lsu_cmp                 ),
  .iu_lsu_data                 (iu_lsu_data                ),
  .iu_lsu_ex_byte              (iu_lsu_ex_byte             ),
  .iu_lsu_ex_data_sel          (iu_lsu_ex_data_sel         ),
  .iu_lsu_ex_half              (iu_lsu_ex_half             ),
  .iu_lsu_ex_sel               (iu_lsu_ex_sel              ),
  .iu_lsu_ex_store             (iu_lsu_ex_store            ),
  .iu_lsu_ex_uns               (iu_lsu_ex_uns              ),
  .iu_lsu_imm_data             (iu_lsu_imm_data            ),
  .iu_lsu_imm_sel              (iu_lsu_imm_sel             ),
  .iu_lsu_imm_write_en         (iu_lsu_imm_write_en        ),
  .iu_lsu_offset               (iu_lsu_offset              ),
  .iu_lsu_oper_mux_en          (iu_lsu_oper_mux_en         ),
  .iu_lsu_pc                   (iu_lsu_pc                  ),
  .iu_lsu_pc_sel               (iu_lsu_pc_sel              ),
  .iu_lsu_rs1_sel              (iu_lsu_rs1_sel             ),
  .iu_lsu_rs2                  (iu_lsu_rs2                 ),
  .iu_lsu_stall_without_hready (iu_lsu_stall_without_hready),
  .iu_lsu_wb_ldst              (iu_lsu_wb_ldst             ),
  .iu_lsu_wb_load              (iu_lsu_wb_load             ),
  .iu_lsu_wb_store             (iu_lsu_wb_store            ),
  .iu_yy_xx_flush              (iu_yy_xx_flush             ),
  .lsu_bmu_addr                (lsu_bmu_addr               ),
  .lsu_bmu_addr_check_fail     (lsu_bmu_addr_check_fail    ),
  .lsu_bmu_idle                (lsu_bmu_idle               ),
  .lsu_bmu_prot                (lsu_bmu_prot               ),
  .lsu_bmu_req                 (lsu_bmu_req                ),
  .lsu_bmu_req_without_cmplt   (lsu_bmu_req_without_cmplt  ),
  .lsu_bmu_sg_chk_fail         (lsu_bmu_sg_chk_fail        ),
  .lsu_bmu_size                (lsu_bmu_size               ),
  .lsu_bmu_store_error         (lsu_bmu_store_error        ),
  .lsu_bmu_wdata               (lsu_bmu_wdata              ),
  .lsu_bmu_wfd1                (lsu_bmu_wfd1               ),
  .lsu_bmu_write               (lsu_bmu_write              ),
  .lsu_had_addr                (lsu_had_addr               ),
  .lsu_had_addr_vld            (lsu_had_addr_vld           ),
  .lsu_had_ex_cmplt            (lsu_had_ex_cmplt           ),
  .lsu_had_st                  (lsu_had_st                 ),
  .lsu_iu_addr                 (lsu_iu_addr                ),
  .lsu_iu_addr_vld             (lsu_iu_addr_vld            ),
  .lsu_iu_alu_sel              (lsu_iu_alu_sel             ),
  .lsu_iu_branch_cout          (lsu_iu_branch_cout         ),
  .lsu_iu_branch_rst           (lsu_iu_branch_rst          ),
  .lsu_iu_data                 (lsu_iu_data                ),
  .lsu_iu_data_vld             (lsu_iu_data_vld            ),
  .lsu_iu_expt_vec             (lsu_iu_expt_vec            ),
  .lsu_iu_expt_vld             (lsu_iu_expt_vld            ),
  .lsu_iu_fast_retire          (lsu_iu_fast_retire         ),
  .lsu_iu_mad_buf              (lsu_iu_mad_buf             ),
  .lsu_iu_req                  (lsu_iu_req                 ),
  .lsu_iu_stall                (lsu_iu_stall               ),
  .lsu_iu_stall_noinput        (lsu_iu_stall_noinput       ),
  .lsu_iu_store                (lsu_iu_store               ),
  .lsu_iu_wb_acc_err           (lsu_iu_wb_acc_err          ),
  .lsu_iu_wb_bstack_chk_fail   (lsu_iu_wb_bstack_chk_fail  ),
  .lsu_iu_wb_cmplt             (lsu_iu_wb_cmplt            ),
  .lsu_iu_wb_data_vld          (lsu_iu_wb_data_vld         ),
  .lsu_iu_wb_load_data         (lsu_iu_wb_load_data        ),
  .lsu_iu_wfd                  (lsu_iu_wfd                 ),
  .pad_yy_gate_clk_en_b        (pad_yy_gate_clk_en_b       ),
  .pad_yy_test_mode            (pad_yy_test_mode           )
);
cr_cp0_top  x_cr_cp0_top (
  .cache_cp0_lpmd_ack             (cache_cp0_lpmd_ack            ),
  .cp0_cache_lpmd_req             (cp0_cache_lpmd_req            ),
  .cp0_had_cpuid_idx0             (cp0_had_cpuid_idx0            ),
  .cp0_had_int_exit               (cp0_had_int_exit              ),
  .cp0_had_lpmd_b                 (cp0_had_lpmd_b                ),
  .cp0_had_mcause_data            (cp0_had_mcause_data           ),
  .cp0_ifu_in_lpmd                (cp0_ifu_in_lpmd               ),
  .cp0_ifu_lpmd_req               (cp0_ifu_lpmd_req              ),
  .cp0_iu_data                    (cp0_iu_data                   ),
  .cp0_iu_data_vld                (cp0_iu_data_vld               ),
  .cp0_iu_dbg_disable_for_tee     (cp0_iu_dbg_disable_for_tee    ),
  .cp0_iu_epc_for_chgflw          (cp0_iu_epc_for_chgflw         ),
  .cp0_iu_expt_vec                (cp0_iu_expt_vec               ),
  .cp0_iu_expt_vld                (cp0_iu_expt_vld               ),
  .cp0_iu_flush                   (cp0_iu_flush                  ),
  .cp0_iu_flush_chgflw_vld        (cp0_iu_flush_chgflw_vld       ),
  .cp0_iu_il                      (cp0_iu_il                     ),
  .cp0_iu_meie                    (cp0_iu_meie                   ),
  .cp0_iu_mie_for_int             (cp0_iu_mie_for_int            ),
  .cp0_iu_req                     (cp0_iu_req                    ),
  .cp0_iu_rte_chgflw_vld          (cp0_iu_rte_chgflw_vld         ),
  .cp0_iu_rte_chgflw_vld_for_data (cp0_iu_rte_chgflw_vld_for_data),
  .cp0_iu_stall                   (cp0_iu_stall                  ),
  .cp0_iu_vbr                     (cp0_iu_vbr                    ),
  .cp0_iu_vec_mode                (cp0_iu_vec_mode               ),
  .cp0_pad_mintstatus             (cp0_pad_mintstatus            ),
  .cp0_pad_mstatus                (cp0_pad_mstatus               ),
  .cp0_pad_psr                    (cp0_pad_psr                   ),
  .cp0_sysio_ipend_b              (cp0_sysio_ipend_b             ),
  .cp0_sysio_lpmd_b               (cp0_sysio_lpmd_b              ),
  .cp0_vector_vec_err_vbr         (cp0_vector_vec_err_vbr        ),
  .cp0_yy_be_v1                   (cp0_yy_be_v1                  ),
  .cp0_yy_be_v2                   (cp0_yy_be_v2                  ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cp0_yy_machine_mode_aft_dbg    (cp0_yy_machine_mode_aft_dbg   ),
  .cp0_yy_priv_mode               (cp0_yy_priv_mode              ),
  .cpu_clic_curid                 (cpu_clic_curid                ),
  .cpu_clic_int_exit              (cpu_clic_int_exit             ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .had_iu_force_dbg_en            (had_iu_force_dbg_en           ),
  .had_yy_xx_dbg                  (had_yy_xx_dbg                 ),
  .ifu_cp0_lpmd_ack               (ifu_cp0_lpmd_ack              ),
  .iu_cp0_ecall                   (iu_cp0_ecall                  ),
  .iu_cp0_epc                     (iu_cp0_epc                    ),
  .iu_cp0_epc_update              (iu_cp0_epc_update             ),
  .iu_cp0_ex_csrrc                (iu_cp0_ex_csrrc               ),
  .iu_cp0_ex_csrrci               (iu_cp0_ex_csrrci              ),
  .iu_cp0_ex_csrrs                (iu_cp0_ex_csrrs               ),
  .iu_cp0_ex_csrrsi               (iu_cp0_ex_csrrsi              ),
  .iu_cp0_ex_csrrw                (iu_cp0_ex_csrrw               ),
  .iu_cp0_ex_csrrwi               (iu_cp0_ex_csrrwi              ),
  .iu_cp0_ex_data_sel             (iu_cp0_ex_data_sel            ),
  .iu_cp0_ex_func3                (iu_cp0_ex_func3               ),
  .iu_cp0_ex_mret                 (iu_cp0_ex_mret                ),
  .iu_cp0_ex_rd_reg               (iu_cp0_ex_rd_reg              ),
  .iu_cp0_ex_rs1_reg              (iu_cp0_ex_rs1_reg             ),
  .iu_cp0_ex_sel                  (iu_cp0_ex_sel                 ),
  .iu_cp0_ex_wfi                  (iu_cp0_ex_wfi                 ),
  .iu_cp0_expt_tval               (iu_cp0_expt_tval              ),
  .iu_cp0_expt_vld                (iu_cp0_expt_vld               ),
  .iu_cp0_imm                     (iu_cp0_imm                    ),
  .iu_cp0_int_vld                 (iu_cp0_int_vld                ),
  .iu_cp0_lp_wk_int               (iu_cp0_lp_wk_int              ),
  .iu_cp0_mtval_updt_vld          (iu_cp0_mtval_updt_vld         ),
  .iu_cp0_nt_int_pending_vld      (iu_cp0_nt_int_pending_vld     ),
  .iu_cp0_oper_mux_en             (iu_cp0_oper_mux_en            ),
  .iu_cp0_rs1                     (iu_cp0_rs1                    ),
  .iu_cp0_syc_rst_b               (iu_cp0_syc_rst_b              ),
  .iu_yy_xx_dbgon                 (iu_yy_xx_dbgon                ),
  .iu_yy_xx_expt_vec              (iu_yy_xx_expt_vec             ),
  .iu_yy_xx_flush                 (iu_yy_xx_flush                ),
  .iu_yy_xx_int_hv                (iu_yy_xx_int_hv               ),
  .iu_yy_xx_int_il                (iu_yy_xx_int_il               ),
  .iu_yy_xx_int_pending_hv        (iu_yy_xx_int_pending_hv       ),
  .iu_yy_xx_int_pending_id        (iu_yy_xx_int_pending_id       ),
  .iu_yy_xx_int_pending_il        (iu_yy_xx_int_pending_il       ),
  .iu_yy_xx_int_pending_priv      (iu_yy_xx_int_pending_priv     ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .sysio_cp0_bigend               (sysio_cp0_bigend              ),
  .sysio_cp0_clkratio             (sysio_cp0_clkratio            ),
  .sysio_cp0_endian_v2            (sysio_cp0_endian_v2           ),
  .sysio_cp0_sys_view_lpmd_b      (sysio_cp0_sys_view_lpmd_b     ),
  .vector_cp0_vec_err             (vector_cp0_vec_err            ),
  .vector_cp0_vec_err_epc         (vector_cp0_vec_err_epc        ),
  .vector_cp0_vec_succeed         (vector_cp0_vec_succeed        )
);
endmodule
