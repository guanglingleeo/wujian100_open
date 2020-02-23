/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ifu_ibusif(
  bmu_xx_ibus_acc_err,
  bmu_xx_ibus_data,
  bmu_xx_ibus_grnt,
  bmu_xx_ibus_trans_cmplt,
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_yy_clk_en,
  cp0_yy_machine_mode_aft_dbg,
  cpurst_b,
  cru_ifu_acc_ca,
  forever_cpuclk,
  ibuf_ibusif_inst_fetch,
  ibusif_ibuf_no_trans,
  ibusif_ifctrl_inst_mad32_high,
  ibusif_ifctrl_inst_no_bypass,
  ibusif_top_clk_en,
  ibusif_xx_16bit_inst,
  ibusif_xx_acc_err,
  ibusif_xx_data,
  ibusif_xx_ibus_idle,
  ibusif_xx_trans_cmplt,
  ibusif_xx_unalign_fetch,
  ifu_bmu_addr,
  ifu_bmu_idle,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_wfd1,
  ifu_cp0_lpmd_ack,
  ifu_iu_ibus_idle,
  ifu_iu_vector_ibus_in_idle,
  ifu_iu_xx_ibus_data,
  ifu_misc_clk,
  iu_ifu_addr,
  iu_ifu_data_fetch,
  iu_ifu_data_fetch_for_data,
  iu_ifu_inst_fetch,
  iu_ifu_inst_fetch_for_data,
  iu_ifu_inst_fetch_mask,
  iu_ifu_security_violation,
  iu_yy_xx_dbgon,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  pmp_ifu_acc_scu
);
input           bmu_xx_ibus_acc_err;          
input   [31:0]  bmu_xx_ibus_data;             
input           bmu_xx_ibus_grnt;             
input           bmu_xx_ibus_trans_cmplt;      
input           cp0_ifu_in_lpmd;              
input           cp0_ifu_lpmd_req;             
input           cp0_yy_clk_en;                
input           cp0_yy_machine_mode_aft_dbg;  
input           cpurst_b;                     
input           cru_ifu_acc_ca;               
input           forever_cpuclk;               
input           ibuf_ibusif_inst_fetch;       
input           ifu_misc_clk;                 
input   [30:0]  iu_ifu_addr;                  
input           iu_ifu_data_fetch;            
input           iu_ifu_data_fetch_for_data;   
input           iu_ifu_inst_fetch;            
input           iu_ifu_inst_fetch_for_data;   
input           iu_ifu_inst_fetch_mask;       
input           iu_ifu_security_violation;    
input           iu_yy_xx_dbgon;               
input           pad_yy_gate_clk_en_b;         
input           pad_yy_test_mode;             
input           pmp_ifu_acc_scu;              
output          ibusif_ibuf_no_trans;         
output          ibusif_ifctrl_inst_mad32_high; 
output          ibusif_ifctrl_inst_no_bypass; 
output          ibusif_top_clk_en;            
output          ibusif_xx_16bit_inst;         
output          ibusif_xx_acc_err;            
output  [31:0]  ibusif_xx_data;               
output          ibusif_xx_ibus_idle;          
output          ibusif_xx_trans_cmplt;        
output          ibusif_xx_unalign_fetch;      
output  [31:0]  ifu_bmu_addr;                 
output          ifu_bmu_idle;                 
output  [3 :0]  ifu_bmu_prot;                 
output          ifu_bmu_req;                  
output          ifu_bmu_wfd1;                 
output          ifu_cp0_lpmd_ack;             
output          ifu_iu_ibus_idle;             
output          ifu_iu_vector_ibus_in_idle;   
output  [31:0]  ifu_iu_xx_ibus_data;          
reg             abort_cur_st;                 
reg             abort_nxt_st;                 
reg     [29:0]  addr_cnt;                     
reg     [2 :0]  cur_st;                       
reg     [3 :0]  ibus_prot_reg;                
reg     [2 :0]  nxt_st;                       
reg             unalign_fetch_reg;            
wire            addr_cnt_high_upd_clk;        
wire            addr_cnt_high_upd_en;         
wire            addr_cnt_high_upd_en_local;   
wire            addr_cnt_low_upd_clk;         
wire            addr_cnt_low_upd_en;          
wire            addr_cnt_upd_en;              
wire            bmu_xx_ibus_acc_err;          
wire    [31:0]  bmu_xx_ibus_data;             
wire    [31:0]  bmu_xx_ibus_data_aft_pol;     
wire            bmu_xx_ibus_grnt;             
wire            bmu_xx_ibus_trans_cmplt;      
wire            change_flow_vld;              
wire            cp0_ifu_in_lpmd;              
wire            cp0_ifu_lpmd_req;             
wire            cp0_yy_clk_en;                
wire            cp0_yy_machine_mode_aft_dbg;  
wire            cpurst_b;                     
wire            cru_ifu_acc_ca;               
wire            flop_out_bus;                 
wire            forever_cpuclk;               
wire            ibuf_ibusif_inst_fetch;       
wire            ibus_abort_trig;              
wire            ibus_acc_err;                 
wire    [30:0]  ibus_addr;                    
wire            ibus_busy;                    
wire    [31:0]  ibus_data;                    
wire            ibus_inst_fetch_cmplt;        
wire            ibus_inst_mad;                
wire            ibus_inst_mad32_high;         
wire            ibus_inst_no_bypass;          
wire            ibus_inst_req;                
wire            ibus_no_outstanding;          
wire    [30:0]  ibus_nonseq_addr;             
wire    [3 :0]  ibus_prot;                    
wire            ibus_prot_buf;                
wire            ibus_prot_buf_sel;            
wire            ibus_req;                     
wire    [30:0]  ibus_seq_addr;                
wire            ibus_trans_abort;             
wire            ibusif_ibuf_no_trans;         
wire            ibusif_ifctrl_inst_mad32_high; 
wire            ibusif_ifctrl_inst_no_bypass; 
wire            ibusif_top_clk_en;            
wire            ibusif_xx_16bit_inst;         
wire            ibusif_xx_acc_err;            
wire    [31:0]  ibusif_xx_data;               
wire            ibusif_xx_ibus_idle;          
wire            ibusif_xx_trans_cmplt;        
wire            ibusif_xx_unalign_fetch;      
wire    [31:0]  ifu_bmu_addr;                 
wire            ifu_bmu_idle;                 
wire    [3 :0]  ifu_bmu_prot;                 
wire            ifu_bmu_req;                  
wire            ifu_bmu_wfd1;                 
wire            ifu_cp0_lpmd_ack;             
wire            ifu_iu_ibus_idle;             
wire            ifu_iu_vector_ibus_in_idle;   
wire    [31:0]  ifu_iu_xx_ibus_data;          
wire            ifu_misc_clk;                 
wire    [29:0]  inc_addr;                     
wire            inst_chgflw_for_data;         
wire            internal_inst_fetch;          
wire            internal_inst_fetch_pre;      
wire    [30:0]  iu_ifu_addr;                  
wire            iu_ifu_data_fetch;            
wire            iu_ifu_data_fetch_for_data;   
wire            iu_ifu_inst_fetch;            
wire            iu_ifu_inst_fetch_for_data;   
wire            iu_ifu_inst_fetch_mask;       
wire            iu_ifu_security_violation;    
wire            iu_yy_xx_dbgon;               
wire            lpmd_mask;                    
wire            pad_yy_gate_clk_en_b;         
wire            pad_yy_test_mode;             
wire            pmp_ifu_acc_scu;              
wire            sm_upd_clk;                   
wire            sm_upd_en;                    
parameter IDLE     = 3'b001,
          WFG1     = 3'b010,
          WFD1     = 3'b011,
          WFD1WFG2 = 3'b000,
          WFD1WFD2 = 3'b110;
parameter ABORT_IDLE = 1'b0,
          ABORT_VLD  = 1'b1;
gated_clk_cell  x_ibus_addr_cnt_low_clkhdr (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (addr_cnt_low_upd_clk),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (addr_cnt_low_upd_en ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
gated_clk_cell  x_ibus_addr_cnt_high_clkhdr (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (addr_cnt_high_upd_clk),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (addr_cnt_high_upd_en ),
  .module_en             (1'b0                 ),
  .pad_yy_gate_clk_en_b  (pad_yy_gate_clk_en_b ),
  .pad_yy_test_mode      (pad_yy_test_mode     )
);
gated_clk_cell  x_sm_upd_clkhdr (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sm_upd_clk          ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (sm_upd_en           ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign sm_upd_en = ibus_req || iu_ifu_inst_fetch_for_data ||
                   bmu_xx_ibus_trans_cmplt || 
                   (cur_st != IDLE);
assign ibus_seq_addr[30:0] = {addr_cnt[29:0], 1'b0};
assign ibus_nonseq_addr[30:0] = iu_ifu_addr[30:0];
assign ibus_addr[30:0] = (iu_ifu_inst_fetch_for_data
                          || iu_ifu_data_fetch_for_data)
                                      ? ibus_nonseq_addr[30:0]
                                      : ibus_seq_addr[30:0];
assign change_flow_vld = iu_ifu_inst_fetch;
assign addr_cnt_upd_en = change_flow_vld || (!iu_ifu_data_fetch_for_data && bmu_xx_ibus_grnt);
assign addr_cnt_high_upd_en = change_flow_vld ||
                              bmu_xx_ibus_grnt && (addr_cnt[10] ^ inc_addr[10]);
assign addr_cnt_low_upd_en  = addr_cnt_upd_en;
always @(posedge addr_cnt_low_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    addr_cnt[9:0] <= 10'b0;
  else if(addr_cnt_low_upd_en)
    addr_cnt[9:0] <= inc_addr[9:0];
end
assign addr_cnt_high_upd_en_local = 1'b0;
always @(posedge addr_cnt_high_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    addr_cnt[29:10] <= 20'b0;
  else if(addr_cnt_high_upd_en)
    addr_cnt[29:10] <= inc_addr[29:10];
end
assign inc_addr[29:0] = ibus_addr[30:1] + bmu_xx_ibus_grnt;
assign bmu_xx_ibus_data_aft_pol[31:0] = bmu_xx_ibus_data[31:0];
assign ibus_data[31:0] = {bmu_xx_ibus_data_aft_pol[31:16], unalign_fetch_reg ?
                          bmu_xx_ibus_data_aft_pol[31:16] :
                          bmu_xx_ibus_data_aft_pol[15:0]}; 
always @(posedge sm_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    unalign_fetch_reg <= 1'b0;
  else if(change_flow_vld)
    unalign_fetch_reg <= ibus_addr[0];
  else if(ibus_inst_fetch_cmplt)
    unalign_fetch_reg <= 1'b0;
end    
assign ibus_prot[3:0] = {cru_ifu_acc_ca,
                         pmp_ifu_acc_scu,
                         cp0_yy_machine_mode_aft_dbg,
                         1'b0};
always @(posedge sm_upd_clk)
begin
  if(ibus_prot_buf)
    ibus_prot_reg[3:0] <= ibus_prot[3:0];
end
assign inst_chgflw_for_data = iu_ifu_inst_fetch_for_data;
assign internal_inst_fetch_pre = ibuf_ibusif_inst_fetch 
                                    && !inst_chgflw_for_data
                                    && !addr_cnt_high_upd_en_local
                              || iu_ifu_inst_fetch;
assign internal_inst_fetch = internal_inst_fetch_pre &&
                             !lpmd_mask &&
                             !iu_yy_xx_dbgon &&
                             !iu_ifu_inst_fetch_mask &&
                             !iu_ifu_security_violation;
assign lpmd_mask = cp0_ifu_in_lpmd || cp0_ifu_lpmd_req;
assign flop_out_bus = 1'b0;
always @(posedge sm_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_st[2:0] <= IDLE;
  else
    cur_st[2:0]  <= nxt_st[2:0];
end
always @( internal_inst_fetch
       or bmu_xx_ibus_trans_cmplt
       or bmu_xx_ibus_grnt
       or flop_out_bus
       or cur_st)
begin
case(cur_st)
IDLE:
begin
  if(internal_inst_fetch)
    begin
      if(bmu_xx_ibus_grnt)
        nxt_st = WFD1;
      else
        nxt_st = WFG1;
    end
  else
    nxt_st = IDLE;
end
WFG1:
begin
  if(bmu_xx_ibus_grnt)
    nxt_st = WFD1;
  else
    nxt_st = WFG1;
end
WFD1:
begin
  if(bmu_xx_ibus_trans_cmplt)
    begin
      if(internal_inst_fetch)
        begin
          if(bmu_xx_ibus_grnt)
            nxt_st = WFD1;
          else
            nxt_st = WFG1;
        end
      else
        nxt_st = IDLE;
    end
  else if(internal_inst_fetch && flop_out_bus)
    begin 
      if(bmu_xx_ibus_grnt)
        nxt_st = WFD1WFD2;
      else
        nxt_st = WFD1WFG2;
    end
  else if(internal_inst_fetch)
    nxt_st = WFD1WFG2;
  else
    nxt_st = WFD1;
end
WFD1WFG2:
begin
  if(bmu_xx_ibus_trans_cmplt)
    begin
      if(bmu_xx_ibus_grnt)
        nxt_st = WFD1;
      else
        nxt_st = WFG1;
    end
  else
    begin
      if(bmu_xx_ibus_grnt && flop_out_bus)
        nxt_st = WFD1WFD2;
      else
        nxt_st = WFD1WFG2;
    end
end
WFD1WFD2:
begin
  if(bmu_xx_ibus_trans_cmplt)
    nxt_st = WFD1;
  else
    nxt_st = WFD1WFD2;
end
default:
begin
  nxt_st = IDLE;
end
endcase
end
assign ibus_busy = !cur_st[0];
assign ibus_inst_fetch_cmplt = ((cur_st == WFD1) 
                             || (cur_st == WFD1WFG2)
                             || (cur_st == WFD1WFD2)
                               )  && bmu_xx_ibus_trans_cmplt
                                  && !ibus_trans_abort;
assign ibus_acc_err = ((cur_st == WFD1)
                    || (cur_st == WFD1WFG2)
                    || (cur_st == WFD1WFD2)
                      )  &&  bmu_xx_ibus_acc_err;
assign ibus_inst_req = (cur_st == IDLE)
                         && internal_inst_fetch
                    || (cur_st == WFG1)
                    || (cur_st == WFD1)
                         && internal_inst_fetch
                    || (cur_st == WFD1WFG2);
assign ibus_abort_trig = (cur_st == WFD1)
                           && !bmu_xx_ibus_trans_cmplt
                           && change_flow_vld; 
assign ibus_no_outstanding = (cur_st == IDLE)
                          || (cur_st == WFG1)
                          || (cur_st == WFD1)
                               && bmu_xx_ibus_trans_cmplt
                          || (cur_st == WFD1WFG2)
                               && bmu_xx_ibus_trans_cmplt;
assign ibus_prot_buf = ((cur_st == IDLE) || (cur_st == WFD1))
                    && ((nxt_st == WFG1) || (nxt_st == WFD1WFG2));
assign ibus_prot_buf_sel = (cur_st == WFG1) || (cur_st == WFD1WFG2);
assign ibus_req = ibus_inst_req || iu_ifu_data_fetch;
always @(posedge ifu_misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    abort_cur_st <= ABORT_IDLE;
  else
    abort_cur_st <= abort_nxt_st;
end
always @( abort_cur_st
       or bmu_xx_ibus_trans_cmplt
       or ibus_abort_trig)
begin
case(abort_cur_st)
ABORT_IDLE:
begin
  abort_nxt_st = ABORT_IDLE;
  if(ibus_abort_trig)
    abort_nxt_st = ABORT_VLD;
end
ABORT_VLD:
begin
  abort_nxt_st = ABORT_VLD;
  if(bmu_xx_ibus_trans_cmplt)
    abort_nxt_st = ABORT_IDLE;
end
default:
begin
  abort_nxt_st = ABORT_IDLE;
end
endcase
end
assign ibus_trans_abort = (abort_cur_st == ABORT_VLD);
assign ibusif_top_clk_en = ibus_abort_trig || ibus_trans_abort;
assign ibus_inst_no_bypass = ibus_inst_mad;
assign ibus_inst_mad = 1'b0;
assign ibus_inst_mad32_high = 1'b0;
assign ifu_bmu_req = ibus_req;
assign ifu_bmu_idle = ibus_no_outstanding;
assign ifu_bmu_wfd1 = (cur_st == WFD1) || (cur_st == IDLE);
assign ifu_bmu_addr[31:0] = {ibus_addr[30:1], 2'b0};
assign ifu_bmu_prot[3:0] = ibus_prot_buf_sel ? ibus_prot_reg[3:0]
                                             : ibus_prot[3:0];
assign ibusif_ifctrl_inst_no_bypass = ibus_inst_no_bypass;
assign ibusif_ifctrl_inst_mad32_high = ibus_inst_mad32_high;
assign ibusif_ibuf_no_trans = (cur_st == IDLE);
assign ibusif_xx_ibus_idle = !ibus_busy;
assign ibusif_xx_data[31:0] = ibus_data[31:0];
assign ibusif_xx_acc_err = ibus_acc_err && !iu_yy_xx_dbgon;
assign ibusif_xx_unalign_fetch = unalign_fetch_reg;
assign ibusif_xx_trans_cmplt = ibus_inst_fetch_cmplt
                           && !iu_ifu_inst_fetch_mask 
                           && !iu_yy_xx_dbgon;
assign ibusif_xx_16bit_inst = !(ibus_data[1:0] == 2'b11);
assign ifu_iu_ibus_idle = !ibus_busy;
assign ifu_iu_vector_ibus_in_idle = (cur_st == IDLE);
assign ifu_iu_xx_ibus_data[31:0]  = bmu_xx_ibus_data_aft_pol[31:0];
assign ifu_cp0_lpmd_ack = cp0_ifu_lpmd_req && (cur_st == IDLE);
endmodule
