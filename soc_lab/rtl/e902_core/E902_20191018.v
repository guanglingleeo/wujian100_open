/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module E902_20191018(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  biu_pad_vec_redrct,
  clk_en,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pad_psr,
  cpu_pad_dfs_ack,
  ctim_pad_int_vld,
  had_pad_jdb_ack_b,
  had_pad_jdb_pm,
  had_pad_jtg_tap_on,
  had_pad_jtg_tms_o,
  had_pad_jtg_tms_oe,
  had_pad_wakeup_req_b,
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  iahbl_pad_vec_redrct,
  iu_pad_gpr_data,
  iu_pad_gpr_index,
  iu_pad_gpr_we,
  iu_pad_inst_retire,
  iu_pad_inst_split,
  iu_pad_retire_pc,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_clic_int_cfg,
  pad_clic_int_vld,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_cpu_rst_b,
  pad_ctim_calib,
  pad_ctim_refclk,
  pad_had_jdb_req_b,
  pad_had_jtg_tap_en,
  pad_had_jtg_tclk,
  pad_had_jtg_tms_i,
  pad_had_jtg_trst_b,
  pad_had_rst_b,
  pad_iahbl_hrdata,
  pad_iahbl_hready,
  pad_iahbl_hresp,
  pad_sysio_bigend_b,
  pad_sysio_clkratio,
  pad_sysio_endian_v2,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pll_core_cpuclk,
  sysio_pad_dbg_b,
  sysio_pad_ipend_b,
  sysio_pad_lpmd_b,
  sysio_pad_srst,
  sysio_pad_wakeup_b
);
input           clk_en;                              
input   [31:0]  pad_biu_hrdata;                      
input           pad_biu_hready;                      
input           pad_biu_hresp;                       
input   [11:0]  pad_bmu_iahbl_base;                  
input   [11:0]  pad_bmu_iahbl_mask;                  
input   [63:0]  pad_clic_int_cfg;                    
input   [63:0]  pad_clic_int_vld;                    
input           pad_cpu_dfs_req;                     
input           pad_cpu_ext_int_b;                   
input           pad_cpu_rst_b;                       
input   [25:0]  pad_ctim_calib;                      
input           pad_ctim_refclk;                     
input           pad_had_jdb_req_b;                   
input           pad_had_jtg_tap_en;                  
input           pad_had_jtg_tclk;                    
input           pad_had_jtg_tms_i;                   
input           pad_had_jtg_trst_b;                  
input           pad_had_rst_b;                       
input   [31:0]  pad_iahbl_hrdata;                    
input           pad_iahbl_hready;                    
input           pad_iahbl_hresp;                     
input           pad_sysio_bigend_b;                  
input   [2 :0]  pad_sysio_clkratio;                  
input           pad_sysio_endian_v2;                 
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
input           pll_core_cpuclk;                     
output  [31:0]  biu_pad_haddr;                       
output  [2 :0]  biu_pad_hburst;                      
output  [3 :0]  biu_pad_hprot;                       
output  [2 :0]  biu_pad_hsize;                       
output  [1 :0]  biu_pad_htrans;                      
output  [31:0]  biu_pad_hwdata;                      
output          biu_pad_hwrite;                      
output          biu_pad_vec_redrct;                  
output  [31:0]  cp0_pad_mintstatus;                  
output  [31:0]  cp0_pad_mstatus;                     
output  [31:0]  cp0_pad_psr;                         
output          cpu_pad_dfs_ack;                     
output          ctim_pad_int_vld;                    
output          had_pad_jdb_ack_b;                   
output  [1 :0]  had_pad_jdb_pm;                      
output          had_pad_jtg_tap_on;                  
output          had_pad_jtg_tms_o;                   
output          had_pad_jtg_tms_oe;                  
output          had_pad_wakeup_req_b;                
output  [31:0]  iahbl_pad_haddr;                     
output  [2 :0]  iahbl_pad_hburst;                    
output  [3 :0]  iahbl_pad_hprot;                     
output  [2 :0]  iahbl_pad_hsize;                     
output  [1 :0]  iahbl_pad_htrans;                    
output  [31:0]  iahbl_pad_hwdata;                    
output          iahbl_pad_hwrite;                    
output          iahbl_pad_vec_redrct;                
output  [31:0]  iu_pad_gpr_data;                     
output  [4 :0]  iu_pad_gpr_index;                    
output          iu_pad_gpr_we;                       
output          iu_pad_inst_retire;                  
output          iu_pad_inst_split;                   
output  [31:0]  iu_pad_retire_pc;                    
output          sysio_pad_dbg_b;                     
output          sysio_pad_ipend_b;                   
output  [1 :0]  sysio_pad_lpmd_b;                    
output          sysio_pad_srst;                      
output          sysio_pad_wakeup_b;                  
wire    [31:0]  biu_pad_haddr;                       
wire    [2 :0]  biu_pad_hburst;                      
wire    [3 :0]  biu_pad_hprot;                       
wire    [2 :0]  biu_pad_hsize;                       
wire    [1 :0]  biu_pad_htrans;                      
wire    [31:0]  biu_pad_hwdata;                      
wire            biu_pad_hwrite;                      
wire            biu_pad_vec_redrct;                  
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
wire            clic_cpu_int_hv;                     
wire    [9 :0]  clic_cpu_int_id;                     
wire    [7 :0]  clic_cpu_int_il;                     
wire    [1 :0]  clic_cpu_int_priv;                   
wire            clk_en;                              
wire    [31:0]  cp0_had_cpuid_idx0;                  
wire            cp0_had_int_exit;                    
wire    [1 :0]  cp0_had_lpmd_b;                      
wire    [31:0]  cp0_had_mcause_data;                 
wire    [31:0]  cp0_pad_mintstatus;                  
wire    [31:0]  cp0_pad_mstatus;                     
wire    [31:0]  cp0_pad_psr;                         
wire            cp0_yy_be_v2;                        
wire    [9 :0]  cpu_clic_curid;                      
wire            cpu_clic_int_exit;                   
wire            cpu_pad_dfs_ack;                     
wire            cpurst_b;                            
wire            ctim_pad_int_vld;                    
wire            forever_cpuclk;                      
wire            forever_cpuclk_nogated;              
wire            forever_jtgclk;                      
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
wire            had_pad_jdb_ack_b;                   
wire    [1 :0]  had_pad_jdb_pm;                      
wire            had_pad_jtg_tap_on;                  
wire            had_pad_jtg_tms_o;                   
wire            had_pad_jtg_tms_oe;                  
wire            had_pad_wakeup_req_b;                
wire            had_tcipif_cmplt;                    
wire    [31:0]  had_tcipif_rdata;                    
wire            had_yy_xx_dbg;                       
wire            had_yy_xx_dp_index_mbee;             
wire            hadrst_b;                            
wire    [31:0]  iahbl_pad_haddr;                     
wire    [2 :0]  iahbl_pad_hburst;                    
wire    [3 :0]  iahbl_pad_hprot;                     
wire    [2 :0]  iahbl_pad_hsize;                     
wire    [1 :0]  iahbl_pad_htrans;                    
wire    [31:0]  iahbl_pad_hwdata;                    
wire            iahbl_pad_hwrite;                    
wire            iahbl_pad_vec_redrct;                
wire            ifu_had_chg_flw_inst;                
wire            ifu_had_fetch_expt_vld;              
wire            ifu_had_inst_dbg_disable;            
wire    [31:0]  ifu_had_match_pc;                    
wire            ifu_had_split_first;                 
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
wire            iu_yy_xx_dbgon;                      
wire    [31:0]  lsu_had_addr;                        
wire            lsu_had_addr_vld;                    
wire            lsu_had_ex_cmplt;                    
wire            lsu_had_st;                          
wire    [31:0]  pad_biu_hrdata;                      
wire            pad_biu_hready;                      
wire            pad_biu_hresp;                       
wire    [11:0]  pad_bmu_iahbl_base;                  
wire    [11:0]  pad_bmu_iahbl_mask;                  
wire    [63:0]  pad_clic_int_cfg;                    
wire    [63:0]  pad_clic_int_vld;                    
wire            pad_cpu_dfs_req;                     
wire            pad_cpu_ext_int_b;                   
wire            pad_cpu_rst_b;                       
wire    [25:0]  pad_ctim_calib;                      
wire            pad_ctim_refclk;                     
wire            pad_had_jdb_req_b;                   
wire            pad_had_jtg_tap_en;                  
wire            pad_had_jtg_tclk;                    
wire            pad_had_jtg_tms_i;                   
wire            pad_had_jtg_trst_b;                  
wire            pad_had_rst_b;                       
wire    [31:0]  pad_iahbl_hrdata;                    
wire            pad_iahbl_hready;                    
wire            pad_iahbl_hresp;                     
wire            pad_sysio_bigend_b;                  
wire    [2 :0]  pad_sysio_clkratio;                  
wire            pad_sysio_endian_v2;                 
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire            pll_core_cpuclk;                     
wire            pwrm_cpu_bus_peak_power_limit_en;    
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
wire    [15:0]  tcipif_had_addr;                     
wire            tcipif_had_sel;                      
wire    [31:0]  tcipif_had_wdata;                    
wire            tcipif_had_write;                    
wire            trst_b;                              
cr_core_top  x_cr_core_top (
  .biu_pad_haddr                        (biu_pad_haddr                       ),
  .biu_pad_hburst                       (biu_pad_hburst                      ),
  .biu_pad_hprot                        (biu_pad_hprot                       ),
  .biu_pad_hsize                        (biu_pad_hsize                       ),
  .biu_pad_htrans                       (biu_pad_htrans                      ),
  .biu_pad_hwdata                       (biu_pad_hwdata                      ),
  .biu_pad_hwrite                       (biu_pad_hwrite                      ),
  .biu_pad_vec_redrct                   (biu_pad_vec_redrct                  ),
  .bmu_tcipif_dbus_acc_deny             (bmu_tcipif_dbus_acc_deny            ),
  .bmu_tcipif_dbus_addr                 (bmu_tcipif_dbus_addr                ),
  .bmu_tcipif_dbus_chk_fail             (bmu_tcipif_dbus_chk_fail            ),
  .bmu_tcipif_dbus_req                  (bmu_tcipif_dbus_req                 ),
  .bmu_tcipif_dbus_size                 (bmu_tcipif_dbus_size                ),
  .bmu_tcipif_dbus_supv_mode            (bmu_tcipif_dbus_supv_mode           ),
  .bmu_tcipif_dbus_wdata                (bmu_tcipif_dbus_wdata               ),
  .bmu_tcipif_dbus_write                (bmu_tcipif_dbus_write               ),
  .bmu_tcipif_ibus_acc_deny             (bmu_tcipif_ibus_acc_deny            ),
  .bmu_tcipif_ibus_addr                 (bmu_tcipif_ibus_addr                ),
  .bmu_tcipif_ibus_req                  (bmu_tcipif_ibus_req                 ),
  .bmu_tcipif_ibus_write                (bmu_tcipif_ibus_write               ),
  .clic_cpu_int_hv                      (clic_cpu_int_hv                     ),
  .clic_cpu_int_id                      (clic_cpu_int_id                     ),
  .clic_cpu_int_il                      (clic_cpu_int_il                     ),
  .clic_cpu_int_priv                    (clic_cpu_int_priv                   ),
  .clk_en                               (clk_en                              ),
  .cp0_had_cpuid_idx0                   (cp0_had_cpuid_idx0                  ),
  .cp0_had_int_exit                     (cp0_had_int_exit                    ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_mcause_data                  (cp0_had_mcause_data                 ),
  .cp0_pad_mintstatus                   (cp0_pad_mintstatus                  ),
  .cp0_pad_mstatus                      (cp0_pad_mstatus                     ),
  .cp0_pad_psr                          (cp0_pad_psr                         ),
  .cp0_yy_be_v2                         (cp0_yy_be_v2                        ),
  .cpu_clic_curid                       (cpu_clic_curid                      ),
  .cpu_clic_int_exit                    (cpu_clic_int_exit                   ),
  .cpu_pad_dfs_ack                      (cpu_pad_dfs_ack                     ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_core_dbg_mode_req                (had_core_dbg_mode_req               ),
  .had_core_exit_dbg                    (had_core_exit_dbg                   ),
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
  .iahbl_pad_haddr                      (iahbl_pad_haddr                     ),
  .iahbl_pad_hburst                     (iahbl_pad_hburst                    ),
  .iahbl_pad_hprot                      (iahbl_pad_hprot                     ),
  .iahbl_pad_hsize                      (iahbl_pad_hsize                     ),
  .iahbl_pad_htrans                     (iahbl_pad_htrans                    ),
  .iahbl_pad_hwdata                     (iahbl_pad_hwdata                    ),
  .iahbl_pad_hwrite                     (iahbl_pad_hwrite                    ),
  .iahbl_pad_vec_redrct                 (iahbl_pad_vec_redrct                ),
  .ifu_had_chg_flw_inst                 (ifu_had_chg_flw_inst                ),
  .ifu_had_fetch_expt_vld               (ifu_had_fetch_expt_vld              ),
  .ifu_had_inst_dbg_disable             (ifu_had_inst_dbg_disable            ),
  .ifu_had_match_pc                     (ifu_had_match_pc                    ),
  .ifu_had_split_first                  (ifu_had_split_first                 ),
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
  .iu_yy_xx_dbgon                       (iu_yy_xx_dbgon                      ),
  .lsu_had_addr                         (lsu_had_addr                        ),
  .lsu_had_addr_vld                     (lsu_had_addr_vld                    ),
  .lsu_had_ex_cmplt                     (lsu_had_ex_cmplt                    ),
  .lsu_had_st                           (lsu_had_st                          ),
  .pad_biu_hrdata                       (pad_biu_hrdata                      ),
  .pad_biu_hready                       (pad_biu_hready                      ),
  .pad_biu_hresp                        (pad_biu_hresp                       ),
  .pad_bmu_iahbl_base                   (pad_bmu_iahbl_base                  ),
  .pad_bmu_iahbl_mask                   (pad_bmu_iahbl_mask                  ),
  .pad_cpu_dfs_req                      (pad_cpu_dfs_req                     ),
  .pad_cpu_ext_int_b                    (pad_cpu_ext_int_b                   ),
  .pad_iahbl_hrdata                     (pad_iahbl_hrdata                    ),
  .pad_iahbl_hready                     (pad_iahbl_hready                    ),
  .pad_iahbl_hresp                      (pad_iahbl_hresp                     ),
  .pad_sysio_bigend_b                   (pad_sysio_bigend_b                  ),
  .pad_sysio_clkratio                   (pad_sysio_clkratio                  ),
  .pad_sysio_endian_v2                  (pad_sysio_endian_v2                 ),
  .pad_yy_gate_clk_en_b                 (pad_yy_gate_clk_en_b                ),
  .pad_yy_test_mode                     (pad_yy_test_mode                    ),
  .pwrm_cpu_bus_peak_power_limit_en     (pwrm_cpu_bus_peak_power_limit_en    ),
  .sysio_pad_dbg_b                      (sysio_pad_dbg_b                     ),
  .sysio_pad_ipend_b                    (sysio_pad_ipend_b                   ),
  .sysio_pad_lpmd_b                     (sysio_pad_lpmd_b                    ),
  .sysio_pad_srst                       (sysio_pad_srst                      ),
  .sysio_pad_wakeup_b                   (sysio_pad_wakeup_b                  ),
  .tcipif_bmu_dbus_acc_err              (tcipif_bmu_dbus_acc_err             ),
  .tcipif_bmu_dbus_data                 (tcipif_bmu_dbus_data                ),
  .tcipif_bmu_dbus_data_vld             (tcipif_bmu_dbus_data_vld            ),
  .tcipif_bmu_dbus_grnt                 (tcipif_bmu_dbus_grnt                ),
  .tcipif_bmu_dbus_trans_cmplt          (tcipif_bmu_dbus_trans_cmplt         ),
  .tcipif_bmu_ibus_acc_err              (tcipif_bmu_ibus_acc_err             ),
  .tcipif_bmu_ibus_data                 (tcipif_bmu_ibus_data                ),
  .tcipif_bmu_ibus_data_vld             (tcipif_bmu_ibus_data_vld            ),
  .tcipif_bmu_ibus_grnt                 (tcipif_bmu_ibus_grnt                ),
  .tcipif_bmu_ibus_trans_cmplt          (tcipif_bmu_ibus_trans_cmplt         )
);
cr_had_top  x_cr_had_top (
  .cp0_had_cpuid_idx0                   (cp0_had_cpuid_idx0                  ),
  .cp0_had_int_exit                     (cp0_had_int_exit                    ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_mcause_data                  (cp0_had_mcause_data                 ),
  .forever_cpuclk_nogated               (forever_cpuclk_nogated              ),
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
  .had_pad_jdb_ack_b                    (had_pad_jdb_ack_b                   ),
  .had_pad_jdb_pm                       (had_pad_jdb_pm                      ),
  .had_pad_jtg_tap_on                   (had_pad_jtg_tap_on                  ),
  .had_pad_jtg_tms_o                    (had_pad_jtg_tms_o                   ),
  .had_pad_jtg_tms_oe                   (had_pad_jtg_tms_oe                  ),
  .had_pad_wakeup_req_b                 (had_pad_wakeup_req_b                ),
  .had_tcipif_cmplt                     (had_tcipif_cmplt                    ),
  .had_tcipif_rdata                     (had_tcipif_rdata                    ),
  .had_yy_xx_dbg                        (had_yy_xx_dbg                       ),
  .had_yy_xx_dp_index_mbee              (had_yy_xx_dp_index_mbee             ),
  .had_yy_xx_exit_dbg                   (had_core_exit_dbg                   ),
  .hadrst_b                             (hadrst_b                            ),
  .ifu_had_chg_flw_inst                 (ifu_had_chg_flw_inst                ),
  .ifu_had_fetch_expt_vld               (ifu_had_fetch_expt_vld              ),
  .ifu_had_inst_dbg_disable             (ifu_had_inst_dbg_disable            ),
  .ifu_had_match_pc                     (ifu_had_match_pc                    ),
  .ifu_had_split_first                  (ifu_had_split_first                 ),
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
  .iu_yy_xx_dbgon                       (iu_yy_xx_dbgon                      ),
  .lsu_had_addr                         (lsu_had_addr                        ),
  .lsu_had_addr_vld                     (lsu_had_addr_vld                    ),
  .lsu_had_ex_cmplt                     (lsu_had_ex_cmplt                    ),
  .lsu_had_st                           (lsu_had_st                          ),
  .pad_had_jdb_req_b                    (pad_had_jdb_req_b                   ),
  .pad_had_jtg_tap_en                   (pad_had_jtg_tap_en                  ),
  .pad_had_jtg_tms_i                    (pad_had_jtg_tms_i                   ),
  .pad_yy_gate_clk_en_b                 (pad_yy_gate_clk_en_b                ),
  .pad_yy_test_mode                     (pad_yy_test_mode                    ),
  .tcipif_had_addr                      (tcipif_had_addr                     ),
  .tcipif_had_sel                       (tcipif_had_sel                      ),
  .tcipif_had_wdata                     (tcipif_had_wdata                    ),
  .tcipif_had_write                     (tcipif_had_write                    ),
  .tclk                                 (forever_jtgclk                      ),
  .trst_b                               (trst_b                              )
);
cr_clkrst_top  x_cr_clkrst_top (
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .forever_jtgclk         (forever_jtgclk        ),
  .hadrst_b               (hadrst_b              ),
  .pad_cpu_rst_b          (pad_cpu_rst_b         ),
  .pad_had_jtg_tclk       (pad_had_jtg_tclk      ),
  .pad_had_jtg_trst_b     (pad_had_jtg_trst_b    ),
  .pad_had_rst_b          (pad_had_rst_b         ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .pll_core_cpuclk        (pll_core_cpuclk       ),
  .trst_b                 (trst_b                )
);
cr_tcipif_top  x_cr_tcipif_top (
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
  .clic_cpu_int_hv                  (clic_cpu_int_hv                 ),
  .clic_cpu_int_id                  (clic_cpu_int_id                 ),
  .clic_cpu_int_il                  (clic_cpu_int_il                 ),
  .clic_cpu_int_priv                (clic_cpu_int_priv               ),
  .cp0_yy_be_v2                     (cp0_yy_be_v2                    ),
  .cpu_clic_curid                   (cpu_clic_curid                  ),
  .cpu_clic_int_exit                (cpu_clic_int_exit               ),
  .cpurst_b                         (cpurst_b                        ),
  .ctim_pad_int_vld                 (ctim_pad_int_vld                ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .forever_cpuclk_nogated           (forever_cpuclk_nogated          ),
  .had_tcipif_cmplt                 (had_tcipif_cmplt                ),
  .had_tcipif_rdata                 (had_tcipif_rdata                ),
  .iu_yy_xx_dbgon                   (iu_yy_xx_dbgon                  ),
  .pad_clic_int_cfg                 (pad_clic_int_cfg                ),
  .pad_clic_int_vld                 (pad_clic_int_vld                ),
  .pad_ctim_calib                   (pad_ctim_calib                  ),
  .pad_ctim_refclk                  (pad_ctim_refclk                 ),
  .pad_yy_gate_clk_en_b             (pad_yy_gate_clk_en_b            ),
  .pad_yy_test_mode                 (pad_yy_test_mode                ),
  .pwrm_cpu_bus_peak_power_limit_en (pwrm_cpu_bus_peak_power_limit_en),
  .tcipif_bmu_dbus_acc_err          (tcipif_bmu_dbus_acc_err         ),
  .tcipif_bmu_dbus_data             (tcipif_bmu_dbus_data            ),
  .tcipif_bmu_dbus_data_vld         (tcipif_bmu_dbus_data_vld        ),
  .tcipif_bmu_dbus_grnt             (tcipif_bmu_dbus_grnt            ),
  .tcipif_bmu_dbus_trans_cmplt      (tcipif_bmu_dbus_trans_cmplt     ),
  .tcipif_bmu_ibus_acc_err          (tcipif_bmu_ibus_acc_err         ),
  .tcipif_bmu_ibus_data             (tcipif_bmu_ibus_data            ),
  .tcipif_bmu_ibus_data_vld         (tcipif_bmu_ibus_data_vld        ),
  .tcipif_bmu_ibus_grnt             (tcipif_bmu_ibus_grnt            ),
  .tcipif_bmu_ibus_trans_cmplt      (tcipif_bmu_ibus_trans_cmplt     ),
  .tcipif_had_addr                  (tcipif_had_addr                 ),
  .tcipif_had_sel                   (tcipif_had_sel                  ),
  .tcipif_had_wdata                 (tcipif_had_wdata                ),
  .tcipif_had_write                 (tcipif_had_write                )
);
endmodule
