/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clic_top(
  clic_pad_int_hv,
  clic_pad_int_id,
  clic_pad_int_il,
  clic_pad_int_priv,
  clic_tcipif_cmplt,
  clic_tcipif_rdata,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  forever_cpuclk,
  forever_cpuclk_nogated,
  pad_clic_int_cfg,
  pad_clic_int_vld,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  tcipif_clic_addr,
  tcipif_clic_sel,
  tcipif_clic_size,
  tcipif_clic_wdata,
  tcipif_clic_write
);
input   [9  :0]  cpu_clic_curid;                
input            cpu_clic_int_exit;             
input            cpurst_b;                      
input            forever_cpuclk;                
input            forever_cpuclk_nogated;        
input   [63 :0]  pad_clic_int_cfg;              
input   [63 :0]  pad_clic_int_vld;              
input            pad_yy_gate_clk_en_b;          
input            pad_yy_test_mode;              
input   [15 :0]  tcipif_clic_addr;              
input            tcipif_clic_sel;               
input   [1  :0]  tcipif_clic_size;              
input   [31 :0]  tcipif_clic_wdata;             
input            tcipif_clic_write;             
output           clic_pad_int_hv;               
output  [9  :0]  clic_pad_int_id;               
output  [7  :0]  clic_pad_int_il;               
output  [1  :0]  clic_pad_int_priv;             
output           clic_tcipif_cmplt;             
output  [31 :0]  clic_tcipif_rdata;             
wire             arb_ctrl_output_clk_en;        
wire             clic_pad_int_hv;               
wire    [9  :0]  clic_pad_int_id;               
wire    [7  :0]  clic_pad_int_il;               
wire    [1  :0]  clic_pad_int_priv;             
wire             clic_tcipif_cmplt;             
wire    [31 :0]  clic_tcipif_rdata;             
wire             cliccfg_cpuclk;                
wire    [7  :0]  cliccfg_data;                  
wire    [7  :0]  clicth_data;                   
wire    [9  :0]  clicthcfg_data;                
wire    [9  :0]  cpu_clic_curid;                
wire             cpu_clic_int_exit;             
wire             cpurst_b;                      
wire             ctl_gate_cliccfg_en;           
wire             ctl_gate_en;                   
wire             ctl_gate_intcfg_en;            
wire             ctl_gate_output_en;            
wire    [63 :0]  ctrl_arb_int_sec;              
wire    [63 :0]  ctrl_arb_prio0_mask;           
wire    [63 :0]  ctrl_arb_prio10_mask;          
wire    [63 :0]  ctrl_arb_prio11_mask;          
wire    [63 :0]  ctrl_arb_prio12_mask;          
wire    [63 :0]  ctrl_arb_prio13_mask;          
wire    [63 :0]  ctrl_arb_prio14_mask;          
wire    [63 :0]  ctrl_arb_prio15_mask;          
wire    [63 :0]  ctrl_arb_prio1_mask;           
wire    [63 :0]  ctrl_arb_prio2_mask;           
wire    [63 :0]  ctrl_arb_prio3_mask;           
wire    [63 :0]  ctrl_arb_prio4_mask;           
wire    [63 :0]  ctrl_arb_prio5_mask;           
wire    [63 :0]  ctrl_arb_prio6_mask;           
wire    [63 :0]  ctrl_arb_prio7_mask;           
wire    [63 :0]  ctrl_arb_prio8_mask;           
wire    [63 :0]  ctrl_arb_prio9_mask;           
wire    [7  :0]  ctrl_xx_cliccfg_updt_val;      
wire             ctrl_xx_cliccfg_updt_vld;      
wire    [7  :0]  ctrl_xx_clicth_updt_val;       
wire             ctrl_xx_clicth_updt_vld;       
wire             ctrl_xx_clicthcfg_hi_updt_vld; 
wire             ctrl_xx_clicthcfg_lo_updt_vld; 
wire    [9  :0]  ctrl_xx_clicthcfg_updt_val;    
wire             ctrl_xx_clicthcfg_updt_vld;    
wire    [63 :0]  ctrl_xx_int_req;               
wire    [511:0]  ctrl_xx_intcfg_updt_val;       
wire    [63 :0]  ctrl_xx_intcfg_updt_vld;       
wire    [63 :0]  ctrl_xx_intie_updt_val;        
wire    [63 :0]  ctrl_xx_intie_updt_vld;        
wire    [63 :0]  ctrl_xx_intip_sw_clear_pending; 
wire    [63 :0]  ctrl_xx_intip_sw_set_pending;  
wire    [15 :0]  ctrl_xx_intip_updt_vld;        
wire    [63 :0]  ctrl_xx_intsec_updt_val;       
wire    [0  :0]  ctrl_xx_prot_sec;              
wire             forever_cpuclk;                
wire             forever_cpuclk_nogated;        
wire    [31 :0]  intcfg_read_data_0;            
wire    [31 :0]  intcfg_read_data_1;            
wire    [31 :0]  intcfg_read_data_10;           
wire    [31 :0]  intcfg_read_data_11;           
wire    [31 :0]  intcfg_read_data_12;           
wire    [31 :0]  intcfg_read_data_13;           
wire    [31 :0]  intcfg_read_data_14;           
wire    [31 :0]  intcfg_read_data_15;           
wire    [31 :0]  intcfg_read_data_2;            
wire    [31 :0]  intcfg_read_data_3;            
wire    [31 :0]  intcfg_read_data_4;            
wire    [31 :0]  intcfg_read_data_5;            
wire    [31 :0]  intcfg_read_data_6;            
wire    [31 :0]  intcfg_read_data_7;            
wire    [31 :0]  intcfg_read_data_8;            
wire    [31 :0]  intcfg_read_data_9;            
wire    [31 :0]  intie_read_data_0;             
wire    [31 :0]  intie_read_data_1;             
wire    [31 :0]  intie_read_data_10;            
wire    [31 :0]  intie_read_data_11;            
wire    [31 :0]  intie_read_data_12;            
wire    [31 :0]  intie_read_data_13;            
wire    [31 :0]  intie_read_data_14;            
wire    [31 :0]  intie_read_data_15;            
wire    [31 :0]  intie_read_data_2;             
wire    [31 :0]  intie_read_data_3;             
wire    [31 :0]  intie_read_data_4;             
wire    [31 :0]  intie_read_data_5;             
wire    [31 :0]  intie_read_data_6;             
wire    [31 :0]  intie_read_data_7;             
wire    [31 :0]  intie_read_data_8;             
wire    [31 :0]  intie_read_data_9;             
wire    [31 :0]  intip_read_data_0;             
wire    [31 :0]  intip_read_data_1;             
wire    [31 :0]  intip_read_data_10;            
wire    [31 :0]  intip_read_data_11;            
wire    [31 :0]  intip_read_data_12;            
wire    [31 :0]  intip_read_data_13;            
wire    [31 :0]  intip_read_data_14;            
wire    [31 :0]  intip_read_data_15;            
wire    [31 :0]  intip_read_data_2;             
wire    [31 :0]  intip_read_data_3;             
wire    [31 :0]  intip_read_data_4;             
wire    [31 :0]  intip_read_data_5;             
wire    [31 :0]  intip_read_data_6;             
wire    [31 :0]  intip_read_data_7;             
wire    [31 :0]  intip_read_data_8;             
wire    [31 :0]  intip_read_data_9;             
wire             kid_arb_int_req;               
wire             kid_arb_int_sec;               
wire             kid_arb_pending_dummy_en;      
wire    [63 :0]  kid_arb_pending_en;            
wire             kid_arb_prio0_mask;            
wire             kid_arb_prio10_mask;           
wire             kid_arb_prio11_mask;           
wire             kid_arb_prio12_mask;           
wire             kid_arb_prio13_mask;           
wire             kid_arb_prio14_mask;           
wire             kid_arb_prio15_mask;           
wire             kid_arb_prio1_mask;            
wire             kid_arb_prio2_mask;            
wire             kid_arb_prio3_mask;            
wire             kid_arb_prio4_mask;            
wire             kid_arb_prio5_mask;            
wire             kid_arb_prio6_mask;            
wire             kid_arb_prio7_mask;            
wire             kid_arb_prio8_mask;            
wire             kid_arb_prio9_mask;            
wire    [63 :0]  kid_arb_sample_en;             
wire             kid_arb_sample_en0;            
wire    [511:0]  kid_xx_ie;                     
wire    [7  :0]  kid_xx_ie0;                    
wire    [511:0]  kid_xx_intcfg;                 
wire    [7  :0]  kid_xx_intcfg0;                
wire    [511:0]  kid_xx_ip;                     
wire    [7  :0]  kid_xx_ip0;                    
wire             m_th_clr_clk_en;               
wire             out_clk;                       
wire             pad_yy_gate_clk_en_b;          
wire             pad_yy_test_mode;              
wire             pending_cpuclk;                
wire             pending_en;                    
wire             pri_cpuclk;                    
wire             regs_cpuclk;                   
wire             sample_cpuclk;                 
wire             sample_en;                     
wire    [15 :0]  tcipif_clic_addr;              
wire             tcipif_clic_sel;               
wire    [1  :0]  tcipif_clic_size;              
wire    [31 :0]  tcipif_clic_wdata;             
wire             tcipif_clic_write;             
parameter CLICINTNUM = 64;
assign ctl_gate_en = |ctrl_xx_intie_updt_vld[CLICINTNUM-1:0];
gated_clk_cell  x_clic_enable_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (regs_cpuclk         ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (1'b0                ),
  .module_en            (ctl_gate_en         ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign pending_en  = |kid_arb_pending_en[CLICINTNUM-1:0];
gated_clk_cell  x_clic_pend_gated_clk (
  .clk_in                 (forever_cpuclk_nogated),
  .clk_out                (pending_cpuclk        ),
  .external_en            (1'b0                  ),
  .global_en              (1'b1                  ),
  .local_en               (pending_en            ),
  .module_en              (1'b0                  ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      )
);
assign sample_en = |kid_arb_sample_en[CLICINTNUM-1:0];
gated_clk_cell  x_clic_sample_gated_clk (
  .clk_in                 (forever_cpuclk_nogated),
  .clk_out                (sample_cpuclk         ),
  .external_en            (1'b0                  ),
  .global_en              (1'b1                  ),
  .local_en               (sample_en             ),
  .module_en              (1'b0                  ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      )
);
assign ctl_gate_intcfg_en = |ctrl_xx_intcfg_updt_vld[CLICINTNUM-1:0];
gated_clk_cell  x_clic_pri_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (pri_cpuclk          ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ctl_gate_intcfg_en  ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign ctl_gate_cliccfg_en = ctrl_xx_cliccfg_updt_vld 
                             || ctrl_xx_clicth_updt_vld 
                             || m_th_clr_clk_en 
                             || ctrl_xx_clicthcfg_updt_vld;
gated_clk_cell  x_clic_cfg_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (cliccfg_cpuclk      ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ctl_gate_cliccfg_en ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
gated_clk_cell  x_clic_output_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (out_clk             ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ctl_gate_output_en  ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign ctl_gate_output_en = arb_ctrl_output_clk_en;
cr_clic_reg_if  x_cr_clic_reg_if (
  .clic_tcipif_cmplt              (clic_tcipif_cmplt             ),
  .clic_tcipif_rdata              (clic_tcipif_rdata             ),
  .cliccfg_data                   (cliccfg_data                  ),
  .clicth_data                    (clicth_data                   ),
  .clicthcfg_data                 (clicthcfg_data                ),
  .ctrl_xx_cliccfg_updt_val       (ctrl_xx_cliccfg_updt_val      ),
  .ctrl_xx_cliccfg_updt_vld       (ctrl_xx_cliccfg_updt_vld      ),
  .ctrl_xx_clicth_updt_val        (ctrl_xx_clicth_updt_val       ),
  .ctrl_xx_clicth_updt_vld        (ctrl_xx_clicth_updt_vld       ),
  .ctrl_xx_clicthcfg_hi_updt_vld  (ctrl_xx_clicthcfg_hi_updt_vld ),
  .ctrl_xx_clicthcfg_lo_updt_vld  (ctrl_xx_clicthcfg_lo_updt_vld ),
  .ctrl_xx_clicthcfg_updt_val     (ctrl_xx_clicthcfg_updt_val    ),
  .ctrl_xx_clicthcfg_updt_vld     (ctrl_xx_clicthcfg_updt_vld    ),
  .ctrl_xx_intcfg_updt_val        (ctrl_xx_intcfg_updt_val       ),
  .ctrl_xx_intcfg_updt_vld        (ctrl_xx_intcfg_updt_vld       ),
  .ctrl_xx_intie_updt_val         (ctrl_xx_intie_updt_val        ),
  .ctrl_xx_intie_updt_vld         (ctrl_xx_intie_updt_vld        ),
  .ctrl_xx_intip_sw_clear_pending (ctrl_xx_intip_sw_clear_pending),
  .ctrl_xx_intip_sw_set_pending   (ctrl_xx_intip_sw_set_pending  ),
  .ctrl_xx_intip_updt_vld         (ctrl_xx_intip_updt_vld        ),
  .ctrl_xx_intsec_updt_val        (ctrl_xx_intsec_updt_val       ),
  .ctrl_xx_prot_sec               (ctrl_xx_prot_sec              ),
  .intcfg_read_data_0             (intcfg_read_data_0            ),
  .intcfg_read_data_1             (intcfg_read_data_1            ),
  .intcfg_read_data_10            (intcfg_read_data_10           ),
  .intcfg_read_data_11            (intcfg_read_data_11           ),
  .intcfg_read_data_12            (intcfg_read_data_12           ),
  .intcfg_read_data_13            (intcfg_read_data_13           ),
  .intcfg_read_data_14            (intcfg_read_data_14           ),
  .intcfg_read_data_15            (intcfg_read_data_15           ),
  .intcfg_read_data_2             (intcfg_read_data_2            ),
  .intcfg_read_data_3             (intcfg_read_data_3            ),
  .intcfg_read_data_4             (intcfg_read_data_4            ),
  .intcfg_read_data_5             (intcfg_read_data_5            ),
  .intcfg_read_data_6             (intcfg_read_data_6            ),
  .intcfg_read_data_7             (intcfg_read_data_7            ),
  .intcfg_read_data_8             (intcfg_read_data_8            ),
  .intcfg_read_data_9             (intcfg_read_data_9            ),
  .intie_read_data_0              (intie_read_data_0             ),
  .intie_read_data_1              (intie_read_data_1             ),
  .intie_read_data_10             (intie_read_data_10            ),
  .intie_read_data_11             (intie_read_data_11            ),
  .intie_read_data_12             (intie_read_data_12            ),
  .intie_read_data_13             (intie_read_data_13            ),
  .intie_read_data_14             (intie_read_data_14            ),
  .intie_read_data_15             (intie_read_data_15            ),
  .intie_read_data_2              (intie_read_data_2             ),
  .intie_read_data_3              (intie_read_data_3             ),
  .intie_read_data_4              (intie_read_data_4             ),
  .intie_read_data_5              (intie_read_data_5             ),
  .intie_read_data_6              (intie_read_data_6             ),
  .intie_read_data_7              (intie_read_data_7             ),
  .intie_read_data_8              (intie_read_data_8             ),
  .intie_read_data_9              (intie_read_data_9             ),
  .intip_read_data_0              (intip_read_data_0             ),
  .intip_read_data_1              (intip_read_data_1             ),
  .intip_read_data_10             (intip_read_data_10            ),
  .intip_read_data_11             (intip_read_data_11            ),
  .intip_read_data_12             (intip_read_data_12            ),
  .intip_read_data_13             (intip_read_data_13            ),
  .intip_read_data_14             (intip_read_data_14            ),
  .intip_read_data_15             (intip_read_data_15            ),
  .intip_read_data_2              (intip_read_data_2             ),
  .intip_read_data_3              (intip_read_data_3             ),
  .intip_read_data_4              (intip_read_data_4             ),
  .intip_read_data_5              (intip_read_data_5             ),
  .intip_read_data_6              (intip_read_data_6             ),
  .intip_read_data_7              (intip_read_data_7             ),
  .intip_read_data_8              (intip_read_data_8             ),
  .intip_read_data_9              (intip_read_data_9             ),
  .tcipif_clic_addr               (tcipif_clic_addr              ),
  .tcipif_clic_sel                (tcipif_clic_sel               ),
  .tcipif_clic_size               (tcipif_clic_size              ),
  .tcipif_clic_wdata              (tcipif_clic_wdata             ),
  .tcipif_clic_write              (tcipif_clic_write             )
);
cr_clic_arb  x_cr_clic_arb (
  .arb_ctrl_output_clk_en        (arb_ctrl_output_clk_en       ),
  .clic_pad_int_hv               (clic_pad_int_hv              ),
  .clic_pad_int_id               (clic_pad_int_id              ),
  .clic_pad_int_il               (clic_pad_int_il              ),
  .clic_pad_int_priv             (clic_pad_int_priv            ),
  .cliccfg_cpuclk                (cliccfg_cpuclk               ),
  .cliccfg_data                  (cliccfg_data                 ),
  .clicth_data                   (clicth_data                  ),
  .clicthcfg_data                (clicthcfg_data               ),
  .cpu_clic_curid                (cpu_clic_curid               ),
  .cpu_clic_int_exit             (cpu_clic_int_exit            ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_arb_int_sec              (ctrl_arb_int_sec             ),
  .ctrl_arb_prio0_mask           (ctrl_arb_prio0_mask          ),
  .ctrl_arb_prio10_mask          (ctrl_arb_prio10_mask         ),
  .ctrl_arb_prio11_mask          (ctrl_arb_prio11_mask         ),
  .ctrl_arb_prio12_mask          (ctrl_arb_prio12_mask         ),
  .ctrl_arb_prio13_mask          (ctrl_arb_prio13_mask         ),
  .ctrl_arb_prio14_mask          (ctrl_arb_prio14_mask         ),
  .ctrl_arb_prio15_mask          (ctrl_arb_prio15_mask         ),
  .ctrl_arb_prio1_mask           (ctrl_arb_prio1_mask          ),
  .ctrl_arb_prio2_mask           (ctrl_arb_prio2_mask          ),
  .ctrl_arb_prio3_mask           (ctrl_arb_prio3_mask          ),
  .ctrl_arb_prio4_mask           (ctrl_arb_prio4_mask          ),
  .ctrl_arb_prio5_mask           (ctrl_arb_prio5_mask          ),
  .ctrl_arb_prio6_mask           (ctrl_arb_prio6_mask          ),
  .ctrl_arb_prio7_mask           (ctrl_arb_prio7_mask          ),
  .ctrl_arb_prio8_mask           (ctrl_arb_prio8_mask          ),
  .ctrl_arb_prio9_mask           (ctrl_arb_prio9_mask          ),
  .ctrl_xx_cliccfg_updt_val      (ctrl_xx_cliccfg_updt_val     ),
  .ctrl_xx_cliccfg_updt_vld      (ctrl_xx_cliccfg_updt_vld     ),
  .ctrl_xx_clicth_updt_val       (ctrl_xx_clicth_updt_val      ),
  .ctrl_xx_clicth_updt_vld       (ctrl_xx_clicth_updt_vld      ),
  .ctrl_xx_clicthcfg_hi_updt_vld (ctrl_xx_clicthcfg_hi_updt_vld),
  .ctrl_xx_clicthcfg_lo_updt_vld (ctrl_xx_clicthcfg_lo_updt_vld),
  .ctrl_xx_clicthcfg_updt_val    (ctrl_xx_clicthcfg_updt_val   ),
  .ctrl_xx_int_req               (ctrl_xx_int_req              ),
  .m_th_clr_clk_en               (m_th_clr_clk_en              ),
  .out_clk                       (out_clk                      )
);
cr_clic_kid  x_cr_clic_kid_dummy (
  .clicintie_updt_vld       (1'b0                    ),
  .cpurst_b                 (1'b1                    ),
  .ctl_xx_prot_sec          (1'b0                    ),
  .int_enable_updt_val      (1'b0                    ),
  .int_sec_updt_val         (1'b0                    ),
  .intcfg_updt_value        (8'b0                    ),
  .intcfg_updt_vld          (1'b0                    ),
  .kid_arb_int_req          (kid_arb_int_req         ),
  .kid_arb_int_sec          (kid_arb_int_sec         ),
  .kid_arb_pending_en       (kid_arb_pending_dummy_en),
  .kid_arb_prio0_mask       (kid_arb_prio0_mask      ),
  .kid_arb_prio10_mask      (kid_arb_prio10_mask     ),
  .kid_arb_prio11_mask      (kid_arb_prio11_mask     ),
  .kid_arb_prio12_mask      (kid_arb_prio12_mask     ),
  .kid_arb_prio13_mask      (kid_arb_prio13_mask     ),
  .kid_arb_prio14_mask      (kid_arb_prio14_mask     ),
  .kid_arb_prio15_mask      (kid_arb_prio15_mask     ),
  .kid_arb_prio1_mask       (kid_arb_prio1_mask      ),
  .kid_arb_prio2_mask       (kid_arb_prio2_mask      ),
  .kid_arb_prio3_mask       (kid_arb_prio3_mask      ),
  .kid_arb_prio4_mask       (kid_arb_prio4_mask      ),
  .kid_arb_prio5_mask       (kid_arb_prio5_mask      ),
  .kid_arb_prio6_mask       (kid_arb_prio6_mask      ),
  .kid_arb_prio7_mask       (kid_arb_prio7_mask      ),
  .kid_arb_prio8_mask       (kid_arb_prio8_mask      ),
  .kid_arb_prio9_mask       (kid_arb_prio9_mask      ),
  .kid_arb_sample_en        (kid_arb_sample_en0      ),
  .kid_xx_ie                (kid_xx_ie0              ),
  .kid_xx_intcfg            (kid_xx_intcfg0          ),
  .kid_xx_ip                (kid_xx_ip0              ),
  .pad_clic_int_cfg         (1'b0                    ),
  .pad_clic_int_vld         (1'b0                    ),
  .pending_cpuclk           (1'b0                    ),
  .pri_cpuclk               (1'b0                    ),
  .regs_cpuclk              (1'b0                    ),
  .sample_cpuclk            (1'b0                    ),
  .sw_clear_pending         (1'b0                    ),
  .sw_set_pending           (1'b0                    )
);
genvar i;
generate
for(i=0;i<CLICINTNUM;i=i+1)
begin:INT_KID
  cr_clic_kid x_cr_clic_kid(
      .clicintie_updt_vld(ctrl_xx_intie_updt_vld[i]),
      .cpurst_b(cpurst_b),
      .int_enable_updt_val(ctrl_xx_intie_updt_val[i]),
      .int_sec_updt_val(ctrl_xx_intsec_updt_val[i]),
      .intcfg_updt_vld(ctrl_xx_intcfg_updt_vld[i]),
      .ctl_xx_prot_sec(ctrl_xx_prot_sec),
      .kid_arb_int_req(ctrl_xx_int_req[i]),
      .kid_arb_int_sec(ctrl_arb_int_sec[i]),
      .kid_arb_pending_en(kid_arb_pending_en[i]),
      .kid_arb_prio0_mask(ctrl_arb_prio0_mask[i]),
      .kid_arb_prio1_mask(ctrl_arb_prio1_mask[i]),
      .kid_arb_prio2_mask(ctrl_arb_prio2_mask[i]),
      .kid_arb_prio3_mask(ctrl_arb_prio3_mask[i]),
      .kid_arb_prio4_mask(ctrl_arb_prio4_mask[i]),
      .kid_arb_prio5_mask(ctrl_arb_prio5_mask[i]),
      .kid_arb_prio6_mask(ctrl_arb_prio6_mask[i]),
      .kid_arb_prio7_mask(ctrl_arb_prio7_mask[i]),
      .kid_arb_prio8_mask(ctrl_arb_prio8_mask[i]),
      .kid_arb_prio9_mask(ctrl_arb_prio9_mask[i]),
      .kid_arb_prio10_mask(ctrl_arb_prio10_mask[i]),
      .kid_arb_prio11_mask(ctrl_arb_prio11_mask[i]),
      .kid_arb_prio12_mask(ctrl_arb_prio12_mask[i]),
      .kid_arb_prio13_mask(ctrl_arb_prio13_mask[i]),
      .kid_arb_prio14_mask(ctrl_arb_prio14_mask[i]),
      .kid_arb_prio15_mask(ctrl_arb_prio15_mask[i]),
      .kid_arb_sample_en(kid_arb_sample_en[i]),
      .kid_xx_ie(kid_xx_ie[8*i+:8]),
      .kid_xx_intcfg(kid_xx_intcfg[8*i+:8]),
      .kid_xx_ip(kid_xx_ip[8*i+:8]),
      .pad_clic_int_cfg(pad_clic_int_cfg[i]),
      .pad_clic_int_vld(pad_clic_int_vld[i]),
      .pending_cpuclk(pending_cpuclk),
      .pri_cpuclk(pri_cpuclk),
      .intcfg_updt_value(ctrl_xx_intcfg_updt_val[8*i+:8]),
      .regs_cpuclk(regs_cpuclk),
      .sample_cpuclk(sample_cpuclk),
      .sw_clear_pending(ctrl_xx_intip_sw_clear_pending[i]),
      .sw_set_pending(ctrl_xx_intip_sw_set_pending[i])
  );
end
endgenerate
assign intie_read_data_0[31:0] = kid_xx_ie[31:0];
assign intie_read_data_1[31:0] = kid_xx_ie[63:32];
assign intie_read_data_2[31:0] = kid_xx_ie[95:64];
assign intie_read_data_3[31:0] = kid_xx_ie[127:96];
assign intie_read_data_4[31:0] = kid_xx_ie[159:128];
assign intie_read_data_5[31:0] = kid_xx_ie[191:160];
assign intie_read_data_6[31:0] = kid_xx_ie[223:192];
assign intie_read_data_7[31:0] = kid_xx_ie[255:224];
assign intie_read_data_8[31:0] = kid_xx_ie[287:256];
assign intie_read_data_9[31:0] = kid_xx_ie[319:288];
assign intie_read_data_10[31:0] = kid_xx_ie[351:320];
assign intie_read_data_11[31:0] = kid_xx_ie[383:352];
assign intie_read_data_12[31:0] = kid_xx_ie[415:384];
assign intie_read_data_13[31:0] = kid_xx_ie[447:416];
assign intie_read_data_14[31:0] = kid_xx_ie[479:448];
assign intie_read_data_15[31:0] = kid_xx_ie[511:480];
assign intip_read_data_0[31:0] = kid_xx_ip[31:0];
assign intip_read_data_1[31:0] = kid_xx_ip[63:32];
assign intip_read_data_2[31:0] = kid_xx_ip[95:64];
assign intip_read_data_3[31:0] = kid_xx_ip[127:96];
assign intip_read_data_4[31:0] = kid_xx_ip[159:128];
assign intip_read_data_5[31:0] = kid_xx_ip[191:160];
assign intip_read_data_6[31:0] = kid_xx_ip[223:192];
assign intip_read_data_7[31:0] = kid_xx_ip[255:224];
assign intip_read_data_8[31:0] = kid_xx_ip[287:256];
assign intip_read_data_9[31:0] = kid_xx_ip[319:288];
assign intip_read_data_10[31:0] = kid_xx_ip[351:320];
assign intip_read_data_11[31:0] = kid_xx_ip[383:352];
assign intip_read_data_12[31:0] = kid_xx_ip[415:384];
assign intip_read_data_13[31:0] = kid_xx_ip[447:416];
assign intip_read_data_14[31:0] = kid_xx_ip[479:448];
assign intip_read_data_15[31:0] = kid_xx_ip[511:480];
assign intcfg_read_data_0[31:0] = kid_xx_intcfg[31:0];
assign intcfg_read_data_1[31:0] = kid_xx_intcfg[63:32];
assign intcfg_read_data_2[31:0] = kid_xx_intcfg[95:64];
assign intcfg_read_data_3[31:0] = kid_xx_intcfg[127:96];
assign intcfg_read_data_4[31:0] = kid_xx_intcfg[159:128];
assign intcfg_read_data_5[31:0] = kid_xx_intcfg[191:160];
assign intcfg_read_data_6[31:0] = kid_xx_intcfg[223:192];
assign intcfg_read_data_7[31:0] = kid_xx_intcfg[255:224];
assign intcfg_read_data_8[31:0] = kid_xx_intcfg[287:256];
assign intcfg_read_data_9[31:0] = kid_xx_intcfg[319:288];
assign intcfg_read_data_10[31:0] = kid_xx_intcfg[351:320];
assign intcfg_read_data_11[31:0] = kid_xx_intcfg[383:352];
assign intcfg_read_data_12[31:0] = kid_xx_intcfg[415:384];
assign intcfg_read_data_13[31:0] = kid_xx_intcfg[447:416];
assign intcfg_read_data_14[31:0] = kid_xx_intcfg[479:448];
assign intcfg_read_data_15[31:0] = kid_xx_intcfg[511:480];
endmodule
