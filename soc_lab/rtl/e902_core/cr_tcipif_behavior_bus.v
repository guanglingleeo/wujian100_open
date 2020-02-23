/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_tcipif_behavior_bus(
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_chk_fail,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  coretim_tcipif_cmplt,
  coretim_tcipif_rdata,
  cp0_yy_be_v2,
  cpurst_b,
  forever_cpuclk,
  had_img_tcipif_cmplt,
  had_img_tcipif_rdata,
  iu_yy_xx_dbgon,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_data_vld,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_coretim_sel,
  tcipif_had_img_sel,
  tcipif_vic_sel,
  tcipif_vic_size,
  tcipif_xx_dbus_addr,
  tcipif_xx_dbus_wdata,
  tcipif_xx_dbus_write,
  vic_tcipif_cmplt,
  vic_tcipif_rdata
);
input           bmu_tcipif_dbus_acc_deny;   
input   [31:0]  bmu_tcipif_dbus_addr;       
input           bmu_tcipif_dbus_chk_fail;   
input           bmu_tcipif_dbus_req;        
input   [1 :0]  bmu_tcipif_dbus_size;       
input           bmu_tcipif_dbus_supv_mode;  
input   [31:0]  bmu_tcipif_dbus_wdata;      
input           bmu_tcipif_dbus_write;      
input           coretim_tcipif_cmplt;       
input   [31:0]  coretim_tcipif_rdata;       
input           cp0_yy_be_v2;               
input           cpurst_b;                   
input           forever_cpuclk;             
input           had_img_tcipif_cmplt;       
input   [31:0]  had_img_tcipif_rdata;       
input           iu_yy_xx_dbgon;             
input           pad_yy_gate_clk_en_b;       
input           pad_yy_test_mode;           
input           vic_tcipif_cmplt;           
input   [31:0]  vic_tcipif_rdata;           
output          tcipif_bmu_dbus_acc_err;    
output  [31:0]  tcipif_bmu_dbus_data;       
output          tcipif_bmu_dbus_data_vld;   
output          tcipif_bmu_dbus_grnt;       
output          tcipif_bmu_dbus_trans_cmplt; 
output          tcipif_coretim_sel;         
output          tcipif_had_img_sel;         
output          tcipif_vic_sel;             
output  [1 :0]  tcipif_vic_size;            
output  [15:0]  tcipif_xx_dbus_addr;        
output  [31:0]  tcipif_xx_dbus_wdata;       
output          tcipif_xx_dbus_write;       
reg             coretim_sel_ff;             
reg             dummy_addr_cmplt;           
reg             had_img_sel_ff;             
reg             tcipif_acc_err;             
reg     [15:0]  tcipif_xx_dbus_addr;        
reg             vic_sel_ff;                 
reg     [1 :0]  vic_size_ff;                
reg             xx_dbus_write;              
reg             xx_tcip_grant;              
wire            bmu_tcipif_dbus_acc_deny;   
wire    [31:0]  bmu_tcipif_dbus_addr;       
wire            bmu_tcipif_dbus_chk_fail;   
wire            bmu_tcipif_dbus_req;        
wire    [1 :0]  bmu_tcipif_dbus_size;       
wire            bmu_tcipif_dbus_supv_mode;  
wire    [31:0]  bmu_tcipif_dbus_wdata;      
wire            bmu_tcipif_dbus_write;      
wire    [31:0]  bmu_tcipif_had_addr;        
wire            bmu_tcipif_had_req;         
wire    [1 :0]  bmu_tcipif_had_size;        
wire            bmu_tcipif_had_supv_mode;   
wire    [31:0]  bmu_tcipif_had_wdata;       
wire            bmu_tcipif_had_write;       
wire            cmmu_req_mask;              
wire            cmmu_sel;                   
wire            cmmu_tcipif_cmplt;          
wire    [31:0]  cmmu_tcipif_rdata;          
wire            coretim_req_mask;           
wire            coretim_tcipif_cmplt;       
wire    [31:0]  coretim_tcipif_rdata;       
wire            cp0_yy_be_v2;               
wire            cpurst_b;                   
wire            cru_req_mask;               
wire            cru_sel;                    
wire            cru_tcipif_cmplt;           
wire    [31:0]  cru_tcipif_rdata;           
wire            ctim_sel;                   
wire            ctrl_cpuclk;                
wire            dbus_err;                   
wire            dbus_req;                   
wire            dbus_req_pre;               
wire            dbus_sel;                   
wire            dummy_addr_sel;             
wire            forever_cpuclk;             
wire            had_err;                    
wire            had_img_req_mask;           
wire            had_img_sel;                
wire            had_img_tcipif_cmplt;       
wire    [31:0]  had_img_tcipif_rdata;       
wire            had_req;                    
wire            had_req_pre;                
wire            had_sel;                    
wire            iu_yy_xx_dbgon;             
wire            pad_yy_gate_clk_en_b;       
wire            pad_yy_test_mode;           
wire            pwrm_req_mask;              
wire            pwrm_sel;                   
wire            pwrm_tcipif_cmplt;          
wire    [31:0]  pwrm_tcipif_rdata;          
wire            scram_req_mask;             
wire            scram_sel;                  
wire            scram_tcipif_cmplt;         
wire    [31:0]  scram_tcipif_rdata;         
wire            sel_clk_en;                 
wire            sel_cpuclk;                 
wire            seu_bist_req_mask;          
wire            seu_bist_sel;               
wire            seu_bist_tcipif_cmplt;      
wire    [31:0]  seu_bist_tcipif_rdata;      
wire            seu_req_mask;               
wire            seu_sel;                    
wire            seu_tcipif_cmplt;           
wire    [31:0]  seu_tcipif_rdata;           
wire            tcip_err;                   
wire            tcip_req;                   
wire    [31:0]  tcip_req_addr;              
wire            tcip_req_mask;              
wire            tcip_req_pre;               
wire            tcipif_bmu_dbus_acc_err;    
wire    [31:0]  tcipif_bmu_dbus_data;       
wire            tcipif_bmu_dbus_data_vld;   
wire            tcipif_bmu_dbus_grnt;       
wire            tcipif_bmu_dbus_trans_cmplt; 
wire            tcipif_coretim_sel;         
wire            tcipif_data_vld;            
wire            tcipif_dbus_req;            
wire    [31:0]  tcipif_dbus_wdata;          
wire            tcipif_had_img_sel;         
wire            tcipif_had_req;             
wire    [31:0]  tcipif_rd_data;             
wire    [31:0]  tcipif_rdata;               
wire            tcipif_req_write;           
wire            tcipif_trans_cmplt;         
wire            tcipif_vic_sel;             
wire    [1 :0]  tcipif_vic_size;            
wire    [31:0]  tcipif_wdata;               
wire    [31:0]  tcipif_xx_dbus_wdata;       
wire            tcipif_xx_dbus_write;       
wire            vic_req_mask;               
wire            vic_sel;                    
wire    [1 :0]  vic_size;                   
wire            vic_tcipif_cmplt;           
wire    [31:0]  vic_tcipif_rdata;           
wire            xx_tcipif_cmplt;            
parameter CORETIM_IN = 24'hE000E0;
parameter CORETIM_EX = 28'hE000E00;
parameter VIC_IN     = 20'hE000E;
parameter VIC_EX1    = 24'hE000E0;
parameter VIC_EX2    = 24'hE000ED;
parameter VIC_EX3    = 24'hE000EE;
parameter VIC_EX4    = 24'hE000EF;
parameter POWER_IN   = 28'hE000EF9;
parameter SEU_IN     = 28'hE000EFA;
parameter SCRMB_IN1  = 28'hE000EFB;
parameter SCRMB_IN2  = 28'hE000EFC;
parameter CRU_IN     = 20'hE000F;
parameter SEU_BIST_IN = 20'hE0010;
parameter HAD_IMG_IN = 20'hE0011;
parameter CMMU_IN1     = 24'hE01000;
parameter CMMU_IN2     = 24'hE01001;
assign bmu_tcipif_had_req         = 1'b0;
assign bmu_tcipif_had_addr[31:0]  = 32'b0;
assign bmu_tcipif_had_write       = 1'b0;
assign bmu_tcipif_had_wdata[31:0] = 32'b0;
assign bmu_tcipif_had_supv_mode   = 1'b0;
assign bmu_tcipif_had_size[1:0]   = 2'b0;
assign tcipif_dbus_req = bmu_tcipif_dbus_req && !tcip_req_mask
                         && !bmu_tcipif_had_req;
assign tcipif_had_req  = bmu_tcipif_had_req  && !tcip_req_mask;
assign dbus_sel        = tcipif_dbus_req;
assign had_sel         = tcipif_had_req;
assign dbus_req_pre    = tcipif_dbus_req
                     && !bmu_tcipif_dbus_acc_deny
                     && !bmu_tcipif_dbus_chk_fail;
assign had_req_pre     = tcipif_had_req;
assign tcip_req_pre    = dbus_req_pre || had_req_pre;
assign dbus_req = dbus_req_pre && !dbus_err;
assign had_req  = had_req_pre  && !had_err;
assign tcip_req = dbus_req || had_req;
assign dbus_err = !bmu_tcipif_dbus_supv_mode && !iu_yy_xx_dbgon;
assign had_err  = !bmu_tcipif_had_supv_mode;
assign tcip_err = dbus_sel && dbus_err
               || had_sel  && had_err;
assign tcip_req_addr[31:0] = {32{dbus_sel}} & bmu_tcipif_dbus_addr[31:0]
                           | {32{had_sel}}  & bmu_tcipif_had_addr[31:0];
assign tcipif_req_write    = dbus_sel && bmu_tcipif_dbus_write
                          || had_sel  && bmu_tcipif_had_write;
assign ctim_sel  =  (tcip_req_addr[31:8] == CORETIM_IN)
                && !(tcip_req_addr[31:4] == CORETIM_EX);
assign vic_sel   =  (tcip_req_addr[31:12] == VIC_IN) 
                && !(tcip_req_addr[31:8]  == VIC_EX1) 
                && !(tcip_req_addr[31:8]  == VIC_EX2) 
                && !(tcip_req_addr[31:8]  == VIC_EX3) 
                && !(tcip_req_addr[31:8]  == VIC_EX4);
assign pwrm_sel  = 1'b0;
assign seu_sel   = 1'b0;
assign scram_sel = 1'b0;
assign cru_sel   = 1'b0;
assign cmmu_sel  = 1'b0;
assign seu_bist_sel   = 1'b0;
assign had_img_sel    = (tcip_req_addr[31:12] == HAD_IMG_IN);
assign dummy_addr_sel = !(ctim_sel     || vic_sel     || pwrm_sel 
                       || seu_sel      || scram_sel   || cru_sel
                       || seu_bist_sel || had_img_sel || cmmu_sel);
assign sel_clk_en = xx_tcipif_cmplt || tcipif_acc_err || dummy_addr_cmplt;
gated_clk_cell  x_tcipif_dbus_sel_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sel_cpuclk          ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (tcip_req_pre        ),
  .module_en            (sel_clk_en          ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tcipif_acc_err <= 1'b0;
  else if(tcip_req_pre)
    tcipif_acc_err <= tcip_err;
  else if(tcipif_acc_err)
    tcipif_acc_err <= 1'b0;
end
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    coretim_sel_ff  <= 1'b0;
  else if(tcip_req)
    coretim_sel_ff  <= ctim_sel;
  else if(coretim_tcipif_cmplt)
    coretim_sel_ff  <= 1'b0;
end
assign tcipif_coretim_sel = coretim_sel_ff;
assign coretim_req_mask   = coretim_sel_ff && !coretim_tcipif_cmplt;
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vic_sel_ff <= 1'b0;
  else if(tcip_req)
    vic_sel_ff <= vic_sel;
  else if(vic_tcipif_cmplt)
    vic_sel_ff <= 1'b0;
end
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vic_size_ff[1:0] <= 1'b0;
  else if(tcip_req)
    vic_size_ff[1:0] <= vic_size[1:0];
end
assign tcipif_vic_sel = vic_sel_ff;
assign vic_req_mask   = vic_sel_ff && !vic_tcipif_cmplt;
assign vic_size[1:0]  = {2{dbus_sel}} & bmu_tcipif_dbus_size[1:0]
                       |{2{had_sel}} & bmu_tcipif_had_size[1:0];
assign tcipif_vic_size[1:0] = vic_size_ff[1:0];
assign pwrm_req_mask           = 1'b0;
assign pwrm_tcipif_cmplt       = 1'b0;
assign pwrm_tcipif_rdata[31:0] = 32'b0;
assign seu_req_mask           = 1'b0;
assign seu_tcipif_cmplt       = 1'b0;
assign seu_tcipif_rdata[31:0] = 32'b0;
assign scram_req_mask           = 1'b0;
assign scram_tcipif_cmplt       = 1'b0;
assign scram_tcipif_rdata[31:0] = 32'b0;
assign cru_req_mask           = 1'b0;
assign cru_tcipif_cmplt       = 1'b0;
assign cru_tcipif_rdata[31:0] = 32'b0;
assign cmmu_req_mask           = 1'b0;
assign cmmu_tcipif_cmplt       = 1'b0;
assign cmmu_tcipif_rdata[31:0] = 32'b0;
assign seu_bist_req_mask           = 1'b0;
assign seu_bist_tcipif_cmplt       = 1'b0;
assign seu_bist_tcipif_rdata[31:0] = 32'b0;
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    had_img_sel_ff   <= 1'b0;
  else if(tcip_req)
    had_img_sel_ff   <= had_img_sel;
  else if(had_img_tcipif_cmplt)
    had_img_sel_ff   <= 1'b0;
end
assign tcipif_had_img_sel = had_img_sel_ff;
assign had_img_req_mask   = had_img_sel_ff && !had_img_tcipif_cmplt;
always @(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dummy_addr_cmplt <= 1'b0;
  else if(tcip_req)
    dummy_addr_cmplt <= dummy_addr_sel;
  else if(dummy_addr_cmplt)
    dummy_addr_cmplt <= 1'b0;
end
assign tcip_req_mask  = (coretim_req_mask  || vic_req_mask   || pwrm_req_mask 
                      || seu_req_mask      || scram_req_mask || cru_req_mask   
                      || seu_bist_req_mask || had_img_req_mask || cmmu_req_mask);
gated_clk_cell  x_tcipif_dbus_ctrl_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (ctrl_cpuclk         ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (tcip_req_pre        ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge ctrl_cpuclk)
begin
  if(!cpurst_b)
    xx_tcip_grant              <= 1'b0;
  else if(tcip_req_pre)
    xx_tcip_grant              <= had_req_pre;
end
always @(posedge ctrl_cpuclk)
begin
  if(tcip_req)
  begin
    tcipif_xx_dbus_addr[15:0]  <= tcip_req_addr[15:0];
    xx_dbus_write              <= tcipif_req_write;
  end
end
assign tcipif_xx_dbus_write = xx_dbus_write;
assign tcipif_wdata[31:0] = xx_tcip_grant ? bmu_tcipif_had_wdata[31:0]
                                          : bmu_tcipif_dbus_wdata[31:0];
assign tcipif_dbus_wdata[31:0]    = tcipif_wdata[31:0];
assign tcipif_xx_dbus_wdata[31:0] = cp0_yy_be_v2 ? 
      {tcipif_dbus_wdata[7:0],  tcipif_dbus_wdata[15:8],
       tcipif_dbus_wdata[23:16],tcipif_dbus_wdata[31:24]} :
       tcipif_dbus_wdata[31:0];
assign tcipif_bmu_dbus_grnt = tcipif_dbus_req ;
assign xx_tcipif_cmplt = coretim_tcipif_cmplt 
                      || vic_tcipif_cmplt     
                      || pwrm_tcipif_cmplt    
                      || seu_tcipif_cmplt     
                      || scram_tcipif_cmplt   
                      || cru_tcipif_cmplt     
                      || seu_bist_tcipif_cmplt
                      || had_img_tcipif_cmplt
                      || cmmu_tcipif_cmplt;
assign tcipif_trans_cmplt =  xx_tcipif_cmplt 
                          || dummy_addr_cmplt
                          || tcipif_acc_err;
assign tcipif_bmu_dbus_trans_cmplt = !xx_tcip_grant && tcipif_trans_cmplt;
assign tcipif_data_vld    = (xx_tcipif_cmplt || dummy_addr_cmplt)
                         && !xx_dbus_write;
assign tcipif_bmu_dbus_data_vld    = !xx_tcip_grant && tcipif_data_vld;
assign tcipif_bmu_dbus_acc_err = !xx_tcip_grant && tcipif_acc_err;
assign tcipif_rd_data[31:0]   = {32{coretim_tcipif_cmplt}}  & coretim_tcipif_rdata[31:0] 
                                   | {32{vic_tcipif_cmplt}}      & vic_tcipif_rdata[31:0]     
                                   | {32{pwrm_tcipif_cmplt}}     & pwrm_tcipif_rdata[31:0]    
                                   | {32{seu_tcipif_cmplt}}      & seu_tcipif_rdata[31:0]     
                                   | {32{scram_tcipif_cmplt}}    & scram_tcipif_rdata[31:0]   
                                   | {32{cru_tcipif_cmplt}}      & cru_tcipif_rdata[31:0]     
                                   | {32{seu_bist_tcipif_cmplt}} & seu_bist_tcipif_rdata[31:0]
                                   | {32{had_img_tcipif_cmplt}}  & had_img_tcipif_rdata[31:0]
                                   | {32{cmmu_tcipif_cmplt}}  & cmmu_tcipif_rdata[31:0];
assign tcipif_rdata[31:0] = cp0_yy_be_v2 ? 
      {tcipif_rd_data[7:0],  tcipif_rd_data[15:8],
       tcipif_rd_data[23:16],tcipif_rd_data[31:24]} :
       tcipif_rd_data[31:0];
assign tcipif_bmu_dbus_data[31:0] = tcipif_rdata[31:0];
endmodule
