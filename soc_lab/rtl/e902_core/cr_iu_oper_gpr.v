/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_oper_gpr(
  cp0_yy_clk_en,
  forever_cpuclk,
  hs_split_iu_nsinst_gpr_rst_b,
  inst_read_data0,
  inst_read_data1,
  inst_read_index0,
  inst_read_index1,
  inst_wen,
  inst_write_data,
  inst_write_index,
  iu_yy_xx_reg_rst_b,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  randclk_oper_gpr_mod_en_w32
);
input           cp0_yy_clk_en;                   
input           forever_cpuclk;                  
input           hs_split_iu_nsinst_gpr_rst_b;    
input   [4 :0]  inst_read_index0;                
input   [4 :0]  inst_read_index1;                
input           inst_wen;                        
input   [31:0]  inst_write_data;                 
input   [4 :0]  inst_write_index;                
input           iu_yy_xx_reg_rst_b;              
input           pad_yy_gate_clk_en_b;            
input           pad_yy_test_mode;                
input   [20:0]  randclk_oper_gpr_mod_en_w32;     
output  [31:0]  inst_read_data0;                 
output  [31:0]  inst_read_data1;                 
reg     [31:0]  gpr_read_data0;                  
reg     [31:0]  gpr_read_data1;                  
reg     [31:0]  reg_sel;                         
reg     [31:0]  sp_read_data0;                   
reg     [31:0]  sp_read_data1;                   
wire    [31:0]  alter_0_reg_dout;                
wire    [31:0]  alter_10_reg_dout;               
wire    [31:0]  alter_11_reg_dout;               
wire    [31:0]  alter_12_reg_dout;               
wire    [31:0]  alter_13_reg_dout;               
wire    [31:0]  alter_14_reg_dout;               
wire    [31:0]  alter_15_reg_dout;               
wire    [31:0]  alter_1_reg_dout;                
wire    [31:0]  alter_2_reg_dout;                
wire    [31:0]  alter_3_reg_dout;                
wire    [31:0]  alter_4_reg_dout;                
wire    [31:0]  alter_5_reg_dout;                
wire    [31:0]  alter_6_reg_dout;                
wire    [31:0]  alter_7_reg_dout;                
wire    [31:0]  alter_8_reg_dout;                
wire    [31:0]  alter_9_reg_dout;                
wire            alter_mode;                      
wire            cp0_yy_clk_en;                   
wire            forever_cpuclk;                  
wire            gpr_sync_rst_b;                  
wire            gpr_sync_rst_for_sp_b;           
wire            hs_split_iu_nsinst_gpr_rst_b;    
wire    [31:0]  inst_read_data0;                 
wire    [31:0]  inst_read_data1;                 
wire    [4 :0]  inst_read_index0;                
wire    [4 :0]  inst_read_index1;                
wire            inst_wen;                        
wire    [31:0]  inst_write_data;                 
wire    [4 :0]  inst_write_index;                
wire            iu_yy_xx_reg_rst_b;              
wire            machine_2_randclk_reg_mod_en_w32; 
wire    [31:0]  machine_2_reg_dout;              
wire            machine_2_write_en;              
wire            machine_write_en_2;              
wire            pad_cpu_gpr_rst_b;               
wire            pad_yy_gate_clk_en_b;            
wire            pad_yy_test_mode;                
wire    [20:0]  randclk_oper_gpr_mod_en_w32;     
wire            user_10_randclk_reg_mod_en_w32;  
wire    [31:0]  user_10_reg_dout;                
wire            user_10_write_en;                
wire            user_11_randclk_reg_mod_en_w32;  
wire    [31:0]  user_11_reg_dout;                
wire            user_11_write_en;                
wire            user_12_randclk_reg_mod_en_w32;  
wire    [31:0]  user_12_reg_dout;                
wire            user_12_write_en;                
wire            user_13_randclk_reg_mod_en_w32;  
wire    [31:0]  user_13_reg_dout;                
wire            user_13_write_en;                
wire            user_14_randclk_reg_mod_en_w32;  
wire    [31:0]  user_14_reg_dout;                
wire            user_14_write_en;                
wire            user_15_randclk_reg_mod_en_w32;  
wire    [31:0]  user_15_reg_dout;                
wire            user_15_write_en;                
wire            user_1_randclk_reg_mod_en_w32;   
wire    [31:0]  user_1_reg_dout;                 
wire            user_1_write_en;                 
wire            user_3_randclk_reg_mod_en_w32;   
wire    [31:0]  user_3_reg_dout;                 
wire            user_3_write_en;                 
wire            user_4_randclk_reg_mod_en_w32;   
wire    [31:0]  user_4_reg_dout;                 
wire            user_4_write_en;                 
wire            user_5_randclk_reg_mod_en_w32;   
wire    [31:0]  user_5_reg_dout;                 
wire            user_5_write_en;                 
wire            user_6_randclk_reg_mod_en_w32;   
wire    [31:0]  user_6_reg_dout;                 
wire            user_6_write_en;                 
wire            user_7_randclk_reg_mod_en_w32;   
wire    [31:0]  user_7_reg_dout;                 
wire            user_7_write_en;                 
wire            user_8_randclk_reg_mod_en_w32;   
wire    [31:0]  user_8_reg_dout;                 
wire            user_8_write_en;                 
wire            user_9_randclk_reg_mod_en_w32;   
wire    [31:0]  user_9_reg_dout;                 
wire            user_9_write_en;                 
wire    [31:0]  user_write_en;                   
wire            ussp_explicit_we;                
wire    [31:0]  write_data;                      
wire    [31:0]  write_data_for_sp;               
wire    [31:0]  write_port_data;                 
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_1 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_1_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_1_reg_dout              ),
  .x_write_en                    (user_1_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_3 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_3_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_3_reg_dout              ),
  .x_write_en                    (user_3_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_4 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_4_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_4_reg_dout              ),
  .x_write_en                    (user_4_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_5 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_5_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_5_reg_dout              ),
  .x_write_en                    (user_5_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_6 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_6_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_6_reg_dout              ),
  .x_write_en                    (user_6_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_7 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_7_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_7_reg_dout              ),
  .x_write_en                    (user_7_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_8 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_8_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_8_reg_dout              ),
  .x_write_en                    (user_8_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_9 (
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_gate_clk_en_b          (pad_yy_gate_clk_en_b         ),
  .pad_yy_test_mode              (pad_yy_test_mode             ),
  .write_data                    (write_data                   ),
  .x_randclk_reg_mod_en_w32      (user_9_randclk_reg_mod_en_w32),
  .x_reg_dout                    (user_9_reg_dout              ),
  .x_write_en                    (user_9_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_10 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_10_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_10_reg_dout              ),
  .x_write_en                     (user_10_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_11 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_11_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_11_reg_dout              ),
  .x_write_en                     (user_11_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_12 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_12_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_12_reg_dout              ),
  .x_write_en                     (user_12_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_13 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_13_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_13_reg_dout              ),
  .x_write_en                     (user_13_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_14 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_14_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_14_reg_dout              ),
  .x_write_en                     (user_14_write_en              )
);
cr_iu_gated_clk_reg  x_cr_iu_gated_clk_reg_user_15 (
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_gate_clk_en_b           (pad_yy_gate_clk_en_b          ),
  .pad_yy_test_mode               (pad_yy_test_mode              ),
  .write_data                     (write_data                    ),
  .x_randclk_reg_mod_en_w32       (user_15_randclk_reg_mod_en_w32),
  .x_reg_dout                     (user_15_reg_dout              ),
  .x_write_en                     (user_15_write_en              )
);
cr_iu_gated_clk_reg_timing  x_cr_iu_gated_clk_reg_machine_2 (
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .pad_yy_gate_clk_en_b             (pad_yy_gate_clk_en_b            ),
  .pad_yy_test_mode                 (pad_yy_test_mode                ),
  .write_data                       (write_data_for_sp[31:0]         ),
  .x_randclk_reg_mod_en_w32         (machine_2_randclk_reg_mod_en_w32),
  .x_reg_dout                       (machine_2_reg_dout              ),
  .x_write_en                       (machine_2_write_en              )
);
assign user_1_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[1];
assign user_3_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[3];
assign user_4_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[4];
assign user_5_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[5];
assign user_6_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[6];
assign user_7_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[7];
assign user_8_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[8];
assign user_9_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[9];
assign user_10_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[10];
assign user_11_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[11];
assign user_12_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[12];
assign user_13_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[13];
assign user_14_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[14];
assign user_15_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[15];
assign machine_2_randclk_reg_mod_en_w32 = randclk_oper_gpr_mod_en_w32[16];
assign pad_cpu_gpr_rst_b = 1'b1;
assign gpr_sync_rst_b = pad_cpu_gpr_rst_b && iu_yy_xx_reg_rst_b
                        && hs_split_iu_nsinst_gpr_rst_b;
assign gpr_sync_rst_for_sp_b = pad_cpu_gpr_rst_b && iu_yy_xx_reg_rst_b;
assign write_port_data[31:0] = {32{gpr_sync_rst_b}}
                             & inst_write_data[31:0];
assign write_data[31:0] = write_port_data[31:0];
assign  write_data_for_sp[31:0] =  write_port_data[31:0];
always @( inst_write_index[4:0])
begin
  reg_sel[31:0] = 32'b0;
  case(inst_write_index[4:0])
  5'h0 :  reg_sel[0]  = 1'b1;
  5'h1 :  reg_sel[1]  = 1'b1;
  5'h2 :  reg_sel[2]  = 1'b1;
  5'h3 :  reg_sel[3]  = 1'b1;
  5'h4 :  reg_sel[4]  = 1'b1;
  5'h5 :  reg_sel[5]  = 1'b1;
  5'h6 :  reg_sel[6]  = 1'b1;
  5'h7 :  reg_sel[7]  = 1'b1;
  5'h8 :  reg_sel[8]  = 1'b1;
  5'h9 :  reg_sel[9]  = 1'b1;
  5'ha :  reg_sel[10] = 1'b1;
  5'hb :  reg_sel[11] = 1'b1;
  5'hc :  reg_sel[12] = 1'b1;
  5'hd :  reg_sel[13] = 1'b1;
  5'he :  reg_sel[14] = 1'b1;
  5'hf :  reg_sel[15] = 1'b1;
  endcase
end
assign user_write_en[31:3] = reg_sel[31:3] & {29{inst_wen}};
assign user_write_en[1:0]  = reg_sel[1:0] & {2{inst_wen}}; 
assign user_write_en[2] = 1'b0;
assign ussp_explicit_we   = reg_sel[2] && inst_wen
                         || !gpr_sync_rst_for_sp_b;
assign machine_write_en_2 = ussp_explicit_we;
assign user_1_write_en   = !gpr_sync_rst_b | user_write_en[1];
assign user_3_write_en   = !gpr_sync_rst_b | user_write_en[3];
assign user_4_write_en   = !gpr_sync_rst_b | user_write_en[4];
assign user_5_write_en   = !gpr_sync_rst_b | user_write_en[5];
assign user_6_write_en   = !gpr_sync_rst_b | user_write_en[6];
assign user_7_write_en   = !gpr_sync_rst_b | user_write_en[7];
assign user_8_write_en   = !gpr_sync_rst_b | user_write_en[8];
assign user_9_write_en   = !gpr_sync_rst_b | user_write_en[9];
assign user_10_write_en  = !gpr_sync_rst_b | user_write_en[10];
assign user_11_write_en  = !gpr_sync_rst_b | user_write_en[11];
assign user_12_write_en  = !gpr_sync_rst_b | user_write_en[12];
assign user_13_write_en  = !gpr_sync_rst_b | user_write_en[13];
assign user_14_write_en  = !gpr_sync_rst_b | user_write_en[14];
assign user_15_write_en  = !gpr_sync_rst_b | user_write_en[15];
assign machine_2_write_en = machine_write_en_2;
assign alter_mode = 1'b0;
assign alter_0_reg_dout[31:0] = 32'b0;
assign alter_1_reg_dout[31:0] = 32'b0;
assign alter_2_reg_dout[31:0] = 32'b0;
assign alter_3_reg_dout[31:0] = 32'b0;
assign alter_4_reg_dout[31:0] = 32'b0;
assign alter_5_reg_dout[31:0] = 32'b0;
assign alter_6_reg_dout[31:0] = 32'b0;
assign alter_7_reg_dout[31:0] = 32'b0;
assign alter_8_reg_dout[31:0] = 32'b0;
assign alter_9_reg_dout[31:0]  = 32'b0;
assign alter_10_reg_dout[31:0] = 32'b0;
assign alter_11_reg_dout[31:0] = 32'b0;
assign alter_12_reg_dout[31:0] = 32'b0;
assign alter_13_reg_dout[31:0] = 32'b0;
assign alter_14_reg_dout[31:0] = 32'b0;
assign alter_15_reg_dout[31:0] = 32'b0;
always @( user_8_reg_dout[31:0]
       or alter_3_reg_dout[31:0]
       or alter_7_reg_dout[31:0]
       or alter_13_reg_dout[31:0]
       or inst_read_index0[4:0]
       or user_11_reg_dout[31:0]
       or user_10_reg_dout[31:0]
       or user_3_reg_dout[31:0]
       or user_9_reg_dout[31:0]
       or alter_15_reg_dout[31:0]
       or alter_1_reg_dout[31:0]
       or alter_6_reg_dout[31:0]
       or user_1_reg_dout[31:0]
       or sp_read_data0[31:0]
       or user_13_reg_dout[31:0]
       or alter_5_reg_dout[31:0]
       or alter_4_reg_dout[31:0]
       or alter_mode
       or user_4_reg_dout[31:0]
       or user_5_reg_dout[31:0]
       or user_15_reg_dout[31:0]
       or user_6_reg_dout[31:0]
       or alter_10_reg_dout[31:0]
       or alter_12_reg_dout[31:0]
       or alter_9_reg_dout[31:0]
       or alter_11_reg_dout[31:0]
       or alter_0_reg_dout[31:0]
       or user_14_reg_dout[31:0]
       or user_12_reg_dout[31:0]
       or user_7_reg_dout[31:0]
       or alter_8_reg_dout[31:0]
       or alter_14_reg_dout[31:0])
begin
  case(inst_read_index0[4:0])
  5'h0:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_0_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = 32'b0;
  5'h1:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_1_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_1_reg_dout[31:0];
  5'h2:
    gpr_read_data0[31:0] = sp_read_data0[31:0];
  5'h3:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_3_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_3_reg_dout[31:0];
  5'h4:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_4_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_4_reg_dout[31:0];
  5'h5:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_5_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_5_reg_dout[31:0];
  5'h6:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_6_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_6_reg_dout[31:0];
  5'h7:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_7_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_7_reg_dout[31:0];
  5'h8:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_8_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_8_reg_dout[31:0];
  5'h9:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_9_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_9_reg_dout[31:0];
  5'ha:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_10_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_10_reg_dout[31:0];
  5'hb:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_11_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_11_reg_dout[31:0];
  5'hc:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_12_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_12_reg_dout[31:0];
  5'hd:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_13_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_13_reg_dout[31:0];
  5'he:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_14_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_14_reg_dout[31:0];
  5'hf:
  if(alter_mode)
    gpr_read_data0[31:0] = alter_15_reg_dout[31:0];
  else
    gpr_read_data0[31:0] = user_15_reg_dout[31:0];
  default: gpr_read_data0[31:0] = 32'b0;
  endcase
end
always @( alter_2_reg_dout[31:0]
       or alter_mode
       or machine_2_reg_dout[31:0])
begin
  if(alter_mode)
    sp_read_data0[31:0] = alter_2_reg_dout[31:0];
  else
    sp_read_data0[31:0] = machine_2_reg_dout[31:0];
end
assign inst_read_data0[31:0] = gpr_read_data0[31:0];
always @( user_8_reg_dout[31:0]
       or alter_3_reg_dout[31:0]
       or sp_read_data1[31:0]
       or alter_7_reg_dout[31:0]
       or alter_13_reg_dout[31:0]
       or user_11_reg_dout[31:0]
       or user_10_reg_dout[31:0]
       or user_3_reg_dout[31:0]
       or user_9_reg_dout[31:0]
       or alter_15_reg_dout[31:0]
       or inst_read_index1[4:0]
       or alter_1_reg_dout[31:0]
       or alter_6_reg_dout[31:0]
       or user_1_reg_dout[31:0]
       or user_13_reg_dout[31:0]
       or alter_5_reg_dout[31:0]
       or alter_4_reg_dout[31:0]
       or alter_mode
       or user_4_reg_dout[31:0]
       or user_5_reg_dout[31:0]
       or user_15_reg_dout[31:0]
       or user_6_reg_dout[31:0]
       or alter_12_reg_dout[31:0]
       or alter_10_reg_dout[31:0]
       or alter_9_reg_dout[31:0]
       or alter_11_reg_dout[31:0]
       or user_14_reg_dout[31:0]
       or alter_0_reg_dout[31:0]
       or user_12_reg_dout[31:0]
       or user_7_reg_dout[31:0]
       or alter_8_reg_dout[31:0]
       or alter_14_reg_dout[31:0])
begin
  case(inst_read_index1[4:0])
  5'h0:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_0_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = 32'b0;
  5'h1:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_1_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_1_reg_dout[31:0];
  5'h2:
    gpr_read_data1[31:0] = sp_read_data1[31:0];
  5'h3:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_3_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_3_reg_dout[31:0];
  5'h4:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_4_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_4_reg_dout[31:0];
  5'h5:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_5_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_5_reg_dout[31:0];
  5'h6:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_6_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_6_reg_dout[31:0];
  5'h7:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_7_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_7_reg_dout[31:0];
  5'h8:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_8_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_8_reg_dout[31:0];
  5'h9:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_9_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_9_reg_dout[31:0];
  5'ha:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_10_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_10_reg_dout[31:0];
  5'hb:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_11_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_11_reg_dout[31:0];
  5'hc:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_12_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_12_reg_dout[31:0];
  5'hd:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_13_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_13_reg_dout[31:0];
  5'he:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_14_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_14_reg_dout[31:0];
  5'hf:
  if(alter_mode)
    gpr_read_data1[31:0] = alter_15_reg_dout[31:0];
  else
    gpr_read_data1[31:0] = user_15_reg_dout[31:0];
  default: gpr_read_data1[31:0] = 32'b0;
  endcase
end
always @( alter_2_reg_dout[31:0]
       or alter_mode
       or machine_2_reg_dout[31:0])
begin
  if(alter_mode)
    sp_read_data1[31:0] = alter_2_reg_dout[31:0];
  else
    sp_read_data1[31:0] = machine_2_reg_dout[31:0];
end
assign inst_read_data1[31:0] = gpr_read_data1[31:0];
endmodule
