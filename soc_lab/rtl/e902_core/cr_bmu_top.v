/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_bmu_top(
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
  bmu_lsu_acc_err,
  bmu_lsu_bstack_chk_fail,
  bmu_lsu_data,
  bmu_lsu_data_vld,
  bmu_lsu_grnt,
  bmu_lsu_trans_cmplt,
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
  bmu_xx_ibus_acc_err,
  bmu_xx_ibus_data,
  bmu_xx_ibus_data_vld,
  bmu_xx_ibus_grnt,
  bmu_xx_ibus_trans_cmplt,
  cp0_yy_clk_en,
  cp0_yy_machine_mode_aft_dbg,
  cpurst_b,
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
  ifu_bmu_addr,
  ifu_bmu_idle,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_wfd1,
  iu_bmu_vec_redirect,
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
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
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
input           biu_bmu_dbus_acc_err;            
input   [31:0]  biu_bmu_dbus_data;               
input           biu_bmu_dbus_data_vld;           
input           biu_bmu_dbus_grnt;               
input           biu_bmu_dbus_trans_cmplt;        
input           biu_bmu_ibus_acc_err;            
input   [31:0]  biu_bmu_ibus_data;               
input           biu_bmu_ibus_data_vld;           
input           biu_bmu_ibus_grnt;               
input           biu_bmu_ibus_trans_cmplt;        
input           cp0_yy_clk_en;                   
input           cp0_yy_machine_mode_aft_dbg;     
input           cpurst_b;                        
input           forever_cpuclk;                  
input           iahbl_bmu_dbus_acc_err;          
input   [31:0]  iahbl_bmu_dbus_data;             
input           iahbl_bmu_dbus_data_vld;         
input           iahbl_bmu_dbus_grnt;             
input           iahbl_bmu_dbus_trans_cmplt;      
input           iahbl_bmu_ibus_acc_err;          
input   [31:0]  iahbl_bmu_ibus_data;             
input           iahbl_bmu_ibus_data_vld;         
input           iahbl_bmu_ibus_grnt;             
input           iahbl_bmu_ibus_trans_cmplt;      
input   [31:0]  ifu_bmu_addr;                    
input           ifu_bmu_idle;                    
input   [3 :0]  ifu_bmu_prot;                    
input           ifu_bmu_req;                     
input           ifu_bmu_wfd1;                    
input           iu_bmu_vec_redirect;             
input   [31:0]  lsu_bmu_addr;                    
input           lsu_bmu_addr_check_fail;         
input           lsu_bmu_idle;                    
input   [3 :0]  lsu_bmu_prot;                    
input           lsu_bmu_req;                     
input           lsu_bmu_req_without_cmplt;       
input           lsu_bmu_sg_chk_fail;             
input   [1 :0]  lsu_bmu_size;                    
input           lsu_bmu_store_error;             
input   [31:0]  lsu_bmu_wdata;                   
input           lsu_bmu_wfd1;                    
input           lsu_bmu_write;                   
input   [11:0]  pad_bmu_iahbl_base;              
input   [11:0]  pad_bmu_iahbl_mask;              
input           pad_yy_gate_clk_en_b;            
input           pad_yy_test_mode;                
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
output          bmu_biu_dbus_acc_deny;           
output  [31:0]  bmu_biu_dbus_addr;               
output          bmu_biu_dbus_chk_fail;           
output  [3 :0]  bmu_biu_dbus_prot;               
output          bmu_biu_dbus_req;                
output          bmu_biu_dbus_req_without_cmplt;  
output  [1 :0]  bmu_biu_dbus_size;               
output  [31:0]  bmu_biu_dbus_wdata;              
output          bmu_biu_dbus_write;              
output          bmu_biu_ibus_acc_deny;           
output  [31:0]  bmu_biu_ibus_addr;               
output          bmu_biu_ibus_hit;                
output  [3 :0]  bmu_biu_ibus_prot;               
output          bmu_biu_ibus_req;                
output          bmu_biu_ibus_req_no_hit;         
output  [1 :0]  bmu_biu_ibus_size;               
output          bmu_biu_ibus_vec_redirect;       
output          bmu_iahbl_dbus_acc_deny;         
output  [31:0]  bmu_iahbl_dbus_addr;             
output          bmu_iahbl_dbus_chk_fail;         
output  [3 :0]  bmu_iahbl_dbus_prot;             
output          bmu_iahbl_dbus_req;              
output          bmu_iahbl_dbus_req_without_cmplt; 
output  [1 :0]  bmu_iahbl_dbus_size;             
output  [31:0]  bmu_iahbl_dbus_wdata;            
output          bmu_iahbl_dbus_write;            
output          bmu_iahbl_ibus_acc_deny;         
output  [31:0]  bmu_iahbl_ibus_addr;             
output          bmu_iahbl_ibus_hit;              
output  [3 :0]  bmu_iahbl_ibus_prot;             
output          bmu_iahbl_ibus_req;              
output          bmu_iahbl_ibus_req_no_hit;       
output  [1 :0]  bmu_iahbl_ibus_size;             
output          bmu_iahbl_ibus_vec_redirect;     
output          bmu_lsu_acc_err;                 
output          bmu_lsu_bstack_chk_fail;         
output  [31:0]  bmu_lsu_data;                    
output          bmu_lsu_data_vld;                
output          bmu_lsu_grnt;                    
output          bmu_lsu_trans_cmplt;             
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
output          bmu_xx_ibus_acc_err;             
output  [31:0]  bmu_xx_ibus_data;                
output          bmu_xx_ibus_data_vld;            
output          bmu_xx_ibus_grnt;                
output          bmu_xx_ibus_trans_cmplt;         
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
wire            cp0_yy_clk_en;                   
wire            cp0_yy_machine_mode_aft_dbg;     
wire            cpurst_b;                        
wire            dbus_deny_clk_en;                
wire            deny_clk;                        
wire            deny_en;                         
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
wire            ibus_deny_clk_en;                
wire    [31:0]  ifu_bmu_addr;                    
wire            ifu_bmu_idle;                    
wire    [3 :0]  ifu_bmu_prot;                    
wire            ifu_bmu_req;                     
wire            ifu_bmu_wfd1;                    
wire            iu_bmu_vec_redirect;             
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
wire    [11:0]  pad_bmu_iahbl_base;              
wire    [11:0]  pad_bmu_iahbl_mask;              
wire            pad_yy_gate_clk_en_b;            
wire            pad_yy_test_mode;                
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
assign deny_en = ibus_deny_clk_en || dbus_deny_clk_en;
gated_clk_cell  x_deny_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (deny_clk            ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (deny_en             ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
cr_bmu_dbus_if  x_cr_bmu_dbus_if (
  .biu_bmu_dbus_acc_err             (biu_bmu_dbus_acc_err            ),
  .biu_bmu_dbus_data                (biu_bmu_dbus_data               ),
  .biu_bmu_dbus_data_vld            (biu_bmu_dbus_data_vld           ),
  .biu_bmu_dbus_grnt                (biu_bmu_dbus_grnt               ),
  .biu_bmu_dbus_trans_cmplt         (biu_bmu_dbus_trans_cmplt        ),
  .bmu_biu_dbus_acc_deny            (bmu_biu_dbus_acc_deny           ),
  .bmu_biu_dbus_addr                (bmu_biu_dbus_addr               ),
  .bmu_biu_dbus_chk_fail            (bmu_biu_dbus_chk_fail           ),
  .bmu_biu_dbus_prot                (bmu_biu_dbus_prot               ),
  .bmu_biu_dbus_req                 (bmu_biu_dbus_req                ),
  .bmu_biu_dbus_req_without_cmplt   (bmu_biu_dbus_req_without_cmplt  ),
  .bmu_biu_dbus_size                (bmu_biu_dbus_size               ),
  .bmu_biu_dbus_wdata               (bmu_biu_dbus_wdata              ),
  .bmu_biu_dbus_write               (bmu_biu_dbus_write              ),
  .bmu_iahbl_dbus_acc_deny          (bmu_iahbl_dbus_acc_deny         ),
  .bmu_iahbl_dbus_addr              (bmu_iahbl_dbus_addr             ),
  .bmu_iahbl_dbus_chk_fail          (bmu_iahbl_dbus_chk_fail         ),
  .bmu_iahbl_dbus_prot              (bmu_iahbl_dbus_prot             ),
  .bmu_iahbl_dbus_req               (bmu_iahbl_dbus_req              ),
  .bmu_iahbl_dbus_req_without_cmplt (bmu_iahbl_dbus_req_without_cmplt),
  .bmu_iahbl_dbus_size              (bmu_iahbl_dbus_size             ),
  .bmu_iahbl_dbus_wdata             (bmu_iahbl_dbus_wdata            ),
  .bmu_iahbl_dbus_write             (bmu_iahbl_dbus_write            ),
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
  .cp0_yy_machine_mode_aft_dbg      (cp0_yy_machine_mode_aft_dbg     ),
  .cpurst_b                         (cpurst_b                        ),
  .dbus_deny_clk_en                 (dbus_deny_clk_en                ),
  .deny_clk                         (deny_clk                        ),
  .iahbl_bmu_dbus_acc_err           (iahbl_bmu_dbus_acc_err          ),
  .iahbl_bmu_dbus_data              (iahbl_bmu_dbus_data             ),
  .iahbl_bmu_dbus_data_vld          (iahbl_bmu_dbus_data_vld         ),
  .iahbl_bmu_dbus_grnt              (iahbl_bmu_dbus_grnt             ),
  .iahbl_bmu_dbus_trans_cmplt       (iahbl_bmu_dbus_trans_cmplt      ),
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
  .pmp_bmu_dbus_acc_deny            (1'b0                            ),
  .tcipif_bmu_dbus_acc_err          (tcipif_bmu_dbus_acc_err         ),
  .tcipif_bmu_dbus_data             (tcipif_bmu_dbus_data            ),
  .tcipif_bmu_dbus_data_vld         (tcipif_bmu_dbus_data_vld        ),
  .tcipif_bmu_dbus_grnt             (tcipif_bmu_dbus_grnt            ),
  .tcipif_bmu_dbus_trans_cmplt      (tcipif_bmu_dbus_trans_cmplt     )
);
cr_bmu_ibus_if  x_cr_bmu_ibus_if (
  .biu_bmu_ibus_acc_err        (biu_bmu_ibus_acc_err       ),
  .biu_bmu_ibus_data           (biu_bmu_ibus_data          ),
  .biu_bmu_ibus_data_vld       (biu_bmu_ibus_data_vld      ),
  .biu_bmu_ibus_grnt           (biu_bmu_ibus_grnt          ),
  .biu_bmu_ibus_trans_cmplt    (biu_bmu_ibus_trans_cmplt   ),
  .bmu_biu_ibus_acc_deny       (bmu_biu_ibus_acc_deny      ),
  .bmu_biu_ibus_addr           (bmu_biu_ibus_addr          ),
  .bmu_biu_ibus_hit            (bmu_biu_ibus_hit           ),
  .bmu_biu_ibus_prot           (bmu_biu_ibus_prot          ),
  .bmu_biu_ibus_req            (bmu_biu_ibus_req           ),
  .bmu_biu_ibus_req_no_hit     (bmu_biu_ibus_req_no_hit    ),
  .bmu_biu_ibus_size           (bmu_biu_ibus_size          ),
  .bmu_biu_ibus_vec_redirect   (bmu_biu_ibus_vec_redirect  ),
  .bmu_iahbl_ibus_acc_deny     (bmu_iahbl_ibus_acc_deny    ),
  .bmu_iahbl_ibus_addr         (bmu_iahbl_ibus_addr        ),
  .bmu_iahbl_ibus_hit          (bmu_iahbl_ibus_hit         ),
  .bmu_iahbl_ibus_prot         (bmu_iahbl_ibus_prot        ),
  .bmu_iahbl_ibus_req          (bmu_iahbl_ibus_req         ),
  .bmu_iahbl_ibus_req_no_hit   (bmu_iahbl_ibus_req_no_hit  ),
  .bmu_iahbl_ibus_size         (bmu_iahbl_ibus_size        ),
  .bmu_iahbl_ibus_vec_redirect (bmu_iahbl_ibus_vec_redirect),
  .bmu_tcipif_ibus_acc_deny    (bmu_tcipif_ibus_acc_deny   ),
  .bmu_tcipif_ibus_addr        (bmu_tcipif_ibus_addr       ),
  .bmu_tcipif_ibus_req         (bmu_tcipif_ibus_req        ),
  .bmu_tcipif_ibus_write       (bmu_tcipif_ibus_write      ),
  .bmu_xx_ibus_acc_err         (bmu_xx_ibus_acc_err        ),
  .bmu_xx_ibus_data            (bmu_xx_ibus_data           ),
  .bmu_xx_ibus_data_vld        (bmu_xx_ibus_data_vld       ),
  .bmu_xx_ibus_grnt            (bmu_xx_ibus_grnt           ),
  .bmu_xx_ibus_trans_cmplt     (bmu_xx_ibus_trans_cmplt    ),
  .cpurst_b                    (cpurst_b                   ),
  .deny_clk                    (deny_clk                   ),
  .iahbl_bmu_ibus_acc_err      (iahbl_bmu_ibus_acc_err     ),
  .iahbl_bmu_ibus_data         (iahbl_bmu_ibus_data        ),
  .iahbl_bmu_ibus_data_vld     (iahbl_bmu_ibus_data_vld    ),
  .iahbl_bmu_ibus_grnt         (iahbl_bmu_ibus_grnt        ),
  .iahbl_bmu_ibus_trans_cmplt  (iahbl_bmu_ibus_trans_cmplt ),
  .ibus_deny_clk_en            (ibus_deny_clk_en           ),
  .ifu_bmu_addr                (ifu_bmu_addr               ),
  .ifu_bmu_idle                (ifu_bmu_idle               ),
  .ifu_bmu_prot                (ifu_bmu_prot               ),
  .ifu_bmu_req                 (ifu_bmu_req                ),
  .ifu_bmu_wfd1                (ifu_bmu_wfd1               ),
  .iu_bmu_vec_redirect         (iu_bmu_vec_redirect        ),
  .pad_bmu_iahbl_base          (pad_bmu_iahbl_base         ),
  .pad_bmu_iahbl_mask          (pad_bmu_iahbl_mask         ),
  .pmp_bmu_ibus_acc_deny       (1'b0                       ),
  .tcipif_bmu_ibus_acc_err     (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_ibus_data        (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_ibus_data_vld    (tcipif_bmu_ibus_data_vld   ),
  .tcipif_bmu_ibus_grnt        (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_ibus_trans_cmplt (tcipif_bmu_ibus_trans_cmplt)
);
endmodule
