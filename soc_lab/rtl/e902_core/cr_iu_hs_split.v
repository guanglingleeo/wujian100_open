/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_hs_split(
  hs_split_iu_ctrl_inst_vld,
  hs_split_iu_dp_inst_op,
  hs_split_iu_hs_retire_mask,
  hs_split_iu_hs_switch_se,
  hs_split_iu_nsinst_gpr_rst_b,
  hs_split_iu_unstack_chgflw,
  iu_hs_split_ex_stall,
  iu_ifu_spcu_int_en,
  split_ifctrl_hs_stall,
  split_ifctrl_hs_stall_part
);
input           iu_hs_split_ex_stall;        
input           iu_ifu_spcu_int_en;          
output          hs_split_iu_ctrl_inst_vld;   
output  [31:0]  hs_split_iu_dp_inst_op;      
output          hs_split_iu_hs_retire_mask;  
output          hs_split_iu_hs_switch_se;    
output          hs_split_iu_nsinst_gpr_rst_b; 
output          hs_split_iu_unstack_chgflw;  
output          split_ifctrl_hs_stall;       
output          split_ifctrl_hs_stall_part;  
wire            hs_split_iu_ctrl_inst_vld;   
wire    [31:0]  hs_split_iu_dp_inst_op;      
wire            hs_split_iu_hs_retire_mask;  
wire            hs_split_iu_hs_switch_se;    
wire            hs_split_iu_nsinst_gpr_rst_b; 
wire            hs_split_iu_unstack_chgflw;  
wire            split_ifctrl_hs_stall;       
wire            split_ifctrl_hs_stall_part;  
assign hs_split_iu_nsinst_gpr_rst_b = 1'b1; 
assign hs_split_iu_hs_retire_mask   = 1'b0; 
assign hs_split_iu_unstack_chgflw   = 1'b0;
assign hs_split_iu_hs_switch_se     = 1'b0;
assign split_ifctrl_hs_stall_part   = 1'b0;
assign split_ifctrl_hs_stall        = 1'b0;
assign hs_split_iu_ctrl_inst_vld    = 1'b0;
assign hs_split_iu_dp_inst_op[31:0] = 32'b0;
endmodule
