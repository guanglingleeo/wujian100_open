/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_sys_io(
  clk_en,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cpurst_b,
  forever_cpuclk,
  had_yy_xx_dbg,
  iu_sys_lp_wk_int,
  iu_sysyio_soft_rst,
  iu_yy_xx_dbgon,
  pad_sysio_bigend_b,
  pad_sysio_clkratio,
  pad_sysio_endian_v2,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  sysio_cp0_bigend,
  sysio_cp0_clkratio,
  sysio_cp0_endian_v2,
  sysio_cp0_sys_view_lpmd_b,
  sysio_pad_dbg_b,
  sysio_pad_ipend_b,
  sysio_pad_lpmd_b,
  sysio_pad_srst,
  sysio_pad_wakeup_b
);
input          clk_en;                   
input          cp0_sysio_ipend_b;        
input   [1:0]  cp0_sysio_lpmd_b;         
input          cpurst_b;                 
input          forever_cpuclk;           
input          had_yy_xx_dbg;            
input          iu_sys_lp_wk_int;         
input          iu_sysyio_soft_rst;       
input          iu_yy_xx_dbgon;           
input          pad_sysio_bigend_b;       
input   [2:0]  pad_sysio_clkratio;       
input          pad_sysio_endian_v2;      
input          pad_yy_gate_clk_en_b;     
input          pad_yy_test_mode;         
output         sysio_cp0_bigend;         
output  [2:0]  sysio_cp0_clkratio;       
output         sysio_cp0_endian_v2;      
output  [1:0]  sysio_cp0_sys_view_lpmd_b; 
output         sysio_pad_dbg_b;          
output         sysio_pad_ipend_b;        
output  [1:0]  sysio_pad_lpmd_b;         
output         sysio_pad_srst;           
output         sysio_pad_wakeup_b;       
reg            sysio_pad_dbg_b;          
reg            sysio_pad_ipend_b;        
reg     [1:0]  sysio_pad_lpmd_b;         
reg            sysio_pad_wakeup_b;       
wire           clk_en;                   
wire           cp0_sysio_ipend_b;        
wire    [1:0]  cp0_sysio_lpmd_b;         
wire           cpu_wake_up_b;            
wire           cpurst_b;                 
wire           forever_cpuclk;           
wire           had_yy_xx_dbg;            
wire           iu_sys_lp_wk_int;         
wire           iu_sysyio_soft_rst;       
wire           iu_yy_xx_dbgon;           
wire           pad_sysio_bigend_b;       
wire    [2:0]  pad_sysio_clkratio;       
wire           pad_sysio_endian_v2;      
wire           pad_yy_gate_clk_en_b;     
wire           pad_yy_test_mode;         
wire           sysio_cp0_bigend;         
wire    [2:0]  sysio_cp0_clkratio;       
wire           sysio_cp0_endian_v2;      
wire    [1:0]  sysio_cp0_sys_view_lpmd_b; 
wire           sysio_lpmd_gated_clk;     
wire           sysio_lpmd_gated_en;      
wire           sysio_pad_srst;           
gated_clk_cell  x_gated_sysio_lpmd_cpuclk_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sysio_lpmd_gated_clk),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (sysio_lpmd_gated_en ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign sysio_lpmd_gated_en = ((sysio_pad_dbg_b     ^ (~iu_yy_xx_dbgon))   ||
                              (sysio_pad_lpmd_b[1] ^ cp0_sysio_lpmd_b[1]) ||
                              (sysio_pad_lpmd_b[0] ^ cp0_sysio_lpmd_b[0]) ||
                              (sysio_pad_ipend_b   ^ cp0_sysio_ipend_b)   ||
                              (sysio_pad_wakeup_b  ^ cpu_wake_up_b))
                            && clk_en;
assign  sysio_cp0_bigend         =!pad_sysio_bigend_b;
assign  sysio_cp0_endian_v2      = pad_sysio_endian_v2;
assign  sysio_cp0_clkratio[2:0]  = pad_sysio_clkratio[2:0];
assign cpu_wake_up_b = iu_sys_lp_wk_int && !had_yy_xx_dbg;
always @(posedge sysio_lpmd_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    sysio_pad_dbg_b       <= 1'b1;
    sysio_pad_lpmd_b[1:0] <= 2'b11;
    sysio_pad_ipend_b     <= 1'b0;
    sysio_pad_wakeup_b    <= 1'b0;
  end
  else if(clk_en) 
  begin
    sysio_pad_dbg_b       <= ~iu_yy_xx_dbgon;
    sysio_pad_lpmd_b[1:0] <= cp0_sysio_lpmd_b[1:0];
    sysio_pad_ipend_b     <= cp0_sysio_ipend_b;
    sysio_pad_wakeup_b    <= cpu_wake_up_b;
  end
end
assign sysio_cp0_sys_view_lpmd_b[1:0] = sysio_pad_lpmd_b[1:0];
assign sysio_pad_srst = iu_sysyio_soft_rst;
endmodule
