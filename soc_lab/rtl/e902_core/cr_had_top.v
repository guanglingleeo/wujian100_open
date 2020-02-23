/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_had_top(
  cp0_had_cpuid_idx0,
  cp0_had_int_exit,
  cp0_had_lpmd_b,
  cp0_had_mcause_data,
  forever_cpuclk_nogated,
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
  had_pad_jdb_ack_b,
  had_pad_jdb_pm,
  had_pad_jtg_tap_on,
  had_pad_jtg_tms_o,
  had_pad_jtg_tms_oe,
  had_pad_wakeup_req_b,
  had_tcipif_cmplt,
  had_tcipif_rdata,
  had_yy_xx_dbg,
  had_yy_xx_dp_index_mbee,
  had_yy_xx_exit_dbg,
  hadrst_b,
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
  iu_yy_xx_dbgon,
  lsu_had_addr,
  lsu_had_addr_vld,
  lsu_had_ex_cmplt,
  lsu_had_st,
  pad_had_jdb_req_b,
  pad_had_jtg_tap_en,
  pad_had_jtg_tms_i,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  tcipif_had_addr,
  tcipif_had_sel,
  tcipif_had_wdata,
  tcipif_had_write,
  tclk,
  trst_b
);
input   [31:0]  cp0_had_cpuid_idx0;                  
input           cp0_had_int_exit;                    
input   [1 :0]  cp0_had_lpmd_b;                      
input   [31:0]  cp0_had_mcause_data;                 
input           forever_cpuclk_nogated;              
input           hadrst_b;                            
input           ifu_had_chg_flw_inst;                
input           ifu_had_fetch_expt_vld;              
input           ifu_had_inst_dbg_disable;            
input   [31:0]  ifu_had_match_pc;                    
input           ifu_had_split_first;                 
input           iu_had_adr_dbg_ack;                  
input   [31:0]  iu_had_chgflw_dst_pc;                
input           iu_had_chgflw_vld;                   
input           iu_had_data_bkpt_occur_vld;          
input           iu_had_dbg_disable_for_tee;          
input           iu_had_dr_dbg_ack;                   
input           iu_had_expt_vld;                     
input           iu_had_fast_retire_acc_err_pc_update; 
input   [30:0]  iu_had_fast_retire_acc_err_pc_val;   
input           iu_had_flush;                        
input           iu_had_inst_bkpt_occur_vld;          
input           iu_had_int_ack;                      
input           iu_had_retire_with_had_int;          
input           iu_had_trace_occur_vld;              
input           iu_had_xx_bkpt_inst;                 
input   [31:0]  iu_had_xx_data;                      
input           iu_had_xx_data_vld;                  
input           iu_had_xx_dbg_ack;                   
input           iu_had_xx_mldst;                     
input           iu_had_xx_retire;                    
input           iu_had_xx_retire_normal;             
input   [31:0]  iu_had_xx_retire_pc;                 
input           iu_yy_xx_dbgon;                      
input   [31:0]  lsu_had_addr;                        
input           lsu_had_addr_vld;                    
input           lsu_had_ex_cmplt;                    
input           lsu_had_st;                          
input           pad_had_jdb_req_b;                   
input           pad_had_jtg_tap_en;                  
input           pad_had_jtg_tms_i;                   
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
input   [15:0]  tcipif_had_addr;                     
input           tcipif_had_sel;                      
input   [31:0]  tcipif_had_wdata;                    
input           tcipif_had_write;                    
input           tclk;                                
input           trst_b;                              
output          had_core_dbg_mode_req;               
output  [31:0]  had_idu_wbbr_data;                   
output          had_idu_wbbr_vld;                    
output          had_ifu_inst_bkpt_dbq_req;           
output          had_ifu_inst_bkpt_dbqexp_req;        
output  [31:0]  had_ifu_ir;                          
output          had_ifu_ir_vld;                      
output          had_iu_bkpt_trace_en;                
output          had_iu_dr_set_req;                   
output          had_iu_force_dbg_en;                 
output          had_iu_int_vld;                      
output          had_iu_mbkpt_fsm_index_mbee;         
output          had_iu_mem_bkpt_exp_req;             
output          had_iu_mem_bkpt_mask;                
output          had_iu_mem_bkpt_req;                 
output  [30:0]  had_iu_pc;                           
output          had_iu_rte_pc_sel;                   
output          had_iu_trace_req;                    
output          had_iu_trace_req_for_dbg_disable;    
output          had_iu_xx_fdb;                       
output          had_iu_xx_jdbreq;                    
output          had_pad_jdb_ack_b;                   
output  [1 :0]  had_pad_jdb_pm;                      
output          had_pad_jtg_tap_on;                  
output          had_pad_jtg_tms_o;                   
output          had_pad_jtg_tms_oe;                  
output          had_pad_wakeup_req_b;                
output          had_tcipif_cmplt;                    
output  [31:0]  had_tcipif_rdata;                    
output          had_yy_xx_dbg;                       
output          had_yy_xx_dp_index_mbee;             
output          had_yy_xx_exit_dbg;                  
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
wire    [31:0]  cp0_had_cpuid_idx0;                  
wire            cp0_had_int_exit;                    
wire    [1 :0]  cp0_had_lpmd_b;                      
wire    [31:0]  cp0_had_mcause_data;                 
wire            A117;                              
wire            A1858a;                  
wire            A118;               
wire            A18589;                
wire            A119;                
wire            A18588;                
wire            A11a;                 
wire            A18587;                        
wire    [31:0]  A11b;                         
wire            A18586;                 
wire            A11c;                  
wire            forever_cpuclk_nogated;              
wire            A11d;                          
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
wire            had_yy_xx_exit_dbg;                  
wire            hadrst_b;                            
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
wire            iu_yy_xx_dbgon;                      
wire            A13c;                     
wire            A18565;                    
wire            A13d;                      
wire            A18564;               
wire    [31:0]  A13e;                        
wire            A18563;                   
wire    [31:0]  lsu_had_addr;                        
wire            lsu_had_addr_vld;                    
wire            lsu_had_ex_cmplt;                    
wire            lsu_had_st;                          
wire            pad_had_jdb_req_b;                   
wire            pad_had_jtg_tap_en;                  
wire            pad_had_jtg_tms_i;                   
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire            A1855e;                    
wire            A144;                       
wire            A1855d;                        
wire    [31:0]  A145;                     
wire            A1855c;                 
wire    [2 :0]  A146;                     
wire    [7 :0]  A1855b;                     
wire    [31:0]  A147;                     
wire    [2 :0]  A1855a;                     
wire    [7 :0]  A148;                     
wire    [31:0]  A18559;                     
wire            A149;                       
wire    [31:0]  A18558;                     
wire            A14a;                       
wire    [31:0]  A18557;                     
wire            A14b;                       
wire            A18556;                       
wire            A14c;                        
wire            A18555;                  
wire            A14d;                   
wire            A18554;                   
wire            A14e;                
wire    [8 :0]  A18553;                      
wire            A14f;                  
wire            A18552;                  
wire    [31:0]  A150;                      
wire            A18551;                   
wire            A151;                 
wire            A18550;                  
wire    [1 :0]  A152;                         
wire            A161;                       
wire            A153;                      
wire            A1854e;                        
wire    [15:0]  tcipif_had_addr;                     
wire            tcipif_had_sel;                      
wire    [31:0]  tcipif_had_wdata;                    
wire            tcipif_had_write;                    
wire            tclk;                                
wire            A162;                      
wire            A1853f;      
wire            trst_b;                              
gated_clk_cell  A158 (
  .clk_in                 (forever_cpuclk_nogated),
  .clk_out                (A117                ),
  .external_en            (1'b0                  ),
  .global_en              (1'b1                  ),
  .local_en               (1'b0                  ),
  .module_en              (A11d            ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      )
);
assign A11d = A1854e || tcipif_had_sel;
A186a0  A18549 (
  .A1868b  (A110),
  .A17                 (A18591               ),
  .A117                        (A117                       ),
  .had_core_dbg_mode_req         (had_core_dbg_mode_req        ),
  .hadrst_b                      (hadrst_b                     ),
  .ifu_had_chg_flw_inst          (ifu_had_chg_flw_inst         ),
  .ifu_had_fetch_expt_vld        (ifu_had_fetch_expt_vld       ),
  .ifu_had_inst_dbg_disable      (ifu_had_inst_dbg_disable     ),
  .ifu_had_match_pc              (ifu_had_match_pc             ),
  .ifu_had_split_first           (ifu_had_split_first          ),
  .iu_had_expt_vld               (iu_had_expt_vld              ),
  .iu_had_flush                  (iu_had_flush                 ),
  .iu_had_xx_mldst               (iu_had_xx_mldst              ),
  .iu_had_xx_retire              (iu_had_xx_retire             ),
  .iu_had_xx_retire_normal       (iu_had_xx_retire_normal      ),
  .iu_yy_xx_dbgon                (iu_yy_xx_dbgon               ),
  .lsu_had_addr                  (lsu_had_addr                 ),
  .lsu_had_addr_vld              (lsu_had_addr_vld             ),
  .lsu_had_ex_cmplt              (lsu_had_ex_cmplt             ),
  .lsu_had_st                    (lsu_had_st                   ),
  .A1867c                (A145              ),
  .A14                (A146              ),
  .A1868d                (A1855b              )
);
A186a0  A159 (
  .A1868b  (A111),
  .A17                 (A18590               ),
  .A117                        (A117                       ),
  .had_core_dbg_mode_req         (had_core_dbg_mode_req        ),
  .hadrst_b                      (hadrst_b                     ),
  .ifu_had_chg_flw_inst          (ifu_had_chg_flw_inst         ),
  .ifu_had_fetch_expt_vld        (ifu_had_fetch_expt_vld       ),
  .ifu_had_inst_dbg_disable      (ifu_had_inst_dbg_disable     ),
  .ifu_had_match_pc              (ifu_had_match_pc             ),
  .ifu_had_split_first           (ifu_had_split_first          ),
  .iu_had_expt_vld               (iu_had_expt_vld              ),
  .iu_had_flush                  (iu_had_flush                 ),
  .iu_had_xx_mldst               (iu_had_xx_mldst              ),
  .iu_had_xx_retire              (iu_had_xx_retire             ),
  .iu_had_xx_retire_normal       (iu_had_xx_retire_normal      ),
  .iu_yy_xx_dbgon                (iu_yy_xx_dbgon               ),
  .lsu_had_addr                  (lsu_had_addr                 ),
  .lsu_had_addr_vld              (lsu_had_addr_vld             ),
  .lsu_had_ex_cmplt              (lsu_had_ex_cmplt             ),
  .lsu_had_st                    (lsu_had_st                   ),
  .A1867c                (A147              ),
  .A14                (A1855a              ),
  .A1868d                (A148              )
);
A15  A18548 (
  .A1868b  (A112),
  .A17                 (A1858f               ),
  .A117                        (A117                       ),
  .had_core_dbg_mode_req         (had_core_dbg_mode_req        ),
  .hadrst_b                      (hadrst_b                     ),
  .ifu_had_fetch_expt_vld        (ifu_had_fetch_expt_vld       ),
  .ifu_had_inst_dbg_disable      (ifu_had_inst_dbg_disable     ),
  .ifu_had_match_pc              (ifu_had_match_pc             ),
  .ifu_had_split_first           (ifu_had_split_first          ),
  .iu_had_expt_vld               (iu_had_expt_vld              ),
  .iu_had_flush                  (iu_had_flush                 ),
  .iu_had_xx_mldst               (iu_had_xx_mldst              ),
  .iu_had_xx_retire              (iu_had_xx_retire             ),
  .iu_had_xx_retire_normal       (iu_had_xx_retire_normal      ),
  .iu_yy_xx_dbgon                (iu_yy_xx_dbgon               ),
  .lsu_had_addr                  (lsu_had_addr                 ),
  .lsu_had_addr_vld              (lsu_had_addr_vld             ),
  .lsu_had_ex_cmplt              (lsu_had_ex_cmplt             ),
  .A1867c                (A18559              ),
  .A26                  (A149                )
);
A15  A15a (
  .A1868b  (A113),
  .A17                 (A1858e               ),
  .A117                        (A117                       ),
  .had_core_dbg_mode_req         (had_core_dbg_mode_req        ),
  .hadrst_b                      (hadrst_b                     ),
  .ifu_had_fetch_expt_vld        (ifu_had_fetch_expt_vld       ),
  .ifu_had_inst_dbg_disable      (ifu_had_inst_dbg_disable     ),
  .ifu_had_match_pc              (ifu_had_match_pc             ),
  .ifu_had_split_first           (ifu_had_split_first          ),
  .iu_had_expt_vld               (iu_had_expt_vld              ),
  .iu_had_flush                  (iu_had_flush                 ),
  .iu_had_xx_mldst               (iu_had_xx_mldst              ),
  .iu_had_xx_retire              (iu_had_xx_retire             ),
  .iu_had_xx_retire_normal       (iu_had_xx_retire_normal      ),
  .iu_yy_xx_dbgon                (iu_yy_xx_dbgon               ),
  .lsu_had_addr                  (lsu_had_addr                 ),
  .lsu_had_addr_vld              (lsu_had_addr_vld             ),
  .lsu_had_ex_cmplt              (lsu_had_ex_cmplt             ),
  .A1867c                (A18558              ),
  .A26                  (A14a                )
);
A15  A18547 (
  .A1868b  (A114),
  .A17                 (A1858d               ),
  .A117                        (A117                       ),
  .had_core_dbg_mode_req         (had_core_dbg_mode_req        ),
  .hadrst_b                      (hadrst_b                     ),
  .ifu_had_fetch_expt_vld        (ifu_had_fetch_expt_vld       ),
  .ifu_had_inst_dbg_disable      (ifu_had_inst_dbg_disable     ),
  .ifu_had_match_pc              (ifu_had_match_pc             ),
  .ifu_had_split_first           (ifu_had_split_first          ),
  .iu_had_expt_vld               (iu_had_expt_vld              ),
  .iu_had_flush                  (iu_had_flush                 ),
  .iu_had_xx_mldst               (iu_had_xx_mldst              ),
  .iu_had_xx_retire              (iu_had_xx_retire             ),
  .iu_had_xx_retire_normal       (iu_had_xx_retire_normal      ),
  .iu_yy_xx_dbgon                (iu_yy_xx_dbgon               ),
  .lsu_had_addr                  (lsu_had_addr                 ),
  .lsu_had_addr_vld              (lsu_had_addr_vld             ),
  .lsu_had_ex_cmplt              (lsu_had_ex_cmplt             ),
  .A1867c                (A18557              ),
  .A26                  (A14b                )
);
A1867b  A15b (
  .A110    (A110   ),
  .A18591                   (A18591                  ),
  .A111    (A111   ),
  .A18590                   (A18590                  ),
  .A112    (A112   ),
  .A1858f                   (A1858f                  ),
  .A113    (A113   ),
  .A1858e                   (A1858e                  ),
  .A114    (A114   ),
  .A1858d                   (A1858d                  ),
  .A117                           (A117                          ),
  .A1858a               (A1858a              ),
  .A118            (A118           ),
  .A18589             (A18589            ),
  .A119             (A119            ),
  .A18588             (A18588            ),
  .A11a              (A11a             ),
  .had_ifu_inst_bkpt_dbq_req        (had_ifu_inst_bkpt_dbq_req       ),
  .had_ifu_inst_bkpt_dbqexp_req     (had_ifu_inst_bkpt_dbqexp_req    ),
  .had_iu_bkpt_trace_en             (had_iu_bkpt_trace_en            ),
  .had_iu_dr_set_req                (had_iu_dr_set_req               ),
  .had_iu_mbkpt_fsm_index_mbee      (had_iu_mbkpt_fsm_index_mbee     ),
  .had_iu_mem_bkpt_exp_req          (had_iu_mem_bkpt_exp_req         ),
  .had_iu_mem_bkpt_mask             (had_iu_mem_bkpt_mask            ),
  .had_iu_mem_bkpt_req              (had_iu_mem_bkpt_req             ),
  .had_iu_trace_req                 (had_iu_trace_req                ),
  .had_iu_trace_req_for_dbg_disable (had_iu_trace_req_for_dbg_disable),
  .had_iu_xx_jdbreq                 (had_iu_xx_jdbreq                ),
  .had_yy_xx_dbg                    (had_yy_xx_dbg                   ),
  .had_yy_xx_dp_index_mbee          (had_yy_xx_dp_index_mbee         ),
  .had_yy_xx_exit_dbg               (had_yy_xx_exit_dbg              ),
  .hadrst_b                         (hadrst_b                        ),
  .iu_had_adr_dbg_ack               (iu_had_adr_dbg_ack              ),
  .iu_had_chgflw_dst_pc             (iu_had_chgflw_dst_pc            ),
  .iu_had_chgflw_vld                (iu_had_chgflw_vld               ),
  .iu_had_data_bkpt_occur_vld       (iu_had_data_bkpt_occur_vld      ),
  .iu_had_dbg_disable_for_tee       (iu_had_dbg_disable_for_tee      ),
  .iu_had_dr_dbg_ack                (iu_had_dr_dbg_ack               ),
  .iu_had_inst_bkpt_occur_vld       (iu_had_inst_bkpt_occur_vld      ),
  .iu_had_trace_occur_vld           (iu_had_trace_occur_vld          ),
  .iu_had_xx_bkpt_inst              (iu_had_xx_bkpt_inst             ),
  .iu_yy_xx_dbgon                   (iu_yy_xx_dbgon                  ),
  .A18563                (A18563               ),
  .A1855e                 (A1855e                ),
  .A1855c              (A1855c             ),
  .A18556                    (A18556                   ),
  .A14c                     (A14c                    ),
  .A18555               (A18555              ),
  .A14d                (A14d               ),
  .A18554                (A18554               ),
  .A14e             (A14e            ),
  .A18553                   (A18553                  ),
  .A161                    (A161                   ),
  .A162                   (A162                  ),
  .A1853f   (A1853f  )
);
A45  A18546 (
  .A117              (A117             ),
  .A18587        (A18587       ),
  .A11b         (A11b        ),
  .A18586 (A18586),
  .A11c  (A11c ),
  .hadrst_b            (hadrst_b           ),
  .iu_had_xx_retire    (iu_had_xx_retire   ),
  .A18563   (A18563  ),
  .A14f  (A14f ),
  .A18552  (A18552 ),
  .A153      (A153     )
);
A1862c  A15c (
  .had_pad_jdb_ack_b  (had_pad_jdb_ack_b ),
  .had_pad_jdb_pm     (had_pad_jdb_pm    ),
  .had_pad_jtg_tap_on (had_pad_jtg_tap_on),
  .had_pad_jtg_tms_o  (had_pad_jtg_tms_o ),
  .had_pad_jtg_tms_oe (had_pad_jtg_tms_oe),
  .iu_yy_xx_dbgon     (iu_yy_xx_dbgon    ),
  .A13c    (A13c   ),
  .A18565   (A18565  ),
  .pad_had_jdb_req_b  (pad_had_jdb_req_b ),
  .pad_had_jtg_tap_en (pad_had_jtg_tap_en),
  .pad_had_jtg_tms_i  (pad_had_jtg_tms_i ),
  .A1855e   (A1855e  ),
  .A144      (A144     ),
  .A1855d       (A1855d      ),
  .A152        (A152       ),
  .tclk               (tclk              ),
  .trst_b             (trst_b            )
);
A7f  A18545 (
  .cp0_had_cpuid_idx0                   (cp0_had_cpuid_idx0                  ),
  .cp0_had_int_exit                     (cp0_had_int_exit                    ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_mcause_data                  (cp0_had_mcause_data                 ),
  .A117                               (A117                              ),
  .A1858a                   (A1858a                  ),
  .A118                (A118               ),
  .A18589                 (A18589                ),
  .A119                 (A119                ),
  .A18588                 (A18588                ),
  .A11a                  (A11a                 ),
  .A18587                         (A18587                        ),
  .A11b                          (A11b                         ),
  .A18586                  (A18586                 ),
  .A11c                   (A11c                  ),
  .had_core_dbg_mode_req                (had_core_dbg_mode_req               ),
  .had_idu_wbbr_data                    (had_idu_wbbr_data                   ),
  .had_idu_wbbr_vld                     (had_idu_wbbr_vld                    ),
  .had_ifu_ir                           (had_ifu_ir                          ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .had_iu_force_dbg_en                  (had_iu_force_dbg_en                 ),
  .had_iu_int_vld                       (had_iu_int_vld                      ),
  .had_iu_pc                            (had_iu_pc                           ),
  .had_iu_rte_pc_sel                    (had_iu_rte_pc_sel                   ),
  .had_iu_xx_fdb                        (had_iu_xx_fdb                       ),
  .had_tcipif_cmplt                     (had_tcipif_cmplt                    ),
  .had_tcipif_rdata                     (had_tcipif_rdata                    ),
  .hadrst_b                             (hadrst_b                            ),
  .iu_had_fast_retire_acc_err_pc_update (iu_had_fast_retire_acc_err_pc_update),
  .iu_had_fast_retire_acc_err_pc_val    (iu_had_fast_retire_acc_err_pc_val   ),
  .iu_had_int_ack                       (iu_had_int_ack                      ),
  .iu_had_retire_with_had_int           (iu_had_retire_with_had_int          ),
  .iu_had_xx_data                       (iu_had_xx_data                      ),
  .iu_had_xx_data_vld                   (iu_had_xx_data_vld                  ),
  .iu_had_xx_dbg_ack                    (iu_had_xx_dbg_ack                   ),
  .iu_had_xx_retire_pc                  (iu_had_xx_retire_pc                 ),
  .iu_yy_xx_dbgon                       (iu_yy_xx_dbgon                      ),
  .A13d                       (A13d                      ),
  .A18564                (A18564               ),
  .A13e                         (A13e                        ),
  .A18563                    (A18563                   ),
  .A145                      (A145                     ),
  .A1855c                  (A1855c                 ),
  .A146                      (A146                     ),
  .A1855b                      (A1855b                     ),
  .A147                      (A147                     ),
  .A1855a                      (A1855a                     ),
  .A148                      (A148                     ),
  .A18559                      (A18559                     ),
  .A149                        (A149                       ),
  .A18558                      (A18558                     ),
  .A14a                        (A14a                       ),
  .A18557                      (A18557                     ),
  .A14b                        (A14b                       ),
  .A18556                        (A18556                       ),
  .A14c                         (A14c                        ),
  .A18555                   (A18555                  ),
  .A14d                    (A14d                   ),
  .A18554                    (A18554                   ),
  .A14e                 (A14e                ),
  .A18553                       (A18553                      ),
  .A14f                   (A14f                  ),
  .A18552                   (A18552                  ),
  .A150                       (A150                      ),
  .A18551                    (A18551                   ),
  .A151                  (A151                 ),
  .A18550                   (A18550                  ),
  .A152                          (A152                         ),
  .A161                        (A161                       ),
  .A153                       (A153                      ),
  .tcipif_had_addr                      (tcipif_had_addr                     ),
  .tcipif_had_sel                       (tcipif_had_sel                      ),
  .tcipif_had_wdata                     (tcipif_had_wdata                    ),
  .tcipif_had_write                     (tcipif_had_write                    )
);
A1864d  A15d (
  .A117                 (A117                ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .had_pad_wakeup_req_b   (had_pad_wakeup_req_b  ),
  .hadrst_b               (hadrst_b              ),
  .A13c        (A13c       ),
  .A18565       (A18565      ),
  .A13d         (A13d        ),
  .A18564  (A18564 ),
  .A13e           (A13e          ),
  .A18563      (A18563     ),
  .A144          (A144         ),
  .A1855d           (A1855d          ),
  .A150         (A150        ),
  .A18551      (A18551     ),
  .A151    (A151   ),
  .A18550     (A18550    ),
  .A1854e           (A1854e          ),
  .tclk                   (tclk                  ),
  .trst_b                 (trst_b                )
);
A15e  A18544 (
  .had_core_dbg_mode_req          (had_core_dbg_mode_req         ),
  .iu_had_xx_mldst                (iu_had_xx_mldst               ),
  .iu_had_xx_retire               (iu_had_xx_retire              ),
  .iu_had_xx_retire_normal        (iu_had_xx_retire_normal       ),
  .iu_yy_xx_dbgon                 (iu_yy_xx_dbgon                ),
  .A161                  (A161                 ),
  .A162                 (A162                ),
  .A1853f (A1853f)
);
endmodule
