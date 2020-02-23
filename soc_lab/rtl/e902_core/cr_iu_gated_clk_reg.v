/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_gated_clk_reg(
  cp0_yy_clk_en,
  forever_cpuclk,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  write_data,
  x_randclk_reg_mod_en_w32,
  x_reg_dout,
  x_write_en
);
input           cp0_yy_clk_en;           
input           forever_cpuclk;          
input           pad_yy_gate_clk_en_b;    
input           pad_yy_test_mode;        
input   [31:0]  write_data;              
input           x_randclk_reg_mod_en_w32; 
input           x_write_en;              
output  [31:0]  x_reg_dout;              
reg     [31:0]  x_reg_dout;              
wire            cp0_yy_clk_en;           
wire            forever_cpuclk;          
wire            pad_yy_gate_clk_en_b;    
wire            pad_yy_test_mode;        
wire            reg_clk_en;              
wire            reg_cpuclk;              
wire    [31:0]  write_data;              
wire    [31:0]  write_in_data;           
wire            write_in_en;             
wire            x_randclk_reg_mod_en_w32; 
wire            x_write_en;              
assign reg_clk_en = write_in_en;
gated_clk_cell  x_reg_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (reg_cpuclk              ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (reg_clk_en              ),
  .module_en                (x_randclk_reg_mod_en_w32),
  .pad_yy_gate_clk_en_b     (pad_yy_gate_clk_en_b    ),
  .pad_yy_test_mode         (pad_yy_test_mode        )
);
assign write_in_en = x_write_en;
assign write_in_data[31:0] = write_data[31:0];
always @(posedge reg_cpuclk)
begin
  if(write_in_en)
    x_reg_dout[31:0] <= write_in_data[31:0];
  else
    x_reg_dout[31:0] <= x_reg_dout[31:0];
end
endmodule
