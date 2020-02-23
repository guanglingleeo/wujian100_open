/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_pcgen(
  branch_pcgen_add_pc,
  branch_pcgen_br_chgflw_vld,
  branch_pcgen_br_chgflw_vld_for_data,
  branch_pcgen_br_pc_chgflw_vld,
  branch_pcgen_branch_chgflw_vld_for_data,
  branch_pcgen_jmp_chgflw_vld_for_data,
  branch_pcgen_reg_pc,
  cp0_iu_epc_for_chgflw,
  cp0_iu_flush_chgflw_vld,
  cp0_iu_rte_chgflw_vld,
  cp0_iu_rte_chgflw_vld_for_data,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_iu_pc,
  had_iu_rte_pc_sel,
  had_yy_xx_exit_dbg,
  hs_split_iu_unstack_chgflw,
  ifu_iu_ibus_idle,
  ifu_iu_spcu_retire_mask,
  ifu_iu_xx_ibus_data,
  iu_ifu_addr,
  iu_ifu_data_fetch,
  iu_ifu_data_fetch_for_data,
  iu_ifu_inst_fetch,
  iu_ifu_inst_fetch_for_data,
  iu_ifu_inst_fetch_without_dbg_disable,
  iu_yy_xx_flush,
  iu_yy_xx_retire,
  misc_clk,
  nie_flush_chgflw,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pcgen_ctrl_stall,
  pcgen_retire_updt_pc,
  pcgen_top_abort_clk_en,
  pcgen_vector_expt_taken,
  pcgen_xx_cur_pc,
  pcgen_xx_ibus_idle,
  randclk_pcgen_mod_en_w32,
  retire_branch_stall,
  retire_pcgen_curpc_update,
  retire_xx_normal_retire,
  special_pcgen_chgflw_vld,
  vector_pcgen_buf_vbr,
  vector_pcgen_chgflw_vld,
  vector_pcgen_cur_pc_vld,
  vector_pcgen_enter_addr,
  vector_pcgen_ibus_req,
  wb_pcgen_ldst_stall,
  wb_pcgen_pc_updt_val,
  wb_pcgen_switch_ld_pc,
  wb_retire_fast_retire_load_pc
);
input   [30:0]  branch_pcgen_add_pc;                    
input           branch_pcgen_br_chgflw_vld;             
input           branch_pcgen_br_chgflw_vld_for_data;    
input           branch_pcgen_br_pc_chgflw_vld;          
input           branch_pcgen_branch_chgflw_vld_for_data; 
input           branch_pcgen_jmp_chgflw_vld_for_data;   
input   [30:0]  branch_pcgen_reg_pc;                    
input   [30:0]  cp0_iu_epc_for_chgflw;                  
input           cp0_iu_flush_chgflw_vld;                
input           cp0_iu_rte_chgflw_vld;                  
input           cp0_iu_rte_chgflw_vld_for_data;         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           forever_cpuclk;                         
input   [30:0]  had_iu_pc;                              
input           had_iu_rte_pc_sel;                      
input           had_yy_xx_exit_dbg;                     
input           hs_split_iu_unstack_chgflw;             
input           ifu_iu_ibus_idle;                       
input           ifu_iu_spcu_retire_mask;                
input   [31:0]  ifu_iu_xx_ibus_data;                    
input           iu_yy_xx_flush;                         
input           iu_yy_xx_retire;                        
input           misc_clk;                               
input           nie_flush_chgflw;                       
input           pad_yy_gate_clk_en_b;                   
input           pad_yy_test_mode;                       
input           randclk_pcgen_mod_en_w32;               
input           retire_branch_stall;                    
input           retire_pcgen_curpc_update;              
input           retire_xx_normal_retire;                
input           special_pcgen_chgflw_vld;               
input           vector_pcgen_buf_vbr;                   
input           vector_pcgen_chgflw_vld;                
input           vector_pcgen_cur_pc_vld;                
input   [30:0]  vector_pcgen_enter_addr;                
input           vector_pcgen_ibus_req;                  
input           wb_pcgen_ldst_stall;                    
input   [30:0]  wb_pcgen_pc_updt_val;                   
input           wb_pcgen_switch_ld_pc;                  
input   [30:0]  wb_retire_fast_retire_load_pc;          
output  [30:0]  iu_ifu_addr;                            
output          iu_ifu_data_fetch;                      
output          iu_ifu_data_fetch_for_data;             
output          iu_ifu_inst_fetch;                      
output          iu_ifu_inst_fetch_for_data;             
output          iu_ifu_inst_fetch_without_dbg_disable;  
output          pcgen_ctrl_stall;                       
output  [30:0]  pcgen_retire_updt_pc;                   
output          pcgen_top_abort_clk_en;                 
output          pcgen_vector_expt_taken;                
output  [30:0]  pcgen_xx_cur_pc;                        
output          pcgen_xx_ibus_idle;                     
reg             cur_state;                              
reg             fetch_cur_state;                        
reg             fetch_next_state;                       
reg             next_state;                             
reg     [30:0]  pcgen_cur_pc;                           
wire    [30:0]  bctm_pcgen_chgflw_pc;                   
wire            bctm_pcgen_chk_chgflw_vld;              
wire            bctm_pcgen_chk_fail_pc_vld;             
wire            bctm_pcgen_jmp_chgflw_vld;              
wire            bctm_pcgen_jmp_chgflw_vld_for_data;     
wire    [30:0]  branch_pcgen_add_pc;                    
wire            branch_pcgen_br_chgflw_vld;             
wire            branch_pcgen_br_chgflw_vld_for_data;    
wire            branch_pcgen_br_pc_chgflw_vld;          
wire            branch_pcgen_branch_chgflw_vld_for_data; 
wire            branch_pcgen_jmp_chgflw_vld_for_data;   
wire    [30:0]  branch_pcgen_reg_pc;                    
wire    [30:0]  cp0_iu_epc_for_chgflw;                  
wire            cp0_iu_flush_chgflw_vld;                
wire            cp0_iu_rte_chgflw_vld;                  
wire            cp0_iu_rte_chgflw_vld_for_data;         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            curpc_10_0_clk;                         
wire            curpc_10_0_clk_en;                      
wire            curpc_30_11_clk;                        
wire            curpc_30_11_clk_en;                     
wire            curpc_sel_from_wb;                      
wire            curpc_sel_not_hs;                       
wire            forever_cpuclk;                         
wire    [30:0]  had_iu_pc;                              
wire            had_iu_rte_pc_sel;                      
wire            had_yy_xx_exit_dbg;                     
wire            hs_split_iu_unstack_chgflw;             
wire            ifu_iu_ibus_idle;                       
wire            ifu_iu_spcu_retire_mask;                
wire    [31:0]  ifu_iu_xx_ibus_data;                    
wire            inst_fetch_mask;                        
wire    [30:0]  iu_ifu_addr;                            
wire            iu_ifu_data_fetch;                      
wire            iu_ifu_data_fetch_for_data;             
wire            iu_ifu_inst_fetch;                      
wire            iu_ifu_inst_fetch_for_data;             
wire            iu_ifu_inst_fetch_without_dbg_disable;  
wire            iu_yy_xx_flush;                         
wire            iu_yy_xx_retire;                        
wire            misc_clk;                               
wire            nie_flush_chgflw;                       
wire            pad_yy_gate_clk_en_b;                   
wire            pad_yy_test_mode;                       
wire            pcgen_abort_chgflw_vld;                 
wire            pcgen_abort_chgflw_vld_for_data;        
wire    [30:0]  pcgen_addr_after_bctm;                  
wire    [30:0]  pcgen_addr_chgflw_asap;                 
wire    [30:0]  pcgen_addr_chgflw_delay;                
wire    [30:0]  pcgen_addr_except_chgflw_delay;         
wire            pcgen_address_add;                      
wire            pcgen_address_cur;                      
wire            pcgen_address_epc;                      
wire            pcgen_address_had;                      
wire            pcgen_address_ibus;                     
wire            pcgen_address_inc;                      
wire            pcgen_address_reg;                      
wire            pcgen_address_svbr;                     
wire            pcgen_address_vec;                      
wire            pcgen_chfglw_asap_vld_for_data;         
wire            pcgen_chgflw_asap_vld;                  
wire            pcgen_chgflw_delay_sel;                 
wire            pcgen_ctrl_stall;                       
wire    [30:0]  pcgen_cur_pc_next_val;                  
wire    [30:0]  pcgen_cur_pc_next_val_before_hs;        
wire            pcgen_cur_pc_updt_vld;                  
wire            pcgen_cur_pc_updt_vld_by_inst;          
wire            pcgen_cur_pc_updt_vld_chgflw;           
wire            pcgen_cur_pc_updt_vld_normal;           
wire            pcgen_cur_pc_updt_vld_not_by_inst;      
wire            pcgen_fetch_mask_trig;                  
wire            pcgen_idle_chgflw_vld;                  
wire            pcgen_idle_chgflw_vld_for_data;         
wire    [30:0]  pcgen_increase_pc;                      
wire            pcgen_inst_fetch;                       
wire    [30:0]  pcgen_retire_updt_pc;                   
wire            pcgen_top_abort_clk_en;                 
wire            pcgen_vector_expt_taken;                
wire            pcgen_wait_idle_trig;                   
wire    [30:0]  pcgen_xx_cur_pc;                        
wire            pcgen_xx_ibus_idle;                     
wire            randclk_pcgen_mod_en_w32;               
wire            retire_branch_stall;                    
wire            retire_pcgen_curpc_update;              
wire            retire_xx_normal_retire;                
wire            special_pcgen_chgflw_vld;               
wire            vector_pcgen_buf_vbr;                   
wire            vector_pcgen_chgflw_vld;                
wire            vector_pcgen_cur_pc_vld;                
wire    [30:0]  vector_pcgen_enter_addr;                
wire            vector_pcgen_ibus_req;                  
wire            wb_pcgen_ldst_stall;                    
wire    [30:0]  wb_pcgen_pc_updt_val;                   
wire            wb_pcgen_switch_ld_pc;                  
wire    [30:0]  wb_retire_fast_retire_load_pc;          
parameter IDLE       = 1'b0;
parameter WAIT_IDLE  = 1'b1;
parameter FETCH_IDLE = 1'b0;
parameter FETCH_MASK = 1'b1;
parameter EMMU_IDLE       = 1'b0;
parameter EMMU_WAIT_IDLE  = 1'b1;
assign pcgen_top_abort_clk_en = pcgen_wait_idle_trig
                             || pcgen_fetch_mask_trig
                             || (cur_state != IDLE)
                             || (fetch_cur_state != FETCH_IDLE);
assign curpc_10_0_clk_en = pcgen_cur_pc_updt_vld;
gated_clk_cell  x_curpc_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (curpc_10_0_clk          ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (curpc_10_0_clk_en       ),
  .module_en                (randclk_pcgen_mod_en_w32),
  .pad_yy_gate_clk_en_b     (pad_yy_gate_clk_en_b    ),
  .pad_yy_test_mode         (pad_yy_test_mode        )
);
assign curpc_30_11_clk_en = pcgen_cur_pc_updt_vld_chgflw
                         || pcgen_cur_pc_updt_vld_normal
                            && (pcgen_cur_pc[11] ^ pcgen_cur_pc_next_val[11]);
gated_clk_cell  x_curpc_30_11_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (curpc_30_11_clk         ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (curpc_30_11_clk_en      ),
  .module_en                (randclk_pcgen_mod_en_w32),
  .pad_yy_gate_clk_en_b     (pad_yy_gate_clk_en_b    ),
  .pad_yy_test_mode         (pad_yy_test_mode        )
);
assign bctm_pcgen_jmp_chgflw_vld          = 1'b0;
assign bctm_pcgen_jmp_chgflw_vld_for_data = 1'b0;
assign bctm_pcgen_chgflw_pc[30:0] = 31'b0;
assign bctm_pcgen_chk_fail_pc_vld = 1'b0;
assign bctm_pcgen_chk_chgflw_vld = 1'b0;
assign pcgen_inst_fetch = branch_pcgen_br_chgflw_vld
                       || cp0_iu_rte_chgflw_vld
                       || cp0_iu_flush_chgflw_vld 
                       || had_yy_xx_exit_dbg
                       || vector_pcgen_chgflw_vld 
                       || special_pcgen_chgflw_vld 
                       || bctm_pcgen_jmp_chgflw_vld
                       || bctm_pcgen_chk_chgflw_vld
                       || hs_split_iu_unstack_chgflw 
                       || nie_flush_chgflw;
always @(posedge misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state <= IDLE;
  else
    cur_state <= next_state;
end
assign pcgen_chgflw_asap_vld          = branch_pcgen_br_chgflw_vld;
assign pcgen_chfglw_asap_vld_for_data = branch_pcgen_br_chgflw_vld_for_data; 
assign pcgen_wait_idle_trig = pcgen_inst_fetch && !pcgen_chgflw_asap_vld;
always @( cur_state
       or pcgen_wait_idle_trig
       or ifu_iu_ibus_idle)
begin
  case(cur_state)
  IDLE      : if(pcgen_wait_idle_trig)
                next_state = WAIT_IDLE;
              else
                next_state = IDLE;
  WAIT_IDLE : if(ifu_iu_ibus_idle)
                next_state = IDLE;
              else
                next_state = WAIT_IDLE;
  default   :   next_state = IDLE;
  endcase
end
always @(posedge misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    fetch_cur_state <= FETCH_IDLE;
  else if(iu_yy_xx_flush)
    fetch_cur_state <= FETCH_IDLE;
  else
    fetch_cur_state <= fetch_next_state;
end
assign pcgen_fetch_mask_trig = pcgen_chgflw_asap_vld && !iu_yy_xx_retire;
always @( pcgen_fetch_mask_trig
       or iu_yy_xx_retire
       or fetch_cur_state)
begin
  case(fetch_cur_state)
  FETCH_IDLE : if(pcgen_fetch_mask_trig)
                 fetch_next_state = FETCH_MASK;
               else
                 fetch_next_state = FETCH_IDLE;
  FETCH_MASK : if(iu_yy_xx_retire)
                 fetch_next_state = FETCH_IDLE;
               else
                 fetch_next_state = FETCH_MASK;
  default    :   fetch_next_state = FETCH_IDLE;
  endcase
end
assign inst_fetch_mask = (fetch_cur_state == FETCH_MASK);
assign pcgen_xx_ibus_idle = ifu_iu_ibus_idle || inst_fetch_mask;
assign pcgen_idle_chgflw_vld  = pcgen_chgflw_asap_vld 
                                && !inst_fetch_mask;
assign pcgen_abort_chgflw_vld = (cur_state == WAIT_IDLE)
                                && ifu_iu_ibus_idle;
assign iu_ifu_inst_fetch  = pcgen_abort_chgflw_vld || pcgen_idle_chgflw_vld;
assign pcgen_idle_chgflw_vld_for_data  = pcgen_chfglw_asap_vld_for_data
                                         && !inst_fetch_mask;
assign pcgen_abort_chgflw_vld_for_data = (cur_state == WAIT_IDLE)
                                         && ifu_iu_ibus_idle; 
assign iu_ifu_inst_fetch_for_data = pcgen_abort_chgflw_vld_for_data ||
                                    pcgen_idle_chgflw_vld_for_data;
assign iu_ifu_inst_fetch_without_dbg_disable = iu_ifu_inst_fetch && !retire_branch_stall
                                               && !wb_pcgen_ldst_stall;
assign iu_ifu_data_fetch = vector_pcgen_ibus_req;
assign iu_ifu_data_fetch_for_data = vector_pcgen_ibus_req;
assign pcgen_ctrl_stall   = (cur_state == WAIT_IDLE)
                         && !ifu_iu_spcu_retire_mask;
assign pcgen_address_had  = had_yy_xx_exit_dbg
                         || cp0_iu_rte_chgflw_vld_for_data && had_iu_rte_pc_sel;
assign pcgen_address_vec  = vector_pcgen_buf_vbr;
assign pcgen_address_ibus = vector_pcgen_cur_pc_vld;
assign pcgen_address_epc  = cp0_iu_rte_chgflw_vld_for_data && !had_iu_rte_pc_sel
                            && !pcgen_address_svbr;
assign pcgen_address_add  = branch_pcgen_branch_chgflw_vld_for_data
                            && !pcgen_address_svbr;
assign pcgen_address_reg  = branch_pcgen_jmp_chgflw_vld_for_data
                            && !pcgen_address_svbr;
assign pcgen_address_svbr = bctm_pcgen_jmp_chgflw_vld_for_data
                         || bctm_pcgen_chk_fail_pc_vld;
assign pcgen_address_inc  = !(pcgen_address_add
                             || pcgen_address_reg
                             || pcgen_address_svbr
                             || pcgen_address_cur);
assign pcgen_address_cur  = (cur_state == WAIT_IDLE) || vector_pcgen_ibus_req;
assign pcgen_addr_chgflw_delay[30:0] = 
             {31{pcgen_address_had}}  & had_iu_pc[30:0]
           | {31{pcgen_address_vec}}  & vector_pcgen_enter_addr[30:0]
           | {31{pcgen_address_ibus}} & ifu_iu_xx_ibus_data[31:1]
           | {31{pcgen_address_epc}}  & cp0_iu_epc_for_chgflw[30:0];
assign pcgen_addr_chgflw_asap[30:0] =
             {31{pcgen_address_add}}  & branch_pcgen_add_pc[30:0]
           | {31{pcgen_address_reg}}  & branch_pcgen_reg_pc[30:0]
           | {31{pcgen_address_inc}}  & pcgen_increase_pc[30:0]
           | {31{pcgen_address_cur}}  & pcgen_cur_pc[30:0];
assign pcgen_addr_after_bctm[30:0] = 
             {31{pcgen_address_svbr}}  & bctm_pcgen_chgflw_pc[30:0]
           | {31{!pcgen_address_svbr}} & pcgen_addr_chgflw_asap[30:0];
assign pcgen_addr_except_chgflw_delay[30:0] = pcgen_cur_pc_updt_vld
                                      ? pcgen_addr_after_bctm[30:0]
                                      : pcgen_cur_pc[30:0];
assign pcgen_retire_updt_pc[30:0] = pcgen_addr_except_chgflw_delay[30:0]; 
assign pcgen_chgflw_delay_sel = pcgen_cur_pc_updt_vld
                             && (pcgen_address_had
                                 || pcgen_address_vec
                                 || pcgen_address_ibus
                                 || pcgen_address_epc);
assign pcgen_cur_pc_next_val_before_hs[30:0] = pcgen_chgflw_delay_sel
                                      ? pcgen_addr_chgflw_delay[30:0]
                                      : pcgen_addr_except_chgflw_delay[30:0];
assign curpc_sel_from_wb = retire_pcgen_curpc_update
                        && !bctm_pcgen_chk_fail_pc_vld;
assign curpc_sel_not_hs = !curpc_sel_from_wb
                       && !wb_pcgen_switch_ld_pc;
assign pcgen_cur_pc_next_val[30:0] = 
        {31{curpc_sel_from_wb}}     & wb_retire_fast_retire_load_pc[30:0]
      | {31{wb_pcgen_switch_ld_pc}} & wb_pcgen_pc_updt_val[30:0]
      | {31{curpc_sel_not_hs}}      & pcgen_cur_pc_next_val_before_hs[30:0];
assign iu_ifu_addr[30:0] = pcgen_addr_chgflw_asap[30:0]; 
assign pcgen_cur_pc_updt_vld_not_by_inst = had_yy_xx_exit_dbg
                                        || vector_pcgen_cur_pc_vld
                                        || vector_pcgen_buf_vbr
                                        || bctm_pcgen_chk_fail_pc_vld
                                        || retire_pcgen_curpc_update
                                        || wb_pcgen_switch_ld_pc;
assign pcgen_cur_pc_updt_vld_by_inst = branch_pcgen_br_pc_chgflw_vld
                                    || cp0_iu_rte_chgflw_vld
                                    || bctm_pcgen_jmp_chgflw_vld;
assign pcgen_cur_pc_updt_vld_normal = retire_xx_normal_retire;
assign pcgen_cur_pc_updt_vld_chgflw = pcgen_cur_pc_updt_vld_not_by_inst 
                                   || pcgen_cur_pc_updt_vld_by_inst;
assign pcgen_cur_pc_updt_vld = pcgen_cur_pc_updt_vld_not_by_inst
                            || pcgen_cur_pc_updt_vld_normal;
always @(posedge curpc_10_0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pcgen_cur_pc[10:0] <= 11'b0;
  else
    pcgen_cur_pc[10:0] <= pcgen_cur_pc_next_val[10:0];
end
always @(posedge curpc_30_11_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pcgen_cur_pc[30:11] <= 20'b0;
  else
    pcgen_cur_pc[30:11] <= pcgen_cur_pc_next_val[30:11];
end
assign pcgen_xx_cur_pc[30:0] = pcgen_cur_pc[30:0];
assign pcgen_increase_pc[30:0] = branch_pcgen_add_pc[30:0];
assign pcgen_vector_expt_taken = (cur_state==IDLE);
endmodule
