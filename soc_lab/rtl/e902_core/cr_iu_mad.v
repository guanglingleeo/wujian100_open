/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_mad(
  alu_mad_adder_of,
  alu_mad_adder_rst,
  alu_mad_rst_cout,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_mad_ex_data_sel,
  ctrl_mad_ex_sel,
  ctrl_mad_oper_mux_en,
  decd_mad_inst_div,
  decd_mad_inst_divu,
  decd_mad_inst_mul,
  decd_mad_inst_mulh,
  decd_mad_inst_mulhsu,
  decd_mad_inst_mulhu,
  decd_mad_inst_rem,
  decd_mad_inst_remu,
  forever_cpuclk,
  ifu_iu_ex_cnt,
  ifu_iu_ex_split_on,
  iu_lsu_imm_data,
  iu_lsu_imm_write_en,
  iu_yy_xx_flush,
  lsu_iu_mad_buf,
  mad_alu_data_vld,
  mad_alu_div_rs2,
  mad_alu_div_shift,
  mad_alu_fst_add,
  mad_alu_imm_vld,
  mad_alu_rs1,
  mad_alu_rs1_cst_0,
  mad_alu_rs1_vld,
  mad_alu_rs2_cst_0,
  mad_alu_rst,
  mad_alu_rst_vld,
  mad_ctrl_stall,
  mad_ctrl_stall_noinput,
  mad_rbus_req,
  oper_mad_rs1,
  oper_mad_rs2,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  randclk_mad_mod_en_w2,
  retire_mad_ex_cancel,
  wb_ctrl_stall
);
input            alu_mad_adder_of;      
input   [31:0 ]  alu_mad_adder_rst;     
input            alu_mad_rst_cout;      
input            cp0_yy_clk_en;         
input            cpurst_b;              
input            ctrl_mad_ex_data_sel;  
input            ctrl_mad_ex_sel;       
input            ctrl_mad_oper_mux_en;  
input            decd_mad_inst_div;     
input            decd_mad_inst_divu;    
input            decd_mad_inst_mul;     
input            decd_mad_inst_mulh;    
input            decd_mad_inst_mulhsu;  
input            decd_mad_inst_mulhu;   
input            decd_mad_inst_rem;     
input            decd_mad_inst_remu;    
input            forever_cpuclk;        
input            iu_yy_xx_flush;        
input   [31:0 ]  lsu_iu_mad_buf;        
input   [31:0 ]  oper_mad_rs1;          
input   [31:0 ]  oper_mad_rs2;          
input            pad_yy_gate_clk_en_b;  
input            pad_yy_test_mode;      
input            randclk_mad_mod_en_w2; 
input            retire_mad_ex_cancel;  
input            wb_ctrl_stall;         
output  [4 :0 ]  ifu_iu_ex_cnt;         
output           ifu_iu_ex_split_on;    
output  [31:0 ]  iu_lsu_imm_data;       
output           iu_lsu_imm_write_en;   
output           mad_alu_data_vld;      
output  [31:0 ]  mad_alu_div_rs2;       
output           mad_alu_div_shift;     
output           mad_alu_fst_add;       
output           mad_alu_imm_vld;       
output  [31:0 ]  mad_alu_rs1;           
output           mad_alu_rs1_cst_0;     
output           mad_alu_rs1_vld;       
output           mad_alu_rs2_cst_0;     
output  [31:0 ]  mad_alu_rst;           
output           mad_alu_rst_vld;       
output           mad_ctrl_stall;        
output           mad_ctrl_stall_noinput; 
output           mad_rbus_req;          
reg     [2 :0 ]  cur_st;                
reg     [31:0 ]  mad_internal;          
reg              mad_neg;               
reg              mad_rs1_cst_0;         
reg     [2 :0 ]  nxt_st;                
reg     [4 :0 ]  rst_ff1;               
reg     [4 :0 ]  split_cnt;             
wire             alu_mad_adder_of;      
wire    [31:0 ]  alu_mad_adder_rst;     
wire             alu_mad_rst_cout;      
wire             cnt_en;                
wire             cp0_yy_clk_en;         
wire             cpurst_b;              
wire             ctrl_mad_ex_data_sel;  
wire             ctrl_mad_ex_sel;       
wire             ctrl_mad_oper_mux_en;  
wire             decd_mad_inst_div;     
wire             decd_mad_inst_divu;    
wire             decd_mad_inst_mul;     
wire             decd_mad_inst_mulh;    
wire             decd_mad_inst_mulhsu;  
wire             decd_mad_inst_mulhu;   
wire             decd_mad_inst_rem;     
wire             decd_mad_inst_remu;    
wire    [4 :0 ]  div_cnt;               
wire    [31:0 ]  div_ifu_imm;           
wire    [31:0 ]  div_ifu_imm_pre;       
wire             div_neg;               
wire    [31:0 ]  div_quotient;          
wire    [31:0 ]  div_remainder;         
wire             div_rs2_shift;         
wire    [31:0 ]  div_rst;               
wire             div_rst_neg;           
wire    [31:0 ]  div_rst_rev;           
wire    [31:0 ]  div_rst_sel;           
wire             div_single_quotient;   
wire             div_unsigned;          
wire             div_vld;               
wire             div_zero;              
wire    [4 :0 ]  ff1_disp;              
wire             forever_cpuclk;        
wire    [4 :0 ]  ifu_iu_ex_cnt;         
wire             ifu_iu_ex_split_on;    
wire             ifu_iu_mad_idle;       
wire             ifu_iu_mad_pair;       
wire             ifu_iu_mad_split;      
wire             ifu_iu_mad_wfi2;       
wire             ifu_iu_mult_sign;      
wire    [4 :0 ]  iu_ifu_cnt;            
wire             iu_ifu_cnt_write_en;   
wire             iu_ifu_ex_stall;       
wire             iu_ifu_mad_cmplt;      
wire    [31:0 ]  iu_lsu_imm_data;       
wire             iu_lsu_imm_write_en;   
wire             iu_yy_xx_flush;        
wire    [31:0 ]  lsu_iu_mad_buf;        
wire             mad_alu_data_vld;      
wire    [31:0 ]  mad_alu_div_rs2;       
wire             mad_alu_div_shift;     
wire             mad_alu_fst_add;       
wire             mad_alu_imm_vld;       
wire    [31:0 ]  mad_alu_rs1;           
wire             mad_alu_rs1_cst_0;     
wire             mad_alu_rs1_vld;       
wire             mad_alu_rs2_cst_0;     
wire    [31:0 ]  mad_alu_rst;           
wire             mad_alu_rst_vld;       
wire             mad_clk;               
wire             mad_clk_en;            
wire             mad_cmplt;             
wire    [4 :0 ]  mad_cnt;               
wire             mad_ctrl_stall;        
wire             mad_ctrl_stall_noinput; 
wire    [31:0 ]  mad_ff1_src;           
wire             mad_pair;              
wire             mad_pair_mult_sign;    
wire             mad_pair_vld;          
wire             mad_rbus_req;          
wire    [31:0 ]  mad_rs1;               
wire    [31:0 ]  mad_rs1_abs;           
wire             mad_rs1_abs_sel;       
wire    [31:0 ]  mad_rs1_fin;           
wire    [31:0 ]  mad_rs2;               
wire    [31:0 ]  mad_rs2_abs;           
wire             mad_rs2_abs_sel;       
wire    [31:00]  mad_rs2_fin;           
wire             mad_vld_no_cancel;     
wire             mls_cmplt;             
wire             mls_vld_no_cancel;     
wire             mulh_vld;              
wire             mult_add_one;          
wire             mult_fst_vld;          
wire    [31:0 ]  mult_high_data;        
wire    [31:0 ]  mult_high_rst;         
wire    [31:0 ]  mult_ifu_imm;          
wire    [31:0 ]  mult_low_rst;          
wire             mult_neg;              
wire    [31:0 ]  mult_reverse;          
wire    [31:0 ]  mult_rst;              
wire    [31:0 ]  mult_rst_fin;          
wire    [31:0 ]  mult_rst_pre;          
wire             mult_vld;              
wire             mult_zero;             
wire    [31:0 ]  oper_mad_rs1;          
wire    [31:0 ]  oper_mad_rs2;          
wire             pad_yy_gate_clk_en_b;  
wire             pad_yy_test_mode;      
wire             quot_zero;             
wire             randclk_mad_mod_en_w2; 
wire             rem_vld;               
wire             retire_mad_ex_cancel;  
wire             rs1_eqlz;              
wire    [4 :0 ]  rs1_ff1_rst;           
wire             rs2_eqlz;              
wire    [4 :0 ]  rs2_ff1_rst;           
wire             sm_upd_clk;            
wire             sm_upd_en;             
wire    [4 :0 ]  split_cnt_dec;         
wire             split_cnt_en;          
wire    [4 :0 ]  split_cnt_inc;         
wire             split_cnt_offset;      
wire             split_cnt_rst;         
wire             split_cnt_upd_clk;     
wire             split_cnt_upd_en;      
wire             split_cnt_write_en;    
wire             split_last;            
wire             split_last_noinput;    
wire             split_mad_cmplt;       
wire             split_on;              
wire             split_xx_stall;        
wire             wb_ctrl_stall;         
assign mad_rs1_abs_sel   = !(decd_mad_inst_mulhu || div_unsigned) && mad_rs1[31]; 
assign mad_cnt[4:0] = {5{ctrl_mad_oper_mux_en}} & split_cnt[4:0];
always @( mad_rs2_fin[01:00]
       or mad_rs2_fin[20:16]
       or mad_cnt[4:0]
       or mad_rs2_fin[31:21]
       or mad_rs2_fin[12:00]
       or mad_rs2_fin[16:09])
begin
  case(mad_cnt[4:0])
    5'd31 : mad_rs1_cst_0 = mad_rs2_fin[31];
    5'd30 : mad_rs1_cst_0 = mad_rs2_fin[30];
    5'd29 : mad_rs1_cst_0 = mad_rs2_fin[29];
    5'd28 : mad_rs1_cst_0 = mad_rs2_fin[28];
    5'd27 : mad_rs1_cst_0 = mad_rs2_fin[27];
    5'd26 : mad_rs1_cst_0 = mad_rs2_fin[26];
    5'd25 : mad_rs1_cst_0 = mad_rs2_fin[25];
    5'd24 : mad_rs1_cst_0 = mad_rs2_fin[24];
    5'd23 : mad_rs1_cst_0 = mad_rs2_fin[23];
    5'd22 : mad_rs1_cst_0 = mad_rs2_fin[22];
    5'd21 : mad_rs1_cst_0 = mad_rs2_fin[21];
    5'd20 : mad_rs1_cst_0 = mad_rs2_fin[20];
    5'd19 : mad_rs1_cst_0 = mad_rs2_fin[19];
    5'd18 : mad_rs1_cst_0 = mad_rs2_fin[18];
    5'd17 : mad_rs1_cst_0 = mad_rs2_fin[17];
    5'd16 : mad_rs1_cst_0 = mad_rs2_fin[16];
    5'd15 : mad_rs1_cst_0 = mad_rs2_fin[15];
    5'd14 : mad_rs1_cst_0 = mad_rs2_fin[14];
    5'd13 : mad_rs1_cst_0 = mad_rs2_fin[13];
    5'd12 : mad_rs1_cst_0 = mad_rs2_fin[12];
    5'd11 : mad_rs1_cst_0 = mad_rs2_fin[11];
    5'd10 : mad_rs1_cst_0 = mad_rs2_fin[10];
    5'd9  : mad_rs1_cst_0 = mad_rs2_fin[09];
    5'd8  : mad_rs1_cst_0 = mad_rs2_fin[08];
    5'd7  : mad_rs1_cst_0 = mad_rs2_fin[07];
    5'd6  : mad_rs1_cst_0 = mad_rs2_fin[06];
    5'd5  : mad_rs1_cst_0 = mad_rs2_fin[05];
    5'd4  : mad_rs1_cst_0 = mad_rs2_fin[04];
    5'd3  : mad_rs1_cst_0 = mad_rs2_fin[03];
    5'd2  : mad_rs1_cst_0 = mad_rs2_fin[02];
    5'd1  : mad_rs1_cst_0 = mad_rs2_fin[01];
    5'd0  : mad_rs1_cst_0 = mad_rs2_fin[00];
    default:mad_rs1_cst_0 = 1'bx;
endcase
end
assign mult_fst_vld = ifu_iu_mad_wfi2;
assign mad_alu_rs2_cst_0  = ctrl_mad_ex_data_sel && mult_fst_vld && mult_vld;
assign mad_alu_rs1_cst_0 = ctrl_mad_ex_data_sel && mult_vld 
                        && (!mad_rs1_cst_0 || mult_fst_vld);
assign mad_alu_imm_vld   = ctrl_mad_ex_data_sel && mult_vld && !mult_fst_vld;
assign mult_low_rst[31:0]   = mad_pair ? lsu_iu_mad_buf[31:0] :
                              (mult_vld && rst_ff1[4:0] == 5'b0) ? mad_rs1_fin[31:0]
                              : alu_mad_adder_rst[31:0];
assign mult_high_rst[31:0]  = rst_ff1[4:0] == 5'b0 ? 32'b0 : (mad_internal[31:0] + alu_mad_adder_of);
assign mult_high_data[31:0] = {mult_high_rst[30:0], alu_mad_adder_rst[31]};
assign mult_ifu_imm[31:0] = (mult_fst_vld && mult_vld && rst_ff1[4:0] == 5'b0) 
                           ? mad_rs1_fin[31:0] : split_on ? 
                            {alu_mad_adder_rst[30:0], 1'b0}
                           : alu_mad_adder_rst[31:0];
assign mult_zero = rs1_eqlz || rs2_eqlz;
assign mult_neg = mad_pair ? mad_neg : 
                 (decd_mad_inst_mulh || decd_mad_inst_mul)
                  && (mad_rs1[31] ^ mad_rs2[31])
               || decd_mad_inst_mulhsu && mad_rs1[31];
assign mult_rst_pre[31:0] = mulh_vld ? mult_high_rst[31:0] : mult_low_rst[31:0];
assign mult_reverse[31:0] = {32{mult_neg}} ^ mult_rst_pre[31:0];
assign mult_add_one       = mulh_vld ? mult_neg && alu_mad_adder_rst[31:0] == 32'b0 : mult_neg;
assign mult_rst_fin[31:0] = mult_reverse[31:0] + mult_add_one; 
assign mult_rst[31:0] = {32{!mult_zero}} & mult_rst_fin[31:0];
assign iu_lsu_imm_write_en   = ctrl_mad_ex_sel && (split_on || mulh_vld) && !ifu_iu_mad_pair;
assign mad_clk_en = ctrl_mad_ex_sel;
gated_clk_cell  x_mad_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (mad_clk              ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (mad_clk_en           ),
  .module_en             (randclk_mad_mod_en_w2),
  .pad_yy_gate_clk_en_b  (pad_yy_gate_clk_en_b ),
  .pad_yy_test_mode      (pad_yy_test_mode     )
);
parameter IDLE  = 3'b000,
          WFI1  = 3'b001,
          SPLIT = 3'b010,
          WFI2  = 3'b011,
          PAIR  = 3'b110,
          PAIRS = 3'b111;
assign mad_rs1[31:0] = {32{ctrl_mad_oper_mux_en}} & oper_mad_rs1[31:0];
assign mad_rs2[31:0] = {32{ctrl_mad_oper_mux_en}} & oper_mad_rs2[31:0];
assign mult_vld = decd_mad_inst_mul  || decd_mad_inst_mulhu 
               || decd_mad_inst_mulh || decd_mad_inst_mulhsu;
assign div_vld  = decd_mad_inst_div  || decd_mad_inst_divu 
               || decd_mad_inst_rem  || decd_mad_inst_remu;
assign div_unsigned = decd_mad_inst_divu || decd_mad_inst_remu;
assign rem_vld  = decd_mad_inst_rem  || decd_mad_inst_remu;
assign mulh_vld = decd_mad_inst_mulhu || decd_mad_inst_mulh 
                || decd_mad_inst_mulhsu;
assign mad_rs1_abs[31:0] = ~mad_rs1[31:0] + 1'b1;
assign mad_rs2_abs[31:0] = ~mad_rs2[31:0] + 1'b1;
assign mad_rs1_fin[31:0] = mad_rs1_abs_sel ? mad_rs1_abs[31:0] : mad_rs1[31:0];
assign mad_rs2_abs_sel   = !(decd_mad_inst_mulhu || decd_mad_inst_mulhsu || div_unsigned) && mad_rs2[31]; 
assign mad_rs2_fin[31:0] = mad_rs2_abs_sel ? mad_rs2_abs[31:0] : mad_rs2[31:0];
assign rs1_eqlz = mad_rs1[31:0] == 32'b0;
assign rs2_eqlz = mad_rs2[31:0] == 32'b0;
assign iu_ifu_cnt_write_en = ctrl_mad_ex_sel && (div_vld ? ifu_iu_mad_wfi2
                           : ifu_iu_mad_wfi2);
assign iu_ifu_cnt[4:0]     = mult_vld ? rst_ff1[4:0] : div_cnt[4:0];
assign mad_ff1_src[31:0] = ifu_iu_mad_idle && div_vld ? mad_rs1_fin[31:0] : mad_rs2_fin[31:0];
always @( mad_ff1_src[31:0])
begin
  rst_ff1[4:0] = 5'd0;
  casez(mad_ff1_src[31:0])
  32'b1???????????????????????????????: rst_ff1[4:0] = 5'd31;
  32'b01??????????????????????????????: rst_ff1[4:0] = 5'd30;
  32'b001?????????????????????????????: rst_ff1[4:0] = 5'd29;
  32'b0001????????????????????????????: rst_ff1[4:0] = 5'd28;
  32'b00001???????????????????????????: rst_ff1[4:0] = 5'd27;
  32'b000001??????????????????????????: rst_ff1[4:0] = 5'd26;
  32'b0000001?????????????????????????: rst_ff1[4:0] = 5'd25;
  32'b00000001????????????????????????: rst_ff1[4:0] = 5'd24;
  32'b000000001???????????????????????: rst_ff1[4:0] = 5'd23;
  32'b0000000001??????????????????????: rst_ff1[4:0] = 5'd22;
  32'b00000000001?????????????????????: rst_ff1[4:0] = 5'd21;
  32'b000000000001????????????????????: rst_ff1[4:0] = 5'd20;
  32'b0000000000001???????????????????: rst_ff1[4:0] = 5'd19;
  32'b00000000000001??????????????????: rst_ff1[4:0] = 5'd18;
  32'b000000000000001?????????????????: rst_ff1[4:0] = 5'd17;
  32'b0000000000000001????????????????: rst_ff1[4:0] = 5'd16;
  32'b00000000000000001???????????????: rst_ff1[4:0] = 5'd15;
  32'b000000000000000001??????????????: rst_ff1[4:0] = 5'd14;
  32'b0000000000000000001?????????????: rst_ff1[4:0] = 5'd13;
  32'b00000000000000000001????????????: rst_ff1[4:0] = 5'd12;
  32'b000000000000000000001???????????: rst_ff1[4:0] = 5'd11;
  32'b0000000000000000000001??????????: rst_ff1[4:0] = 5'd10;
  32'b00000000000000000000001?????????: rst_ff1[4:0] = 5'd9;
  32'b000000000000000000000001????????: rst_ff1[4:0] = 5'd8;
  32'b0000000000000000000000001???????: rst_ff1[4:0] = 5'd7;
  32'b00000000000000000000000001??????: rst_ff1[4:0] = 5'd6;
  32'b000000000000000000000000001?????: rst_ff1[4:0] = 5'd5;
  32'b0000000000000000000000000001????: rst_ff1[4:0] = 5'd4;
  32'b00000000000000000000000000001???: rst_ff1[4:0] = 5'd3;
  32'b000000000000000000000000000001??: rst_ff1[4:0] = 5'd2;
  32'b0000000000000000000000000000001?: rst_ff1[4:0] = 5'd1;
  32'b00000000000000000000000000000001: rst_ff1[4:0] = 5'd0;
  endcase
end
always @ (posedge mad_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mad_internal[31:0] <= 32'b0;
  else if (ctrl_mad_ex_sel && mulh_vld && ifu_iu_mad_wfi2)
    mad_internal[31:0] <= 32'b0;
  else if (ctrl_mad_ex_sel && mulh_vld)
    mad_internal[31:0] <= mult_high_data[31:0];
  else if (ctrl_mad_ex_sel && div_vld && ifu_iu_mad_idle && (quot_zero || div_zero))
    mad_internal[31:0] <= mad_rs1_fin[31:0];
  else if (ctrl_mad_ex_sel && div_vld && ifu_iu_mad_idle)
    mad_internal[31:0] <= {27'b0, rst_ff1[4:0]};
  else if (ctrl_mad_ex_sel && div_vld && ifu_iu_mad_wfi2)
    mad_internal[31:0] <= mad_rs1_fin[31:0];
  else if (ctrl_mad_ex_sel && div_vld && split_on && div_single_quotient && !ifu_iu_mad_pair)
    mad_internal[31:0] <= alu_mad_adder_rst[31:0];
  else
    mad_internal[31:0] <= mad_internal[31:0];
end
assign mad_pair = 1'b0;
always @ (posedge mad_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mad_neg <= 1'b0;
  else if(ifu_iu_mult_sign)
    mad_neg <= 1'b1;
  else if(!split_on)
    mad_neg <= 1'b0;
  else
    mad_neg <= mad_neg;
end
assign div_neg    = !div_unsigned && (mad_rs1[31] ^ mad_rs2[31]) 
                 && !rs1_eqlz;
assign quot_zero = ifu_iu_mad_idle && alu_mad_rst_cout && !rs2_eqlz && alu_mad_adder_rst[31:0] != 32'b0;
assign div_zero = rs2_eqlz;
assign rs1_ff1_rst[4:0] = {5{ifu_iu_mad_wfi2}} & mad_internal[4:0];
assign rs2_ff1_rst[4:0] = rst_ff1[4:0];
assign ff1_disp[4:0] = rs1_ff1_rst[4:0] - rs2_ff1_rst[4:0];
assign div_cnt[4:0] = ff1_disp[4:0];
assign div_rs2_shift = div_vld && ifu_iu_mad_split;
assign div_single_quotient = !alu_mad_rst_cout;
assign div_ifu_imm_pre[31:0] = {32{!ifu_iu_mad_wfi2}} & {lsu_iu_mad_buf[30:0], div_single_quotient};
assign div_ifu_imm[31:0] = {32{!quot_zero}} & div_ifu_imm_pre[31:0] | {32{div_zero}};
assign div_quotient[31:0]  = div_ifu_imm[31:0];
assign div_remainder[31:0] = (quot_zero || div_zero) ? mad_rs1[31:0] : div_single_quotient ? alu_mad_adder_rst[31:0] : mad_internal[31:0];
assign div_rst_sel[31:0] = rem_vld ? div_remainder[31:0] : div_quotient[31:0];
assign div_rst_neg       = rem_vld ? !div_unsigned && mad_rs1[31] && !(quot_zero || div_zero) : div_neg && !rs2_eqlz;
assign div_rst_rev[31:0]  = {32{div_rst_neg}} ^ div_rst_sel[31:0];
assign div_rst[31:0]      = div_rst_rev[31:0] + div_rst_neg;
assign mad_alu_rs1_vld       = div_vld || mult_vld;
assign mad_alu_rs1[31:0]     = div_rs2_shift ? mad_internal[31:0] : mad_rs1_fin[31:0];
assign mad_alu_div_shift     = div_rs2_shift;
assign mad_alu_fst_add       = ifu_iu_mad_idle && mad_rs2_abs_sel;
assign mad_alu_div_rs2[31:0] = mad_rs2_fin[31:0];
assign iu_ifu_mad_cmplt      = 
                               div_vld && ifu_iu_mad_idle && (quot_zero || div_zero)
                               && ctrl_mad_ex_sel;
assign iu_lsu_imm_data[31:0] = div_vld ? div_ifu_imm[31:0] : mult_ifu_imm[31:0];
assign mad_rbus_req   = ctrl_mad_ex_sel && split_mad_cmplt;
assign mad_alu_data_vld = split_mad_cmplt;
assign mad_alu_rst_vld   = mult_vld || div_vld;
assign mad_alu_rst[31:0] = div_vld ? div_rst[31:0] : mult_rst[31:0];
assign iu_ifu_ex_stall = wb_ctrl_stall;
assign ifu_iu_ex_split_on = split_on;
assign mad_ctrl_stall   = split_xx_stall;
assign mad_ctrl_stall_noinput = split_on && !split_last_noinput;
assign split_last_noinput = (cur_st == IDLE)
                        && (mls_vld_no_cancel && mls_cmplt ||
                            mad_vld_no_cancel && iu_ifu_mad_cmplt)
                 || (cur_st == SPLIT)
                        && ((mls_vld_no_cancel  && mls_cmplt) ||
                            (mad_vld_no_cancel && mad_cmplt)
                           )
                 || cur_st[2]
                 || (cur_st == WFI1) && iu_ifu_mad_cmplt
                 || (cur_st == WFI2) && iu_ifu_mad_cmplt;
gated_clk_cell  x_split_cnt_upd_clkhdr (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (split_cnt_upd_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (split_cnt_upd_en    ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
assign split_cnt_upd_en = split_cnt_rst  || split_cnt_en       || split_cnt_write_en; 
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
assign sm_upd_en = retire_mad_ex_cancel  ||
                   mad_vld_no_cancel  ||
                   iu_ifu_cnt_write_en;
assign split_cnt_write_en = iu_ifu_cnt_write_en;
always @(posedge split_cnt_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    split_cnt[4:0] <= 5'b0;
  else if(split_cnt_rst)
    split_cnt[4:0] <= 5'b0;
  else if(split_cnt_write_en)
    split_cnt[4:0] <= iu_ifu_cnt[4:0];
  else if(split_cnt_en)
    split_cnt[4:0] <= cnt_en ? split_cnt_dec[4:0]: split_cnt_inc[4:0];
end
assign split_cnt_inc[4:0] = split_cnt[4:0] + split_cnt_offset;
assign split_cnt_dec[4:0] = split_cnt[4:0] - split_cnt_offset;
assign split_cnt_offset = 1'b1; 
assign ifu_iu_ex_cnt[4:0] = split_cnt[4:0];
assign mls_vld_no_cancel = 1'b0;
assign mls_cmplt = 1'b0;
assign mad_vld_no_cancel = ctrl_mad_ex_sel;
assign split_mad_cmplt    = split_last;
assign mad_pair_vld = 1'b0;
assign mad_pair_mult_sign = 1'b0;
assign mad_cmplt = split_cnt[4:0] == 5'b0;
always @(posedge sm_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_st[2:0] <= IDLE;
  else if(retire_mad_ex_cancel)
    cur_st[2:0] <= IDLE;
  else
    cur_st[2:0] <= nxt_st[2:0];
end
always @( iu_ifu_mad_cmplt
       or mad_cmplt
       or mls_cmplt
       or mls_vld_no_cancel
       or iu_ifu_cnt_write_en
       or mad_pair_mult_sign
       or mad_vld_no_cancel
       or iu_ifu_ex_stall
       or mad_pair_vld
       or cur_st)
begin
case(cur_st)
IDLE:
begin
  nxt_st = IDLE;
  if(iu_ifu_ex_stall)
    nxt_st = IDLE;
  else
  begin      
    case({mls_vld_no_cancel, mad_vld_no_cancel})
      2'b10:
      begin
        if(!mls_cmplt)
           nxt_st = SPLIT;
      end
      2'b01:
      begin
        if(mad_pair_vld)
          if(mad_pair_mult_sign)
            nxt_st = PAIRS;
          else
            nxt_st = PAIR;
        else if(iu_ifu_mad_cmplt)
          nxt_st = IDLE;
        else
          nxt_st = WFI2;
      end
      default;
    endcase
  end
end
WFI1:
begin
  nxt_st = WFI1;
  if(iu_ifu_mad_cmplt)
    nxt_st = IDLE;
  else if(!iu_ifu_ex_stall)
    nxt_st = WFI2;
end
WFI2:
begin
  nxt_st = WFI2;
  if(iu_ifu_mad_cmplt)
    nxt_st = IDLE;
  else if(iu_ifu_cnt_write_en)
  begin
    nxt_st = SPLIT;
  end
end
SPLIT:
begin
  nxt_st = SPLIT;
  case({mls_vld_no_cancel, mad_vld_no_cancel})
    2'b10:
    begin
      if(mls_cmplt)
        nxt_st = IDLE;
    end
    2'b01:
    begin
      if(mad_cmplt)
        nxt_st = IDLE;
    end
    default;
  endcase
end
PAIR:
begin
  nxt_st = IDLE;
end
PAIRS:
begin
  nxt_st = IDLE;
end
default:
  nxt_st = IDLE;
endcase
end
assign split_on = (cur_st != IDLE)
                  || mls_vld_no_cancel || mad_vld_no_cancel;
assign cnt_en = (cur_st == IDLE)
                    && !iu_ifu_ex_stall
                    && ((mls_vld_no_cancel && !mls_cmplt) || mad_vld_no_cancel)
             || (cur_st == SPLIT)
                    && !iu_ifu_ex_stall
                    && ((mls_vld_no_cancel  && !mls_cmplt) ||
                        (mad_vld_no_cancel && !mad_cmplt)
                       );
assign split_last = (cur_st == IDLE)
                        && !iu_ifu_ex_stall
                        && (mls_vld_no_cancel && mls_cmplt ||
                            mad_vld_no_cancel && iu_ifu_mad_cmplt)
                 || (cur_st == SPLIT)
                        && !iu_ifu_ex_stall
                        && ((mls_vld_no_cancel  && mls_cmplt) ||
                            (mad_vld_no_cancel && mad_cmplt)
                           )
                 || cur_st[2]
                 || (cur_st == WFI1) && iu_ifu_mad_cmplt
                 || (cur_st == WFI2) && iu_ifu_mad_cmplt;
assign ifu_iu_mad_idle  = (cur_st == IDLE);
assign ifu_iu_mad_wfi2  = (cur_st == WFI2);
assign ifu_iu_mad_split = (cur_st == SPLIT);
assign ifu_iu_mad_pair  = 1'b0;
assign ifu_iu_mult_sign = 1'b0;
assign split_cnt_rst = split_last       ||
                       iu_yy_xx_flush;
assign split_cnt_en = cnt_en;
assign split_xx_stall = (split_on       && !split_last) ;
endmodule
