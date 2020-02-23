/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_lsu_ctrl(
  bmu_lsu_acc_err,
  bmu_lsu_bstack_chk_fail,
  bmu_lsu_data_vld,
  bmu_lsu_grnt,
  bmu_lsu_trans_cmplt,
  cpurst_b,
  ctrl_dp_ldst_info_buf_reuse,
  ctrl_dp_ldst_req_grnt,
  ctrl_dp_store_buffer_updt,
  ctrl_top_req_en,
  dp_ctrl_misalign,
  iu_lsu_ex_data_sel,
  iu_lsu_ex_sel,
  iu_lsu_ex_store,
  iu_lsu_oper_mux_en,
  iu_lsu_stall_without_hready,
  iu_lsu_wb_ldst,
  iu_lsu_wb_load,
  iu_lsu_wb_store,
  iu_yy_xx_flush,
  lsu_bmu_addr_check_fail,
  lsu_bmu_idle,
  lsu_bmu_req,
  lsu_bmu_req_without_cmplt,
  lsu_bmu_sg_chk_fail,
  lsu_bmu_wfd1,
  lsu_had_addr_vld,
  lsu_had_ex_cmplt,
  lsu_inst_store,
  lsu_iu_data_vld,
  lsu_iu_expt_vec,
  lsu_iu_expt_vld,
  lsu_iu_fast_retire,
  lsu_iu_req,
  lsu_iu_stall,
  lsu_iu_stall_noinput,
  lsu_iu_wb_acc_err,
  lsu_iu_wb_bstack_chk_fail,
  lsu_iu_wb_cmplt,
  lsu_iu_wb_data_vld,
  lsu_iu_wfd,
  sm_clk,
  unalign_ctrl_not_last_beat,
  unalign_ctrl_stall,
  unalign_xx_split_on
);
input          bmu_lsu_acc_err;            
input          bmu_lsu_bstack_chk_fail;    
input          bmu_lsu_data_vld;           
input          bmu_lsu_grnt;               
input          bmu_lsu_trans_cmplt;        
input          cpurst_b;                   
input          dp_ctrl_misalign;           
input          iu_lsu_ex_data_sel;         
input          iu_lsu_ex_sel;              
input          iu_lsu_ex_store;            
input          iu_lsu_oper_mux_en;         
input          iu_lsu_stall_without_hready; 
input          iu_lsu_wb_ldst;             
input          iu_lsu_wb_load;             
input          iu_lsu_wb_store;            
input          iu_yy_xx_flush;             
input          sm_clk;                     
input          unalign_ctrl_not_last_beat; 
input          unalign_ctrl_stall;         
input          unalign_xx_split_on;        
output         ctrl_dp_ldst_info_buf_reuse; 
output         ctrl_dp_ldst_req_grnt;      
output         ctrl_dp_store_buffer_updt;  
output         ctrl_top_req_en;            
output         lsu_bmu_addr_check_fail;    
output         lsu_bmu_idle;               
output         lsu_bmu_req;                
output         lsu_bmu_req_without_cmplt;  
output         lsu_bmu_sg_chk_fail;        
output         lsu_bmu_wfd1;               
output         lsu_had_addr_vld;           
output         lsu_had_ex_cmplt;           
output         lsu_inst_store;             
output         lsu_iu_data_vld;            
output  [4:0]  lsu_iu_expt_vec;            
output         lsu_iu_expt_vld;            
output         lsu_iu_fast_retire;         
output         lsu_iu_req;                 
output         lsu_iu_stall;               
output         lsu_iu_stall_noinput;       
output         lsu_iu_wb_acc_err;          
output         lsu_iu_wb_bstack_chk_fail;  
output         lsu_iu_wb_cmplt;            
output         lsu_iu_wb_data_vld;         
output         lsu_iu_wfd;                 
reg            cur_state;                  
reg            next_state;                 
wire           bmu_lsu_acc_err;            
wire           bmu_lsu_bstack_chk_fail;    
wire           bmu_lsu_data_vld;           
wire           bmu_lsu_grnt;               
wire           bmu_lsu_trans_cmplt;        
wire           cpurst_b;                   
wire           ctrl_dp_ldst_info_buf_reuse; 
wire           ctrl_dp_ldst_req_grnt;      
wire           ctrl_dp_store_buffer_updt;  
wire           ctrl_top_req_en;            
wire           dp_ctrl_misalign;           
wire           fast_retire_grnt;           
wire           idle_retire;                
wire           iu_lsu_ex_data_sel;         
wire           iu_lsu_ex_sel;              
wire           iu_lsu_ex_store;            
wire           iu_lsu_oper_mux_en;         
wire           iu_lsu_stall_without_hready; 
wire           iu_lsu_wb_ldst;             
wire           iu_lsu_wb_load;             
wire           iu_lsu_wb_store;            
wire           iu_yy_xx_flush;             
wire           lsu_addr_chk_fail;          
wire           lsu_bmu_addr_check_fail;    
wire           lsu_bmu_idle;               
wire           lsu_bmu_req;                
wire           lsu_bmu_req_without_cmplt;  
wire           lsu_bmu_sg_chk_fail;        
wire           lsu_bmu_wfd1;               
wire           lsu_dbus_req;               
wire           lsu_fast_retire;            
wire           lsu_had_addr_vld;           
wire           lsu_had_ex_cmplt;           
wire           lsu_inst_store;             
wire           lsu_iu_data_vld;            
wire    [4:0]  lsu_iu_expt_vec;            
wire           lsu_iu_expt_vld;            
wire           lsu_iu_fast_retire;         
wire           lsu_iu_req;                 
wire           lsu_iu_req_wait_data;       
wire           lsu_iu_stall;               
wire           lsu_iu_stall_noinput;       
wire           lsu_iu_wb_acc_err;          
wire           lsu_iu_wb_bstack_chk_fail;  
wire           lsu_iu_wb_cmplt;            
wire           lsu_iu_wb_data_vld;         
wire           lsu_iu_wfd;                 
wire           lsu_sel_without_cmplt;      
wire           lsu_sel_without_hready;     
wire           lsu_trans_cmplt;            
wire           lsu_wb_acc_err;             
wire           sm_clk;                     
wire           unalign_ctrl_not_last_beat; 
wire           unalign_ctrl_stall;         
wire           unalign_xx_split_on;        
parameter IDLE       = 1'b0;
parameter WAIT_DATA  = 1'b1;
assign ctrl_top_req_en = (cur_state == IDLE) && (next_state == WAIT_DATA)
                      || (cur_state != IDLE);
parameter MISL_VEC=5'b00100, MISS_VEC=5'b00110,
          ACCL_VEC=5'b00101, ACCS_VEC=5'b00111;
assign lsu_addr_chk_fail = 1'b0;
assign lsu_sel_without_hready = iu_lsu_ex_data_sel && !dp_ctrl_misalign
                                && !iu_lsu_stall_without_hready;
assign lsu_bmu_addr_check_fail = lsu_addr_chk_fail;
assign lsu_sel_without_cmplt = iu_lsu_ex_data_sel && !dp_ctrl_misalign;
assign lsu_inst_store = iu_lsu_oper_mux_en && iu_lsu_ex_store;
assign lsu_fast_retire = !unalign_xx_split_on;
assign fast_retire_grnt = lsu_fast_retire && bmu_lsu_grnt;
always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state <= IDLE;
  else if(iu_yy_xx_flush)
    cur_state <= IDLE;
  else
    cur_state <= next_state;
end
always @( cur_state
       or bmu_lsu_grnt
       or lsu_sel_without_hready
       or iu_lsu_ex_sel
       or lsu_fast_retire
       or iu_lsu_wb_ldst
       or lsu_trans_cmplt)
begin
  case(cur_state)
  IDLE       : if(lsu_sel_without_hready)
                 begin
                   if(bmu_lsu_grnt)
                     begin
                       if(!iu_lsu_ex_sel || !lsu_fast_retire)
                         next_state = WAIT_DATA;
                       else
                         next_state = IDLE;
                     end
                   else
                     next_state = IDLE;
                 end
               else
                 next_state = IDLE;
  WAIT_DATA  : if(lsu_trans_cmplt)
                 begin
                   if(!iu_lsu_wb_ldst || lsu_fast_retire)
                     next_state = IDLE;
                   else
                     next_state = WAIT_DATA;
                 end
               else
                 next_state = WAIT_DATA;
  default    :   next_state = IDLE;
  endcase
end
assign lsu_trans_cmplt      = bmu_lsu_trans_cmplt;
assign lsu_dbus_req     = (cur_state == IDLE) && lsu_sel_without_hready;
assign lsu_bmu_req = lsu_dbus_req;
assign lsu_bmu_req_without_cmplt = (cur_state == IDLE) && lsu_sel_without_cmplt;
assign lsu_bmu_idle = !iu_lsu_wb_ldst || (cur_state == IDLE) && lsu_trans_cmplt;
assign lsu_bmu_wfd1 = iu_lsu_wb_ldst ^ (cur_state == WAIT_DATA);
assign idle_retire          = fast_retire_grnt || dp_ctrl_misalign;
assign lsu_iu_req           =    (cur_state == IDLE)
                                   && iu_lsu_ex_sel && idle_retire
                              || lsu_iu_req_wait_data;
assign lsu_wb_acc_err = iu_lsu_wb_ldst && bmu_lsu_acc_err; 
assign lsu_iu_req_wait_data  =   (cur_state == WAIT_DATA)
                                   && lsu_trans_cmplt 
                                   && !lsu_wb_acc_err
                                   && (lsu_fast_retire 
                                       || !iu_lsu_wb_ldst
                                          && (!unalign_ctrl_not_last_beat
                                              || bmu_lsu_acc_err
                                              || bmu_lsu_bstack_chk_fail)
                                      );
assign lsu_iu_fast_retire   =   (cur_state == IDLE)
                                   && iu_lsu_ex_sel
                                   && fast_retire_grnt
                                   && !dp_ctrl_misalign
                             || (cur_state == WAIT_DATA)
                                   && lsu_trans_cmplt
                                   && !lsu_wb_acc_err
                                   && lsu_fast_retire;
assign ctrl_dp_store_buffer_updt   = lsu_dbus_req
                                     && lsu_inst_store 
                                     && bmu_lsu_grnt;
assign ctrl_dp_ldst_info_buf_reuse = lsu_dbus_req
                                       && bmu_lsu_grnt
                                       && lsu_bmu_idle
                                  || (cur_state == WAIT_DATA)
                                       && iu_lsu_wb_ldst
                                       && lsu_trans_cmplt
                                       && !bmu_lsu_acc_err;
assign ctrl_dp_ldst_req_grnt = 1'b0;
assign lsu_iu_stall         = (cur_state == IDLE)
                                 && iu_lsu_ex_sel && !idle_retire
                           || (cur_state == WAIT_DATA)
                                 && (!lsu_trans_cmplt
                                     || iu_lsu_wb_ldst && !lsu_fast_retire)
                           || unalign_ctrl_stall;
assign lsu_iu_stall_noinput = (cur_state == IDLE)
                                 && iu_lsu_ex_data_sel
                           || unalign_ctrl_stall;
assign lsu_iu_data_vld      = (cur_state == WAIT_DATA) 
                              && bmu_lsu_data_vld
                              && !iu_lsu_wb_ldst
                              && !lsu_fast_retire;
assign lsu_iu_expt_vld      = (cur_state == WAIT_DATA)
                              && bmu_lsu_acc_err
                              && !iu_lsu_wb_ldst
                              && !lsu_fast_retire
                           || dp_ctrl_misalign;
assign lsu_iu_expt_vec[4:0] = {5{dp_ctrl_misalign && !lsu_inst_store}} & MISL_VEC 
                            | {5{dp_ctrl_misalign &&  lsu_inst_store}} & MISS_VEC
                            | {5{cur_state && iu_lsu_wb_load}}         & ACCL_VEC 
                            | {5{cur_state && iu_lsu_wb_store}}        & ACCS_VEC;
assign lsu_iu_wfd = (cur_state == WAIT_DATA);
assign lsu_had_addr_vld   = lsu_dbus_req && bmu_lsu_grnt;
assign lsu_had_ex_cmplt   = lsu_iu_req;
assign lsu_iu_wb_cmplt    = bmu_lsu_trans_cmplt;
assign lsu_iu_wb_data_vld = bmu_lsu_data_vld;
assign lsu_iu_wb_acc_err  = bmu_lsu_acc_err;
assign lsu_iu_wb_bstack_chk_fail = bmu_lsu_bstack_chk_fail;
assign lsu_bmu_sg_chk_fail  = 1'b0;
endmodule
