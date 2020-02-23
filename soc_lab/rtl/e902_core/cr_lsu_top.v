/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_lsu_top(
  bmu_lsu_acc_err,
  bmu_lsu_bstack_chk_fail,
  bmu_lsu_data,
  bmu_lsu_data_vld,
  bmu_lsu_grnt,
  bmu_lsu_trans_cmplt,
  cp0_yy_be_v1,
  cp0_yy_be_v2,
  cp0_yy_clk_en,
  cp0_yy_machine_mode_aft_dbg,
  cpurst_b,
  forever_cpuclk,
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
  iu_yy_xx_flush,
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
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode
);
input           bmu_lsu_acc_err;                     
input           bmu_lsu_bstack_chk_fail;             
input   [31:0]  bmu_lsu_data;                        
input           bmu_lsu_data_vld;                    
input           bmu_lsu_grnt;                        
input           bmu_lsu_trans_cmplt;                 
input           cp0_yy_be_v1;                        
input           cp0_yy_be_v2;                        
input           cp0_yy_clk_en;                       
input           cp0_yy_machine_mode_aft_dbg;         
input           cpurst_b;                            
input           forever_cpuclk;                      
input   [31:0]  iu_lsu_base;                         
input           iu_lsu_cmp;                          
input   [31:0]  iu_lsu_data;                         
input           iu_lsu_ex_byte;                      
input           iu_lsu_ex_data_sel;                  
input           iu_lsu_ex_half;                      
input           iu_lsu_ex_sel;                       
input           iu_lsu_ex_store;                     
input           iu_lsu_ex_uns;                       
input   [31:0]  iu_lsu_imm_data;                     
input           iu_lsu_imm_sel;                      
input           iu_lsu_imm_write_en;                 
input   [31:0]  iu_lsu_offset;                       
input           iu_lsu_oper_mux_en;                  
input   [31:0]  iu_lsu_pc;                           
input           iu_lsu_pc_sel;                       
input           iu_lsu_rs1_sel;                      
input   [31:0]  iu_lsu_rs2;                          
input           iu_lsu_stall_without_hready;         
input           iu_lsu_wb_ldst;                      
input           iu_lsu_wb_load;                      
input           iu_lsu_wb_store;                     
input           iu_yy_xx_flush;                      
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
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
output  [31:0]  lsu_iu_addr;                         
output          lsu_iu_addr_vld;                     
output          lsu_iu_alu_sel;                      
output          lsu_iu_branch_cout;                  
output  [31:0]  lsu_iu_branch_rst;                   
output  [31:0]  lsu_iu_data;                         
output          lsu_iu_data_vld;                     
output  [4 :0]  lsu_iu_expt_vec;                     
output          lsu_iu_expt_vld;                     
output          lsu_iu_fast_retire;                  
output  [31:0]  lsu_iu_mad_buf;                      
output          lsu_iu_req;                          
output          lsu_iu_stall;                        
output          lsu_iu_stall_noinput;                
output          lsu_iu_store;                        
output          lsu_iu_wb_acc_err;                   
output          lsu_iu_wb_bstack_chk_fail;           
output          lsu_iu_wb_cmplt;                     
output          lsu_iu_wb_data_vld;                  
output  [31:0]  lsu_iu_wb_load_data;                 
output          lsu_iu_wfd;                          
wire            bmu_lsu_acc_err;                     
wire            bmu_lsu_bstack_chk_fail;             
wire    [31:0]  bmu_lsu_data;                        
wire            bmu_lsu_data_vld;                    
wire            bmu_lsu_grnt;                        
wire            bmu_lsu_trans_cmplt;                 
wire            cp0_yy_be_v1;                        
wire            cp0_yy_be_v2;                        
wire            cp0_yy_clk_en;                       
wire            cp0_yy_machine_mode_aft_dbg;         
wire            cpurst_b;                            
wire            ctrl_dp_ldst_info_buf_reuse;         
wire            ctrl_dp_ldst_req_grnt;               
wire            ctrl_dp_store_buffer_updt;           
wire            ctrl_top_req_en;                     
wire            dp_ctrl_misalign;                    
wire            forever_cpuclk;                      
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
wire            iu_yy_xx_flush;                      
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
wire            lsu_inst_store;                      
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
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire            randclk_dp_size_buf_mod_en_w5;       
wire            top_sm_clk_en;                       
wire            unalign_ctrl_not_last_beat;          
wire            unalign_ctrl_stall;                  
wire            unalign_dp_first_req;                
wire            unalign_dp_load_data_byte1_to_byte1; 
wire            unalign_dp_load_data_byte1_to_byte2; 
wire            unalign_dp_load_data_byte1_to_byte3; 
wire            unalign_dp_load_data_byte1_to_byte4; 
wire            unalign_dp_load_data_byte2_to_byte1; 
wire            unalign_dp_load_data_byte2_to_byte2; 
wire            unalign_dp_load_data_byte2_to_byte3; 
wire            unalign_dp_load_data_byte2_to_byte4; 
wire            unalign_dp_load_data_byte3_to_byte1; 
wire            unalign_dp_load_data_byte3_to_byte2; 
wire            unalign_dp_load_data_byte3_to_byte3; 
wire            unalign_dp_load_data_byte3_to_byte4; 
wire            unalign_dp_load_data_byte4_to_byte1; 
wire            unalign_dp_load_data_byte4_to_byte2; 
wire            unalign_dp_load_data_byte4_to_byte3; 
wire            unalign_dp_load_data_byte4_to_byte4; 
wire            unalign_dp_store_data_byte1_to_byte1; 
wire            unalign_dp_store_data_byte1_to_byte2; 
wire            unalign_dp_store_data_byte1_to_byte3; 
wire            unalign_dp_store_data_byte1_to_byte4; 
wire            unalign_dp_store_data_byte2_to_byte1; 
wire            unalign_dp_store_data_byte2_to_byte2; 
wire            unalign_dp_store_data_byte2_to_byte3; 
wire            unalign_dp_store_data_byte2_to_byte4; 
wire            unalign_dp_store_data_byte3_to_byte1; 
wire            unalign_dp_store_data_byte3_to_byte2; 
wire            unalign_dp_store_data_byte3_to_byte3; 
wire            unalign_dp_store_data_byte3_to_byte4; 
wire            unalign_dp_store_data_byte4_to_byte1; 
wire            unalign_dp_store_data_byte4_to_byte2; 
wire            unalign_dp_store_data_byte4_to_byte3; 
wire            unalign_dp_store_data_byte4_to_byte4; 
wire            unalign_top_clk_en;                  
wire            unalign_xx_split_on;                 
assign top_sm_clk_en = ctrl_top_req_en || unalign_top_clk_en;
cr_lsu_dp  x_cr_lsu_dp (
  .bmu_lsu_data                         (bmu_lsu_data                        ),
  .cp0_yy_be_v1                         (cp0_yy_be_v1                        ),
  .cp0_yy_be_v2                         (cp0_yy_be_v2                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cp0_yy_machine_mode_aft_dbg          (cp0_yy_machine_mode_aft_dbg         ),
  .cpurst_b                             (cpurst_b                            ),
  .cru_lsu_acc_ca                       (1'b0                                ),
  .ctrl_dp_ldst_info_buf_reuse          (ctrl_dp_ldst_info_buf_reuse         ),
  .ctrl_dp_ldst_req_grnt                (ctrl_dp_ldst_req_grnt               ),
  .ctrl_dp_store_buffer_updt            (ctrl_dp_store_buffer_updt           ),
  .dp_ctrl_misalign                     (dp_ctrl_misalign                    ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .iu_lsu_base                          (iu_lsu_base                         ),
  .iu_lsu_cmp                           (iu_lsu_cmp                          ),
  .iu_lsu_data                          (iu_lsu_data                         ),
  .iu_lsu_ex_byte                       (iu_lsu_ex_byte                      ),
  .iu_lsu_ex_data_sel                   (iu_lsu_ex_data_sel                  ),
  .iu_lsu_ex_half                       (iu_lsu_ex_half                      ),
  .iu_lsu_ex_uns                        (iu_lsu_ex_uns                       ),
  .iu_lsu_imm_data                      (iu_lsu_imm_data                     ),
  .iu_lsu_imm_sel                       (iu_lsu_imm_sel                      ),
  .iu_lsu_imm_write_en                  (iu_lsu_imm_write_en                 ),
  .iu_lsu_offset                        (iu_lsu_offset                       ),
  .iu_lsu_oper_mux_en                   (iu_lsu_oper_mux_en                  ),
  .iu_lsu_pc                            (iu_lsu_pc                           ),
  .iu_lsu_pc_sel                        (iu_lsu_pc_sel                       ),
  .iu_lsu_rs1_sel                       (iu_lsu_rs1_sel                      ),
  .iu_lsu_rs2                           (iu_lsu_rs2                          ),
  .lsu_bmu_addr                         (lsu_bmu_addr                        ),
  .lsu_bmu_prot                         (lsu_bmu_prot                        ),
  .lsu_bmu_size                         (lsu_bmu_size                        ),
  .lsu_bmu_store_error                  (lsu_bmu_store_error                 ),
  .lsu_bmu_wdata                        (lsu_bmu_wdata                       ),
  .lsu_bmu_write                        (lsu_bmu_write                       ),
  .lsu_had_addr                         (lsu_had_addr                        ),
  .lsu_had_st                           (lsu_had_st                          ),
  .lsu_inst_store                       (lsu_inst_store                      ),
  .lsu_iu_addr                          (lsu_iu_addr                         ),
  .lsu_iu_addr_vld                      (lsu_iu_addr_vld                     ),
  .lsu_iu_alu_sel                       (lsu_iu_alu_sel                      ),
  .lsu_iu_branch_cout                   (lsu_iu_branch_cout                  ),
  .lsu_iu_branch_rst                    (lsu_iu_branch_rst                   ),
  .lsu_iu_data                          (lsu_iu_data                         ),
  .lsu_iu_mad_buf                       (lsu_iu_mad_buf                      ),
  .lsu_iu_store                         (lsu_iu_store                        ),
  .lsu_iu_wb_load_data                  (lsu_iu_wb_load_data                 ),
  .pad_yy_gate_clk_en_b                 (pad_yy_gate_clk_en_b                ),
  .pad_yy_test_mode                     (pad_yy_test_mode                    ),
  .pmp_lsu_acc_scu                      (1'b0                                ),
  .randclk_dp_size_buf_mod_en_w5        (randclk_dp_size_buf_mod_en_w5       ),
  .unalign_dp_first_req                 (unalign_dp_first_req                ),
  .unalign_dp_load_data_byte1_to_byte1  (unalign_dp_load_data_byte1_to_byte1 ),
  .unalign_dp_load_data_byte1_to_byte2  (unalign_dp_load_data_byte1_to_byte2 ),
  .unalign_dp_load_data_byte1_to_byte3  (unalign_dp_load_data_byte1_to_byte3 ),
  .unalign_dp_load_data_byte1_to_byte4  (unalign_dp_load_data_byte1_to_byte4 ),
  .unalign_dp_load_data_byte2_to_byte1  (unalign_dp_load_data_byte2_to_byte1 ),
  .unalign_dp_load_data_byte2_to_byte2  (unalign_dp_load_data_byte2_to_byte2 ),
  .unalign_dp_load_data_byte2_to_byte3  (unalign_dp_load_data_byte2_to_byte3 ),
  .unalign_dp_load_data_byte2_to_byte4  (unalign_dp_load_data_byte2_to_byte4 ),
  .unalign_dp_load_data_byte3_to_byte1  (unalign_dp_load_data_byte3_to_byte1 ),
  .unalign_dp_load_data_byte3_to_byte2  (unalign_dp_load_data_byte3_to_byte2 ),
  .unalign_dp_load_data_byte3_to_byte3  (unalign_dp_load_data_byte3_to_byte3 ),
  .unalign_dp_load_data_byte3_to_byte4  (unalign_dp_load_data_byte3_to_byte4 ),
  .unalign_dp_load_data_byte4_to_byte1  (unalign_dp_load_data_byte4_to_byte1 ),
  .unalign_dp_load_data_byte4_to_byte2  (unalign_dp_load_data_byte4_to_byte2 ),
  .unalign_dp_load_data_byte4_to_byte3  (unalign_dp_load_data_byte4_to_byte3 ),
  .unalign_dp_load_data_byte4_to_byte4  (unalign_dp_load_data_byte4_to_byte4 ),
  .unalign_dp_store_data_byte1_to_byte1 (unalign_dp_store_data_byte1_to_byte1),
  .unalign_dp_store_data_byte1_to_byte2 (unalign_dp_store_data_byte1_to_byte2),
  .unalign_dp_store_data_byte1_to_byte3 (unalign_dp_store_data_byte1_to_byte3),
  .unalign_dp_store_data_byte1_to_byte4 (unalign_dp_store_data_byte1_to_byte4),
  .unalign_dp_store_data_byte2_to_byte1 (unalign_dp_store_data_byte2_to_byte1),
  .unalign_dp_store_data_byte2_to_byte2 (unalign_dp_store_data_byte2_to_byte2),
  .unalign_dp_store_data_byte2_to_byte3 (unalign_dp_store_data_byte2_to_byte3),
  .unalign_dp_store_data_byte2_to_byte4 (unalign_dp_store_data_byte2_to_byte4),
  .unalign_dp_store_data_byte3_to_byte1 (unalign_dp_store_data_byte3_to_byte1),
  .unalign_dp_store_data_byte3_to_byte2 (unalign_dp_store_data_byte3_to_byte2),
  .unalign_dp_store_data_byte3_to_byte3 (unalign_dp_store_data_byte3_to_byte3),
  .unalign_dp_store_data_byte3_to_byte4 (unalign_dp_store_data_byte3_to_byte4),
  .unalign_dp_store_data_byte4_to_byte1 (unalign_dp_store_data_byte4_to_byte1),
  .unalign_dp_store_data_byte4_to_byte2 (unalign_dp_store_data_byte4_to_byte2),
  .unalign_dp_store_data_byte4_to_byte3 (unalign_dp_store_data_byte4_to_byte3),
  .unalign_dp_store_data_byte4_to_byte4 (unalign_dp_store_data_byte4_to_byte4)
);
cr_lsu_ctrl  x_cr_lsu_ctrl (
  .bmu_lsu_acc_err             (bmu_lsu_acc_err            ),
  .bmu_lsu_bstack_chk_fail     (bmu_lsu_bstack_chk_fail    ),
  .bmu_lsu_data_vld            (bmu_lsu_data_vld           ),
  .bmu_lsu_grnt                (bmu_lsu_grnt               ),
  .bmu_lsu_trans_cmplt         (bmu_lsu_trans_cmplt        ),
  .cpurst_b                    (cpurst_b                   ),
  .ctrl_dp_ldst_info_buf_reuse (ctrl_dp_ldst_info_buf_reuse),
  .ctrl_dp_ldst_req_grnt       (ctrl_dp_ldst_req_grnt      ),
  .ctrl_dp_store_buffer_updt   (ctrl_dp_store_buffer_updt  ),
  .ctrl_top_req_en             (ctrl_top_req_en            ),
  .dp_ctrl_misalign            (dp_ctrl_misalign           ),
  .iu_lsu_ex_data_sel          (iu_lsu_ex_data_sel         ),
  .iu_lsu_ex_sel               (iu_lsu_ex_sel              ),
  .iu_lsu_ex_store             (iu_lsu_ex_store            ),
  .iu_lsu_oper_mux_en          (iu_lsu_oper_mux_en         ),
  .iu_lsu_stall_without_hready (iu_lsu_stall_without_hready),
  .iu_lsu_wb_ldst              (iu_lsu_wb_ldst             ),
  .iu_lsu_wb_load              (iu_lsu_wb_load             ),
  .iu_lsu_wb_store             (iu_lsu_wb_store            ),
  .iu_yy_xx_flush              (iu_yy_xx_flush             ),
  .lsu_bmu_addr_check_fail     (lsu_bmu_addr_check_fail    ),
  .lsu_bmu_idle                (lsu_bmu_idle               ),
  .lsu_bmu_req                 (lsu_bmu_req                ),
  .lsu_bmu_req_without_cmplt   (lsu_bmu_req_without_cmplt  ),
  .lsu_bmu_sg_chk_fail         (lsu_bmu_sg_chk_fail        ),
  .lsu_bmu_wfd1                (lsu_bmu_wfd1               ),
  .lsu_had_addr_vld            (lsu_had_addr_vld           ),
  .lsu_had_ex_cmplt            (lsu_had_ex_cmplt           ),
  .lsu_inst_store              (lsu_inst_store             ),
  .lsu_iu_data_vld             (lsu_iu_data_vld            ),
  .lsu_iu_expt_vec             (lsu_iu_expt_vec            ),
  .lsu_iu_expt_vld             (lsu_iu_expt_vld            ),
  .lsu_iu_fast_retire          (lsu_iu_fast_retire         ),
  .lsu_iu_req                  (lsu_iu_req                 ),
  .lsu_iu_stall                (lsu_iu_stall               ),
  .lsu_iu_stall_noinput        (lsu_iu_stall_noinput       ),
  .lsu_iu_wb_acc_err           (lsu_iu_wb_acc_err          ),
  .lsu_iu_wb_bstack_chk_fail   (lsu_iu_wb_bstack_chk_fail  ),
  .lsu_iu_wb_cmplt             (lsu_iu_wb_cmplt            ),
  .lsu_iu_wb_data_vld          (lsu_iu_wb_data_vld         ),
  .lsu_iu_wfd                  (lsu_iu_wfd                 ),
  .sm_clk                      (forever_cpuclk             ),
  .unalign_ctrl_not_last_beat  (unalign_ctrl_not_last_beat ),
  .unalign_ctrl_stall          (unalign_ctrl_stall         ),
  .unalign_xx_split_on         (unalign_xx_split_on        )
);
cr_lsu_randclk  x_randclk (
  .randclk_dp_size_buf_mod_en_w5 (randclk_dp_size_buf_mod_en_w5)
);
cr_lsu_unalign  x_cr_lsu_unalign (
  .unalign_ctrl_not_last_beat           (unalign_ctrl_not_last_beat          ),
  .unalign_ctrl_stall                   (unalign_ctrl_stall                  ),
  .unalign_dp_first_req                 (unalign_dp_first_req                ),
  .unalign_dp_load_data_byte1_to_byte1  (unalign_dp_load_data_byte1_to_byte1 ),
  .unalign_dp_load_data_byte1_to_byte2  (unalign_dp_load_data_byte1_to_byte2 ),
  .unalign_dp_load_data_byte1_to_byte3  (unalign_dp_load_data_byte1_to_byte3 ),
  .unalign_dp_load_data_byte1_to_byte4  (unalign_dp_load_data_byte1_to_byte4 ),
  .unalign_dp_load_data_byte2_to_byte1  (unalign_dp_load_data_byte2_to_byte1 ),
  .unalign_dp_load_data_byte2_to_byte2  (unalign_dp_load_data_byte2_to_byte2 ),
  .unalign_dp_load_data_byte2_to_byte3  (unalign_dp_load_data_byte2_to_byte3 ),
  .unalign_dp_load_data_byte2_to_byte4  (unalign_dp_load_data_byte2_to_byte4 ),
  .unalign_dp_load_data_byte3_to_byte1  (unalign_dp_load_data_byte3_to_byte1 ),
  .unalign_dp_load_data_byte3_to_byte2  (unalign_dp_load_data_byte3_to_byte2 ),
  .unalign_dp_load_data_byte3_to_byte3  (unalign_dp_load_data_byte3_to_byte3 ),
  .unalign_dp_load_data_byte3_to_byte4  (unalign_dp_load_data_byte3_to_byte4 ),
  .unalign_dp_load_data_byte4_to_byte1  (unalign_dp_load_data_byte4_to_byte1 ),
  .unalign_dp_load_data_byte4_to_byte2  (unalign_dp_load_data_byte4_to_byte2 ),
  .unalign_dp_load_data_byte4_to_byte3  (unalign_dp_load_data_byte4_to_byte3 ),
  .unalign_dp_load_data_byte4_to_byte4  (unalign_dp_load_data_byte4_to_byte4 ),
  .unalign_dp_store_data_byte1_to_byte1 (unalign_dp_store_data_byte1_to_byte1),
  .unalign_dp_store_data_byte1_to_byte2 (unalign_dp_store_data_byte1_to_byte2),
  .unalign_dp_store_data_byte1_to_byte3 (unalign_dp_store_data_byte1_to_byte3),
  .unalign_dp_store_data_byte1_to_byte4 (unalign_dp_store_data_byte1_to_byte4),
  .unalign_dp_store_data_byte2_to_byte1 (unalign_dp_store_data_byte2_to_byte1),
  .unalign_dp_store_data_byte2_to_byte2 (unalign_dp_store_data_byte2_to_byte2),
  .unalign_dp_store_data_byte2_to_byte3 (unalign_dp_store_data_byte2_to_byte3),
  .unalign_dp_store_data_byte2_to_byte4 (unalign_dp_store_data_byte2_to_byte4),
  .unalign_dp_store_data_byte3_to_byte1 (unalign_dp_store_data_byte3_to_byte1),
  .unalign_dp_store_data_byte3_to_byte2 (unalign_dp_store_data_byte3_to_byte2),
  .unalign_dp_store_data_byte3_to_byte3 (unalign_dp_store_data_byte3_to_byte3),
  .unalign_dp_store_data_byte3_to_byte4 (unalign_dp_store_data_byte3_to_byte4),
  .unalign_dp_store_data_byte4_to_byte1 (unalign_dp_store_data_byte4_to_byte1),
  .unalign_dp_store_data_byte4_to_byte2 (unalign_dp_store_data_byte4_to_byte2),
  .unalign_dp_store_data_byte4_to_byte3 (unalign_dp_store_data_byte4_to_byte3),
  .unalign_dp_store_data_byte4_to_byte4 (unalign_dp_store_data_byte4_to_byte4),
  .unalign_top_clk_en                   (unalign_top_clk_en                  ),
  .unalign_xx_split_on                  (unalign_xx_split_on                 )
);
endmodule
