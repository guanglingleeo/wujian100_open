/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_tcipif_dummy_bus(
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_write,
  cpurst_b,
  forever_cpuclk,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_data_vld,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt
);
input           bmu_tcipif_ibus_acc_deny;   
input   [31:0]  bmu_tcipif_ibus_addr;       
input           bmu_tcipif_ibus_req;        
input           bmu_tcipif_ibus_write;      
input           cpurst_b;                   
input           forever_cpuclk;             
input           pad_yy_gate_clk_en_b;       
input           pad_yy_test_mode;           
output          tcipif_bmu_ibus_acc_err;    
output  [31:0]  tcipif_bmu_ibus_data;       
output          tcipif_bmu_ibus_data_vld;   
output          tcipif_bmu_ibus_grnt;       
output          tcipif_bmu_ibus_trans_cmplt; 
reg             bus_next_state;             
reg             bus_state;                  
wire            bmu_tcipif_ibus_acc_deny;   
wire            bmu_tcipif_ibus_req;        
wire            cpurst_b;                   
wire            forever_cpuclk;             
wire            ibus_acc_err;               
wire            ibus_busy;                  
wire            ibus_req;                   
wire            pad_yy_gate_clk_en_b;       
wire            pad_yy_test_mode;           
wire            sel_cpuclk;                 
wire            tcipif_bmu_ibus_acc_err;    
wire    [31:0]  tcipif_bmu_ibus_data;       
wire            tcipif_bmu_ibus_data_vld;   
wire            tcipif_bmu_ibus_grnt;       
wire            tcipif_bmu_ibus_trans_cmplt; 
assign tcipif_bmu_ibus_grnt = bmu_tcipif_ibus_req;
assign ibus_req = bmu_tcipif_ibus_req && !bmu_tcipif_ibus_acc_deny;
parameter IDLE  = 1'b0,
          ERROR = 1'b1;
gated_clk_cell  x_tcipif_ibus_sel_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sel_cpuclk          ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (bmu_tcipif_ibus_req ),
  .module_en            (ibus_busy           ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign ibus_busy  = (bus_state != IDLE);
always@(posedge sel_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bus_state <= IDLE;
  else
    bus_state <= bus_next_state;
end
always @( bus_state
       or ibus_req)
begin
case(bus_state)
  IDLE:
    if(ibus_req)
      bus_next_state = ERROR;
    else
      bus_next_state = IDLE;
  ERROR:
    if(ibus_req)
      bus_next_state = ERROR;
    else
      bus_next_state = IDLE;
  default:
    bus_next_state = IDLE;
endcase
end
assign ibus_acc_err = (bus_state == ERROR);
assign tcipif_bmu_ibus_trans_cmplt = ibus_acc_err;
assign tcipif_bmu_ibus_acc_err     = ibus_acc_err;
assign tcipif_bmu_ibus_data_vld    = 1'b0;
assign tcipif_bmu_ibus_data[31:0]  = 32'b0;
endmodule
