/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iahbl_top(
  ahblif_idle,
  bmu_iahbl_dbus_acc_deny,
  bmu_iahbl_dbus_addr,
  bmu_iahbl_dbus_chk_fail,
  bmu_iahbl_dbus_prot,
  bmu_iahbl_dbus_req,
  bmu_iahbl_dbus_req_without_cmplt,
  bmu_iahbl_dbus_size,
  bmu_iahbl_dbus_wdata,
  bmu_iahbl_dbus_write,
  bmu_iahbl_ibus_acc_deny,
  bmu_iahbl_ibus_addr,
  bmu_iahbl_ibus_hit,
  bmu_iahbl_ibus_prot,
  bmu_iahbl_ibus_req,
  bmu_iahbl_ibus_req_no_hit,
  bmu_iahbl_ibus_size,
  bmu_iahbl_ibus_vec_redirect,
  cpurst_b,
  dahblif_other_mask,
  forever_cpuclk,
  iahbl_bmu_dbus_acc_err,
  iahbl_bmu_dbus_data,
  iahbl_bmu_dbus_data_vld,
  iahbl_bmu_dbus_grnt,
  iahbl_bmu_dbus_trans_cmplt,
  iahbl_bmu_ibus_acc_err,
  iahbl_bmu_ibus_data,
  iahbl_bmu_ibus_data_vld,
  iahbl_bmu_ibus_grnt,
  iahbl_bmu_ibus_trans_cmplt,
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  iahbl_pad_vec_redrct,
  iahblif_other_mask,
  pad_cpu_halt_ff2,
  pad_iahbl_hrdata,
  pad_iahbl_hready,
  pad_iahbl_hresp,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pwrm_cpu_bus_peak_power_limit_en,
  sahblif_iahblif_mask
);
input           bmu_iahbl_dbus_acc_deny;         
input   [31:0]  bmu_iahbl_dbus_addr;             
input           bmu_iahbl_dbus_chk_fail;         
input   [3 :0]  bmu_iahbl_dbus_prot;             
input           bmu_iahbl_dbus_req;              
input           bmu_iahbl_dbus_req_without_cmplt; 
input   [1 :0]  bmu_iahbl_dbus_size;             
input   [31:0]  bmu_iahbl_dbus_wdata;            
input           bmu_iahbl_dbus_write;            
input           bmu_iahbl_ibus_acc_deny;         
input   [31:0]  bmu_iahbl_ibus_addr;             
input           bmu_iahbl_ibus_hit;              
input   [3 :0]  bmu_iahbl_ibus_prot;             
input           bmu_iahbl_ibus_req;              
input           bmu_iahbl_ibus_req_no_hit;       
input   [1 :0]  bmu_iahbl_ibus_size;             
input           bmu_iahbl_ibus_vec_redirect;     
input           cpurst_b;                        
input           dahblif_other_mask;              
input           forever_cpuclk;                  
input           pad_cpu_halt_ff2;                
input   [31:0]  pad_iahbl_hrdata;                
input           pad_iahbl_hready;                
input           pad_iahbl_hresp;                 
input           pad_yy_gate_clk_en_b;            
input           pad_yy_test_mode;                
input           pwrm_cpu_bus_peak_power_limit_en; 
input           sahblif_iahblif_mask;            
output          ahblif_idle;                     
output          iahbl_bmu_dbus_acc_err;          
output  [31:0]  iahbl_bmu_dbus_data;             
output          iahbl_bmu_dbus_data_vld;         
output          iahbl_bmu_dbus_grnt;             
output          iahbl_bmu_dbus_trans_cmplt;      
output          iahbl_bmu_ibus_acc_err;          
output  [31:0]  iahbl_bmu_ibus_data;             
output          iahbl_bmu_ibus_data_vld;         
output          iahbl_bmu_ibus_grnt;             
output          iahbl_bmu_ibus_trans_cmplt;      
output  [31:0]  iahbl_pad_haddr;                 
output  [2 :0]  iahbl_pad_hburst;                
output  [3 :0]  iahbl_pad_hprot;                 
output  [2 :0]  iahbl_pad_hsize;                 
output  [1 :0]  iahbl_pad_htrans;                
output  [31:0]  iahbl_pad_hwdata;                
output          iahbl_pad_hwrite;                
output          iahbl_pad_vec_redrct;            
output          iahblif_other_mask;              
wire            ahbl_clk_en;                     
wire            ahbl_gated_clk;                  
wire            ahblif_busy;                     
wire            ahblif_idle;                     
wire            ahblif_power_mask;               
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
wire    [31:0]  cpu_wr_data;                     
wire            cpu_write;                       
wire            cpurst_b;                        
wire            dahblif_other_mask;              
wire            dbus_mask;                       
wire            forever_cpuclk;                  
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
wire            ibus_not_granted;                
wire            pad_cpu_halt_ff2;                
wire    [31:0]  pad_iahbl_hrdata;                
wire            pad_iahbl_hready;                
wire            pad_iahbl_hresp;                 
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
  .ahbl_bmu_dbus_acc_err                   (iahbl_bmu_dbus_acc_err                 ),
  .ahbl_bmu_dbus_data                      (iahbl_bmu_dbus_data                    ),
  .ahbl_bmu_dbus_data_vld                  (iahbl_bmu_dbus_data_vld                ),
  .ahbl_bmu_dbus_grnt                      (iahbl_bmu_dbus_grnt                    ),
  .ahbl_bmu_dbus_trans_cmplt               (iahbl_bmu_dbus_trans_cmplt             ),
  .ahbl_bmu_ibus_acc_err                   (iahbl_bmu_ibus_acc_err                 ),
  .ahbl_bmu_ibus_data                      (iahbl_bmu_ibus_data                    ),
  .ahbl_bmu_ibus_data_vld                  (iahbl_bmu_ibus_data_vld                ),
  .ahbl_bmu_ibus_grnt                      (iahbl_bmu_ibus_grnt                    ),
  .ahbl_bmu_ibus_trans_cmplt               (iahbl_bmu_ibus_trans_cmplt             ),
  .ahbl_gated_clk                          (ahbl_gated_clk                         ),
  .bmu_ahbl_dbus_acc_deny                  (bmu_iahbl_dbus_acc_deny                ),
  .bmu_ahbl_dbus_addr                      (bmu_iahbl_dbus_addr                    ),
  .bmu_ahbl_dbus_chk_fail                  (bmu_iahbl_dbus_chk_fail                ),
  .bmu_ahbl_dbus_prot                      (bmu_iahbl_dbus_prot                    ),
  .bmu_ahbl_dbus_req                       (bmu_iahbl_dbus_req                     ),
  .bmu_ahbl_dbus_req_without_cmplt         (bmu_iahbl_dbus_req_without_cmplt       ),
  .bmu_ahbl_dbus_req_without_deny_chk_fail (bmu_iahbl_dbus_req                     ),
  .bmu_ahbl_dbus_size                      (bmu_iahbl_dbus_size                    ),
  .bmu_ahbl_dbus_write                     (bmu_iahbl_dbus_write                   ),
  .bmu_ahbl_ibus_acc_deny                  (bmu_iahbl_ibus_acc_deny                ),
  .bmu_ahbl_ibus_addr                      (bmu_iahbl_ibus_addr                    ),
  .bmu_ahbl_ibus_hit                       (bmu_iahbl_ibus_hit                     ),
  .bmu_ahbl_ibus_prot                      (bmu_iahbl_ibus_prot                    ),
  .bmu_ahbl_ibus_req                       (bmu_iahbl_ibus_req                     ),
  .bmu_ahbl_ibus_req_no_hit                (bmu_iahbl_ibus_req_no_hit              ),
  .bmu_ahbl_ibus_size                      (bmu_iahbl_ibus_size                    ),
  .bmu_ahbl_ibus_vec_redirect              (bmu_iahbl_ibus_vec_redirect            ),
  .bmu_ahbl_ibus_write                     (1'b0                                   ),
  .bmu_ahbl_wdata                          (bmu_iahbl_dbus_wdata                   ),
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
  .ahbLif_ahbl_haddr      (iahbl_pad_haddr       ),
  .ahbLif_ahbl_hburst     (iahbl_pad_hburst      ),
  .ahbLif_ahbl_hprot      (iahbl_pad_hprot       ),
  .ahbLif_ahbl_hsize      (iahbl_pad_hsize       ),
  .ahbLif_ahbl_htrans     (iahbl_pad_htrans      ),
  .ahbLif_ahbl_hwdata     (iahbl_pad_hwdata      ),
  .ahbLif_ahbl_hwrite     (iahbl_pad_hwrite      ),
  .ahbLif_ahbl_vec_redrct (iahbl_pad_vec_redrct  ),
  .ahbl_ahbLif_hrdata     (pad_iahbl_hrdata      ),
  .ahbl_ahbLif_hready     (pad_iahbl_hready      ),
  .ahbl_ahbLif_hresp      (pad_iahbl_hresp       ),
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
  .cpu_wr_data            (cpu_wr_data           ),
  .cpu_write              (cpu_write             ),
  .cpurst_b               (cpurst_b              ),
  .pad_cpu_halt_ff2       (pad_cpu_halt_ff2      )
);
assign cpu_wr_data[31:0] = {32{cpu_wdata_sel}} & cpu_wdata[31:0];
assign iahblif_other_mask = ahblif_busy && pwrm_cpu_bus_peak_power_limit_en;
assign ahblif_power_mask  = sahblif_iahblif_mask || dahblif_other_mask;
assign cpu_req_power_masked = cpu_req && !ahblif_power_mask;
endmodule
