/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_cp0_lpmd(
  cache_cp0_lpmd_ack,
  cp0_cache_lpmd_req,
  cp0_had_lpmd_b,
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_yy_xx_dbg,
  ifu_cp0_lpmd_ack,
  inst_lpmd,
  iu_cp0_ex_sel,
  iu_cp0_lp_wk_int,
  iu_yy_xx_dbgon,
  iu_yy_xx_flush,
  iui_lpmd_inst_lpmd_for_data,
  lpmd_iui_stall,
  lpmd_sm_clk,
  lpmd_sm_clk_en,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  sysio_cp0_sys_view_lpmd_b
);
input          cache_cp0_lpmd_ack;         
input          cpurst_b;                   
input          forever_cpuclk;             
input          had_yy_xx_dbg;              
input          ifu_cp0_lpmd_ack;           
input          inst_lpmd;                  
input          iu_cp0_ex_sel;              
input          iu_cp0_lp_wk_int;           
input          iu_yy_xx_dbgon;             
input          iu_yy_xx_flush;             
input          iui_lpmd_inst_lpmd_for_data; 
input          lpmd_sm_clk;                
input          pad_yy_gate_clk_en_b;       
input          pad_yy_test_mode;           
input   [1:0]  sysio_cp0_sys_view_lpmd_b;  
output         cp0_cache_lpmd_req;         
output  [1:0]  cp0_had_lpmd_b;             
output         cp0_ifu_in_lpmd;            
output         cp0_ifu_lpmd_req;           
output         cp0_sysio_ipend_b;          
output  [1:0]  cp0_sysio_lpmd_b;           
output         cp0_yy_clk_en;              
output         lpmd_iui_stall;             
output         lpmd_sm_clk_en;             
reg     [1:0]  cur_state;                  
reg     [1:0]  lpmd_b;                     
reg     [1:0]  next_state;                 
wire           cache_cp0_lpmd_ack;         
wire           cp0_cache_lpmd_req;         
wire    [1:0]  cp0_had_lpmd_b;             
wire           cp0_ifu_in_lpmd;            
wire           cp0_ifu_lpmd_req;           
wire           cp0_sysio_ipend_b;          
wire    [1:0]  cp0_sysio_lpmd_b;           
wire           cp0_yy_clk_en;              
wire           cpu_in_lpmd;                
wire           cpu_in_lpmd_core_view;      
wire           cpu_in_lpmd_sys_view;       
wire           cpurst_b;                   
wire           forever_cpuclk;             
wire           had_yy_xx_dbg;              
wire           ifu_cp0_lpmd_ack;           
wire           inst_lpmd;                  
wire           iu_cp0_ex_sel;              
wire           iu_cp0_lp_wk_int;           
wire           iu_yy_xx_dbgon;             
wire           iu_yy_xx_flush;             
wire           iui_lpmd_inst_lpmd_for_data; 
wire           lpmd_ack;                   
wire           lpmd_clk;                   
wire           lpmd_clk_en;                
wire           lpmd_in_wait_state;         
wire           lpmd_iui_stall;             
wire           lpmd_sm_clk;                
wire           lpmd_sm_clk_en;             
wire           lpmd_start;                 
wire           pad_yy_gate_clk_en_b;       
wire           pad_yy_test_mode;           
wire    [1:0]  sys_lpmd_b;                 
wire    [1:0]  sysio_cp0_sys_view_lpmd_b;  
parameter IDLE   = 2'b00;
parameter WFACK  = 2'b01;
parameter WFCPLT = 2'b11;
parameter CPLT   = 2'b10;
assign lpmd_sm_clk_en = iu_cp0_ex_sel || (cur_state != IDLE); 
assign lpmd_clk_en = had_yy_xx_dbg || iu_cp0_lp_wk_int || iu_yy_xx_dbgon
                     || lpmd_start;
gated_clk_cell  x_lpmd_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (lpmd_clk            ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (1'b0                ),
  .module_en            (lpmd_clk_en         ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge lpmd_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else if(iu_yy_xx_flush)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end
always @( cur_state
       or lpmd_start
       or inst_lpmd
       or cpu_in_lpmd)
begin
  case(cur_state)
  IDLE       : if(inst_lpmd)
                next_state = WFACK;
              else
                next_state = IDLE;
  WFACK      : if(lpmd_start)
                next_state = WFCPLT;
              else
                next_state = WFACK;
  WFCPLT    : if(!cpu_in_lpmd)
                next_state = CPLT;
              else
                next_state = WFCPLT;
  CPLT      :   next_state = IDLE;
  default   :   next_state = IDLE;
  endcase
end
assign lpmd_in_wait_state = (cur_state == WFACK);
assign lpmd_iui_stall = (cur_state == IDLE) && iui_lpmd_inst_lpmd_for_data 
                        || (cur_state == WFACK)
                        || (cur_state == WFCPLT);
assign cp0_ifu_lpmd_req = lpmd_in_wait_state;
assign cp0_cache_lpmd_req = lpmd_in_wait_state;
assign lpmd_ack = ifu_cp0_lpmd_ack && cache_cp0_lpmd_ack;
assign lpmd_start = lpmd_ack;
always @(posedge lpmd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lpmd_b[1:0] <= 2'b11;
  else if(had_yy_xx_dbg || iu_cp0_lp_wk_int || iu_yy_xx_dbgon)
    lpmd_b[1:0] <= 2'b11;
  else if(lpmd_start && !cpu_in_lpmd)
  begin
    lpmd_b[1:0] <= 2'b00;
  end
  else
    lpmd_b[1:0] <= lpmd_b[1:0];
end
assign cp0_had_lpmd_b[1:0] = lpmd_b[1:0];
assign cp0_sysio_lpmd_b[1:0] = lpmd_b[1:0];
assign sys_lpmd_b[1:0] = sysio_cp0_sys_view_lpmd_b[1:0];
assign cpu_in_lpmd_sys_view = !(sys_lpmd_b[1] & sys_lpmd_b[0]);
assign cpu_in_lpmd_core_view = !(lpmd_b[1] & lpmd_b[0]);
assign cpu_in_lpmd = cpu_in_lpmd_sys_view || cpu_in_lpmd_core_view;
assign cp0_ifu_in_lpmd  = cpu_in_lpmd;
assign cp0_yy_clk_en = !cpu_in_lpmd;
assign cp0_sysio_ipend_b = !iu_cp0_lp_wk_int;
endmodule
