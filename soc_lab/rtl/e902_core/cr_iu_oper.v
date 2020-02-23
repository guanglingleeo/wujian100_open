/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_oper(
  cp0_yy_clk_en,
  ctrl_oper_lsu_data_sel,
  decd_oper_alu_imm,
  decd_oper_branch_imm,
  decd_oper_cp0_imm,
  decd_oper_lsu_imm,
  forever_cpuclk,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  hs_split_iu_nsinst_gpr_rst_b,
  ifu_iu_ex_rs1_reg,
  ifu_iu_ex_rs2_reg,
  iu_cp0_imm,
  iu_cp0_rs1,
  iu_lsu_base,
  iu_lsu_data,
  iu_lsu_offset,
  iu_lsu_rs2,
  iu_yy_xx_reg_rst_b,
  oper_alu_rs1_reg,
  oper_alu_rs2_imm,
  oper_alu_rs2_reg,
  oper_branch_rs1_reg,
  oper_branch_rs2_imm,
  oper_branch_rs2_reg,
  oper_mad_rs1,
  oper_mad_rs2,
  oper_wb_rs1_equal_to_dst,
  oper_wb_rs2_equal_to_dst,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  randclk_oper_gpr_mod_en_w32,
  wb_oper_fwd_data_no_load,
  wb_oper_fwd_en,
  wb_oper_write_data,
  wb_oper_write_en,
  wb_oper_write_idx,
  wb_oper_write_idx_for_dep
);
input           cp0_yy_clk_en;                  
input           ctrl_oper_lsu_data_sel;         
input   [31:0]  decd_oper_alu_imm;              
input   [31:0]  decd_oper_branch_imm;           
input   [11:0]  decd_oper_cp0_imm;              
input   [31:0]  decd_oper_lsu_imm;              
input           forever_cpuclk;                 
input   [31:0]  had_idu_wbbr_data;              
input           had_idu_wbbr_vld;               
input           hs_split_iu_nsinst_gpr_rst_b;   
input   [4 :0]  ifu_iu_ex_rs1_reg;              
input   [4 :0]  ifu_iu_ex_rs2_reg;              
input           iu_yy_xx_reg_rst_b;             
input           pad_yy_gate_clk_en_b;           
input           pad_yy_test_mode;               
input   [20:0]  randclk_oper_gpr_mod_en_w32;    
input   [31:0]  wb_oper_fwd_data_no_load;       
input           wb_oper_fwd_en;                 
input   [31:0]  wb_oper_write_data;             
input           wb_oper_write_en;               
input   [4 :0]  wb_oper_write_idx;              
input   [4 :0]  wb_oper_write_idx_for_dep;      
output  [11:0]  iu_cp0_imm;                     
output  [31:0]  iu_cp0_rs1;                     
output  [31:0]  iu_lsu_base;                    
output  [31:0]  iu_lsu_data;                    
output  [31:0]  iu_lsu_offset;                  
output  [31:0]  iu_lsu_rs2;                     
output  [31:0]  oper_alu_rs1_reg;               
output  [31:0]  oper_alu_rs2_imm;               
output  [31:0]  oper_alu_rs2_reg;               
output  [31:0]  oper_branch_rs1_reg;            
output  [31:0]  oper_branch_rs2_imm;            
output  [31:0]  oper_branch_rs2_reg;            
output  [31:0]  oper_mad_rs1;                   
output  [31:0]  oper_mad_rs2;                   
output          oper_wb_rs1_equal_to_dst;       
output          oper_wb_rs2_equal_to_dst;       
wire            cp0_yy_clk_en;                  
wire            ctrl_oper_lsu_data_sel;         
wire    [31:0]  decd_oper_alu_imm;              
wire    [31:0]  decd_oper_branch_imm;           
wire    [11:0]  decd_oper_cp0_imm;              
wire    [31:0]  decd_oper_lsu_imm;              
wire            forever_cpuclk;                 
wire    [31:0]  had_idu_wbbr_data;              
wire            had_idu_wbbr_vld;               
wire            hs_split_iu_nsinst_gpr_rst_b;   
wire    [4 :0]  ifu_iu_ex_rs1_reg;              
wire    [4 :0]  ifu_iu_ex_rs2_reg;              
wire    [11:0]  iu_cp0_imm;                     
wire    [31:0]  iu_cp0_rs1;                     
wire    [31:0]  iu_lsu_base;                    
wire    [31:0]  iu_lsu_data;                    
wire    [31:0]  iu_lsu_offset;                  
wire    [31:0]  iu_lsu_rs2;                     
wire            iu_yy_xx_reg_rst_b;             
wire    [31:0]  oper_alu_rs1_reg;               
wire    [31:0]  oper_alu_rs2_imm;               
wire    [31:0]  oper_alu_rs2_reg;               
wire    [31:0]  oper_branch_rs1_reg;            
wire    [31:0]  oper_branch_rs2_imm;            
wire    [31:0]  oper_branch_rs2_reg;            
wire    [31:0]  oper_imm_for_alu;               
wire    [31:0]  oper_imm_for_branch;            
wire    [11:0]  oper_imm_for_cp0;               
wire    [31:0]  oper_imm_for_lsu;               
wire    [31:0]  oper_mad_rs1;                   
wire    [31:0]  oper_mad_rs2;                   
wire            oper_rs1_bsp_dep_vld;           
wire            oper_rs1_dep_vld;               
wire            oper_rs1_dep_vld_aft_bsp;       
wire            oper_rs1_equal_to_dst;          
wire    [31:0]  oper_rs1_gpr_data;              
wire    [31:0]  oper_rs1_gpr_reg;               
wire    [31:0]  oper_rs1_reg;                   
wire    [31:0]  oper_rs1_reg_before_pol;        
wire    [31:0]  oper_rs1_reg_no_load;           
wire    [31:0]  oper_rs1_reg_no_load_before_pol; 
wire            oper_rs2_dep_vld;               
wire            oper_rs2_equal_to_dst;          
wire    [31:0]  oper_rs2_gpr_data;              
wire    [31:0]  oper_rs2_gpr_reg;               
wire    [31:0]  oper_rs2_reg;                   
wire    [31:0]  oper_rs2_reg_before_pol;        
wire    [31:0]  oper_rs2_reg_no_load;           
wire    [31:0]  oper_rs2_reg_no_load_before_pol; 
wire            oper_wb_rs1_equal_to_dst;       
wire            oper_wb_rs2_equal_to_dst;       
wire            pad_yy_gate_clk_en_b;           
wire            pad_yy_test_mode;               
wire    [20:0]  randclk_oper_gpr_mod_en_w32;    
wire    [31:0]  wb_data_no_load_aft_bsp_fwd;    
wire    [31:0]  wb_oper_fwd_data_no_load;       
wire            wb_oper_fwd_en;                 
wire    [31:0]  wb_oper_write_data;             
wire            wb_oper_write_en;               
wire    [4 :0]  wb_oper_write_idx;              
wire    [4 :0]  wb_oper_write_idx_for_dep;      
cr_iu_oper_gpr  x_cr_iu_oper_gpr (
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .hs_split_iu_nsinst_gpr_rst_b      (hs_split_iu_nsinst_gpr_rst_b     ),
  .inst_read_data0                   (oper_rs1_gpr_data[31:0]          ),
  .inst_read_data1                   (oper_rs2_gpr_data[31:0]          ),
  .inst_read_index0                  (ifu_iu_ex_rs1_reg[4:0]           ),
  .inst_read_index1                  (ifu_iu_ex_rs2_reg[4:0]           ),
  .inst_wen                          (wb_oper_write_en                 ),
  .inst_write_data                   (wb_oper_write_data[31:0]         ),
  .inst_write_index                  (wb_oper_write_idx[4:0]           ),
  .iu_yy_xx_reg_rst_b                (iu_yy_xx_reg_rst_b               ),
  .pad_yy_gate_clk_en_b              (pad_yy_gate_clk_en_b             ),
  .pad_yy_test_mode                  (pad_yy_test_mode                 ),
  .randclk_oper_gpr_mod_en_w32       (randclk_oper_gpr_mod_en_w32      )
);
assign oper_rs1_gpr_reg[31:0] = (had_idu_wbbr_vld && !ctrl_oper_lsu_data_sel) ? 
                                                      had_idu_wbbr_data[31:0]
                                                    : oper_rs1_gpr_data[31:0];
assign oper_rs2_gpr_reg[31:0] = had_idu_wbbr_vld ? had_idu_wbbr_data[31:0]
                                                 : oper_rs2_gpr_data[31:0];
assign oper_rs1_equal_to_dst = (ifu_iu_ex_rs1_reg[4:0] == wb_oper_write_idx_for_dep[4:0])
                              && ifu_iu_ex_rs1_reg[4:0] != 5'b0;
assign oper_rs2_equal_to_dst = (ifu_iu_ex_rs2_reg[4:0] == wb_oper_write_idx_for_dep[4:0]) 
                              && ifu_iu_ex_rs2_reg[4:0] != 5'b0;
assign oper_wb_rs1_equal_to_dst = oper_rs1_equal_to_dst;
assign oper_wb_rs2_equal_to_dst = oper_rs2_equal_to_dst;
assign oper_rs1_dep_vld = wb_oper_fwd_en && oper_rs1_equal_to_dst;
assign oper_rs2_dep_vld = wb_oper_fwd_en && oper_rs2_equal_to_dst;
assign oper_rs1_bsp_dep_vld = 1'b0;
assign wb_data_no_load_aft_bsp_fwd[31:0] = 
                                               wb_oper_fwd_data_no_load[31:0];
assign oper_rs1_reg_before_pol[31:0] = (oper_rs1_dep_vld && !had_idu_wbbr_vld)
                                        ? wb_oper_write_data[31:0]
                                        : oper_rs1_gpr_reg[31:0];
assign oper_rs2_reg_before_pol[31:0] = (oper_rs2_dep_vld)
                                        ? wb_oper_write_data[31:0]
                                        : oper_rs2_gpr_reg[31:0];
assign oper_rs1_dep_vld_aft_bsp = oper_rs1_dep_vld || oper_rs1_bsp_dep_vld;
assign oper_rs1_reg_no_load_before_pol[31:0] = 
                                        (oper_rs1_dep_vld_aft_bsp && !had_idu_wbbr_vld)
                                        ? wb_data_no_load_aft_bsp_fwd[31:0]
                                        : oper_rs1_gpr_reg[31:0];
assign oper_rs2_reg_no_load_before_pol[31:0] = 
                                        oper_rs2_dep_vld
                                        ? wb_oper_fwd_data_no_load[31:0]
                                        : oper_rs2_gpr_reg[31:0];
assign oper_rs1_reg[31:0] = oper_rs1_reg_before_pol[31:0];
assign oper_rs2_reg[31:0] = oper_rs2_reg_before_pol[31:0];
assign oper_rs1_reg_no_load[31:0] = oper_rs1_reg_no_load_before_pol[31:0];
assign oper_rs2_reg_no_load[31:0] = oper_rs2_reg_no_load_before_pol[31:0];
assign oper_imm_for_alu[31:0] = decd_oper_alu_imm[31:0];
assign oper_imm_for_lsu[31:0] = decd_oper_lsu_imm[31:0];
assign oper_imm_for_cp0[11:0] = decd_oper_cp0_imm[11:0];
assign oper_imm_for_branch[31:0] = decd_oper_branch_imm[31:0];
assign oper_alu_rs1_reg[31:0]     = oper_rs1_reg[31:0];
assign oper_alu_rs2_reg[31:0]     = oper_rs2_reg[31:0];
assign oper_alu_rs2_imm[31:0]     = oper_imm_for_alu[31:0];
assign oper_mad_rs1[31:0]         = oper_rs1_reg[31:0];
assign oper_mad_rs2[31:0]         = oper_rs2_reg[31:0];
assign oper_branch_rs1_reg[31:0]  = oper_rs1_reg_no_load[31:0];
assign oper_branch_rs2_reg[31:0]  = oper_rs2_reg_no_load[31:0];
assign oper_branch_rs2_imm[31:0]  = oper_imm_for_branch[31:0];
assign iu_lsu_offset[31:0]         = oper_imm_for_lsu[31:0];
assign iu_lsu_data[31:0]           = oper_rs2_reg_before_pol[31:0];
assign iu_lsu_base[31:0]           = oper_rs1_reg_no_load[31:0];
assign iu_lsu_rs2[31:0]            = oper_rs2_reg_no_load[31:0];
assign iu_cp0_rs1[31:0]           = oper_rs1_reg_no_load[31:0];
assign iu_cp0_imm[11:0]           = oper_imm_for_cp0[11:0];
endmodule
