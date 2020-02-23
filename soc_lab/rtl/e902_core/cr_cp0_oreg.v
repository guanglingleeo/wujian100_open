/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define PRODUCT_ID 16'h0000
module cr_cp0_oreg(
  cp0_had_cpuid_idx0,
  cp0_iu_epc_for_chgflw,
  cp0_iu_meie,
  cp0_iu_vbr,
  cp0_iu_vec_mode,
  cp0_pad_psr,
  cp0_vector_vec_err_vbr,
  cp0_yy_be_v1,
  cp0_yy_be_v2,
  cpurst_b,
  forever_cpuclk,
  had_iu_force_dbg_en,
  iu_cp0_ecall,
  iu_cp0_epc,
  iu_cp0_epc_update,
  iu_cp0_ex_sel,
  iu_cp0_expt_tval,
  iu_cp0_expt_vld,
  iu_cp0_int_vld,
  iu_cp0_mtval_updt_vld,
  iu_cp0_nt_int_pending_vld,
  iu_cp0_syc_rst_b,
  iu_yy_xx_dbgon,
  iu_yy_xx_int_hv,
  iu_yy_xx_int_pending_hv,
  iu_yy_xx_int_pending_id,
  iu_yy_xx_int_pending_il,
  iu_yy_xx_int_pending_priv,
  iui_oreg_csr_acc,
  iui_oreg_expt,
  iui_oreg_imm,
  iui_oreg_inst_csr,
  iui_oreg_inst_mret,
  iui_oreg_rs1,
  iui_oreg_tval,
  marchid_value,
  mcpuid_value,
  mcycle_value,
  mcycleh_value,
  mepc_value,
  mhartid_value,
  mie_value,
  mimpid_value,
  minstret_value,
  minstreth_value,
  mip_value,
  misa_value,
  mnxti_value,
  mnxti_vld_int_pending,
  mscratch_value,
  mstatus_value,
  mtval_value,
  mtvec_value,
  mtvt_value,
  mvendorid_value,
  oreg_clk,
  oreg_clk_en,
  oreg_iui_priv_mode,
  oreg_iui_wr_rdonly,
  oreg_status_mode,
  status_oreg_intr,
  status_oreg_mpil,
  status_oreg_mxstatus_t,
  status_oreg_vector,
  sysio_cp0_bigend,
  sysio_cp0_clkratio,
  sysio_cp0_endian_v2,
  vector_cp0_vec_err,
  vector_cp0_vec_err_epc,
  vector_cp0_vec_succeed
);
input           cpurst_b;                 
input           forever_cpuclk;           
input           had_iu_force_dbg_en;      
input           iu_cp0_ecall;             
input   [30:0]  iu_cp0_epc;               
input           iu_cp0_epc_update;        
input           iu_cp0_ex_sel;            
input   [31:0]  iu_cp0_expt_tval;         
input           iu_cp0_expt_vld;          
input           iu_cp0_int_vld;           
input           iu_cp0_mtval_updt_vld;    
input           iu_cp0_nt_int_pending_vld; 
input           iu_cp0_syc_rst_b;         
input           iu_yy_xx_dbgon;           
input           iu_yy_xx_int_hv;          
input           iu_yy_xx_int_pending_hv;  
input   [9 :0]  iu_yy_xx_int_pending_id;  
input   [7 :0]  iu_yy_xx_int_pending_il;  
input   [1 :0]  iu_yy_xx_int_pending_priv; 
input           iui_oreg_csr_acc;         
input           iui_oreg_expt;            
input   [11:0]  iui_oreg_imm;             
input           iui_oreg_inst_csr;        
input           iui_oreg_inst_mret;       
input   [31:0]  iui_oreg_rs1;             
input   [31:0]  iui_oreg_tval;            
input   [31:0]  mstatus_value;            
input           oreg_clk;                 
input   [1 :0]  oreg_iui_priv_mode;       
input           status_oreg_intr;         
input   [7 :0]  status_oreg_mpil;         
input           status_oreg_mxstatus_t;   
input   [9 :0]  status_oreg_vector;       
input           sysio_cp0_bigend;         
input   [2 :0]  sysio_cp0_clkratio;       
input           sysio_cp0_endian_v2;      
input           vector_cp0_vec_err;       
input   [29:0]  vector_cp0_vec_err_epc;   
input           vector_cp0_vec_succeed;   
output  [31:0]  cp0_had_cpuid_idx0;       
output  [30:0]  cp0_iu_epc_for_chgflw;    
output          cp0_iu_meie;              
output  [29:0]  cp0_iu_vbr;               
output  [1 :0]  cp0_iu_vec_mode;          
output  [31:0]  cp0_pad_psr;              
output  [29:0]  cp0_vector_vec_err_vbr;   
output          cp0_yy_be_v1;             
output          cp0_yy_be_v2;             
output  [31:0]  marchid_value;            
output  [31:0]  mcpuid_value;             
output  [31:0]  mcycle_value;             
output  [31:0]  mcycleh_value;            
output  [31:0]  mepc_value;               
output  [31:0]  mhartid_value;            
output  [31:0]  mie_value;                
output  [31:0]  mimpid_value;             
output  [31:0]  minstret_value;           
output  [31:0]  minstreth_value;          
output  [31:0]  mip_value;                
output  [31:0]  misa_value;               
output  [31:0]  mnxti_value;              
output          mnxti_vld_int_pending;    
output  [31:0]  mscratch_value;           
output  [31:0]  mtval_value;              
output  [31:0]  mtvec_value;              
output  [31:0]  mtvt_value;               
output  [31:0]  mvendorid_value;          
output          oreg_clk_en;              
output          oreg_iui_wr_rdonly;       
output  [1 :0]  oreg_status_mode;         
reg     [29:0]  cp0_iu_vbr;               
reg     [31:0]  cpuid_value;              
reg     [1 :0]  index;                    
reg             int_hv;                   
reg     [63:0]  mcycle;                   
reg     [31:0]  mscratch_value;           
reg     [31:0]  mtval_value;              
reg     [29:0]  nt_base;                  
reg             nt_meie;                  
reg     [30:0]  nt_mepc;                  
reg     [1 :0]  nt_mode;                  
reg     [25:0]  nt_mtvt;                  
wire    [29:0]  base;                     
wire    [31:0]  cp0_had_cpuid_idx0;       
wire    [30:0]  cp0_iu_epc_for_chgflw;    
wire            cp0_iu_meie;              
wire    [1 :0]  cp0_iu_vec_mode;          
wire    [31:0]  cp0_pad_psr;              
wire    [29:0]  cp0_vector_vec_err_vbr;   
wire            cp0_yy_be_v1;             
wire            cp0_yy_be_v2;             
wire    [31:0]  cpuid_index0_value;       
wire    [31:0]  cpuid_index1_value;       
wire    [31:0]  cpuid_index2_value;       
wire            cpurst_b;                 
wire            csr_wen;                  
wire            expt_int_epc_update_vld;  
wire            forever_cpuclk;           
wire            had_iu_force_dbg_en;      
wire    [29:0]  hv_base;                  
wire            index_max;                
wire    [1 :0]  index_next_val;           
wire            intr;                     
wire            iu_cp0_ecall;             
wire    [30:0]  iu_cp0_epc;               
wire            iu_cp0_epc_update;        
wire            iu_cp0_ex_sel;            
wire    [31:0]  iu_cp0_expt_tval;         
wire            iu_cp0_expt_vld;          
wire            iu_cp0_int_vld;           
wire            iu_cp0_mtval_updt_vld;    
wire            iu_cp0_nt_int_pending_vld; 
wire            iu_cp0_syc_rst_b;         
wire            iu_yy_xx_dbgon;           
wire            iu_yy_xx_int_hv;          
wire            iu_yy_xx_int_pending_hv;  
wire    [9 :0]  iu_yy_xx_int_pending_id;  
wire    [7 :0]  iu_yy_xx_int_pending_il;  
wire    [1 :0]  iu_yy_xx_int_pending_priv; 
wire            iui_oreg_csr_acc;         
wire            iui_oreg_expt;            
wire    [11:0]  iui_oreg_imm;             
wire            iui_oreg_inst_csr;        
wire            iui_oreg_inst_mret;       
wire    [31:0]  iui_oreg_rs1;             
wire    [31:0]  iui_oreg_tval;            
wire            marchid_local_en;         
wire    [31:0]  marchid_value;            
wire            mcpuid_local_en;          
wire    [31:0]  mcpuid_value;             
wire            mcpuid_wen;               
wire            mcycle_local_en;          
wire    [31:0]  mcycle_value;             
wire            mcycleh_local_en;         
wire    [31:0]  mcycleh_value;            
wire            meie;                     
wire    [30:0]  mepc;                     
wire            mepc_local_en;            
wire    [31:0]  mepc_value;               
wire            mhartid_local_en;         
wire    [31:0]  mhartid_value;            
wire            mie_local_en;             
wire    [31:0]  mie_value;                
wire            mimpid_local_en;          
wire    [31:0]  mimpid_value;             
wire    [31:0]  minstret_value;           
wire    [31:0]  minstreth_value;          
wire    [31:0]  mip_value;                
wire            misa_m;                   
wire            misa_user_mode;           
wire    [31:0]  misa_value;               
wire    [31:0]  mnxti_value;              
wire            mnxti_vld_int_pending;    
wire    [1 :0]  mode;                     
wire    [7 :0]  mpil;                     
wire            mscratch_local_en;        
wire    [31:0]  mstatus_value;            
wire    [31:0]  mtval_expt_update;        
wire            mtval_local_en;           
wire            mtvec_local_en;           
wire    [31:0]  mtvec_value;              
wire    [25:0]  mtvt;                     
wire            mtvt_local_en;            
wire    [31:0]  mtvt_value;               
wire            mvendorid_local_en;       
wire    [31:0]  mvendorid_value;          
wire            mxstatus_t;               
wire    [29:0]  nt_base_pre;              
wire            nt_meip;                  
wire            nt_mepc_local_en;         
wire            nt_mie_local_en;          
wire            nt_mtvec_local_en;        
wire            nt_mtvt_local_en;         
wire            oreg_clk;                 
wire            oreg_clk_en;              
wire    [1 :0]  oreg_iui_priv_mode;       
wire            oreg_iui_wr_rdonly;       
wire    [1 :0]  oreg_status_mode;         
wire            pad_cpu_secu_dbg_en;      
wire            status_oreg_intr;         
wire    [7 :0]  status_oreg_mpil;         
wire            status_oreg_mxstatus_t;   
wire    [9 :0]  status_oreg_vector;       
wire            t_nt_mie_local_en;        
wire            t_nt_mip_local_en;        
wire            t_ntmepc_local_en;        
wire            t_ntmtvec_local_en;       
wire            t_ntmtvt_local_en;        
wire    [29:0]  vec_adder_base;           
wire    [29:0]  vec_adder_vbr;            
wire    [9 :0]  vec_adder_vec;            
wire    [9 :0]  vector;                   
wire            vector_cp0_vec_err;       
wire    [29:0]  vector_cp0_vec_err_epc;   
wire            vector_cp0_vec_succeed;   
wire            vld_int_pending;          
parameter MSTATUS   = 12'h300;
parameter MISA      = 12'h301;
parameter MIE       = 12'h304;
parameter MTVEC     = 12'h305;
parameter MSCRATCH  = 12'h340;
parameter MEPC      = 12'h341;
parameter MCAUSE    = 12'h342;
parameter MTVAL     = 12'h343;
parameter MIP       = 12'h344;
parameter MCYCLE    = 12'hB00;
parameter MINSTRET  = 12'hB02;
parameter MCYCLEH   = 12'hB80; 
parameter MINSTRETH = 12'hB82; 
parameter MVENDORID = 12'hF11;
parameter MARCHID   = 12'hF12;
parameter MIMPID    = 12'hF13;
parameter MHARTID   = 12'hF14;
parameter MCPUID    = 12'hFC0;
parameter MTVT      = 12'h307;
parameter MNXTI     = 12'h345;
parameter MINTSTATUS = 12'h346;
assign oreg_clk_en = csr_wen 
                     || iu_cp0_expt_vld
                     || iui_oreg_inst_mret 
                     || iu_cp0_epc_update 
                     || vector_cp0_vec_succeed 
                     || vector_cp0_vec_err 
                     || iu_cp0_mtval_updt_vld
                     || pad_cpu_secu_dbg_en
                     || had_iu_force_dbg_en;
assign csr_wen = iui_oreg_inst_csr && iu_cp0_syc_rst_b && ((oreg_iui_priv_mode[1:0] == 2'b11) || iu_yy_xx_dbgon);
assign nt_mtvec_local_en  = !mxstatus_t  && mtvec_local_en   || t_ntmtvec_local_en;
assign nt_mepc_local_en   = !mxstatus_t  && mepc_local_en    || t_ntmepc_local_en;
assign nt_mie_local_en    = !mxstatus_t  && mie_local_en     || t_nt_mie_local_en;
assign mie_local_en       = csr_wen && iui_oreg_imm[11:0] == MIE;       
assign mtvec_local_en     = csr_wen && iui_oreg_imm[11:0] == MTVEC;     
assign mepc_local_en      = csr_wen && iui_oreg_imm[11:0] == MEPC;      
assign mvendorid_local_en = csr_wen && iui_oreg_imm[11:0] == MVENDORID; 
assign marchid_local_en   = csr_wen && iui_oreg_imm[11:0] == MARCHID;   
assign mimpid_local_en    = csr_wen && iui_oreg_imm[11:0] == MIMPID;    
assign mhartid_local_en   = csr_wen && iui_oreg_imm[11:0] == MHARTID;   
assign mcpuid_local_en    = iui_oreg_imm[11:0] == MCPUID;
assign mtval_local_en     = csr_wen && iui_oreg_imm[11:0] == MTVAL;     
assign mscratch_local_en  = csr_wen && iui_oreg_imm[11:0] == MSCRATCH;  
assign mcycle_local_en    = csr_wen && iui_oreg_imm[11:0] == MCYCLE;  
assign mcycleh_local_en   = csr_wen && iui_oreg_imm[11:0] == MCYCLEH;  
assign mtvt_local_en      = csr_wen && iui_oreg_imm[11:0] == MTVT;
assign nt_mtvt_local_en   = mtvt_local_en && !mxstatus_t || t_ntmtvt_local_en;
assign t_ntmtvec_local_en     = 1'b0;
assign t_ntmepc_local_en      = 1'b0;
assign t_nt_mie_local_en      = 1'b0;
assign t_nt_mip_local_en      = 1'b0;
assign t_ntmtvt_local_en      = 1'b0;
assign oreg_iui_wr_rdonly = 
                            mvendorid_local_en 
                         || marchid_local_en || mimpid_local_en || mhartid_local_en;
assign misa_value[31:0] = 
  {2'b1, 9'b0, misa_user_mode, 7'b0, misa_m, 7'b0, 1'b1, 1'b0, 1'b1, 2'b0};
assign misa_user_mode = 1'b0;   
assign misa_m         = 1'b1;   
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    nt_base[29:0] <= 30'b0;
  else if(nt_mtvec_local_en)
    nt_base[29:0] <= nt_base_pre[29:0];
  else
    nt_base[29:0] <= nt_base[29:0];
end
assign nt_base_pre[29:0] = mode[1] ? {iui_oreg_rs1[31:6],nt_base[3:0]} : iui_oreg_rs1[31:2];
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    nt_mode[1:0] <= 2'b0;
  else if(nt_mtvec_local_en)
    nt_mode[1:0] <= iui_oreg_rs1[1:0];
  else
    nt_mode[1:0] <= nt_mode[1:0];
end
assign mtvec_value[31:0] = mode[1] ? {nt_base[29:4],4'b0, mode[1:0]}:{nt_base[29:0], mode[1:0]};
assign mode[1:0]         = nt_mode[1:0];
assign base[29:0]        = nt_base[29:0];
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    nt_mepc[30:0] <= 31'b0;
  else if(expt_int_epc_update_vld)
    nt_mepc[30:0] <= iu_cp0_epc[30:0];
  else if(vector_cp0_vec_err&& !mxstatus_t)
    nt_mepc[30:0] <= {vector_cp0_vec_err_epc[29:0],1'b0};
  else if(nt_mepc_local_en&& !mxstatus_t)
    nt_mepc[30:0] <= iui_oreg_rs1[31:1];
  else
    nt_mepc[30:0] <= nt_mepc[30:0];
end
assign mepc_value[31:0] = {nt_mepc[30:0], 1'b0};
assign mepc[30:0] = nt_mepc[30:0];
assign expt_int_epc_update_vld  = ((iu_cp0_expt_vld && !iui_oreg_inst_mret) 
                                  || iu_cp0_epc_update) && !mxstatus_t;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mscratch_value[31:0] <= 32'b0;
  else if(mscratch_local_en)
    mscratch_value[31:0] <= iui_oreg_rs1[31:0];
  else
    mscratch_value[31:0] <= mscratch_value[31:0];
end
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    nt_mtvt[25:0] <= 26'b0;
  else if(nt_mtvt_local_en)
    nt_mtvt[25:0] <= iui_oreg_rs1[31:6];
  else
    nt_mtvt[25:0] <= nt_mtvt[25:0];
end
assign mtvt_value[31:0]  = {nt_mtvt[25:0],6'b0};
assign mtvt[25:0]        = nt_mtvt[25:0];
assign mnxti_value[31:0] = (mode[1:0] == 2'b10) ? vld_int_pending ?  {hv_base[29:0],2'b0} : 32'b0 : 32'b0;
assign vld_int_pending   = (iu_yy_xx_int_pending_il[7:0] > mpil[7:0]) 
                            && (iu_yy_xx_int_pending_priv[1:0] == 2'b11) 
                            && !iu_yy_xx_int_pending_hv;
assign mnxti_vld_int_pending = vld_int_pending; 
assign mpil[7:0]             = status_oreg_mpil[7:0];                           
assign mtval_expt_update[31:0] = (iu_cp0_int_vld || iu_cp0_ecall && iu_cp0_ex_sel) ? 
                                  32'b0 : iui_oreg_expt ? iui_oreg_tval[31:0]
                                                       : iu_cp0_expt_tval[31:0];
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtval_value[31:0] <= 32'b0;
  else if(iu_cp0_mtval_updt_vld)
    mtval_value[31:0] <= mtval_expt_update[31:0];
  else if(mtval_local_en)
    mtval_value[31:0] <= iui_oreg_rs1[31:0];
  else
    mtval_value[31:0] <= mtval_value[31:0];
end
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    nt_meie <= 1'b0;
  else if((mode[1] == 1'b0) && nt_mie_local_en)
    nt_meie <= iui_oreg_rs1[11];
  else
    nt_meie <= nt_meie;
end
assign mie_value[31:0]    = mode[1] ? 32'b0 : {20'b0, nt_meie, 3'b0, 1'b0 , 3'b0, 1'b0, 3'b0};
assign meie               = nt_meie;
assign nt_meip = iu_cp0_nt_int_pending_vld && (mode[1] == 1'b0);
assign mip_value[31:0]    = mode[1] ? 32'b0 : {20'b0, nt_meip, 3'b0, 1'b0 , 3'b0, 1'b0, 3'b0};
assign pad_cpu_secu_dbg_en = 1'b0;
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcycle[63:0] <= 64'b0;
  else if(mcycle_local_en)
    mcycle[63:0] <= {mcycle[63:32], iui_oreg_rs1[31:0]};
  else if(mcycleh_local_en)
    mcycle[63:0] <= {iui_oreg_rs1[31:0], mcycle[31:0]};
  else
    mcycle[63:0] <= mcycle[63:0] + 1'b1;
end
assign mcycle_value[31:0]  = mcycle[31:0];
assign mcycleh_value[31:0] = mcycle[63:32];
assign minstret_value[31:0]  = 32'b0;
assign minstreth_value[31:0] = 32'b0;
assign mvendorid_value[31:0] = 32'h5B7; 
assign mimpid_value[31:0]    = 32'b0; 
assign mhartid_value[31:0]   = 32'b0; 
assign marchid_value[31:0] = 32'b0;
assign index_max = (index[1:0] == 2'd2);
assign index_next_val[1:0] = (index_max) ? 2'd0
                                         : index[1:0] + 2'd1;
assign mcpuid_wen = iui_oreg_csr_acc && iu_cp0_syc_rst_b && ((oreg_iui_priv_mode[1:0] == 2'b11) || iu_yy_xx_dbgon);
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      index[1:0] <= 2'b0;
    end
  else if (mcpuid_wen && mcpuid_local_en)
    begin
      index[1:0] <= index_next_val[1:0];
    end
  else
    begin
      index[1:0] <= index[1:0];
    end
end
always @( cpuid_index1_value[31:0]
       or cpuid_index0_value[31:0]
       or index[1:0]
       or cpuid_index2_value[31:0])
begin
  case(index[1:0])
  2'b00   : cpuid_value[31:0] = cpuid_index0_value[31:0];
  2'b01   : cpuid_value[31:0] = cpuid_index1_value[31:0];
  2'b10   : cpuid_value[31:0] = cpuid_index2_value[31:0];
  default : cpuid_value[31:0] = 32'bx;
  endcase
end
    assign cpuid_index0_value[31:28] = 4'b0000;
    assign cpuid_index0_value[27:26] = 2'b10; 
    assign cpuid_index0_value[25:22] = 4'b0000; 
    assign cpuid_index0_value[21:18] = 4'b0001; 
    assign cpuid_index0_value[17:10] = 8'b0; 
    assign cpuid_index0_value[9] = 1'b0;
    assign cpuid_index0_value[8] = 1'b0; 
    assign cpuid_index0_value[7:3] = 5'b00001; 
    assign cpuid_index0_value[2:0] = 3'b100; 
    assign cpuid_index1_value[31:28] = 4'b0001;
    assign cpuid_index1_value[27:24] = 4'b0;
    assign cpuid_index1_value[23:16] = 8'b0; 
    assign cpuid_index1_value[15:0] = `PRODUCT_ID; 
    assign cpuid_index2_value[31:28] = 4'b0010;
    assign cpuid_index2_value[27:26] = 2'b01;
    assign cpuid_index2_value[25:24] = 2'b00;
    assign cpuid_index2_value[23:21] = 3'b001;
    assign cpuid_index2_value[20:16] = 5'b0;
    assign cpuid_index2_value[15:12] = 4'b0100;
    assign cpuid_index2_value[11:9] = 3'b0;
    assign cpuid_index2_value[8:6] = 3'b0;
    assign cpuid_index2_value[5:3] = 3'b111; 
    assign cpuid_index2_value[2:0] = 3'b0;
assign mcpuid_value[31:0] = cpuid_value[31:0];
assign cp0_iu_meie = meie;
assign vector[9:0]                 = status_oreg_vector[9:0];
assign intr                        = status_oreg_intr;
always @(posedge oreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    int_hv <= 1'b0;
  else if(iu_cp0_expt_vld)
    int_hv <= iu_yy_xx_int_hv;
  else 
    int_hv <= int_hv;
end
always @( intr
       or vec_adder_vbr[29:0]
       or base[29:0]
       or mode[1:0]
       or int_hv)
begin
case({intr,mode[1:0]})
3'b100:cp0_iu_vbr[29:0] = base[29:0];
3'b101:cp0_iu_vbr[29:0] = vec_adder_vbr[29:0];
3'b110:cp0_iu_vbr[29:0] = int_hv ? vec_adder_vbr[29:0] : {base[29:4],4'b0};
3'b111:cp0_iu_vbr[29:0] = vec_adder_vbr[29:0];
3'b000:cp0_iu_vbr[29:0] = base[29:0];
3'b001:cp0_iu_vbr[29:0] = base[29:0];
3'b010:cp0_iu_vbr[29:0] = {base[29:4],4'b0};
3'b011:cp0_iu_vbr[29:0] = {base[29:4],4'b0};
endcase
end
assign vec_adder_base[29:0]        = mode[1] ? {mtvt[25:0],4'b0} : base[29:0];
assign vec_adder_vec[9:0]          = mode[1] ? vld_int_pending ? iu_yy_xx_int_pending_id[9:0] : vector[9:0] 
                                             : {6'b0,vector[3:0]};
assign vec_adder_vbr[29:0]         = vec_adder_base[29:0] + vec_adder_vec[9:0];
assign hv_base[29:0]               = vec_adder_vbr[29:0];
assign cp0_vector_vec_err_vbr[29:0] = {base[29:4],4'b0};
assign cp0_iu_epc_for_chgflw[30:0] = mepc[30:0]; 
assign oreg_status_mode[1:0]       = mode[1:0];
assign cp0_iu_vec_mode[1:0]        = mode[1:0];
assign mxstatus_t                  = status_oreg_mxstatus_t;
assign cp0_had_cpuid_idx0[31:0] = cpuid_index0_value[31:0];
assign cp0_pad_psr[31:0]           = mstatus_value[31:0];
assign cp0_yy_be_v1 = 1'b0; 
assign cp0_yy_be_v2 = 1'b0; 
endmodule
