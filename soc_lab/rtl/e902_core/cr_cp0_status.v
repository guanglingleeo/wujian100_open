/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_cp0_status(
  cp0_had_int_exit,
  cp0_had_mcause_data,
  cp0_iu_il,
  cp0_iu_mie_for_int,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_yy_machine_mode_aft_dbg,
  cp0_yy_priv_mode,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  iu_cp0_expt_vld,
  iu_cp0_int_vld,
  iu_cp0_syc_rst_b,
  iu_yy_xx_dbgon,
  iu_yy_xx_expt_vec,
  iu_yy_xx_int_hv,
  iu_yy_xx_int_il,
  iu_yy_xx_int_pending_id,
  iu_yy_xx_int_pending_il,
  iui_oreg_imm,
  iui_oreg_inst_csr,
  iui_oreg_inst_mret,
  iui_oreg_rd_x0,
  iui_oreg_rs1,
  iui_oreg_rs1_x0,
  mcause_value,
  mintstatus_value,
  mnxti_vld_int_pending,
  mstatus_value,
  oreg_clk,
  oreg_iui_priv_mode,
  oreg_status_mode,
  status_oreg_intr,
  status_oreg_mpil,
  status_oreg_mxstatus_t,
  status_oreg_vector,
  vector_cp0_vec_succeed
);
input           cpurst_b;                   
input           iu_cp0_expt_vld;            
input           iu_cp0_int_vld;             
input           iu_cp0_syc_rst_b;           
input           iu_yy_xx_dbgon;             
input   [9 :0]  iu_yy_xx_expt_vec;          
input           iu_yy_xx_int_hv;            
input   [7 :0]  iu_yy_xx_int_il;            
input   [9 :0]  iu_yy_xx_int_pending_id;    
input   [7 :0]  iu_yy_xx_int_pending_il;    
input   [11:0]  iui_oreg_imm;               
input           iui_oreg_inst_csr;          
input           iui_oreg_inst_mret;         
input           iui_oreg_rd_x0;             
input   [31:0]  iui_oreg_rs1;               
input           iui_oreg_rs1_x0;            
input           mnxti_vld_int_pending;      
input           oreg_clk;                   
input   [1 :0]  oreg_status_mode;           
input           vector_cp0_vec_succeed;     
output          cp0_had_int_exit;           
output  [31:0]  cp0_had_mcause_data;        
output  [7 :0]  cp0_iu_il;                  
output          cp0_iu_mie_for_int;         
output  [31:0]  cp0_pad_mintstatus;         
output  [31:0]  cp0_pad_mstatus;            
output          cp0_yy_machine_mode_aft_dbg; 
output  [1 :0]  cp0_yy_priv_mode;           
output  [9 :0]  cpu_clic_curid;             
output          cpu_clic_int_exit;          
output  [31:0]  mcause_value;               
output  [31:0]  mintstatus_value;           
output  [31:0]  mstatus_value;              
output  [1 :0]  oreg_iui_priv_mode;         
output          status_oreg_intr;           
output  [7 :0]  status_oreg_mpil;           
output          status_oreg_mxstatus_t;     
output  [9 :0]  status_oreg_vector;         
reg             intr;                       
reg             mie;                        
reg     [7 :0]  mil;                        
reg             minhv;                      
reg             mpie;                       
reg     [7 :0]  mpil;                       
reg             mprv;                       
reg     [1 :0]  pm;                         
reg     [9 :0]  vector;                     
wire            cp0_had_int_exit;           
wire    [31:0]  cp0_had_mcause_data;        
wire    [7 :0]  cp0_iu_il;                  
wire            cp0_iu_mie_for_int;         
wire    [31:0]  cp0_pad_mintstatus;         
wire    [31:0]  cp0_pad_mstatus;            
wire            cp0_yy_machine_mode_aft_dbg; 
wire    [1 :0]  cp0_yy_priv_mode;           
wire    [9 :0]  cpu_clic_curid;             
wire            cpu_clic_int_exit;          
wire            cpurst_b;                   
wire            csr_wen;                    
wire            hw_vector_clic_on;          
wire            iu_cp0_expt_vld;            
wire            iu_cp0_int_vld;             
wire            iu_cp0_syc_rst_b;           
wire            iu_yy_xx_dbgon;             
wire    [9 :0]  iu_yy_xx_expt_vec;          
wire            iu_yy_xx_int_hv;            
wire    [7 :0]  iu_yy_xx_int_il;            
wire    [9 :0]  iu_yy_xx_int_pending_id;    
wire    [7 :0]  iu_yy_xx_int_pending_il;    
wire    [11:0]  iui_oreg_imm;               
wire            iui_oreg_inst_csr;          
wire            iui_oreg_inst_mret;         
wire            iui_oreg_rd_x0;             
wire    [31:0]  iui_oreg_rs1;               
wire            iui_oreg_rs1_x0;            
wire            mcause_local_en;            
wire    [31:0]  mcause_value;               
wire    [31:0]  mintstatus_value;           
wire            mnxti_local_en;             
wire            mnxti_mstatus_local_en;     
wire            mnxti_vld_int_pending;      
wire    [1 :0]  mode;                       
wire    [1 :0]  mpp;                        
wire            mstatus_local_en;           
wire    [31:0]  mstatus_value;              
wire            mxstatus_t;                 
wire            oreg_clk;                   
wire    [1 :0]  oreg_iui_priv_mode;         
wire    [1 :0]  oreg_status_mode;           
wire            status_oreg_intr;           
wire    [7 :0]  status_oreg_mpil;           
wire            status_oreg_mxstatus_t;     
wire    [9 :0]  status_oreg_vector;         
wire            vector_cp0_vec_succeed;     
parameter MSTATUS   = 12'h300;
parameter MCAUSE    = 12'h342;
parameter MNXTI     = 12'h345;
assign csr_wen                = iui_oreg_inst_csr 
                                && iu_cp0_syc_rst_b 
                                && ((pm[1:0] == 2'b11) || iu_yy_xx_dbgon);
assign mstatus_local_en       = (csr_wen && iui_oreg_imm[11:0] == MSTATUS) 
                                || (mnxti_mstatus_local_en);
assign mnxti_local_en         = mnxti_mstatus_local_en
                                && !iui_oreg_rd_x0;
assign mnxti_mstatus_local_en = csr_wen 
                                && (iui_oreg_imm[11:0] == MNXTI) 
                                && !iui_oreg_rs1_x0;
assign mode[1:0]              = oreg_status_mode[1:0];
assign mcause_local_en        = csr_wen && iui_oreg_imm[11:0] == MCAUSE;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mpie <= 1'b0;
   else if(mstatus_local_en && iu_cp0_int_vld)
    mpie <= iui_oreg_rs1[3];
  else if(iui_oreg_inst_mret && iu_cp0_int_vld)
    mpie <= mpie;
  else if(iu_cp0_expt_vld)
    mpie <= mie;
  else if(iui_oreg_inst_mret)
    mpie <= 1'b1;
  else if(mstatus_local_en)
    mpie <= iui_oreg_rs1[7];
  else if((mode[1]==1'b1) && mcause_local_en)
    mpie <=iui_oreg_rs1[27];
  else
    mpie <= mpie;
end
assign mpp[1:0]  = 2'b11;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mprv <= 1'b0;
  else
    mprv <= mprv;
end
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pm[1:0] <= 2'b11;
  else if(iu_cp0_expt_vld)
    pm[1:0] <= 2'b11;
  else if(iui_oreg_inst_mret)
    pm[1:0] <= mpp[1:0];
  else
    pm[1:0] <= pm[1:0];
end
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mie <= 1'b0;
  else if(iu_cp0_expt_vld)
    mie <= 1'b0;
  else if(iui_oreg_inst_mret)
    mie <= mpie;
  else if(mstatus_local_en)
    mie <= iui_oreg_rs1[3];
  else
    mie <= mie;
end
assign mstatus_value[31:0]  = {13'b0,1'b0,mprv,4'b0,mpp[1:0],3'b0, mpie, 3'b0, mie, 3'b0};
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    intr <= 1'b0;
   else if(iu_cp0_int_vld)
    intr <= 1'b1;
  else if(iu_cp0_expt_vld)
    intr <= 1'b0;
  else if(mcause_local_en)
    intr <= iui_oreg_rs1[31];
  else
    intr <= intr;
end
assign status_oreg_intr = intr;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vector[9:0] <= 9'b0;
  else if(iu_cp0_expt_vld)
    vector[9:0] <= {iu_yy_xx_expt_vec[9:0]};
  else if(mcause_local_en)
    vector[9:0] <= (mode[1]==1'b1) ? iui_oreg_rs1[9:0] : {6'b0,iui_oreg_rs1[3:0]};
  else if(mnxti_local_en && mnxti_vld_int_pending && (mode[1:0]==2'b10))
    vector[9:0] <= iu_yy_xx_int_pending_id[9:0];
  else
    vector[9:0] <= vector[9:0];
end
assign status_oreg_vector[9:0] = (mode[1]==1'b1) ? vector[9:0] :{6'b0,vector[3:0]};
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    minhv <= 1'b0;
  else if(mode[1]==1'b0)
    minhv <=1'b0;
  else if(mcause_local_en)
    minhv <= iui_oreg_rs1[30];
  else if(hw_vector_clic_on)
    minhv <= 1'b1;
  else if(vector_cp0_vec_succeed)
    minhv <= 1'b0;
end
assign hw_vector_clic_on = ((mode[1:0]==2'b11) || iu_yy_xx_int_hv) && iu_cp0_int_vld;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mpil[7:0] <= 8'b0;
  else if(mode[1]==1'b0)
    mpil[7:0] <= 8'b0;
  else if(iu_cp0_int_vld )
    mpil[7:0] <= mil[7:0];
  else if(mcause_local_en)
    mpil[7:0] <= iui_oreg_rs1[23:16];
  else
    mpil[7:0] <= mpil[7:0];
end
assign status_oreg_mpil[7:0] = mpil[7:0];
assign mcause_value[31:0]    = mode[1] ? {intr, minhv, mpp[1:0], mpie, 3'b0, 
                                          mpil[7:0], 6'b0, vector[9:0]}
                                       : {intr,27'b0,vector[3:0]};
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mil[7:0] <= 8'b0;
  else if(mode[1]==1'b0)
    mil[7:0] <= 8'b0;
   else if(iu_cp0_int_vld)
    mil[7:0] <= iu_yy_xx_int_il[7:0];
  else if(iui_oreg_inst_mret && intr)
    mil[7:0] <= mpil[7:0];
  else if(mnxti_local_en && (mode[1:0]==2'b10) && mnxti_vld_int_pending)
    mil[7:0] <= iu_yy_xx_int_pending_il[7:0];
  else
    mil[7:0] <= mil[7:0];
end
assign mintstatus_value[31:0] = {mil[7:0],24'b0};
assign cp0_iu_mie_for_int            = mie || (pm[1:0] != 2'b11);
assign cp0_iu_il[7:0]                = mil[7:0];
assign cp0_yy_priv_mode[1:0]         = pm[1:0];
assign cp0_yy_machine_mode_aft_dbg   = pm[0];
assign cp0_had_mcause_data[31:0]     = 32'b0;
assign cp0_had_int_exit              = 1'b0;
assign cp0_pad_mstatus[31:0]         = mstatus_value[31:0];
assign cp0_pad_mintstatus[31:0]      = mintstatus_value[31:0];
assign status_oreg_mxstatus_t       = mxstatus_t;
assign oreg_iui_priv_mode[1:0]       = pm[1:0];
assign mxstatus_t                   = 1'b0;
assign cpu_clic_int_exit             = intr && iui_oreg_inst_mret;
assign cpu_clic_curid[9:0]           = vector[9:0];
endmodule
