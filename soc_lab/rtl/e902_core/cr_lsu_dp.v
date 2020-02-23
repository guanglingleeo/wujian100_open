/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_lsu_dp(
  bmu_lsu_data,
  cp0_yy_be_v1,
  cp0_yy_be_v2,
  cp0_yy_clk_en,
  cp0_yy_machine_mode_aft_dbg,
  cpurst_b,
  cru_lsu_acc_ca,
  ctrl_dp_ldst_info_buf_reuse,
  ctrl_dp_ldst_req_grnt,
  ctrl_dp_store_buffer_updt,
  dp_ctrl_misalign,
  forever_cpuclk,
  iu_lsu_base,
  iu_lsu_cmp,
  iu_lsu_data,
  iu_lsu_ex_byte,
  iu_lsu_ex_data_sel,
  iu_lsu_ex_half,
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
  lsu_bmu_addr,
  lsu_bmu_prot,
  lsu_bmu_size,
  lsu_bmu_store_error,
  lsu_bmu_wdata,
  lsu_bmu_write,
  lsu_had_addr,
  lsu_had_st,
  lsu_inst_store,
  lsu_iu_addr,
  lsu_iu_addr_vld,
  lsu_iu_alu_sel,
  lsu_iu_branch_cout,
  lsu_iu_branch_rst,
  lsu_iu_data,
  lsu_iu_mad_buf,
  lsu_iu_store,
  lsu_iu_wb_load_data,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pmp_lsu_acc_scu,
  randclk_dp_size_buf_mod_en_w5,
  unalign_dp_first_req,
  unalign_dp_load_data_byte1_to_byte1,
  unalign_dp_load_data_byte1_to_byte2,
  unalign_dp_load_data_byte1_to_byte3,
  unalign_dp_load_data_byte1_to_byte4,
  unalign_dp_load_data_byte2_to_byte1,
  unalign_dp_load_data_byte2_to_byte2,
  unalign_dp_load_data_byte2_to_byte3,
  unalign_dp_load_data_byte2_to_byte4,
  unalign_dp_load_data_byte3_to_byte1,
  unalign_dp_load_data_byte3_to_byte2,
  unalign_dp_load_data_byte3_to_byte3,
  unalign_dp_load_data_byte3_to_byte4,
  unalign_dp_load_data_byte4_to_byte1,
  unalign_dp_load_data_byte4_to_byte2,
  unalign_dp_load_data_byte4_to_byte3,
  unalign_dp_load_data_byte4_to_byte4,
  unalign_dp_store_data_byte1_to_byte1,
  unalign_dp_store_data_byte1_to_byte2,
  unalign_dp_store_data_byte1_to_byte3,
  unalign_dp_store_data_byte1_to_byte4,
  unalign_dp_store_data_byte2_to_byte1,
  unalign_dp_store_data_byte2_to_byte2,
  unalign_dp_store_data_byte2_to_byte3,
  unalign_dp_store_data_byte2_to_byte4,
  unalign_dp_store_data_byte3_to_byte1,
  unalign_dp_store_data_byte3_to_byte2,
  unalign_dp_store_data_byte3_to_byte3,
  unalign_dp_store_data_byte3_to_byte4,
  unalign_dp_store_data_byte4_to_byte1,
  unalign_dp_store_data_byte4_to_byte2,
  unalign_dp_store_data_byte4_to_byte3,
  unalign_dp_store_data_byte4_to_byte4
);
input   [31:0]  bmu_lsu_data;                        
input           cp0_yy_be_v1;                        
input           cp0_yy_be_v2;                        
input           cp0_yy_clk_en;                       
input           cp0_yy_machine_mode_aft_dbg;         
input           cpurst_b;                            
input           cru_lsu_acc_ca;                      
input           ctrl_dp_ldst_info_buf_reuse;         
input           ctrl_dp_ldst_req_grnt;               
input           ctrl_dp_store_buffer_updt;           
input           forever_cpuclk;                      
input   [31:0]  iu_lsu_base;                         
input           iu_lsu_cmp;                          
input   [31:0]  iu_lsu_data;                         
input           iu_lsu_ex_byte;                      
input           iu_lsu_ex_data_sel;                  
input           iu_lsu_ex_half;                      
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
input           lsu_inst_store;                      
input           pad_yy_gate_clk_en_b;                
input           pad_yy_test_mode;                    
input           pmp_lsu_acc_scu;                     
input           randclk_dp_size_buf_mod_en_w5;       
input           unalign_dp_first_req;                
input           unalign_dp_load_data_byte1_to_byte1; 
input           unalign_dp_load_data_byte1_to_byte2; 
input           unalign_dp_load_data_byte1_to_byte3; 
input           unalign_dp_load_data_byte1_to_byte4; 
input           unalign_dp_load_data_byte2_to_byte1; 
input           unalign_dp_load_data_byte2_to_byte2; 
input           unalign_dp_load_data_byte2_to_byte3; 
input           unalign_dp_load_data_byte2_to_byte4; 
input           unalign_dp_load_data_byte3_to_byte1; 
input           unalign_dp_load_data_byte3_to_byte2; 
input           unalign_dp_load_data_byte3_to_byte3; 
input           unalign_dp_load_data_byte3_to_byte4; 
input           unalign_dp_load_data_byte4_to_byte1; 
input           unalign_dp_load_data_byte4_to_byte2; 
input           unalign_dp_load_data_byte4_to_byte3; 
input           unalign_dp_load_data_byte4_to_byte4; 
input           unalign_dp_store_data_byte1_to_byte1; 
input           unalign_dp_store_data_byte1_to_byte2; 
input           unalign_dp_store_data_byte1_to_byte3; 
input           unalign_dp_store_data_byte1_to_byte4; 
input           unalign_dp_store_data_byte2_to_byte1; 
input           unalign_dp_store_data_byte2_to_byte2; 
input           unalign_dp_store_data_byte2_to_byte3; 
input           unalign_dp_store_data_byte2_to_byte4; 
input           unalign_dp_store_data_byte3_to_byte1; 
input           unalign_dp_store_data_byte3_to_byte2; 
input           unalign_dp_store_data_byte3_to_byte3; 
input           unalign_dp_store_data_byte3_to_byte4; 
input           unalign_dp_store_data_byte4_to_byte1; 
input           unalign_dp_store_data_byte4_to_byte2; 
input           unalign_dp_store_data_byte4_to_byte3; 
input           unalign_dp_store_data_byte4_to_byte4; 
output          dp_ctrl_misalign;                    
output  [31:0]  lsu_bmu_addr;                        
output  [3 :0]  lsu_bmu_prot;                        
output  [1 :0]  lsu_bmu_size;                        
output          lsu_bmu_store_error;                 
output  [31:0]  lsu_bmu_wdata;                       
output          lsu_bmu_write;                       
output  [31:0]  lsu_had_addr;                        
output          lsu_had_st;                          
output  [31:0]  lsu_iu_addr;                         
output          lsu_iu_addr_vld;                     
output          lsu_iu_alu_sel;                      
output          lsu_iu_branch_cout;                  
output  [31:0]  lsu_iu_branch_rst;                   
output  [31:0]  lsu_iu_data;                         
output  [31:0]  lsu_iu_mad_buf;                      
output          lsu_iu_store;                        
output  [31:0]  lsu_iu_wb_load_data;                 
reg     [4 :0]  ldst_size_buffer;                    
reg     [1 :0]  lsu_addr_mask;                       
reg     [31:0]  lsu_data_sign_extd;                  
reg             lsu_misalign;                        
reg     [31:0]  lsu_sized_data;                      
reg     [31:0]  lsu_store_wdata;                     
reg     [31:0]  store_data_buffer;                   
reg     [31:0]  store_data_buffer_updt_val;          
wire            adder_cout;                          
wire    [31:0]  bmu_lsu_data;                        
wire    [4 :0]  buffer_ldst_info;                    
wire            cp0_yy_be_v1;                        
wire            cp0_yy_be_v2;                        
wire            cp0_yy_clk_en;                       
wire            cp0_yy_machine_mode_aft_dbg;         
wire            cpurst_b;                            
wire            cru_lsu_acc_ca;                      
wire            ctrl_dp_ldst_info_buf_reuse;         
wire            ctrl_dp_ldst_req_grnt;               
wire            ctrl_dp_store_buffer_updt;           
wire            dp_ctrl_misalign;                    
wire            forever_cpuclk;                      
wire    [31:0]  iu_lsu_base;                         
wire            iu_lsu_cmp;                          
wire    [31:0]  iu_lsu_data;                         
wire            iu_lsu_ex_byte;                      
wire            iu_lsu_ex_data_sel;                  
wire            iu_lsu_ex_half;                      
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
wire    [1 :0]  iu_lsu_size;                         
wire    [31:0]  lsu_addr;                            
wire    [1 :0]  lsu_addr_1_0;                        
wire    [1 :0]  lsu_addr_1_0_pre_mux;                
wire    [31:0]  lsu_addr_post;                       
wire    [31:0]  lsu_base;                            
wire    [31:0]  lsu_bmu_addr;                        
wire    [3 :0]  lsu_bmu_prot;                        
wire    [1 :0]  lsu_bmu_size;                        
wire            lsu_bmu_store_error;                 
wire    [31:0]  lsu_bmu_wdata;                       
wire            lsu_bmu_write;                       
wire    [31:0]  lsu_data;                            
wire    [31:0]  lsu_had_addr;                        
wire            lsu_had_st;                          
wire            lsu_inst_store;                      
wire    [31:0]  lsu_iu_adder_src0;                   
wire    [31:0]  lsu_iu_adder_src1;                   
wire    [31:0]  lsu_iu_addr;                         
wire            lsu_iu_addr_vld;                     
wire            lsu_iu_alu_sel;                      
wire            lsu_iu_branch_cout;                  
wire    [31:0]  lsu_iu_branch_rst;                   
wire    [31:0]  lsu_iu_data;                         
wire    [31:0]  lsu_iu_mad_buf;                      
wire            lsu_iu_store;                        
wire    [31:0]  lsu_iu_wb_load_data;                 
wire    [31:0]  lsu_offset;                          
wire            lsu_sign_exten;                      
wire    [1 :0]  lsu_size;                            
wire    [1 :0]  lsu_size_post;                       
wire    [7 :0]  lsu_sized_data_default;              
wire    [7 :0]  lsu_store_wdata_default;             
wire    [1 :0]  lsu_wb_addr_1_0;                     
wire            lsu_wb_sign_exten;                   
wire    [1 :0]  lsu_wb_size;                         
wire    [31:0]  lsu_wdata;                           
wire            pad_yy_gate_clk_en_b;                
wire            pad_yy_test_mode;                    
wire            pmp_lsu_acc_scu;                     
wire            randclk_dp_size_buf_mod_en_w5;       
wire            size_buf_clk;                        
wire            size_buf_clk_en;                     
wire            size_buf_en;                         
wire            size_buf_vld;                        
wire            store_buffer_clk;                    
wire            store_buffer_clk_en;                 
wire            store_buffer_updt;                   
wire    [31:0]  store_buffer_updt_data;              
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
wire    [3 :0]  unalign_ld_byte1_sel;                
wire    [3 :0]  unalign_ld_byte2_sel;                
wire    [3 :0]  unalign_ld_byte3_sel;                
wire    [3 :0]  unalign_ld_byte4_sel;                
wire    [3 :0]  unalign_st_byte1_sel;                
wire    [3 :0]  unalign_st_byte2_sel;                
wire    [3 :0]  unalign_st_byte3_sel;                
wire    [3 :0]  unalign_st_byte4_sel;                
assign size_buf_vld = !lsu_inst_store;
assign size_buf_en = ctrl_dp_ldst_info_buf_reuse
                     && unalign_dp_first_req
                     && size_buf_vld;
assign size_buf_clk_en = (ctrl_dp_ldst_info_buf_reuse || ctrl_dp_ldst_req_grnt)
                     && unalign_dp_first_req
                     && size_buf_vld;
gated_clk_cell  x_size_buf_gated_clk (
  .clk_in                        (forever_cpuclk               ),
  .clk_out                       (size_buf_clk                 ),
  .external_en                   (1'b0                         ),
  .global_en                     (cp0_yy_clk_en                ),
  .local_en                      (size_buf_clk_en              ),
  .module_en                     (randclk_dp_size_buf_mod_en_w5),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             )
);
assign iu_lsu_size[1:0]   = iu_lsu_ex_byte ? 2'b00 : iu_lsu_ex_half ? 2'b01 : 2'b10;
assign lsu_wdata[31:0]    = {32{iu_lsu_oper_mux_en}} & iu_lsu_data[31:0];
assign lsu_size[1:0]      = iu_lsu_size[1:0];
assign lsu_addr_1_0[1:0]  = lsu_addr_1_0_pre_mux[1:0];
assign lsu_sign_exten     = !iu_lsu_ex_uns;
assign lsu_data[31:0]     = bmu_lsu_data[31:0];
parameter BYTE = 2'b00, HALF = 2'b01, WORD = 2'b10;
parameter LE = 2'b00;
parameter BE_V1 = 2'b10, BE_V2 = 2'b01;
assign lsu_base[31:0]     = {32{iu_lsu_oper_mux_en}} & iu_lsu_base[31:0]
                          | {32{iu_lsu_rs1_sel}}     & iu_lsu_base[31:0]
                          | {32{iu_lsu_pc_sel}}      & iu_lsu_pc[31:0];
assign lsu_offset[31:0]   = {32{iu_lsu_oper_mux_en}} & iu_lsu_offset[31:0]
                          | {32{iu_lsu_imm_sel}}     & iu_lsu_offset[31:0]
                          | {32{iu_lsu_cmp}}          & iu_lsu_rs2[31:0];
assign lsu_iu_adder_src0[31:0] = lsu_base[31:0];
assign lsu_iu_adder_src1[31:0] = {32{iu_lsu_cmp}} ^ lsu_offset[31:0];
assign {adder_cout, lsu_addr[31:0]} = lsu_iu_adder_src0[31:0] + lsu_iu_adder_src1[31:0] + iu_lsu_cmp;
assign lsu_iu_branch_rst[31:0] = lsu_addr[31:0];
assign lsu_iu_branch_cout      = adder_cout;
assign lsu_iu_alu_sel = 1'b0;
assign lsu_bmu_store_error = 1'b0;
assign lsu_bmu_addr[31:0]      = lsu_addr_post[31:0];
assign lsu_bmu_size[1:0]       = lsu_size_post[1:0];
assign lsu_bmu_prot[3:0]       = {cru_lsu_acc_ca,
                                  pmp_lsu_acc_scu,
                                  cp0_yy_machine_mode_aft_dbg,
                                  1'b1};
always @( lsu_size[1:0])
begin
  case(lsu_size[1:0])
    WORD : lsu_addr_mask[1:0] = 2'b00;
    HALF : lsu_addr_mask[1:0] = 2'b10;
    default     : lsu_addr_mask[1:0] = 2'b11;
  endcase
end
assign lsu_addr_1_0_pre_mux[1:0]  = lsu_addr_mask[1:0] & lsu_addr[1:0];
always @( lsu_addr[1:0]
       or lsu_size[1:0])
begin
  case(lsu_size[1:0])
    WORD    : lsu_misalign = | lsu_addr[1:0];
    HALF    : lsu_misalign = lsu_addr[0];
    default : lsu_misalign = 1'b0;
  endcase
end
assign dp_ctrl_misalign = lsu_misalign;
assign lsu_size_post[1:0] = lsu_size[1:0];
assign lsu_addr_post[31:0] = {lsu_addr[31:2], lsu_addr_1_0[1:0]};
assign lsu_bmu_write = lsu_inst_store && iu_lsu_ex_data_sel;
assign lsu_iu_store  = lsu_inst_store;
assign unalign_st_byte1_sel[3:0] = {unalign_dp_store_data_byte1_to_byte1,
                                    unalign_dp_store_data_byte2_to_byte1,
                                    unalign_dp_store_data_byte3_to_byte1,
                                    unalign_dp_store_data_byte4_to_byte1};
assign lsu_store_wdata_default[7:0] = 8'b0;
always @( lsu_addr_1_0[1:0]
       or unalign_st_byte1_sel[3:0]
       or cp0_yy_be_v2
       or lsu_size[1:0]
       or lsu_wdata[7:0]
       or lsu_wdata[31:8]
       or lsu_store_wdata_default[7:0]
       or cp0_yy_be_v1)
begin
  lsu_store_wdata[7:0]  = lsu_store_wdata_default[7:0];
  casez({unalign_st_byte1_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_size[1:0],lsu_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[31:24];
    {4'b0000,BE_V1,BYTE, 2'b11} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,BE_V1,HALF, 2'b1?} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,BE_V2,BYTE, 2'b00} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,BE_V2,HALF, 2'b0?} : lsu_store_wdata[7:0]  = lsu_wdata[15:8];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[31:24];
    {4'b0000,LE   ,BYTE, 2'b00} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,LE   ,HALF, 2'b0?} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_store_wdata[7:0]  = lsu_wdata[7:0];
  endcase
end
assign unalign_st_byte2_sel[3:0] = {unalign_dp_store_data_byte1_to_byte2,
                                    unalign_dp_store_data_byte2_to_byte2,
                                    unalign_dp_store_data_byte3_to_byte2,
                                    unalign_dp_store_data_byte4_to_byte2};
always @( lsu_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_size[1:0]
       or lsu_wdata[7:0]
       or lsu_wdata[31:8]
       or lsu_store_wdata_default[7:0]
       or cp0_yy_be_v1
       or unalign_st_byte2_sel[3:0])
begin
  lsu_store_wdata[15:8]  = lsu_store_wdata_default[7:0];
  casez({unalign_st_byte2_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_size[1:0],lsu_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[31:24];
    {4'b0000,BE_V1,BYTE, 2'b10} : lsu_store_wdata[15:8]  = lsu_wdata[7:0];
    {4'b0000,BE_V1,HALF, 2'b1?} : lsu_store_wdata[15:8]  = lsu_wdata[15:8];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[15:8];
    {4'b0000,BE_V2,BYTE, 2'b01} : lsu_store_wdata[15:8]  = lsu_wdata[7:0];
    {4'b0000,BE_V2,HALF, 2'b0?} : lsu_store_wdata[15:8]  = lsu_wdata[7:0];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[23:16];
    {4'b0000,LE   ,BYTE, 2'b01} : lsu_store_wdata[15:8]  = lsu_wdata[7:0];
    {4'b0000,LE   ,HALF, 2'b0?} : lsu_store_wdata[15:8]  = lsu_wdata[15:8];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_store_wdata[15:8]  = lsu_wdata[15:8];
  endcase
end
assign unalign_st_byte3_sel[3:0] = {unalign_dp_store_data_byte1_to_byte3,
                                    unalign_dp_store_data_byte2_to_byte3,
                                    unalign_dp_store_data_byte3_to_byte3,
                                    unalign_dp_store_data_byte4_to_byte3};
always @( lsu_addr_1_0[1:0]
       or cp0_yy_be_v2
       or unalign_st_byte3_sel[3:0]
       or lsu_size[1:0]
       or lsu_wdata[7:0]
       or lsu_wdata[31:8]
       or lsu_store_wdata_default[7:0]
       or cp0_yy_be_v1)
begin
  lsu_store_wdata[23:16]  = lsu_store_wdata_default[7:0];
  casez({unalign_st_byte3_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_size[1:0],lsu_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_store_wdata[23:16] = lsu_wdata[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_store_wdata[23:16] = lsu_wdata[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_store_wdata[23:16] = lsu_wdata[31:24];
    {4'b0000,BE_V1,BYTE, 2'b01} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0000,BE_V1,HALF, 2'b0?} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_store_wdata[23:16] = lsu_wdata[23:16];
    {4'b0000,BE_V2,BYTE, 2'b10} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0000,BE_V2,HALF, 2'b1?} : lsu_store_wdata[23:16] = lsu_wdata[15:8];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_store_wdata[23:16] = lsu_wdata[15:8];
    {4'b0000,LE   ,BYTE, 2'b10} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0000,LE   ,HALF, 2'b1?} : lsu_store_wdata[23:16] = lsu_wdata[7:0];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_store_wdata[23:16] = lsu_wdata[23:16];
  endcase
end
assign unalign_st_byte4_sel[3:0] = {unalign_dp_store_data_byte1_to_byte4,
                                    unalign_dp_store_data_byte2_to_byte4,
                                    unalign_dp_store_data_byte3_to_byte4,
                                    unalign_dp_store_data_byte4_to_byte4};
always @( lsu_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_size[1:0]
       or lsu_wdata[7:0]
       or lsu_wdata[31:8]
       or lsu_store_wdata_default[7:0]
       or cp0_yy_be_v1
       or unalign_st_byte4_sel[3:0])
begin
  lsu_store_wdata[31:24]  = lsu_store_wdata_default[7:0];
  casez({unalign_st_byte4_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_size[1:0],lsu_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_store_wdata[31:24] = lsu_wdata[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_store_wdata[31:24] = lsu_wdata[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_store_wdata[31:24] = lsu_wdata[31:24];
    {4'b0000,BE_V1,BYTE, 2'b00} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0000,BE_V1,HALF, 2'b0?} : lsu_store_wdata[31:24] = lsu_wdata[15:8];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_store_wdata[31:24] = lsu_wdata[31:24];
    {4'b0000,BE_V2,BYTE, 2'b11} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0000,BE_V2,HALF, 2'b1?} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0000,LE   ,BYTE, 2'b11} : lsu_store_wdata[31:24] = lsu_wdata[7:0];
    {4'b0000,LE   ,HALF, 2'b1?} : lsu_store_wdata[31:24] = lsu_wdata[15:8];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_store_wdata[31:24] = lsu_wdata[31:24];
  endcase
end
assign store_buffer_clk_en = store_buffer_updt;
gated_clk_cell  x_store_buffer_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (store_buffer_clk    ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (store_buffer_clk_en ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign store_buffer_updt = ctrl_dp_store_buffer_updt
                        || iu_lsu_imm_write_en;
assign store_buffer_updt_data[31:0] = 
                       {32{ctrl_dp_store_buffer_updt}} & lsu_store_wdata[31:0]
                     | {32{iu_lsu_imm_write_en}}       & iu_lsu_imm_data[31:0];          
always @( store_buffer_updt_data[31:0]
       or store_buffer_updt
       or store_data_buffer[31:0])
begin
  if(store_buffer_updt)
    store_data_buffer_updt_val[31:0] = store_buffer_updt_data[31:0];
  else
    store_data_buffer_updt_val[31:0] = store_data_buffer[31:0];
end
always @(posedge store_buffer_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    store_data_buffer[31:0] <= 32'b0;
  else 
    store_data_buffer[31:0] <= store_data_buffer_updt_val[31:0];
end
assign lsu_bmu_wdata[31:0] = store_data_buffer[31:0];
assign lsu_iu_mad_buf[31:0] = store_data_buffer[31:0];
assign buffer_ldst_info[4:0] = {lsu_sign_exten,
                                lsu_size[1:0],
                                lsu_addr_1_0[1:0]};
always @(posedge size_buf_clk)
begin
  if(size_buf_en)
    ldst_size_buffer[4:0] <= buffer_ldst_info[4:0];
end
assign lsu_wb_addr_1_0[1:0] = ldst_size_buffer[1:0];
assign lsu_wb_size[1:0]     = ldst_size_buffer[3:2];
assign lsu_wb_sign_exten    = ldst_size_buffer[4];
assign unalign_ld_byte1_sel[3:0] = {unalign_dp_load_data_byte1_to_byte1,
                                    unalign_dp_load_data_byte2_to_byte1, 
                                    unalign_dp_load_data_byte3_to_byte1,
                                    unalign_dp_load_data_byte4_to_byte1};
assign lsu_sized_data_default[7:0] = 8'b0;
always @( lsu_wb_size[1:0]
       or unalign_ld_byte1_sel[3:0]
       or lsu_wb_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_data[31:16]
       or cp0_yy_be_v1
       or lsu_sized_data_default[7:0]
       or lsu_data[15:0])
begin
  lsu_sized_data[7:0]  = lsu_sized_data_default[7:0];
  casez({unalign_ld_byte1_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_wb_size[1:0],lsu_wb_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_sized_data[7:0]  = lsu_data[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,BE_V1,BYTE, 2'b00} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,BE_V1,BYTE, 2'b01} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0000,BE_V1,BYTE, 2'b10} : lsu_sized_data[7:0]  = lsu_data[15:8];
    {4'b0000,BE_V1,BYTE, 2'b11} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,BE_V1,HALF, 2'b0?} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0000,BE_V1,HALF, 2'b1?} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,BE_V2,BYTE, 2'b00} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,BE_V2,BYTE, 2'b01} : lsu_sized_data[7:0]  = lsu_data[15:8];
    {4'b0000,BE_V2,BYTE, 2'b10} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0000,BE_V2,BYTE, 2'b11} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,BE_V2,HALF, 2'b0?} : lsu_sized_data[7:0]  = lsu_data[15:8];
    {4'b0000,BE_V2,HALF, 2'b1?} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,LE   ,BYTE, 2'b00} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,LE   ,BYTE, 2'b01} : lsu_sized_data[7:0]  = lsu_data[15:8];
    {4'b0000,LE   ,BYTE, 2'b10} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0000,LE   ,BYTE, 2'b11} : lsu_sized_data[7:0]  = lsu_data[31:24];
    {4'b0000,LE   ,HALF, 2'b0?} : lsu_sized_data[7:0]  = lsu_data[7:0];
    {4'b0000,LE   ,HALF, 2'b1?} : lsu_sized_data[7:0]  = lsu_data[23:16];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_sized_data[7:0]  = lsu_data[7:0];
  endcase
end
assign unalign_ld_byte2_sel[3:0] = {unalign_dp_load_data_byte1_to_byte2,
                                    unalign_dp_load_data_byte2_to_byte2,
                                    unalign_dp_load_data_byte3_to_byte2,
                                    unalign_dp_load_data_byte4_to_byte2};
always @( lsu_wb_size[1:0]
       or lsu_wb_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_data[31:16]
       or cp0_yy_be_v1
       or lsu_sized_data_default[7:0]
       or lsu_data[15:0]
       or unalign_ld_byte2_sel[3:0])
begin
  lsu_sized_data[15:8]  = lsu_sized_data_default[7:0];
  casez({unalign_ld_byte2_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_wb_size[1:0],lsu_wb_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_sized_data[15:8] = lsu_data[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_sized_data[15:8] = lsu_data[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_sized_data[15:8] = lsu_data[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_sized_data[15:8] = lsu_data[31:24];
    {4'b0000,BE_V1,HALF, 2'b0?} : lsu_sized_data[15:8] = lsu_data[31:24];
    {4'b0000,BE_V1,HALF, 2'b1?} : lsu_sized_data[15:8] = lsu_data[15:8];
    {4'b0000,BE_V1,WORD, 2'b??} : lsu_sized_data[15:8] = lsu_data[15:8];
    {4'b0000,BE_V2,HALF, 2'b0?} : lsu_sized_data[15:8] = lsu_data[7:0];
    {4'b0000,BE_V2,HALF, 2'b1?} : lsu_sized_data[15:8] = lsu_data[23:16];
    {4'b0000,BE_V2,WORD, 2'b??} : lsu_sized_data[15:8] = lsu_data[23:16];
    {4'b0000,LE   ,HALF, 2'b0?} : lsu_sized_data[15:8] = lsu_data[15:8];
    {4'b0000,LE   ,HALF, 2'b1?} : lsu_sized_data[15:8] = lsu_data[31:24];
    {4'b0000,LE   ,WORD, 2'b??} : lsu_sized_data[15:8] = lsu_data[15:8];
  endcase
end
assign unalign_ld_byte3_sel[3:0] = {unalign_dp_load_data_byte1_to_byte3,
                                    unalign_dp_load_data_byte2_to_byte3,
                                    unalign_dp_load_data_byte3_to_byte3,
                                    unalign_dp_load_data_byte4_to_byte3};
always @( lsu_wb_size[1:0]
       or lsu_wb_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_data[31:16]
       or cp0_yy_be_v1
       or lsu_sized_data_default[7:0]
       or unalign_ld_byte3_sel[3:0]
       or lsu_data[15:0])
begin
  lsu_sized_data[23:16]  = lsu_sized_data_default[7:0];
  casez({unalign_ld_byte3_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_wb_size[1:0],lsu_wb_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_sized_data[23:16] = lsu_data[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_sized_data[23:16] = lsu_data[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_sized_data[23:16] = lsu_data[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_sized_data[23:16] = lsu_data[31:24];
    {4'b0000,BE_V1,WORD ,2'b??} : lsu_sized_data[23:16] = lsu_data[23:16];
    {4'b0000,BE_V2,WORD ,2'b??} : lsu_sized_data[23:16] = lsu_data[15:8];
    {4'b0000,LE   ,WORD ,2'b??} : lsu_sized_data[23:16] = lsu_data[23:16];
  endcase
end
assign unalign_ld_byte4_sel[3:0] = {unalign_dp_load_data_byte1_to_byte4,
                                    unalign_dp_load_data_byte2_to_byte4,
                                    unalign_dp_load_data_byte3_to_byte4, 
                                    unalign_dp_load_data_byte4_to_byte4};
always @( lsu_wb_size[1:0]
       or lsu_wb_addr_1_0[1:0]
       or cp0_yy_be_v2
       or lsu_data[31:16]
       or cp0_yy_be_v1
       or lsu_sized_data_default[7:0]
       or unalign_ld_byte4_sel[3:0]
       or lsu_data[15:0])
begin
  lsu_sized_data[31:24]  = lsu_sized_data_default[7:0];
  casez({unalign_ld_byte4_sel[3:0],cp0_yy_be_v1,cp0_yy_be_v2,lsu_wb_size[1:0],lsu_wb_addr_1_0[1:0]})
    {4'b1000,2'b??,2'b??,2'b??} : lsu_sized_data[31:24] = lsu_data[7:0];
    {4'b0100,2'b??,2'b??,2'b??} : lsu_sized_data[31:24] = lsu_data[15:8];
    {4'b0010,2'b??,2'b??,2'b??} : lsu_sized_data[31:24] = lsu_data[23:16];
    {4'b0001,2'b??,2'b??,2'b??} : lsu_sized_data[31:24] = lsu_data[31:24];
    {4'b0000,BE_V1,WORD ,2'b??} : lsu_sized_data[31:24] = lsu_data[31:24];
    {4'b0000,BE_V2,WORD ,2'b??} : lsu_sized_data[31:24] = lsu_data[7:0];
    {4'b0000,LE   ,WORD ,2'b??} : lsu_sized_data[31:24] = lsu_data[31:24];
  endcase
end
always @( lsu_wb_size[1:0]
       or lsu_sized_data[31:0]
       or lsu_wb_sign_exten)
begin
  case({lsu_wb_sign_exten,lsu_wb_size[1:0]})
    {1'b1,BYTE} : lsu_data_sign_extd[31:0] = {{24{lsu_sized_data[7]}},lsu_sized_data[7:0]};
    {1'b1,HALF} : lsu_data_sign_extd[31:0] = {{16{lsu_sized_data[15]}},lsu_sized_data[15:0]};
    default     : lsu_data_sign_extd[31:0] = lsu_sized_data[31:0];
  endcase
end
assign lsu_iu_data[31:0] = lsu_data_sign_extd[31:0];
assign lsu_iu_wb_load_data[31:0] = lsu_data_sign_extd[31:0];
assign lsu_iu_addr_vld   = iu_lsu_ex_data_sel;
assign lsu_iu_addr[31:0] = lsu_addr[31:0];
assign lsu_had_st         = lsu_inst_store;
assign lsu_had_addr[31:0] = lsu_bmu_addr[31:0];
endmodule
