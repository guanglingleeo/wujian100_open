/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_tcipif_top(
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
  cp0_yy_be_v2,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  ctim_pad_int_vld,
  forever_cpuclk,
  forever_cpuclk_nogated,
  had_tcipif_cmplt,
  had_tcipif_rdata,
  iu_yy_xx_dbgon,
  pad_clic_int_cfg,
  pad_clic_int_vld,
  pad_ctim_calib,
  pad_ctim_refclk,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pwrm_cpu_bus_peak_power_limit_en,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_data_vld,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_data_vld,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt,
  tcipif_had_addr,
  tcipif_had_sel,
  tcipif_had_wdata,
  tcipif_had_write
);
input           bmu_tcipif_dbus_acc_deny;        
input   [31:0]  bmu_tcipif_dbus_addr;            
input           bmu_tcipif_dbus_chk_fail;        
input           bmu_tcipif_dbus_req;             
input   [1 :0]  bmu_tcipif_dbus_size;            
input           bmu_tcipif_dbus_supv_mode;       
input   [31:0]  bmu_tcipif_dbus_wdata;           
input           bmu_tcipif_dbus_write;           
input           bmu_tcipif_ibus_acc_deny;        
input   [31:0]  bmu_tcipif_ibus_addr;            
input           bmu_tcipif_ibus_req;             
input           bmu_tcipif_ibus_write;           
input           cp0_yy_be_v2;                    
input   [9 :0]  cpu_clic_curid;                  
input           cpu_clic_int_exit;               
input           cpurst_b;                        
input           forever_cpuclk;                  
input           forever_cpuclk_nogated;          
input           had_tcipif_cmplt;                
input   [31:0]  had_tcipif_rdata;                
input           iu_yy_xx_dbgon;                  
input   [63:0]  pad_clic_int_cfg;                
input   [63:0]  pad_clic_int_vld;                
input   [25:0]  pad_ctim_calib;                  
input           pad_ctim_refclk;                 
input           pad_yy_gate_clk_en_b;            
input           pad_yy_test_mode;                
output          clic_cpu_int_hv;                 
output  [9 :0]  clic_cpu_int_id;                 
output  [7 :0]  clic_cpu_int_il;                 
output  [1 :0]  clic_cpu_int_priv;               
output          ctim_pad_int_vld;                
output          pwrm_cpu_bus_peak_power_limit_en; 
output          tcipif_bmu_dbus_acc_err;         
output  [31:0]  tcipif_bmu_dbus_data;            
output          tcipif_bmu_dbus_data_vld;        
output          tcipif_bmu_dbus_grnt;            
output          tcipif_bmu_dbus_trans_cmplt;     
output          tcipif_bmu_ibus_acc_err;         
output  [31:0]  tcipif_bmu_ibus_data;            
output          tcipif_bmu_ibus_data_vld;        
output          tcipif_bmu_ibus_grnt;            
output          tcipif_bmu_ibus_trans_cmplt;     
output  [15:0]  tcipif_had_addr;                 
output          tcipif_had_sel;                  
output  [31:0]  tcipif_had_wdata;                
output          tcipif_had_write;                
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
wire            coretim_tcipif_cmplt;            
wire    [31:0]  coretim_tcipif_rdata;            
wire            cp0_yy_be_v2;                    
wire    [9 :0]  cpu_clic_curid;                  
wire            cpu_clic_int_exit;               
wire            cpurst_b;                        
wire            ctim_pad_int_vld;                
wire            forever_cpuclk;                  
wire            forever_cpuclk_nogated;          
wire            had_img_tcipif_cmplt;            
wire    [31:0]  had_img_tcipif_rdata;            
wire            had_tcipif_cmplt;                
wire    [31:0]  had_tcipif_rdata;                
wire            iu_yy_xx_dbgon;                  
wire    [63:0]  pad_clic_int_cfg;                
wire    [63:0]  pad_clic_int_vld;                
wire    [25:0]  pad_ctim_calib;                  
wire            pad_ctim_refclk;                 
wire            pad_yy_gate_clk_en_b;            
wire            pad_yy_test_mode;                
wire            pwrm_cpu_bus_peak_power_limit_en; 
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
wire            tcipif_coretim_sel;              
wire    [15:0]  tcipif_had_addr;                 
wire            tcipif_had_img_sel;              
wire            tcipif_had_sel;                  
wire    [31:0]  tcipif_had_wdata;                
wire            tcipif_had_write;                
wire            tcipif_vic_sel;                  
wire    [1 :0]  tcipif_vic_size;                 
wire    [15:0]  tcipif_xx_dbus_addr;             
wire    [31:0]  tcipif_xx_dbus_wdata;            
wire            tcipif_xx_dbus_write;            
wire            vic_tcipif_cmplt;                
wire    [31:0]  vic_tcipif_rdata;                
cr_tcipif_behavior_bus  x_cr_tcipif_dbus (
  .bmu_tcipif_dbus_acc_deny    (bmu_tcipif_dbus_acc_deny   ),
  .bmu_tcipif_dbus_addr        (bmu_tcipif_dbus_addr       ),
  .bmu_tcipif_dbus_chk_fail    (bmu_tcipif_dbus_chk_fail   ),
  .bmu_tcipif_dbus_req         (bmu_tcipif_dbus_req        ),
  .bmu_tcipif_dbus_size        (bmu_tcipif_dbus_size       ),
  .bmu_tcipif_dbus_supv_mode   (bmu_tcipif_dbus_supv_mode  ),
  .bmu_tcipif_dbus_wdata       (bmu_tcipif_dbus_wdata      ),
  .bmu_tcipif_dbus_write       (bmu_tcipif_dbus_write      ),
  .coretim_tcipif_cmplt        (coretim_tcipif_cmplt       ),
  .coretim_tcipif_rdata        (coretim_tcipif_rdata       ),
  .cp0_yy_be_v2                (cp0_yy_be_v2               ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .had_img_tcipif_cmplt        (had_img_tcipif_cmplt       ),
  .had_img_tcipif_rdata        (had_img_tcipif_rdata       ),
  .iu_yy_xx_dbgon              (iu_yy_xx_dbgon             ),
  .pad_yy_gate_clk_en_b        (pad_yy_gate_clk_en_b       ),
  .pad_yy_test_mode            (pad_yy_test_mode           ),
  .tcipif_bmu_dbus_acc_err     (tcipif_bmu_dbus_acc_err    ),
  .tcipif_bmu_dbus_data        (tcipif_bmu_dbus_data       ),
  .tcipif_bmu_dbus_data_vld    (tcipif_bmu_dbus_data_vld   ),
  .tcipif_bmu_dbus_grnt        (tcipif_bmu_dbus_grnt       ),
  .tcipif_bmu_dbus_trans_cmplt (tcipif_bmu_dbus_trans_cmplt),
  .tcipif_coretim_sel          (tcipif_coretim_sel         ),
  .tcipif_had_img_sel          (tcipif_had_img_sel         ),
  .tcipif_vic_sel              (tcipif_vic_sel             ),
  .tcipif_vic_size             (tcipif_vic_size            ),
  .tcipif_xx_dbus_addr         (tcipif_xx_dbus_addr        ),
  .tcipif_xx_dbus_wdata        (tcipif_xx_dbus_wdata       ),
  .tcipif_xx_dbus_write        (tcipif_xx_dbus_write       ),
  .vic_tcipif_cmplt            (vic_tcipif_cmplt           ),
  .vic_tcipif_rdata            (vic_tcipif_rdata           )
);
cr_tcipif_dummy_bus  x_cr_tcipif_ibus (
  .bmu_tcipif_ibus_acc_deny    (bmu_tcipif_ibus_acc_deny   ),
  .bmu_tcipif_ibus_addr        (bmu_tcipif_ibus_addr       ),
  .bmu_tcipif_ibus_req         (bmu_tcipif_ibus_req        ),
  .bmu_tcipif_ibus_write       (bmu_tcipif_ibus_write      ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_gate_clk_en_b        (pad_yy_gate_clk_en_b       ),
  .pad_yy_test_mode            (pad_yy_test_mode           ),
  .tcipif_bmu_ibus_acc_err     (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_ibus_data        (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_ibus_data_vld    (tcipif_bmu_ibus_data_vld   ),
  .tcipif_bmu_ibus_grnt        (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_ibus_trans_cmplt (tcipif_bmu_ibus_trans_cmplt)
);
cr_clic_top  x_cr_clic_top (
  .clic_pad_int_hv        (clic_cpu_int_hv       ),
  .clic_pad_int_id        (clic_cpu_int_id       ),
  .clic_pad_int_il        (clic_cpu_int_il       ),
  .clic_pad_int_priv      (clic_cpu_int_priv     ),
  .clic_tcipif_cmplt      (vic_tcipif_cmplt      ),
  .clic_tcipif_rdata      (vic_tcipif_rdata      ),
  .cpu_clic_curid         (cpu_clic_curid        ),
  .cpu_clic_int_exit      (cpu_clic_int_exit     ),
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .pad_clic_int_cfg       (pad_clic_int_cfg      ),
  .pad_clic_int_vld       (pad_clic_int_vld      ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .tcipif_clic_addr       (tcipif_xx_dbus_addr   ),
  .tcipif_clic_sel        (tcipif_vic_sel        ),
  .tcipif_clic_size       (tcipif_vic_size       ),
  .tcipif_clic_wdata      (tcipif_xx_dbus_wdata  ),
  .tcipif_clic_write      (tcipif_xx_dbus_write  )
);
cr_pwrm_top_dummy  x_cr_pwrm_top_dummy (
  .pwrm_cpu_bus_peak_power_limit_en (pwrm_cpu_bus_peak_power_limit_en)
);
cr_coretim_top  x_cr_coretim_top (
  .core_dbgon             (iu_yy_xx_dbgon        ),
  .coretim_tcipif_cmplt   (coretim_tcipif_cmplt  ),
  .coretim_tcipif_rdata   (coretim_tcipif_rdata  ),
  .cpurst_b               (cpurst_b              ),
  .ctim_pad_int_vld       (ctim_pad_int_vld      ),
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .pad_ctim_calib         (pad_ctim_calib        ),
  .pad_ctim_refclk        (pad_ctim_refclk       ),
  .pad_yy_gate_clk_en_b   (pad_yy_gate_clk_en_b  ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .tcipif_coretim_addr    (tcipif_xx_dbus_addr   ),
  .tcipif_coretim_sel     (tcipif_coretim_sel    ),
  .tcipif_coretim_wdata   (tcipif_xx_dbus_wdata  ),
  .tcipif_coretim_write   (tcipif_xx_dbus_write  )
);
assign tcipif_had_sel             = tcipif_had_img_sel;
assign tcipif_had_addr[15:0]      = tcipif_xx_dbus_addr[15:0];
assign tcipif_had_write           = tcipif_xx_dbus_write;
assign tcipif_had_wdata[31:0]     = tcipif_xx_dbus_wdata[31:0];
assign had_img_tcipif_cmplt       = had_tcipif_cmplt;
assign had_img_tcipif_rdata[31:0] = had_tcipif_rdata[31:0];
endmodule
