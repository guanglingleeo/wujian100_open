/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clic_kid(
  clicintie_updt_vld,
  cpurst_b,
  ctl_xx_prot_sec,
  int_enable_updt_val,
  int_sec_updt_val,
  intcfg_updt_value,
  intcfg_updt_vld,
  kid_arb_int_req,
  kid_arb_int_sec,
  kid_arb_pending_en,
  kid_arb_prio0_mask,
  kid_arb_prio10_mask,
  kid_arb_prio11_mask,
  kid_arb_prio12_mask,
  kid_arb_prio13_mask,
  kid_arb_prio14_mask,
  kid_arb_prio15_mask,
  kid_arb_prio1_mask,
  kid_arb_prio2_mask,
  kid_arb_prio3_mask,
  kid_arb_prio4_mask,
  kid_arb_prio5_mask,
  kid_arb_prio6_mask,
  kid_arb_prio7_mask,
  kid_arb_prio8_mask,
  kid_arb_prio9_mask,
  kid_arb_sample_en,
  kid_xx_ie,
  kid_xx_intcfg,
  kid_xx_ip,
  pad_clic_int_cfg,
  pad_clic_int_vld,
  pending_cpuclk,
  pri_cpuclk,
  regs_cpuclk,
  sample_cpuclk,
  sw_clear_pending,
  sw_set_pending
);
input          clicintie_updt_vld;  
input          cpurst_b;            
input          ctl_xx_prot_sec;     
input          int_enable_updt_val; 
input          int_sec_updt_val;    
input   [7:0]  intcfg_updt_value;   
input          intcfg_updt_vld;     
input          pad_clic_int_cfg;    
input          pad_clic_int_vld;    
input          pending_cpuclk;      
input          pri_cpuclk;          
input          regs_cpuclk;         
input          sample_cpuclk;       
input          sw_clear_pending;    
input          sw_set_pending;      
output         kid_arb_int_req;     
output         kid_arb_int_sec;     
output         kid_arb_pending_en;  
output         kid_arb_prio0_mask;  
output         kid_arb_prio10_mask; 
output         kid_arb_prio11_mask; 
output         kid_arb_prio12_mask; 
output         kid_arb_prio13_mask; 
output         kid_arb_prio14_mask; 
output         kid_arb_prio15_mask; 
output         kid_arb_prio1_mask;  
output         kid_arb_prio2_mask;  
output         kid_arb_prio3_mask;  
output         kid_arb_prio4_mask;  
output         kid_arb_prio5_mask;  
output         kid_arb_prio6_mask;  
output         kid_arb_prio7_mask;  
output         kid_arb_prio8_mask;  
output         kid_arb_prio9_mask;  
output         kid_arb_sample_en;   
output  [7:0]  kid_xx_ie;           
output  [7:0]  kid_xx_intcfg;       
output  [7:0]  kid_xx_ip;           
reg            int_enable;          
reg            int_pending;         
reg            int_pending_updt_val; 
reg     [2:0]  int_priority;        
reg            int_vld_ff;          
wire           clicintie_updt_vld;  
wire           cpurst_b;            
wire           int_cfg;             
wire           int_enable_updt_val; 
wire           int_enable_updt_vld; 
wire           int_level;           
wire           int_pending_updt_vld; 
wire           int_pulse;           
wire           int_vld;             
wire    [7:0]  intcfg_updt_value;   
wire           intcfg_updt_vld;     
wire           kid_arb_int_req;     
wire           kid_arb_int_sec;     
wire           kid_arb_pending_en;  
wire           kid_arb_prio0_mask;  
wire           kid_arb_prio10_mask; 
wire           kid_arb_prio11_mask; 
wire           kid_arb_prio12_mask; 
wire           kid_arb_prio13_mask; 
wire           kid_arb_prio14_mask; 
wire           kid_arb_prio15_mask; 
wire           kid_arb_prio1_mask;  
wire           kid_arb_prio2_mask;  
wire           kid_arb_prio3_mask;  
wire           kid_arb_prio4_mask;  
wire           kid_arb_prio5_mask;  
wire           kid_arb_prio6_mask;  
wire           kid_arb_prio7_mask;  
wire           kid_arb_prio8_mask;  
wire           kid_arb_prio9_mask;  
wire    [7:0]  kid_arb_prio_mask;   
wire           kid_arb_sample_en;   
wire    [7:0]  kid_xx_ie;           
wire    [7:0]  kid_xx_intcfg;       
wire    [7:0]  kid_xx_ip;           
wire           op_en;               
wire           pad_clic_int_cfg;    
wire           pad_clic_int_vld;    
wire           pending_clear;       
wire           pending_cpuclk;      
wire           pending_set;         
wire           pri_cpuclk;          
wire           regs_cpuclk;         
wire           sample_cpuclk;       
wire           sw_clear_pending;    
wire           sw_set_pending;      
   parameter CLICMASK = 8;
   parameter CLICINTBITS = 3;
assign int_vld = pad_clic_int_vld;
assign int_cfg = pad_clic_int_cfg;
assign int_level = int_vld  && !int_cfg;
assign kid_arb_sample_en = (int_vld ^ int_vld_ff);
always@(posedge sample_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    int_vld_ff <= 1'b0;
  else 
    int_vld_ff <= int_vld;
end
assign int_pulse = int_vld && !int_vld_ff;
assign op_en = 1'b1;
assign int_enable_updt_vld = op_en && clicintie_updt_vld;
always@(posedge regs_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    int_enable <= 1'b0;
  else if(int_enable_updt_vld)
    int_enable <= int_enable_updt_val;
  else 
    int_enable <= int_enable;
end
assign pending_set = op_en && (sw_set_pending) && int_cfg ||
                     int_pulse && int_cfg ||
                     int_level ;
assign pending_clear = op_en && sw_clear_pending && int_cfg || (!int_cfg && !int_vld);
assign kid_arb_pending_en = !int_pending & pending_set || 
                             int_pending & pending_clear & !pending_set;
assign int_pending_updt_vld = pending_set || pending_clear;
always @( pending_set
       or pending_clear
       or int_pending)
begin
if (pending_set)
  int_pending_updt_val = 1'b1;
else if (pending_clear)
  int_pending_updt_val = 1'b0;
else
  int_pending_updt_val = int_pending;
end
always@(posedge pending_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    int_pending <= 1'b0;
  else if (int_pending_updt_vld)
    int_pending <= int_pending_updt_val;
  else 
    int_pending <= int_pending;
end
always@(posedge pri_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    int_priority[CLICINTBITS-1:0] <= {CLICINTBITS{1'b0}};
  else if(intcfg_updt_vld && op_en)
    int_priority[CLICINTBITS-1:0] <= intcfg_updt_value[7:8-CLICINTBITS];
end
assign kid_arb_int_req    = int_enable & int_pending;
assign kid_arb_int_sec    = 1'b0;
assign kid_arb_prio_mask[CLICMASK-1:0] = 1'b1 << ({int_priority[CLICINTBITS-1:0]});
assign kid_arb_prio0_mask = kid_arb_prio_mask[0];
assign kid_arb_prio1_mask = kid_arb_prio_mask[1];
assign kid_arb_prio2_mask = kid_arb_prio_mask[2];
assign kid_arb_prio3_mask = kid_arb_prio_mask[3];
assign kid_arb_prio4_mask = kid_arb_prio_mask[4];
assign kid_arb_prio5_mask = kid_arb_prio_mask[5];
assign kid_arb_prio6_mask = kid_arb_prio_mask[6];
assign kid_arb_prio7_mask = kid_arb_prio_mask[7];
assign kid_arb_prio8_mask = 1'b0;
assign kid_arb_prio9_mask = 1'b0;
assign kid_arb_prio10_mask = 1'b0;
assign kid_arb_prio11_mask = 1'b0;
assign kid_arb_prio12_mask = 1'b0;
assign kid_arb_prio13_mask = 1'b0;
assign kid_arb_prio14_mask = 1'b0;
assign kid_arb_prio15_mask = 1'b0;
assign kid_xx_ie[7:0]       = {7'b0,int_enable && op_en};
assign kid_xx_ip[7:0]       = {7'b0,int_pending && op_en};
assign kid_xx_intcfg[7:0]   = {int_priority[CLICINTBITS-1:0] & {CLICINTBITS{op_en}},{(8-CLICINTBITS){1'b1}}&{(8-CLICINTBITS){op_en}}};
endmodule
