/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_sahbl_top(
  ahblif_idle,
  biu_bmu_dbus_acc_err,
  biu_bmu_dbus_data,
  biu_bmu_dbus_data_vld,
  biu_bmu_dbus_grnt,
  biu_bmu_dbus_trans_cmplt,
  biu_bmu_ibus_acc_err,
  biu_bmu_ibus_data,
  biu_bmu_ibus_data_vld,
  biu_bmu_ibus_grnt,
  biu_bmu_ibus_trans_cmplt,
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  biu_pad_vec_redrct,
  bmu_biu_dbus_acc_deny,
  bmu_biu_dbus_addr,
  bmu_biu_dbus_chk_fail,
  bmu_biu_dbus_prot,
  bmu_biu_dbus_req,
  bmu_biu_dbus_req_without_cmplt,
  bmu_biu_dbus_size,
  bmu_biu_dbus_wdata,
  bmu_biu_dbus_write,
  bmu_biu_ibus_acc_deny,
  bmu_biu_ibus_addr,
  bmu_biu_ibus_hit,
  bmu_biu_ibus_prot,
  bmu_biu_ibus_req,
  bmu_biu_ibus_req_no_hit,
  bmu_biu_ibus_size,
  bmu_biu_ibus_vec_redirect,
  cpurst_b,
  dahblif_other_mask,
  forever_cpuclk,
  iahblif_other_mask,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_cpu_halt_ff2,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pwrm_cpu_bus_peak_power_limit_en,
  sahblif_iahblif_mask
);
input           bmu_biu_dbus_acc_deny;           
input   [31:0]  bmu_biu_dbus_addr;               
input           bmu_biu_dbus_chk_fail;           
input   [3 :0]  bmu_biu_dbus_prot;               
input           bmu_biu_dbus_req;                
input           bmu_biu_dbus_req_without_cmplt;  
input   [1 :0]  bmu_biu_dbus_size;               
input   [31:0]  bmu_biu_dbus_wdata;              
input           bmu_biu_dbus_write;              
input           bmu_biu_ibus_acc_deny;           
input   [31:0]  bmu_biu_ibus_addr;               
input           bmu_biu_ibus_hit;                
input   [3 :0]  bmu_biu_ibus_prot;               
input           bmu_biu_ibus_req;                
input           bmu_biu_ibus_req_no_hit;         
input   [1 :0]  bmu_biu_ibus_size;               
input           bmu_biu_ibus_vec_redirect;       
input           cpurst_b;                        
input           dahblif_other_mask;              
input           forever_cpuclk;                  
input           iahblif_other_mask;              
input   [31:0]  pad_biu_hrdata;                  
input           pad_biu_hready;                  
input           pad_biu_hresp;                   
input           pad_cpu_halt_ff2;                
input           pad_yy_gate_clk_en_b;            
input           pad_yy_test_mode;                
input           pwrm_cpu_bus_peak_power_limit_en; 
output          ahblif_idle;                     
output          biu_bmu_dbus_acc_err;            
output  [31:0]  biu_bmu_dbus_data;               
output          biu_bmu_dbus_data_vld;           
output          biu_bmu_dbus_grnt;               
output          biu_bmu_dbus_trans_cmplt;        
output          biu_bmu_ibus_acc_err;            
output  [31:0]  biu_bmu_ibus_data;               
output          biu_bmu_ibus_data_vld;           
output          biu_bmu_ibus_grnt;               
output          biu_bmu_ibus_trans_cmplt;        
output  [31:0]  biu_pad_haddr;                   
output  [2 :0]  biu_pad_hburst;                  
output  [3 :0]  biu_pad_hprot;                   
output  [2 :0]  biu_pad_hsize;                   
output  [1 :0]  biu_pad_htrans;                  
output  [31:0]  biu_pad_hwdata;                  
output          biu_pad_hwrite;                  
output          biu_pad_vec_redrct;              
output          sahblif_iahblif_mask;            
wire            ahbl_clk_en;                     
wire            ahbl_gated_clk;                  
wire            ahblif_busy;                     
wire            ahblif_idle;                     
wire            ahblif_power_mask;               
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
wire            cpu_acc_err;                     
wire    [31:0]  cpu_addr;                        
wire            cpu_data_vld;                    
wire    [3 :0]  cpu_prot;                        
wire    [31:0]  cpu_rdata;                       
wire            cpu_req;                         
wire            cpu_req_for_grnt;                
wire            cpu_req_for_peak_power;          
wire            cpu_req_grnt;                    
wire            cpu_req_power_masked;            
wire            cpu_sec;                         
wire    [1 :0]  cpu_size;                        
wire            cpu_trans_cmplt;                 
wire            cpu_vec_redirect;                
wire    [31:0]  cpu_wdata;                       
wire            cpu_wdata_sel;                   
wire            cpu_write;                       
wire            cpurst_b;                        
wire            dahblif_other_mask;              
wire            dbus_mask;                       
wire            forever_cpuclk;                  
wire            iahblif_other_mask;              
wire            ibus_not_granted;                
wire    [31:0]  pad_biu_hrdata;                  
wire            pad_biu_hready;                  
wire            pad_biu_hresp;                   
wire            pad_cpu_halt_ff2;                
wire            pad_yy_gate_clk_en_b;            
wire            pad_yy_test_mode;                
wire            pwrm_cpu_bus_peak_power_limit_en; 
wire            sahblif_iahblif_mask;            
gated_clk_cell  x_gated_ahbl_cpuclk_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (ahbl_gated_clk      ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (dbus_mask           ),
  .module_en            (ahbl_clk_en         ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
cr_ahbl_req_arb  x_cr_ahbl_req_arb (
  .ahbl_bmu_dbus_acc_err                   (biu_bmu_dbus_acc_err                   ),
  .ahbl_bmu_dbus_data                      (biu_bmu_dbus_data                      ),
  .ahbl_bmu_dbus_data_vld                  (biu_bmu_dbus_data_vld                  ),
  .ahbl_bmu_dbus_grnt                      (biu_bmu_dbus_grnt                      ),
  .ahbl_bmu_dbus_trans_cmplt               (biu_bmu_dbus_trans_cmplt               ),
  .ahbl_bmu_ibus_acc_err                   (biu_bmu_ibus_acc_err                   ),
  .ahbl_bmu_ibus_data                      (biu_bmu_ibus_data                      ),
  .ahbl_bmu_ibus_data_vld                  (biu_bmu_ibus_data_vld                  ),
  .ahbl_bmu_ibus_grnt                      (biu_bmu_ibus_grnt                      ),
  .ahbl_bmu_ibus_trans_cmplt               (biu_bmu_ibus_trans_cmplt               ),
  .ahbl_gated_clk                          (ahbl_gated_clk                         ),
  .bmu_ahbl_dbus_acc_deny                  (bmu_biu_dbus_acc_deny                  ),
  .bmu_ahbl_dbus_addr                      (bmu_biu_dbus_addr                      ),
  .bmu_ahbl_dbus_chk_fail                  (bmu_biu_dbus_chk_fail                  ),
  .bmu_ahbl_dbus_prot                      (bmu_biu_dbus_prot                      ),
  .bmu_ahbl_dbus_req                       (bmu_biu_dbus_req                       ),
  .bmu_ahbl_dbus_req_without_cmplt         (bmu_biu_dbus_req_without_cmplt         ),
  .bmu_ahbl_dbus_req_without_deny_chk_fail (bmu_biu_dbus_req                       ),
  .bmu_ahbl_dbus_size                      (bmu_biu_dbus_size                      ),
  .bmu_ahbl_dbus_write                     (bmu_biu_dbus_write                     ),
  .bmu_ahbl_ibus_acc_deny                  (bmu_biu_ibus_acc_deny                  ),
  .bmu_ahbl_ibus_addr                      (bmu_biu_ibus_addr                      ),
  .bmu_ahbl_ibus_hit                       (bmu_biu_ibus_hit                       ),
  .bmu_ahbl_ibus_prot                      (bmu_biu_ibus_prot                      ),
  .bmu_ahbl_ibus_req                       (bmu_biu_ibus_req                       ),
  .bmu_ahbl_ibus_req_no_hit                (bmu_biu_ibus_req_no_hit                ),
  .bmu_ahbl_ibus_size                      (bmu_biu_ibus_size                      ),
  .bmu_ahbl_ibus_vec_redirect              (bmu_biu_ibus_vec_redirect              ),
  .bmu_ahbl_ibus_write                     (1'b0                                   ),
  .bmu_ahbl_wdata                          (bmu_biu_dbus_wdata                     ),
  .cpu_acc_err                             (cpu_acc_err                            ),
  .cpu_addr                                (cpu_addr                               ),
  .cpu_data_vld                            (cpu_data_vld                           ),
  .cpu_prot                                (cpu_prot                               ),
  .cpu_rdata                               (cpu_rdata                              ),
  .cpu_req                                 (cpu_req                                ),
  .cpu_req_for_grnt                        (cpu_req_for_grnt                       ),
  .cpu_req_for_peak_power                  (cpu_req_for_peak_power                 ),
  .cpu_req_grnt                            (cpu_req_grnt                           ),
  .cpu_sec                                 (cpu_sec                                ),
  .cpu_size                                (cpu_size                               ),
  .cpu_trans_cmplt                         (cpu_trans_cmplt                        ),
  .cpu_vec_redirect                        (cpu_vec_redirect                       ),
  .cpu_wdata                               (cpu_wdata                              ),
  .cpu_write                               (cpu_write                              ),
  .cpurst_b                                (cpurst_b                               ),
  .ibus_not_granted                        (ibus_not_granted                       )
);
assign dbus_mask = ibus_not_granted;
cr_ahbl_if  x_cr_ahbl_if (
  .ahbLif_ahbl_haddr      (biu_pad_haddr         ),
  .ahbLif_ahbl_hburst     (biu_pad_hburst        ),
  .ahbLif_ahbl_hprot      (biu_pad_hprot         ),
  .ahbLif_ahbl_hsize      (biu_pad_hsize         ),
  .ahbLif_ahbl_htrans     (biu_pad_htrans        ),
  .ahbLif_ahbl_hwdata     (biu_pad_hwdata        ),
  .ahbLif_ahbl_hwrite     (biu_pad_hwrite        ),
  .ahbLif_ahbl_vec_redrct (biu_pad_vec_redrct    ),
  .ahbl_ahbLif_hrdata     (pad_biu_hrdata        ),
  .ahbl_ahbLif_hready     (pad_biu_hready        ),
  .ahbl_ahbLif_hresp      (pad_biu_hresp         ),
  .ahbl_clk_en            (ahbl_clk_en           ),
  .ahbl_gated_clk         (ahbl_gated_clk        ),
  .ahblif_busy            (ahblif_busy           ),
  .ahblif_idle            (ahblif_idle           ),
  .ahblif_power_mask      (ahblif_power_mask     ),
  .cpu_acc_err            (cpu_acc_err           ),
  .cpu_addr               (cpu_addr              ),
  .cpu_data_vld           (cpu_data_vld          ),
  .cpu_prot               (cpu_prot              ),
  .cpu_rdata              (cpu_rdata             ),
  .cpu_req                (cpu_req               ),
  .cpu_req_grnt           (cpu_req_grnt          ),
  .cpu_req_power_masked   (cpu_req_power_masked  ),
  .cpu_sec                (cpu_sec               ),
  .cpu_size               (cpu_size              ),
  .cpu_trans_cmplt        (cpu_trans_cmplt       ),
  .cpu_vec_redirect       (cpu_vec_redirect      ),
  .cpu_wdata_sel          (cpu_wdata_sel         ),
  .cpu_wr_data            (cpu_wdata             ),
  .cpu_write              (cpu_write             ),
  .cpurst_b               (cpurst_b              ),
  .pad_cpu_halt_ff2       (pad_cpu_halt_ff2      )
);
assign sahblif_iahblif_mask = (ahblif_busy || cpu_req_for_peak_power) && 
                               pwrm_cpu_bus_peak_power_limit_en;
assign ahblif_power_mask  = iahblif_other_mask || dahblif_other_mask;
assign cpu_req_power_masked = cpu_req && !ahblif_power_mask;
endmodule
