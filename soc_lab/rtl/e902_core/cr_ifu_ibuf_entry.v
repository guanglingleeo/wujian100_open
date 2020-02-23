/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_ifu_ibuf_entry(
  cp0_yy_clk_en,
  cpuclk,
  cpurst_b,
  entry_acc_err,
  entry_create0_en,
  entry_create1_en,
  entry_inst,
  entry_part_flush,
  entry_randclk_data_mod_en_w16,
  entry_retire0_en,
  entry_retire1_en,
  entry_vld,
  forever_cpuclk,
  had_ifu_ir,
  ibuf_flush,
  ibuf_no_inst_during_pipe_down,
  ibusif_xx_acc_err,
  ibusif_xx_data,
  ifu_misc_clk,
  iu_yy_xx_dbgon,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode
);
input           cp0_yy_clk_en;                
input           cpuclk;                       
input           cpurst_b;                     
input           entry_create0_en;             
input           entry_create1_en;             
input           entry_part_flush;             
input           entry_randclk_data_mod_en_w16; 
input           entry_retire0_en;             
input           entry_retire1_en;             
input           forever_cpuclk;               
input   [31:0]  had_ifu_ir;                   
input           ibuf_flush;                   
input           ibuf_no_inst_during_pipe_down; 
input           ibusif_xx_acc_err;            
input   [31:0]  ibusif_xx_data;               
input           ifu_misc_clk;                 
input           iu_yy_xx_dbgon;               
input           pad_yy_gate_clk_en_b;         
input           pad_yy_test_mode;             
output          entry_acc_err;                
output  [16:0]  entry_inst;                   
output          entry_vld;                    
reg             entry_acc_err;                
reg     [16:0]  entry_inst;                   
reg             entry_vld;                    
wire            cp0_yy_clk_en;                
wire            cpuclk;                       
wire            cpurst_b;                     
wire            entry_create;                 
wire            entry_create0_en;             
wire            entry_create1_en;             
wire            entry_part_flush;             
wire            entry_randclk_data_mod_en_w16; 
wire            entry_retire;                 
wire            entry_retire0_en;             
wire            entry_retire1_en;             
wire            forever_cpuclk;               
wire    [31:0]  had_ifu_ir;                   
wire            ibuf_data_upd_clk;            
wire            ibuf_data_upd_en;             
wire            ibuf_flush;                   
wire            ibuf_no_inst_during_pipe_down; 
wire    [16:0]  ibus_inst_info_high;          
wire    [16:0]  ibus_inst_info_low;           
wire            ibusif_xx_acc_err;            
wire    [31:0]  ibusif_xx_data;               
wire            ifu_misc_clk;                 
wire            iu_yy_xx_dbgon;               
wire            pad_yy_gate_clk_en_b;         
wire            pad_yy_test_mode;             
gated_clk_cell  x_ibuf_data_upd_clkhdr (
  .clk_in                        (forever_cpuclk               ),
  .clk_out                       (ibuf_data_upd_clk            ),
  .external_en                   (1'b0                         ),
  .global_en                     (cp0_yy_clk_en                ),
  .local_en                      (ibuf_data_upd_en             ),
  .module_en                     (entry_randclk_data_mod_en_w16),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             )
);
assign ibuf_data_upd_en = entry_create0_en || entry_create1_en;
assign entry_create  = entry_create0_en || entry_create1_en;
assign entry_retire  = entry_retire0_en || entry_retire1_en;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_vld <= 1'b0;
  else if(entry_part_flush)
    entry_vld <= 1'b0;
  else if(ibuf_flush)
    entry_vld <= 1'b0;
  else if(entry_create)
    entry_vld <= 1'b1;
  else if(entry_retire)
    entry_vld <= 1'b0;
  else
    entry_vld <= entry_vld;
end
assign ibus_inst_info_high[16:0] = {1'b0, ibusif_xx_data[15:0]};
assign ibus_inst_info_low[16:0]  = {1'b0, ibusif_xx_data[31:16]};
always @(posedge ibuf_data_upd_clk)
begin
  if(iu_yy_xx_dbgon)
    begin
      if(entry_create0_en)
        entry_inst[16:0] <= {1'b0, had_ifu_ir[15:0]};
      else if(entry_create1_en)
        entry_inst[16:0] <= {1'b0, had_ifu_ir[31:16]};
      else
        entry_inst[16:0] <= entry_inst[16:0];
    end
  else
    begin
      if(entry_create0_en)
        begin
          if(ibuf_no_inst_during_pipe_down)
            entry_inst[16:0] <= ibus_inst_info_low[16:0];
          else
            entry_inst[16:0] <= ibus_inst_info_high[16:0];
        end
      else if(entry_create1_en)
        entry_inst[16:0] <= ibus_inst_info_low[16:0];
      else
        entry_inst[16:0] <= entry_inst[16:0];
    end
end
always @(posedge ifu_misc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_acc_err <= 1'b0;
  else if(entry_create)
    entry_acc_err <= ibusif_xx_acc_err;
  else
    entry_acc_err <= entry_acc_err;
end
endmodule
