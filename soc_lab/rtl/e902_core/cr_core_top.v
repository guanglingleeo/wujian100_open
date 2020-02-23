/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_core_top(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  biu_pad_vec_redrct,
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_chk_fail,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_write,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clk_en,
  cp0_had_cpuid_idx0,
  cp0_had_int_exit,
  cp0_had_lpmd_b,
  cp0_had_mcause_data,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pad_psr,
  cp0_yy_be_v2,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpu_pad_dfs_ack,
  cpurst_b,
  forever_cpuclk,
  had_core_dbg_mode_req,
  had_core_exit_dbg,
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
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  iahbl_pad_vec_redrct,
  ifu_had_chg_flw_inst,
  ifu_had_fetch_expt_vld,
  ifu_had_inst_dbg_disable,
  ifu_had_match_pc,
  ifu_had_split_first,
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
  iu_yy_xx_dbgon,
  lsu_had_addr,
  lsu_had_addr_vld,
  lsu_had_ex_cmplt,
  lsu_had_st,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_iahbl_hrdata,
  pad_iahbl_hready,
  pad_iahbl_hresp,
  pad_sysio_bigend_b,
  pad_sysio_clkratio,
  pad_sysio_endian_v2,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pwrm_cpu_bus_peak_power_limit_en,
  sysio_pad_dbg_b,
  sysio_pad_ipend_b,
  sysio_pad_lpmd_b,
  sysio_pad_srst,
  sysio_pad_wakeup_b,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_data_vld,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_data_vld,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt
);
input           clic_cpu_int_hv;                     
input   [9 :0]  clic_cpu_int_id;                     
input   [7 :0]  clic_cpu_int_il;                     
input   [1 :0]  clic_cpu_int_priv;                   
input           clk_en;                              
input           cpurst_b;                            
input           forever_cpuclk;                      
input           had_core_dbg_mode_req;               
input           had_core_exit_dbg;                   
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
input   [31:0]  pad_biu_hrdata;                      
input           pad_biu_hready;                      
input           pad_biu_hresp;                       
input   [11:0]  pad_bmu_iahbl_base;                  
input   [11:0]  pad_bmu_iahbl_mask;                  
input           pad_cpu_dfs_req;                     
input           pad_cpu_ext_int_b;                   
input   [31:0]  pad_iahbl_hrdata;                    
input           pad_iahbl_hready;                    
input           pad_iahbl_hresp;                     
input           pad_sysio_bigend_b;                  
input   [2 :0]  pad_sysio_clkratio;                  
input           pad_sysio_endian_v2;                 
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
input           pwrm_cpu_bus_peak_power_limit_en;    
input           tcipif_bmu_dbus_acc_err;             
input   [31:0]  tcipif_bmu_dbus_data;                
input           tcipif_bmu_dbus_data_vld;            
input           tcipif_bmu_dbus_grnt;                
input           tcipif_bmu_dbus_trans_cmplt;         
input           tcipif_bmu_ibus_acc_err;             
input   [31:0]  tcipif_bmu_ibus_data;                
input           tcipif_bmu_ibus_data_vld;            
input           tcipif_bmu_ibus_grnt;                
input           tcipif_bmu_ibus_trans_cmplt;         
output  [31:0]  biu_pad_haddr;                       
output  [2 :0]  biu_pad_hburst;                      
output  [3 :0]  biu_pad_hprot;                       
output  [2 :0]  biu_pad_hsize;                       
output  [1 :0]  biu_pad_htrans;                      
output  [31:0]  biu_pad_hwdata;                      
output          biu_pad_hwrite;                      
output          biu_pad_vec_redrct;                  
output          bmu_tcipif_dbus_acc_deny;            
output  [31:0]  bmu_tcipif_dbus_addr;                
output          bmu_tcipif_dbus_chk_fail;            
output          bmu_tcipif_dbus_req;                 
output  [1 :0]  bmu_tcipif_dbus_size;                
output          bmu_tcipif_dbus_supv_mode;           
output  [31:0]  bmu_tcipif_dbus_wdata;               
output          bmu_tcipif_dbus_write;               
output          bmu_tcipif_ibus_acc_deny;            
output  [31:0]  bmu_tcipif_ibus_addr;                
output          bmu_tcipif_ibus_req;                 
output          bmu_tcipif_ibus_write;               
output  [31:0]  cp0_had_cpuid_idx0;                  
output          cp0_had_int_exit;                    
output  [1 :0]  cp0_had_lpmd_b;                      
output  [31:0]  cp0_had_mcause_data;                 
output  [31:0]  cp0_pad_mintstatus;                  
output  [31:0]  cp0_pad_mstatus;                     
output  [31:0]  cp0_pad_psr;                         
output          cp0_yy_be_v2;                        
output  [9 :0]  cpu_clic_curid;                      
output          cpu_clic_int_exit;                   
output          cpu_pad_dfs_ack;                     
output  [31:0]  iahbl_pad_haddr;                     
output  [2 :0]  iahbl_pad_hburst;                    
output  [3 :0]  iahbl_pad_hprot;                     
output  [2 :0]  iahbl_pad_hsize;                     
output  [1 :0]  iahbl_pad_htrans;                    
output  [31:0]  iahbl_pad_hwdata;                    
output          iahbl_pad_hwrite;                    
output          iahbl_pad_vec_redrct;                
output          ifu_had_chg_flw_inst;                
output          ifu_had_fetch_expt_vld;              
output          ifu_had_inst_dbg_disable;            
output  [31:0]  ifu_had_match_pc;                    
output          ifu_had_split_first;                 
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
output          iu_yy_xx_dbgon;                      
output  [31:0]  lsu_had_addr;                        
output          lsu_had_addr_vld;                    
output          lsu_had_ex_cmplt;                    
output          lsu_had_st;                          
output          sysio_pad_dbg_b;                     
output          sysio_pad_ipend_b;                   
output  [1 :0]  sysio_pad_lpmd_b;                    
output          sysio_pad_srst;                      
output          sysio_pad_wakeup_b;                  
reg             pad_cpu_halt_ff1;                    
reg             pad_cpu_halt_ff2;                    
wire            biu_bmu_dbus_acc_err;                
wire    [31:0]  biu_bmu_dbus_data;                   
wire            biu_bmu_dbus_data_vld;               
wire            biu_bmu_dbus_grnt;                   
wire            biu_bmu_dbus_trans_cmplt;            
wire            biu_bmu_ibus_acc_err;                
wire    [31:0]  biu_bmu_ibus_data;                   
wire            biu_bmu_ibus_data_vld;               
wire            biu_bmu_ibus_grnt;                   
wire            biu_bmu_ibus_trans_cmplt;            
wire    [31:0]  biu_pad_haddr;                       
wire    [2 :0]  biu_pad_hburst;                      
wire    [3 :0]  biu_pad_hprot;                       
wire    [2 :0]  biu_pad_hsize;                       
wire    [1 :0]  biu_pad_htrans;                      
wire    [31:0]  biu_pad_hwdata;                      
wire            biu_pad_hwrite;                      
wire            biu_pad_vec_redrct;                  
wire            bmu_biu_dbus_acc_deny;               
wire    [31:0]  bmu_biu_dbus_addr;                   
wire            bmu_biu_dbus_chk_fail;               
wire    [3 :0]  bmu_biu_dbus_prot;                   
wire            bmu_biu_dbus_req;                    
wire            bmu_biu_dbus_req_without_cmplt;      
wire    [1 :0]  bmu_biu_dbus_size;                   
wire    [31:0]  bmu_biu_dbus_wdata;                  
wire            bmu_biu_dbus_write;                  
wire            bmu_biu_ibus_acc_deny;               
wire    [31:0]  bmu_biu_ibus_addr;                   
wire            bmu_biu_ibus_hit;                    
wire    [3 :0]  bmu_biu_ibus_prot;                   
wire            bmu_biu_ibus_req;                    
wire            bmu_biu_ibus_req_no_hit;             
wire    [1 :0]  bmu_biu_ibus_size;                   
wire            bmu_biu_ibus_vec_redirect;           
wire            bmu_iahbl_dbus_acc_deny;             
wire    [31:0]  bmu_iahbl_dbus_addr;                 
wire            bmu_iahbl_dbus_chk_fail;             
wire    [3 :0]  bmu_iahbl_dbus_prot;                 
wire            bmu_iahbl_dbus_req;                  
wire            bmu_iahbl_dbus_req_without_cmplt;    
wire    [1 :0]  bmu_iahbl_dbus_size;                 
wire    [31:0]  bmu_iahbl_dbus_wdata;                
wire            bmu_iahbl_dbus_write;                
wire            bmu_iahbl_ibus_acc_deny;             
wire    [31:0]  bmu_iahbl_ibus_addr;                 
wire            bmu_iahbl_ibus_hit;                  
wire    [3 :0]  bmu_iahbl_ibus_prot;                 
wire            bmu_iahbl_ibus_req;                  
wire            bmu_iahbl_ibus_req_no_hit;           
wire    [1 :0]  bmu_iahbl_ibus_size;                 
wire            bmu_iahbl_ibus_vec_redirect;         
wire            bmu_lsu_acc_err;                     
wire            bmu_lsu_bstack_chk_fail;             
wire    [31:0]  bmu_lsu_data;                        
wire            bmu_lsu_data_vld;                    
wire            bmu_lsu_grnt;                        
wire            bmu_lsu_trans_cmplt;                 
wire            bmu_tcipif_dbus_acc_deny;            
wire    [31:0]  bmu_tcipif_dbus_addr;                
wire            bmu_tcipif_dbus_chk_fail;            
wire            bmu_tcipif_dbus_req;                 
wire    [1 :0]  bmu_tcipif_dbus_size;                
wire            bmu_tcipif_dbus_supv_mode;           
wire    [31:0]  bmu_tcipif_dbus_wdata;               
wire            bmu_tcipif_dbus_write;               
wire            bmu_tcipif_ibus_acc_deny;            
wire    [31:0]  bmu_tcipif_ibus_addr;                
wire            bmu_tcipif_ibus_req;                 
wire            bmu_tcipif_ibus_write;               
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
wire    [31:0]  cp0_pad_mintstatus;                  
wire    [31:0]  cp0_pad_mstatus;                     
wire    [31:0]  cp0_pad_psr;                         
wire            cp0_sysio_ipend_b;                   
wire    [1 :0]  cp0_sysio_lpmd_b;                    
wire            cp0_yy_be_v2;                        
wire            cp0_yy_clk_en;                       
wire            cp0_yy_machine_mode_aft_dbg;         
wire    [9 :0]  cpu_clic_curid;                      
wire            cpu_clic_int_exit;                   
wire            cpu_pad_dfs_ack;                     
wire            cpurst_b;                            
wire            dahblif_other_mask;                  
wire            dbus_idle;                           
wire            forever_cpuclk;                      
wire            had_core_dbg_mode_req;               
wire            had_core_exit_dbg;                   
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
wire            iahbl_bmu_dbus_acc_err;              
wire    [31:0]  iahbl_bmu_dbus_data;                 
wire            iahbl_bmu_dbus_data_vld;             
wire            iahbl_bmu_dbus_grnt;                 
wire            iahbl_bmu_dbus_trans_cmplt;          
wire            iahbl_bmu_ibus_acc_err;              
wire    [31:0]  iahbl_bmu_ibus_data;                 
wire            iahbl_bmu_ibus_data_vld;             
wire            iahbl_bmu_ibus_grnt;                 
wire            iahbl_bmu_ibus_trans_cmplt;          
wire    [31:0]  iahbl_pad_haddr;                     
wire    [2 :0]  iahbl_pad_hburst;                    
wire    [3 :0]  iahbl_pad_hprot;                     
wire    [2 :0]  iahbl_pad_hsize;                     
wire    [1 :0]  iahbl_pad_htrans;                    
wire    [31:0]  iahbl_pad_hwdata;                    
wire            iahbl_pad_hwrite;                    
wire            iahbl_pad_vec_redrct;                
wire            iahblif_other_mask;                  
wire            ibus_idle;                           
wire    [31:0]  ifu_bmu_addr;                        
wire            ifu_bmu_idle;                        
wire    [3 :0]  ifu_bmu_prot;                        
wire            ifu_bmu_req;                         
wire            ifu_bmu_wfd1;                        
wire            ifu_had_chg_flw_inst;                
wire            ifu_had_fetch_expt_vld;              
wire            ifu_had_inst_dbg_disable;            
wire    [31:0]  ifu_had_match_pc;                    
wire            ifu_had_split_first;                 
wire            iu_bmu_vec_redirect;                 
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
wire    [31:0]  iu_pad_gpr_data;                     
wire    [4 :0]  iu_pad_gpr_index;                    
wire            iu_pad_gpr_we;                       
wire            iu_pad_inst_retire;                  
wire            iu_pad_inst_split;                   
wire    [31:0]  iu_pad_retire_pc;                    
wire            iu_sys_lp_wk_int;                    
wire            iu_sysyio_soft_rst;                  
wire            iu_yy_xx_dbgon;                      
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
wire    [31:0]  pad_biu_hrdata;                      
wire            pad_biu_hready;                      
wire            pad_biu_hresp;                       
wire    [11:0]  pad_bmu_iahbl_base;                  
wire    [11:0]  pad_bmu_iahbl_mask;                  
wire            pad_cpu_dfs_req;                     
wire            pad_cpu_ext_int_b;                   
wire    [31:0]  pad_iahbl_hrdata;                    
wire            pad_iahbl_hready;                    
wire            pad_iahbl_hresp;                     
wire            pad_sysio_bigend_b;                  
wire    [2 :0]  pad_sysio_clkratio;                  
wire            pad_sysio_endian_v2;                 
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire            pwrm_cpu_bus_peak_power_limit_en;    
wire            sahblif_iahblif_mask;                
wire            sbus_idle;                           
wire            sysio_cp0_bigend;                    
wire    [2 :0]  sysio_cp0_clkratio;                  
wire            sysio_cp0_endian_v2;                 
wire    [1 :0]  sysio_cp0_sys_view_lpmd_b;           
wire            sysio_pad_dbg_b;                     
wire            sysio_pad_ipend_b;                   
wire    [1 :0]  sysio_pad_lpmd_b;                    
wire            sysio_pad_srst;                      
wire            sysio_pad_wakeup_b;                  
wire            tcipif_bmu_dbus_acc_err;             
wire    [31:0]  tcipif_bmu_dbus_data;                
wire            tcipif_bmu_dbus_data_vld;            
wire            tcipif_bmu_dbus_grnt;                
wire            tcipif_bmu_dbus_trans_cmplt;         
wire            tcipif_bmu_ibus_acc_err;             
wire    [31:0]  tcipif_bmu_ibus_data;                
wire            tcipif_bmu_ibus_data_vld;            
wire            tcipif_bmu_ibus_grnt;                
wire            tcipif_bmu_ibus_trans_cmplt;         
cr_core  x_cr_core (
  .bmu_lsu_acc_err                      (bmu_lsu_acc_err                     ),
  .bmu_lsu_bstack_chk_fail              (bmu_lsu_bstack_chk_fail             ),
  .bmu_lsu_data                         (bmu_lsu_data                        ),
  .bmu_lsu_data_vld                     (bmu_lsu_data_vld                    ),
  .bmu_lsu_grnt                         (bmu_lsu_grnt                        ),
  .bmu_lsu_trans_cmplt                  (bmu_lsu_trans_cmplt                 ),
  .bmu_xx_ibus_acc_err                  (bmu_xx_ibus_acc_err                 ),
  .bmu_xx_ibus_data                     (bmu_xx_ibus_data                    ),
  .bmu_xx_ibus_data_vld                 (bmu_xx_ibus_data_vld                ),
  .bmu_xx_ibus_grnt                     (bmu_xx_ibus_grnt                    ),
  .bmu_xx_ibus_trans_cmplt              (bmu_xx_ibus_trans_cmplt             ),
  .cache_cp0_lpmd_ack                   (cache_cp0_lpmd_ack                  ),
  .clic_cpu_int_hv                      (clic_cpu_int_hv                     ),
  .clic_cpu_int_id                      (clic_cpu_int_id                     ),
  .clic_cpu_int_il                      (clic_cpu_int_il                     ),
  .clic_cpu_int_priv                    (clic_cpu_int_priv                   ),
  .clk_en                               (clk_en                              ),
  .cp0_cache_lpmd_req                   (cp0_cache_lpmd_req                  ),
  .cp0_had_cpuid_idx0                   (cp0_had_cpuid_idx0                  ),
  .cp0_had_int_exit                     (cp0_had_int_exit                    ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_mcause_data                  (cp0_had_mcause_data                 ),
  .cp0_pad_mintstatus                   (cp0_pad_mintstatus                  ),
  .cp0_pad_mstatus                      (cp0_pad_mstatus                     ),
  .cp0_pad_psr                          (cp0_pad_psr                         ),
  .cp0_sysio_ipend_b                    (cp0_sysio_ipend_b                   ),
  .cp0_sysio_lpmd_b                     (cp0_sysio_lpmd_b                    ),
  .cp0_yy_be_v2                         (cp0_yy_be_v2                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cp0_yy_machine_mode_aft_dbg          (cp0_yy_machine_mode_aft_dbg         ),
  .cpu_clic_curid                       (cpu_clic_curid                      ),
  .cpu_clic_int_exit                    (cpu_clic_int_exit                   ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_core_dbg_mode_req                (had_core_dbg_mode_req               ),
  .had_idu_wbbr_data                    (had_idu_wbbr_data                   ),
  .had_idu_wbbr_vld                     (had_idu_wbbr_vld                    ),
  .had_ifu_inst_bkpt_dbq_req            (had_ifu_inst_bkpt_dbq_req           ),
  .had_ifu_inst_bkpt_dbqexp_req         (had_ifu_inst_bkpt_dbqexp_req        ),
  .had_ifu_ir                           (had_ifu_ir                          ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .had_iu_bkpt_trace_en                 (had_iu_bkpt_trace_en                ),
  .had_iu_dr_set_req                    (had_iu_dr_set_req                   ),
  .had_iu_force_dbg_en                  (had_iu_force_dbg_en                 ),
  .had_iu_int_vld                       (had_iu_int_vld                      ),
  .had_iu_mbkpt_fsm_index_mbee          (had_iu_mbkpt_fsm_index_mbee         ),
  .had_iu_mem_bkpt_exp_req              (had_iu_mem_bkpt_exp_req             ),
  .had_iu_mem_bkpt_mask                 (had_iu_mem_bkpt_mask                ),
  .had_iu_mem_bkpt_req                  (had_iu_mem_bkpt_req                 ),
  .had_iu_pc                            (had_iu_pc                           ),
  .had_iu_rte_pc_sel                    (had_iu_rte_pc_sel                   ),
  .had_iu_trace_req                     (had_iu_trace_req                    ),
  .had_iu_trace_req_for_dbg_disable     (had_iu_trace_req_for_dbg_disable    ),
  .had_iu_xx_fdb                        (had_iu_xx_fdb                       ),
  .had_iu_xx_jdbreq                     (had_iu_xx_jdbreq                    ),
  .had_yy_xx_dbg                        (had_yy_xx_dbg                       ),
  .had_yy_xx_dp_index_mbee              (had_yy_xx_dp_index_mbee             ),
  .had_yy_xx_exit_dbg                   (had_core_exit_dbg                   ),
  .ifu_bmu_addr                         (ifu_bmu_addr                        ),
  .ifu_bmu_idle                         (ifu_bmu_idle                        ),
  .ifu_bmu_prot                         (ifu_bmu_prot                        ),
  .ifu_bmu_req                          (ifu_bmu_req                         ),
  .ifu_bmu_wfd1                         (ifu_bmu_wfd1                        ),
  .ifu_had_chg_flw_inst                 (ifu_had_chg_flw_inst                ),
  .ifu_had_fetch_expt_vld               (ifu_had_fetch_expt_vld              ),
  .ifu_had_inst_dbg_disable             (ifu_had_inst_dbg_disable            ),
  .ifu_had_match_pc                     (ifu_had_match_pc                    ),
  .ifu_had_split_first                  (ifu_had_split_first                 ),
  .iu_bmu_vec_redirect                  (iu_bmu_vec_redirect                 ),
  .iu_had_adr_dbg_ack                   (iu_had_adr_dbg_ack                  ),
  .iu_had_chgflw_dst_pc                 (iu_had_chgflw_dst_pc                ),
  .iu_had_chgflw_vld                    (iu_had_chgflw_vld                   ),
  .iu_had_data_bkpt_occur_vld           (iu_had_data_bkpt_occur_vld          ),
  .iu_had_dbg_disable_for_tee           (iu_had_dbg_disable_for_tee          ),
  .iu_had_dr_dbg_ack                    (iu_had_dr_dbg_ack                   ),
  .iu_had_expt_vld                      (iu_had_expt_vld                     ),
  .iu_had_fast_retire_acc_err_pc_update (iu_had_fast_retire_acc_err_pc_update),
  .iu_had_fast_retire_acc_err_pc_val    (iu_had_fast_retire_acc_err_pc_val   ),
  .iu_had_flush                         (iu_had_flush                        ),
  .iu_had_inst_bkpt_occur_vld           (iu_had_inst_bkpt_occur_vld          ),
  .iu_had_int_ack                       (iu_had_int_ack                      ),
  .iu_had_retire_with_had_int           (iu_had_retire_with_had_int          ),
  .iu_had_trace_occur_vld               (iu_had_trace_occur_vld              ),
  .iu_had_xx_bkpt_inst                  (iu_had_xx_bkpt_inst                 ),
  .iu_had_xx_data                       (iu_had_xx_data                      ),
  .iu_had_xx_data_vld                   (iu_had_xx_data_vld                  ),
  .iu_had_xx_dbg_ack                    (iu_had_xx_dbg_ack                   ),
  .iu_had_xx_mldst                      (iu_had_xx_mldst                     ),
  .iu_had_xx_retire                     (iu_had_xx_retire                    ),
  .iu_had_xx_retire_normal              (iu_had_xx_retire_normal             ),
  .iu_had_xx_retire_pc                  (iu_had_xx_retire_pc                 ),
  .iu_pad_gpr_data                      (iu_pad_gpr_data                     ),
  .iu_pad_gpr_index                     (iu_pad_gpr_index                    ),
  .iu_pad_gpr_we                        (iu_pad_gpr_we                       ),
  .iu_pad_inst_retire                   (iu_pad_inst_retire                  ),
  .iu_pad_inst_split                    (iu_pad_inst_split                   ),
  .iu_pad_retire_pc                     (iu_pad_retire_pc                    ),
  .iu_sys_lp_wk_int                     (iu_sys_lp_wk_int                    ),
  .iu_sysyio_soft_rst                   (iu_sysyio_soft_rst                  ),
  .iu_yy_xx_dbgon                       (iu_yy_xx_dbgon                      ),
  .lsu_bmu_addr                         (lsu_bmu_addr                        ),
  .lsu_bmu_addr_check_fail              (lsu_bmu_addr_check_fail             ),
  .lsu_bmu_idle                         (lsu_bmu_idle                        ),
  .lsu_bmu_prot                         (lsu_bmu_prot                        ),
  .lsu_bmu_req                          (lsu_bmu_req                         ),
  .lsu_bmu_req_without_cmplt            (lsu_bmu_req_without_cmplt           ),
  .lsu_bmu_sg_chk_fail                  (lsu_bmu_sg_chk_fail                 ),
  .lsu_bmu_size                         (lsu_bmu_size                        ),
  .lsu_bmu_store_error                  (lsu_bmu_store_error                 ),
  .lsu_bmu_wdata                        (lsu_bmu_wdata                       ),
  .lsu_bmu_wfd1                         (lsu_bmu_wfd1                        ),
  .lsu_bmu_write                        (lsu_bmu_write                       ),
  .lsu_had_addr                         (lsu_had_addr                        ),
  .lsu_had_addr_vld                     (lsu_had_addr_vld                    ),
  .lsu_had_ex_cmplt                     (lsu_had_ex_cmplt                    ),
  .lsu_had_st                           (lsu_had_st                          ),
  .pad_cpu_ext_int_b                    (pad_cpu_ext_int_b                   ),
  .pad_yy_gate_clk_en_b                 (pad_yy_gate_clk_en_b                ),
  .pad_yy_test_mode                     (pad_yy_test_mode                    ),
  .sysio_cp0_bigend                     (sysio_cp0_bigend                    ),
  .sysio_cp0_clkratio                   (sysio_cp0_clkratio                  ),
  .sysio_cp0_endian_v2                  (sysio_cp0_endian_v2                 ),
  .sysio_cp0_sys_view_lpmd_b            (sysio_cp0_sys_view_lpmd_b           )
);
cr_bmu_top  x_cr_bmu_top (
  .biu_bmu_dbus_acc_err             (biu_bmu_dbus_acc_err            ),
  .biu_bmu_dbus_data                (biu_bmu_dbus_data               ),
  .biu_bmu_dbus_data_vld            (biu_bmu_dbus_data_vld           ),
  .biu_bmu_dbus_grnt                (biu_bmu_dbus_grnt               ),
  .biu_bmu_dbus_trans_cmplt         (biu_bmu_dbus_trans_cmplt        ),
  .biu_bmu_ibus_acc_err             (biu_bmu_ibus_acc_err            ),
  .biu_bmu_ibus_data                (biu_bmu_ibus_data               ),
  .biu_bmu_ibus_data_vld            (biu_bmu_ibus_data_vld           ),
  .biu_bmu_ibus_grnt                (biu_bmu_ibus_grnt               ),
  .biu_bmu_ibus_trans_cmplt         (biu_bmu_ibus_trans_cmplt        ),
  .bmu_biu_dbus_acc_deny            (bmu_biu_dbus_acc_deny           ),
  .bmu_biu_dbus_addr                (bmu_biu_dbus_addr               ),
  .bmu_biu_dbus_chk_fail            (bmu_biu_dbus_chk_fail           ),
  .bmu_biu_dbus_prot                (bmu_biu_dbus_prot               ),
  .bmu_biu_dbus_req                 (bmu_biu_dbus_req                ),
  .bmu_biu_dbus_req_without_cmplt   (bmu_biu_dbus_req_without_cmplt  ),
  .bmu_biu_dbus_size                (bmu_biu_dbus_size               ),
  .bmu_biu_dbus_wdata               (bmu_biu_dbus_wdata              ),
  .bmu_biu_dbus_write               (bmu_biu_dbus_write              ),
  .bmu_biu_ibus_acc_deny            (bmu_biu_ibus_acc_deny           ),
  .bmu_biu_ibus_addr                (bmu_biu_ibus_addr               ),
  .bmu_biu_ibus_hit                 (bmu_biu_ibus_hit                ),
  .bmu_biu_ibus_prot                (bmu_biu_ibus_prot               ),
  .bmu_biu_ibus_req                 (bmu_biu_ibus_req                ),
  .bmu_biu_ibus_req_no_hit          (bmu_biu_ibus_req_no_hit         ),
  .bmu_biu_ibus_size                (bmu_biu_ibus_size               ),
  .bmu_biu_ibus_vec_redirect        (bmu_biu_ibus_vec_redirect       ),
  .bmu_iahbl_dbus_acc_deny          (bmu_iahbl_dbus_acc_deny         ),
  .bmu_iahbl_dbus_addr              (bmu_iahbl_dbus_addr             ),
  .bmu_iahbl_dbus_chk_fail          (bmu_iahbl_dbus_chk_fail         ),
  .bmu_iahbl_dbus_prot              (bmu_iahbl_dbus_prot             ),
  .bmu_iahbl_dbus_req               (bmu_iahbl_dbus_req              ),
  .bmu_iahbl_dbus_req_without_cmplt (bmu_iahbl_dbus_req_without_cmplt),
  .bmu_iahbl_dbus_size              (bmu_iahbl_dbus_size             ),
  .bmu_iahbl_dbus_wdata             (bmu_iahbl_dbus_wdata            ),
  .bmu_iahbl_dbus_write             (bmu_iahbl_dbus_write            ),
  .bmu_iahbl_ibus_acc_deny          (bmu_iahbl_ibus_acc_deny         ),
  .bmu_iahbl_ibus_addr              (bmu_iahbl_ibus_addr             ),
  .bmu_iahbl_ibus_hit               (bmu_iahbl_ibus_hit              ),
  .bmu_iahbl_ibus_prot              (bmu_iahbl_ibus_prot             ),
  .bmu_iahbl_ibus_req               (bmu_iahbl_ibus_req              ),
  .bmu_iahbl_ibus_req_no_hit        (bmu_iahbl_ibus_req_no_hit       ),
  .bmu_iahbl_ibus_size              (bmu_iahbl_ibus_size             ),
  .bmu_iahbl_ibus_vec_redirect      (bmu_iahbl_ibus_vec_redirect     ),
  .bmu_lsu_acc_err                  (bmu_lsu_acc_err                 ),
  .bmu_lsu_bstack_chk_fail          (bmu_lsu_bstack_chk_fail         ),
  .bmu_lsu_data                     (bmu_lsu_data                    ),
  .bmu_lsu_data_vld                 (bmu_lsu_data_vld                ),
  .bmu_lsu_grnt                     (bmu_lsu_grnt                    ),
  .bmu_lsu_trans_cmplt              (bmu_lsu_trans_cmplt             ),
  .bmu_tcipif_dbus_acc_deny         (bmu_tcipif_dbus_acc_deny        ),
  .bmu_tcipif_dbus_addr             (bmu_tcipif_dbus_addr            ),
  .bmu_tcipif_dbus_chk_fail         (bmu_tcipif_dbus_chk_fail        ),
  .bmu_tcipif_dbus_req              (bmu_tcipif_dbus_req             ),
  .bmu_tcipif_dbus_size             (bmu_tcipif_dbus_size            ),
  .bmu_tcipif_dbus_supv_mode        (bmu_tcipif_dbus_supv_mode       ),
  .bmu_tcipif_dbus_wdata            (bmu_tcipif_dbus_wdata           ),
  .bmu_tcipif_dbus_write            (bmu_tcipif_dbus_write           ),
  .bmu_tcipif_ibus_acc_deny         (bmu_tcipif_ibus_acc_deny        ),
  .bmu_tcipif_ibus_addr             (bmu_tcipif_ibus_addr            ),
  .bmu_tcipif_ibus_req              (bmu_tcipif_ibus_req             ),
  .bmu_tcipif_ibus_write            (bmu_tcipif_ibus_write           ),
  .bmu_xx_ibus_acc_err              (bmu_xx_ibus_acc_err             ),
  .bmu_xx_ibus_data                 (bmu_xx_ibus_data                ),
  .bmu_xx_ibus_data_vld             (bmu_xx_ibus_data_vld            ),
  .bmu_xx_ibus_grnt                 (bmu_xx_ibus_grnt                ),
  .bmu_xx_ibus_trans_cmplt          (bmu_xx_ibus_trans_cmplt         ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cp0_yy_machine_mode_aft_dbg      (cp0_yy_machine_mode_aft_dbg     ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .iahbl_bmu_dbus_acc_err           (iahbl_bmu_dbus_acc_err          ),
  .iahbl_bmu_dbus_data              (iahbl_bmu_dbus_data             ),
  .iahbl_bmu_dbus_data_vld          (iahbl_bmu_dbus_data_vld         ),
  .iahbl_bmu_dbus_grnt              (iahbl_bmu_dbus_grnt             ),
  .iahbl_bmu_dbus_trans_cmplt       (iahbl_bmu_dbus_trans_cmplt      ),
  .iahbl_bmu_ibus_acc_err           (iahbl_bmu_ibus_acc_err          ),
  .iahbl_bmu_ibus_data              (iahbl_bmu_ibus_data             ),
  .iahbl_bmu_ibus_data_vld          (iahbl_bmu_ibus_data_vld         ),
  .iahbl_bmu_ibus_grnt              (iahbl_bmu_ibus_grnt             ),
  .iahbl_bmu_ibus_trans_cmplt       (iahbl_bmu_ibus_trans_cmplt      ),
  .ifu_bmu_addr                     (ifu_bmu_addr                    ),
  .ifu_bmu_idle                     (ifu_bmu_idle                    ),
  .ifu_bmu_prot                     (ifu_bmu_prot                    ),
  .ifu_bmu_req                      (ifu_bmu_req                     ),
  .ifu_bmu_wfd1                     (ifu_bmu_wfd1                    ),
  .iu_bmu_vec_redirect              (iu_bmu_vec_redirect             ),
  .lsu_bmu_addr                     (lsu_bmu_addr                    ),
  .lsu_bmu_addr_check_fail          (lsu_bmu_addr_check_fail         ),
  .lsu_bmu_idle                     (lsu_bmu_idle                    ),
  .lsu_bmu_prot                     (lsu_bmu_prot                    ),
  .lsu_bmu_req                      (lsu_bmu_req                     ),
  .lsu_bmu_req_without_cmplt        (lsu_bmu_req_without_cmplt       ),
  .lsu_bmu_sg_chk_fail              (lsu_bmu_sg_chk_fail             ),
  .lsu_bmu_size                     (lsu_bmu_size                    ),
  .lsu_bmu_store_error              (lsu_bmu_store_error             ),
  .lsu_bmu_wdata                    (lsu_bmu_wdata                   ),
  .lsu_bmu_wfd1                     (lsu_bmu_wfd1                    ),
  .lsu_bmu_write                    (lsu_bmu_write                   ),
  .pad_bmu_iahbl_base               (pad_bmu_iahbl_base              ),
  .pad_bmu_iahbl_mask               (pad_bmu_iahbl_mask              ),
  .pad_yy_gate_clk_en_b             (pad_yy_gate_clk_en_b            ),
  .pad_yy_test_mode                 (pad_yy_test_mode                ),
  .tcipif_bmu_dbus_acc_err          (tcipif_bmu_dbus_acc_err         ),
  .tcipif_bmu_dbus_data             (tcipif_bmu_dbus_data            ),
  .tcipif_bmu_dbus_data_vld         (tcipif_bmu_dbus_data_vld        ),
  .tcipif_bmu_dbus_grnt             (tcipif_bmu_dbus_grnt            ),
  .tcipif_bmu_dbus_trans_cmplt      (tcipif_bmu_dbus_trans_cmplt     ),
  .tcipif_bmu_ibus_acc_err          (tcipif_bmu_ibus_acc_err         ),
  .tcipif_bmu_ibus_data             (tcipif_bmu_ibus_data            ),
  .tcipif_bmu_ibus_data_vld         (tcipif_bmu_ibus_data_vld        ),
  .tcipif_bmu_ibus_grnt             (tcipif_bmu_ibus_grnt            ),
  .tcipif_bmu_ibus_trans_cmplt      (tcipif_bmu_ibus_trans_cmplt     )
);
assign cache_cp0_lpmd_ack =1'b1;
always @ (posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pad_cpu_halt_ff1 <= 1'b0;
    pad_cpu_halt_ff2 <= 1'b0;
  end
  else
  begin
    pad_cpu_halt_ff1 <= pad_cpu_dfs_req;
    pad_cpu_halt_ff2 <= pad_cpu_halt_ff1;
  end
end
assign cpu_pad_dfs_ack = ibus_idle && dbus_idle && sbus_idle
                       && pad_cpu_halt_ff2;
cr_sahbl_top  x_cr_sahbl_top (
  .ahblif_idle                      (sbus_idle                       ),
  .biu_bmu_dbus_acc_err             (biu_bmu_dbus_acc_err            ),
  .biu_bmu_dbus_data                (biu_bmu_dbus_data               ),
  .biu_bmu_dbus_data_vld            (biu_bmu_dbus_data_vld           ),
  .biu_bmu_dbus_grnt                (biu_bmu_dbus_grnt               ),
  .biu_bmu_dbus_trans_cmplt         (biu_bmu_dbus_trans_cmplt        ),
  .biu_bmu_ibus_acc_err             (biu_bmu_ibus_acc_err            ),
  .biu_bmu_ibus_data                (biu_bmu_ibus_data               ),
  .biu_bmu_ibus_data_vld            (biu_bmu_ibus_data_vld           ),
  .biu_bmu_ibus_grnt                (biu_bmu_ibus_grnt               ),
  .biu_bmu_ibus_trans_cmplt         (biu_bmu_ibus_trans_cmplt        ),
  .biu_pad_haddr                    (biu_pad_haddr                   ),
  .biu_pad_hburst                   (biu_pad_hburst                  ),
  .biu_pad_hprot                    (biu_pad_hprot                   ),
  .biu_pad_hsize                    (biu_pad_hsize                   ),
  .biu_pad_htrans                   (biu_pad_htrans                  ),
  .biu_pad_hwdata                   (biu_pad_hwdata                  ),
  .biu_pad_hwrite                   (biu_pad_hwrite                  ),
  .biu_pad_vec_redrct               (biu_pad_vec_redrct              ),
  .bmu_biu_dbus_acc_deny            (bmu_biu_dbus_acc_deny           ),
  .bmu_biu_dbus_addr                (bmu_biu_dbus_addr               ),
  .bmu_biu_dbus_chk_fail            (bmu_biu_dbus_chk_fail           ),
  .bmu_biu_dbus_prot                (bmu_biu_dbus_prot               ),
  .bmu_biu_dbus_req                 (bmu_biu_dbus_req                ),
  .bmu_biu_dbus_req_without_cmplt   (bmu_biu_dbus_req_without_cmplt  ),
  .bmu_biu_dbus_size                (bmu_biu_dbus_size               ),
  .bmu_biu_dbus_wdata               (bmu_biu_dbus_wdata              ),
  .bmu_biu_dbus_write               (bmu_biu_dbus_write              ),
  .bmu_biu_ibus_acc_deny            (bmu_biu_ibus_acc_deny           ),
  .bmu_biu_ibus_addr                (bmu_biu_ibus_addr               ),
  .bmu_biu_ibus_hit                 (bmu_biu_ibus_hit                ),
  .bmu_biu_ibus_prot                (bmu_biu_ibus_prot               ),
  .bmu_biu_ibus_req                 (bmu_biu_ibus_req                ),
  .bmu_biu_ibus_req_no_hit          (bmu_biu_ibus_req_no_hit         ),
  .bmu_biu_ibus_size                (bmu_biu_ibus_size               ),
  .bmu_biu_ibus_vec_redirect        (bmu_biu_ibus_vec_redirect       ),
  .cpurst_b                         (cpurst_b                        ),
  .dahblif_other_mask               (dahblif_other_mask              ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .iahblif_other_mask               (iahblif_other_mask              ),
  .pad_biu_hrdata                   (pad_biu_hrdata                  ),
  .pad_biu_hready                   (pad_biu_hready                  ),
  .pad_biu_hresp                    (pad_biu_hresp                   ),
  .pad_cpu_halt_ff2                 (pad_cpu_halt_ff2                ),
  .pad_yy_gate_clk_en_b             (pad_yy_gate_clk_en_b            ),
  .pad_yy_test_mode                 (pad_yy_test_mode                ),
  .pwrm_cpu_bus_peak_power_limit_en (pwrm_cpu_bus_peak_power_limit_en),
  .sahblif_iahblif_mask             (sahblif_iahblif_mask            )
);
cr_iahbl_top  x_cr_iahbl_top (
  .ahblif_idle                      (ibus_idle                       ),
  .bmu_iahbl_dbus_acc_deny          (bmu_iahbl_dbus_acc_deny         ),
  .bmu_iahbl_dbus_addr              (bmu_iahbl_dbus_addr             ),
  .bmu_iahbl_dbus_chk_fail          (bmu_iahbl_dbus_chk_fail         ),
  .bmu_iahbl_dbus_prot              (bmu_iahbl_dbus_prot             ),
  .bmu_iahbl_dbus_req               (bmu_iahbl_dbus_req              ),
  .bmu_iahbl_dbus_req_without_cmplt (bmu_iahbl_dbus_req_without_cmplt),
  .bmu_iahbl_dbus_size              (bmu_iahbl_dbus_size             ),
  .bmu_iahbl_dbus_wdata             (bmu_iahbl_dbus_wdata            ),
  .bmu_iahbl_dbus_write             (bmu_iahbl_dbus_write            ),
  .bmu_iahbl_ibus_acc_deny          (bmu_iahbl_ibus_acc_deny         ),
  .bmu_iahbl_ibus_addr              (bmu_iahbl_ibus_addr             ),
  .bmu_iahbl_ibus_hit               (bmu_iahbl_ibus_hit              ),
  .bmu_iahbl_ibus_prot              (bmu_iahbl_ibus_prot             ),
  .bmu_iahbl_ibus_req               (bmu_iahbl_ibus_req              ),
  .bmu_iahbl_ibus_req_no_hit        (bmu_iahbl_ibus_req_no_hit       ),
  .bmu_iahbl_ibus_size              (bmu_iahbl_ibus_size             ),
  .bmu_iahbl_ibus_vec_redirect      (bmu_iahbl_ibus_vec_redirect     ),
  .cpurst_b                         (cpurst_b                        ),
  .dahblif_other_mask               (dahblif_other_mask              ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .iahbl_bmu_dbus_acc_err           (iahbl_bmu_dbus_acc_err          ),
  .iahbl_bmu_dbus_data              (iahbl_bmu_dbus_data             ),
  .iahbl_bmu_dbus_data_vld          (iahbl_bmu_dbus_data_vld         ),
  .iahbl_bmu_dbus_grnt              (iahbl_bmu_dbus_grnt             ),
  .iahbl_bmu_dbus_trans_cmplt       (iahbl_bmu_dbus_trans_cmplt      ),
  .iahbl_bmu_ibus_acc_err           (iahbl_bmu_ibus_acc_err          ),
  .iahbl_bmu_ibus_data              (iahbl_bmu_ibus_data             ),
  .iahbl_bmu_ibus_data_vld          (iahbl_bmu_ibus_data_vld         ),
  .iahbl_bmu_ibus_grnt              (iahbl_bmu_ibus_grnt             ),
  .iahbl_bmu_ibus_trans_cmplt       (iahbl_bmu_ibus_trans_cmplt      ),
  .iahbl_pad_haddr                  (iahbl_pad_haddr                 ),
  .iahbl_pad_hburst                 (iahbl_pad_hburst                ),
  .iahbl_pad_hprot                  (iahbl_pad_hprot                 ),
  .iahbl_pad_hsize                  (iahbl_pad_hsize                 ),
  .iahbl_pad_htrans                 (iahbl_pad_htrans                ),
  .iahbl_pad_hwdata                 (iahbl_pad_hwdata                ),
  .iahbl_pad_hwrite                 (iahbl_pad_hwrite                ),
  .iahbl_pad_vec_redrct             (iahbl_pad_vec_redrct            ),
  .iahblif_other_mask               (iahblif_other_mask              ),
  .pad_cpu_halt_ff2                 (pad_cpu_halt_ff2                ),
  .pad_iahbl_hrdata                 (pad_iahbl_hrdata                ),
  .pad_iahbl_hready                 (pad_iahbl_hready                ),
  .pad_iahbl_hresp                  (pad_iahbl_hresp                 ),
  .pad_yy_gate_clk_en_b             (pad_yy_gate_clk_en_b            ),
  .pad_yy_test_mode                 (pad_yy_test_mode                ),
  .pwrm_cpu_bus_peak_power_limit_en (pwrm_cpu_bus_peak_power_limit_en),
  .sahblif_iahblif_mask             (sahblif_iahblif_mask            )
);
assign dahblif_other_mask = 1'b0;  
assign dbus_idle = 1'b1;
cr_sys_io  x_cr_sys_io (
  .clk_en                    (clk_en                   ),
  .cp0_sysio_ipend_b         (cp0_sysio_ipend_b        ),
  .cp0_sysio_lpmd_b          (cp0_sysio_lpmd_b         ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .had_yy_xx_dbg             (had_yy_xx_dbg            ),
  .iu_sys_lp_wk_int          (iu_sys_lp_wk_int         ),
  .iu_sysyio_soft_rst        (iu_sysyio_soft_rst       ),
  .iu_yy_xx_dbgon            (iu_yy_xx_dbgon           ),
  .pad_sysio_bigend_b        (pad_sysio_bigend_b       ),
  .pad_sysio_clkratio        (pad_sysio_clkratio       ),
  .pad_sysio_endian_v2       (pad_sysio_endian_v2      ),
  .pad_yy_gate_clk_en_b      (pad_yy_gate_clk_en_b     ),
  .pad_yy_test_mode          (pad_yy_test_mode         ),
  .sysio_cp0_bigend          (sysio_cp0_bigend         ),
  .sysio_cp0_clkratio        (sysio_cp0_clkratio       ),
  .sysio_cp0_endian_v2       (sysio_cp0_endian_v2      ),
  .sysio_cp0_sys_view_lpmd_b (sysio_cp0_sys_view_lpmd_b),
  .sysio_pad_dbg_b           (sysio_pad_dbg_b          ),
  .sysio_pad_ipend_b         (sysio_pad_ipend_b        ),
  .sysio_pad_lpmd_b          (sysio_pad_lpmd_b         ),
  .sysio_pad_srst            (sysio_pad_srst           ),
  .sysio_pad_wakeup_b        (sysio_pad_wakeup_b       )
);
endmodule
