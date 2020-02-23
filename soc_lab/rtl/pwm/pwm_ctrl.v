/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pwm_ctrl(
  cap01t,
  cap01t_h,
  cap0cntic,
  cap0cntie,
  cap0en,
  cap0eventa,
  cap0match,
  cap0mode,
  cap0timic,
  cap0timie,
  cap1cntic,
  cap1cntie,
  cap1en,
  cap1eventa,
  cap1match,
  cap1mode,
  cap1timic,
  cap1timie,
  cap23t,
  cap23t_h,
  cap2cntic,
  cap2cntie,
  cap2en,
  cap2eventa,
  cap2match,
  cap2mode,
  cap2timic,
  cap2timie,
  cap3cntic,
  cap3cntie,
  cap3en,
  cap3eventa,
  cap3match,
  cap3mode,
  cap3timic,
  cap3timie,
  cap45t,
  cap45t_h,
  cap4cntic,
  cap4cntie,
  cap4en,
  cap4eventa,
  cap4match,
  cap4mode,
  cap4timic,
  cap4timie,
  cap5cntic,
  cap5cntie,
  cap5en,
  cap5eventa,
  cap5match,
  cap5mode,
  cap5timic,
  cap5timie,
  capis,
  capris,
  cnt0val,
  cnt1val,
  cnt2val,
  cnt3val,
  cnt4val,
  cnt5val,
  cntdiv,
  cntdiven,
  compa_val_0,
  compa_val_1,
  compa_val_2,
  compa_val_3,
  compa_val_4,
  compa_val_5,
  compb_val_0,
  compb_val_1,
  compb_val_2,
  compb_val_3,
  compb_val_4,
  compb_val_5,
  db0en,
  db1en,
  db2en,
  db3en,
  db4en,
  db5en,
  delay0,
  delay1,
  delay2,
  delay3,
  delay4,
  delay5,
  fault,
  i_capture_0,
  i_capture_10,
  i_capture_2,
  i_capture_4,
  i_capture_6,
  i_capture_8,
  int0encmpad,
  int0encmpau,
  int0encmpbd,
  int0encmpbu,
  int0encntload,
  int0encntzero,
  int1encmpad,
  int1encmpau,
  int1encmpbd,
  int1encmpbu,
  int1encntload,
  int1encntzero,
  int2encmpad,
  int2encmpau,
  int2encmpbd,
  int2encmpbu,
  int2encntload,
  int2encntzero,
  int3encmpad,
  int3encmpau,
  int3encmpbd,
  int3encmpbu,
  int3encntload,
  int3encntzero,
  int4encmpad,
  int4encmpau,
  int4encmpbd,
  int4encmpbu,
  int4encntload,
  int4encntzero,
  int5encmpad,
  int5encmpau,
  int5encmpbd,
  int5encmpbu,
  int5encntload,
  int5encntzero,
  intenfault,
  intic0cmpad,
  intic0cmpau,
  intic0cmpbd,
  intic0cmpbu,
  intic0cntload,
  intic0cntzero,
  intic1cmpad,
  intic1cmpau,
  intic1cmpbd,
  intic1cmpbu,
  intic1cntload,
  intic1cntzero,
  intic2cmpad,
  intic2cmpau,
  intic2cmpbd,
  intic2cmpbu,
  intic2cntload,
  intic2cntzero,
  intic3cmpad,
  intic3cmpau,
  intic3cmpbd,
  intic3cmpbu,
  intic3cntload,
  intic3cntzero,
  intic4cmpad,
  intic4cmpau,
  intic4cmpbd,
  intic4cmpbu,
  intic4cntload,
  intic4cntzero,
  intic5cmpad,
  intic5cmpau,
  intic5cmpbd,
  intic5cmpbu,
  intic5cntload,
  intic5cntzero,
  inticfault,
  pclk,
  presetn,
  pwm01count,
  pwm01count_h,
  pwm0en,
  pwm0inv,
  pwm0load,
  pwm0mode,
  pwm0trig_val,
  pwm10en,
  pwm10inv,
  pwm11en,
  pwm11inv,
  pwm1en,
  pwm1inv,
  pwm1load,
  pwm1mode,
  pwm1trig_val,
  pwm23count,
  pwm23count_h,
  pwm2en,
  pwm2inv,
  pwm2load,
  pwm2mode,
  pwm2trig_val,
  pwm3en,
  pwm3inv,
  pwm3load,
  pwm3mode,
  pwm3trig_val,
  pwm45count,
  pwm45count_h,
  pwm4en,
  pwm4inv,
  pwm4load,
  pwm4mode,
  pwm4trig_val,
  pwm5en,
  pwm5inv,
  pwm5load,
  pwm5mode,
  pwm5trig_val,
  pwm6en,
  pwm6inv,
  pwm7en,
  pwm7inv,
  pwm8en,
  pwm8inv,
  pwm9en,
  pwm9inv,
  pwm_0_oe,
  pwm_0_out,
  pwm_10_oe,
  pwm_10_out,
  pwm_11_oe,
  pwm_11_out,
  pwm_1_oe,
  pwm_1_out,
  pwm_2_oe,
  pwm_2_out,
  pwm_3_oe,
  pwm_3_out,
  pwm_4_oe,
  pwm_4_out,
  pwm_5_oe,
  pwm_5_out,
  pwm_6_oe,
  pwm_6_out,
  pwm_7_oe,
  pwm_7_out,
  pwm_8_oe,
  pwm_8_out,
  pwm_9_oe,
  pwm_9_out,
  pwm_idle,
  pwm_tim0_etb_trig,
  pwm_tim1_etb_trig,
  pwm_tim2_etb_trig,
  pwm_tim3_etb_trig,
  pwm_tim4_etb_trig,
  pwm_tim5_etb_trig,
  pwm_xx_trig,
  pwmint,
  pwmis1,
  pwmis2,
  pwmris1,
  pwmris2,
  sync0mode,
  sync1mode,
  sync2mode,
  sync3mode,
  sync4mode,
  sync5mode,
  test_mode,
  tim01count,
  tim01count_h,
  tim0en,
  tim0ic,
  tim0ie,
  tim0load,
  tim1en,
  tim1ic,
  tim1ie,
  tim1load,
  tim23count,
  tim23count_h,
  tim2en,
  tim2ic,
  tim2ie,
  tim2load,
  tim3en,
  tim3ic,
  tim3ie,
  tim3load,
  tim45count,
  tim45count_h,
  tim4en,
  tim4ic,
  tim4ie,
  tim4load,
  tim5en,
  tim5ic,
  tim5ie,
  tim5load,
  timis,
  timris,
  tr0end,
  tr0enu,
  tr1end,
  tr1enu,
  tr2end,
  tr2enu,
  tr3end,
  tr3enu,
  tr4end,
  tr4enu,
  tr5end,
  tr5enu,
  triginv
);
input           cap0cntic;          
input           cap0cntie;          
input           cap0en;             
input   [1 :0]  cap0eventa;         
input   [31:0]  cap0match;          
input           cap0mode;           
input           cap0timic;          
input           cap0timie;          
input           cap1cntic;          
input           cap1cntie;          
input           cap1en;             
input   [1 :0]  cap1eventa;         
input   [31:0]  cap1match;          
input           cap1mode;           
input           cap1timic;          
input           cap1timie;          
input           cap2cntic;          
input           cap2cntie;          
input           cap2en;             
input   [1 :0]  cap2eventa;         
input   [31:0]  cap2match;          
input           cap2mode;           
input           cap2timic;          
input           cap2timie;          
input           cap3cntic;          
input           cap3cntie;          
input           cap3en;             
input   [1 :0]  cap3eventa;         
input   [31:0]  cap3match;          
input           cap3mode;           
input           cap3timic;          
input           cap3timie;          
input           cap4cntic;          
input           cap4cntie;          
input           cap4en;             
input   [1 :0]  cap4eventa;         
input   [31:0]  cap4match;          
input           cap4mode;           
input           cap4timic;          
input           cap4timie;          
input           cap5cntic;          
input           cap5cntie;          
input           cap5en;             
input   [1 :0]  cap5eventa;         
input   [31:0]  cap5match;          
input           cap5mode;           
input           cap5timic;          
input           cap5timie;          
input   [2 :0]  cntdiv;             
input           cntdiven;           
input   [31:0]  compa_val_0;        
input   [31:0]  compa_val_1;        
input   [31:0]  compa_val_2;        
input   [31:0]  compa_val_3;        
input   [31:0]  compa_val_4;        
input   [31:0]  compa_val_5;        
input   [31:0]  compb_val_0;        
input   [31:0]  compb_val_1;        
input   [31:0]  compb_val_2;        
input   [31:0]  compb_val_3;        
input   [31:0]  compb_val_4;        
input   [31:0]  compb_val_5;        
input           db0en;              
input           db1en;              
input           db2en;              
input           db3en;              
input           db4en;              
input           db5en;              
input   [11:0]  delay0;             
input   [11:0]  delay1;             
input   [11:0]  delay2;             
input   [11:0]  delay3;             
input   [11:0]  delay4;             
input   [11:0]  delay5;             
input           fault;              
input           i_capture_0;        
input           i_capture_10;       
input           i_capture_2;        
input           i_capture_4;        
input           i_capture_6;        
input           i_capture_8;        
input           int0encmpad;        
input           int0encmpau;        
input           int0encmpbd;        
input           int0encmpbu;        
input           int0encntload;      
input           int0encntzero;      
input           int1encmpad;        
input           int1encmpau;        
input           int1encmpbd;        
input           int1encmpbu;        
input           int1encntload;      
input           int1encntzero;      
input           int2encmpad;        
input           int2encmpau;        
input           int2encmpbd;        
input           int2encmpbu;        
input           int2encntload;      
input           int2encntzero;      
input           int3encmpad;        
input           int3encmpau;        
input           int3encmpbd;        
input           int3encmpbu;        
input           int3encntload;      
input           int3encntzero;      
input           int4encmpad;        
input           int4encmpau;        
input           int4encmpbd;        
input           int4encmpbu;        
input           int4encntload;      
input           int4encntzero;      
input           int5encmpad;        
input           int5encmpau;        
input           int5encmpbd;        
input           int5encmpbu;        
input           int5encntload;      
input           int5encntzero;      
input           intenfault;         
input           intic0cmpad;        
input           intic0cmpau;        
input           intic0cmpbd;        
input           intic0cmpbu;        
input           intic0cntload;      
input           intic0cntzero;      
input           intic1cmpad;        
input           intic1cmpau;        
input           intic1cmpbd;        
input           intic1cmpbu;        
input           intic1cntload;      
input           intic1cntzero;      
input           intic2cmpad;        
input           intic2cmpau;        
input           intic2cmpbd;        
input           intic2cmpbu;        
input           intic2cntload;      
input           intic2cntzero;      
input           intic3cmpad;        
input           intic3cmpau;        
input           intic3cmpbd;        
input           intic3cmpbu;        
input           intic3cntload;      
input           intic3cntzero;      
input           intic4cmpad;        
input           intic4cmpau;        
input           intic4cmpbd;        
input           intic4cmpbu;        
input           intic4cntload;      
input           intic4cntzero;      
input           intic5cmpad;        
input           intic5cmpau;        
input           intic5cmpbd;        
input           intic5cmpbu;        
input           intic5cntload;      
input           intic5cntzero;      
input           inticfault;         
input           pclk;               
input           presetn;            
input           pwm0en;             
input           pwm0inv;            
input   [31:0]  pwm0load;           
input           pwm0mode;           
input   [31:0]  pwm0trig_val;       
input           pwm10en;            
input           pwm10inv;           
input           pwm11en;            
input           pwm11inv;           
input           pwm1en;             
input           pwm1inv;            
input   [31:0]  pwm1load;           
input           pwm1mode;           
input   [31:0]  pwm1trig_val;       
input           pwm2en;             
input           pwm2inv;            
input   [31:0]  pwm2load;           
input           pwm2mode;           
input   [31:0]  pwm2trig_val;       
input           pwm3en;             
input           pwm3inv;            
input   [31:0]  pwm3load;           
input           pwm3mode;           
input   [31:0]  pwm3trig_val;       
input           pwm4en;             
input           pwm4inv;            
input   [31:0]  pwm4load;           
input           pwm4mode;           
input   [31:0]  pwm4trig_val;       
input           pwm5en;             
input           pwm5inv;            
input   [31:0]  pwm5load;           
input           pwm5mode;           
input   [31:0]  pwm5trig_val;       
input           pwm6en;             
input           pwm6inv;            
input           pwm7en;             
input           pwm7inv;            
input           pwm8en;             
input           pwm8inv;            
input           pwm9en;             
input           pwm9inv;            
input   [1 :0]  sync0mode;          
input   [1 :0]  sync1mode;          
input   [1 :0]  sync2mode;          
input   [1 :0]  sync3mode;          
input   [1 :0]  sync4mode;          
input   [1 :0]  sync5mode;          
input           test_mode;          
input           tim0en;             
input           tim0ic;             
input           tim0ie;             
input   [31:0]  tim0load;           
input           tim1en;             
input           tim1ic;             
input           tim1ie;             
input   [31:0]  tim1load;           
input           tim2en;             
input           tim2ic;             
input           tim2ie;             
input   [31:0]  tim2load;           
input           tim3en;             
input           tim3ic;             
input           tim3ie;             
input   [31:0]  tim3load;           
input           tim4en;             
input           tim4ic;             
input           tim4ie;             
input   [31:0]  tim4load;           
input           tim5en;             
input           tim5ic;             
input           tim5ie;             
input   [31:0]  tim5load;           
input           tr0end;             
input           tr0enu;             
input           tr1end;             
input           tr1enu;             
input           tr2end;             
input           tr2enu;             
input           tr3end;             
input           tr3enu;             
input           tr4end;             
input           tr4enu;             
input           tr5end;             
input           tr5enu;             
input           triginv;            
output  [31:0]  cap01t;             
output  [31:0]  cap01t_h;           
output  [31:0]  cap23t;             
output  [31:0]  cap23t_h;           
output  [31:0]  cap45t;             
output  [31:0]  cap45t_h;           
output  [31:0]  capis;              
output  [31:0]  capris;             
output  [31:0]  cnt0val;            
output  [31:0]  cnt1val;            
output  [31:0]  cnt2val;            
output  [31:0]  cnt3val;            
output  [31:0]  cnt4val;            
output  [31:0]  cnt5val;            
output  [31:0]  pwm01count;         
output  [31:0]  pwm01count_h;       
output  [31:0]  pwm23count;         
output  [31:0]  pwm23count_h;       
output  [31:0]  pwm45count;         
output  [31:0]  pwm45count_h;       
output          pwm_0_oe;           
output          pwm_0_out;          
output          pwm_10_oe;          
output          pwm_10_out;         
output          pwm_11_oe;          
output          pwm_11_out;         
output          pwm_1_oe;           
output          pwm_1_out;          
output          pwm_2_oe;           
output          pwm_2_out;          
output          pwm_3_oe;           
output          pwm_3_out;          
output          pwm_4_oe;           
output          pwm_4_out;          
output          pwm_5_oe;           
output          pwm_5_out;          
output          pwm_6_oe;           
output          pwm_6_out;          
output          pwm_7_oe;           
output          pwm_7_out;          
output          pwm_8_oe;           
output          pwm_8_out;          
output          pwm_9_oe;           
output          pwm_9_out;          
output          pwm_idle;           
output          pwm_tim0_etb_trig;  
output          pwm_tim1_etb_trig;  
output          pwm_tim2_etb_trig;  
output          pwm_tim3_etb_trig;  
output          pwm_tim4_etb_trig;  
output          pwm_tim5_etb_trig;  
output          pwm_xx_trig;        
output          pwmint;             
output  [31:0]  pwmis1;             
output  [31:0]  pwmis2;             
output  [31:0]  pwmris1;            
output  [31:0]  pwmris2;            
output  [31:0]  tim01count;         
output  [31:0]  tim01count_h;       
output  [31:0]  tim23count;         
output  [31:0]  tim23count_h;       
output  [31:0]  tim45count;         
output  [31:0]  tim45count_h;       
output  [31:0]  timis;              
output  [31:0]  timris;             
reg             cap0en_d;           
reg             cap1en_d;           
reg             cap2en_d;           
reg             cap3en_d;           
reg             cap4en_d;           
reg             cap5en_d;           
reg     [6 :0]  clkcnt;             
reg             clkdiv_en;          
reg     [6 :0]  clkspec;            
reg             int_fault;          
reg             pwm0en_d;           
reg             pwm10en_d;          
reg             pwm11en_d;          
reg             pwm1en_d;           
reg             pwm2en_d;           
reg             pwm3en_d;           
reg             pwm4en_d;           
reg             pwm5en_d;           
reg             pwm6en_d;           
reg             pwm7en_d;           
reg             pwm8en_d;           
reg             pwm9en_d;           
reg             tim0en_d;           
reg             tim1en_d;           
reg             tim2en_d;           
reg             tim3en_d;           
reg             tim4en_d;           
reg             tim5en_d;           
wire    [31:0]  cap01t;             
wire    [31:0]  cap01t_h;           
wire            cap0cntic;          
wire            cap0cntie;          
wire            cap0en;             
wire    [1 :0]  cap0eventa;         
wire    [31:0]  cap0match;          
wire            cap0mode;           
wire            cap0timic;          
wire            cap0timie;          
wire            cap1cntic;          
wire            cap1cntie;          
wire            cap1en;             
wire    [1 :0]  cap1eventa;         
wire    [31:0]  cap1match;          
wire            cap1mode;           
wire            cap1timic;          
wire            cap1timie;          
wire    [31:0]  cap23t;             
wire    [31:0]  cap23t_h;           
wire            cap2cntic;          
wire            cap2cntie;          
wire            cap2en;             
wire    [1 :0]  cap2eventa;         
wire    [31:0]  cap2match;          
wire            cap2mode;           
wire            cap2timic;          
wire            cap2timie;          
wire            cap3cntic;          
wire            cap3cntie;          
wire            cap3en;             
wire    [1 :0]  cap3eventa;         
wire    [31:0]  cap3match;          
wire            cap3mode;           
wire            cap3timic;          
wire            cap3timie;          
wire    [31:0]  cap45t;             
wire    [31:0]  cap45t_h;           
wire            cap4cntic;          
wire            cap4cntie;          
wire            cap4en;             
wire    [1 :0]  cap4eventa;         
wire    [31:0]  cap4match;          
wire            cap4mode;           
wire            cap4timic;          
wire            cap4timie;          
wire            cap5cntic;          
wire            cap5cntie;          
wire            cap5en;             
wire    [1 :0]  cap5eventa;         
wire    [31:0]  cap5match;          
wire            cap5mode;           
wire            cap5timic;          
wire            cap5timie;          
wire    [31:0]  cap_cnt_0;          
wire    [31:0]  cap_cnt_1;          
wire    [31:0]  cap_cnt_2;          
wire    [31:0]  cap_cnt_3;          
wire    [31:0]  cap_cnt_4;          
wire    [31:0]  cap_cnt_5;          
wire    [31:0]  capis;              
wire    [31:0]  capris;             
wire            clk_sel;            
wire            clkdiv;             
wire            clkdiv_temux;       
wire            clksrc;             
wire            clksrc_tmp;         
wire    [31:0]  cnt0val;            
wire    [31:0]  cnt1val;            
wire    [31:0]  cnt2val;            
wire    [31:0]  cnt3val;            
wire    [31:0]  cnt4val;            
wire    [31:0]  cnt5val;            
wire    [2 :0]  cntdiv;             
wire            cntdiven;           
wire    [31:0]  compa_val_0;        
wire    [31:0]  compa_val_1;        
wire    [31:0]  compa_val_2;        
wire    [31:0]  compa_val_3;        
wire    [31:0]  compa_val_4;        
wire    [31:0]  compa_val_5;        
wire    [31:0]  compb_val_0;        
wire    [31:0]  compb_val_1;        
wire    [31:0]  compb_val_2;        
wire    [31:0]  compb_val_3;        
wire    [31:0]  compb_val_4;        
wire    [31:0]  compb_val_5;        
wire            ctrl_clk;           
wire            db0en;              
wire            db1en;              
wire            db2en;              
wire            db3en;              
wire            db4en;              
wire            db5en;              
wire    [11:0]  delay0;             
wire    [11:0]  delay1;             
wire    [11:0]  delay2;             
wire    [11:0]  delay3;             
wire    [11:0]  delay4;             
wire    [11:0]  delay5;             
wire            fault;              
wire            i_capture_0;        
wire            i_capture_10;       
wire            i_capture_2;        
wire            i_capture_4;        
wire            i_capture_6;        
wire            i_capture_8;        
wire            int0encmpad;        
wire            int0encmpau;        
wire            int0encmpbd;        
wire            int0encmpbu;        
wire            int0encntload;      
wire            int0encntzero;      
wire            int1encmpad;        
wire            int1encmpau;        
wire            int1encmpbd;        
wire            int1encmpbu;        
wire            int1encntload;      
wire            int1encntzero;      
wire            int2encmpad;        
wire            int2encmpau;        
wire            int2encmpbd;        
wire            int2encmpbu;        
wire            int2encntload;      
wire            int2encntzero;      
wire            int3encmpad;        
wire            int3encmpau;        
wire            int3encmpbd;        
wire            int3encmpbu;        
wire            int3encntload;      
wire            int3encntzero;      
wire            int4encmpad;        
wire            int4encmpau;        
wire            int4encmpbd;        
wire            int4encmpbu;        
wire            int4encntload;      
wire            int4encntzero;      
wire            int5encmpad;        
wire            int5encmpau;        
wire            int5encmpbd;        
wire            int5encmpbu;        
wire            int5encntload;      
wire            int5encntzero;      
wire            int_cap0_cnt_add;   
wire            int_cap0_cnt_match; 
wire            int_cap1_cnt_add;   
wire            int_cap1_cnt_match; 
wire            int_cap2_cnt_add;   
wire            int_cap2_cnt_match; 
wire            int_cap3_cnt_add;   
wire            int_cap3_cnt_match; 
wire            int_cap4_cnt_add;   
wire            int_cap4_cnt_match; 
wire            int_cap5_cnt_add;   
wire            int_cap5_cnt_match; 
wire            int_pwm0_cnt_load;  
wire            int_pwm0_cnt_zero;  
wire            int_pwm0_compa_down; 
wire            int_pwm0_compa_up;  
wire            int_pwm0_compb_down; 
wire            int_pwm0_compb_up;  
wire            int_pwm1_cnt_load;  
wire            int_pwm1_cnt_zero;  
wire            int_pwm1_compa_down; 
wire            int_pwm1_compa_up;  
wire            int_pwm1_compb_down; 
wire            int_pwm1_compb_up;  
wire            int_pwm2_cnt_load;  
wire            int_pwm2_cnt_zero;  
wire            int_pwm2_compa_down; 
wire            int_pwm2_compa_up;  
wire            int_pwm2_compb_down; 
wire            int_pwm2_compb_up;  
wire            int_pwm3_cnt_load;  
wire            int_pwm3_cnt_zero;  
wire            int_pwm3_compa_down; 
wire            int_pwm3_compa_up;  
wire            int_pwm3_compb_down; 
wire            int_pwm3_compb_up;  
wire            int_pwm4_cnt_load;  
wire            int_pwm4_cnt_zero;  
wire            int_pwm4_compa_down; 
wire            int_pwm4_compa_up;  
wire            int_pwm4_compb_down; 
wire            int_pwm4_compb_up;  
wire            int_pwm5_cnt_load;  
wire            int_pwm5_cnt_zero;  
wire            int_pwm5_compa_down; 
wire            int_pwm5_compa_up;  
wire            int_pwm5_compb_down; 
wire            int_pwm5_compb_up;  
wire            int_tim0_cnt_match; 
wire            int_tim1_cnt_match; 
wire            int_tim2_cnt_match; 
wire            int_tim3_cnt_match; 
wire            int_tim4_cnt_match; 
wire            int_tim5_cnt_match; 
wire            intenfault;         
wire            intic0cmpad;        
wire            intic0cmpau;        
wire            intic0cmpbd;        
wire            intic0cmpbu;        
wire            intic0cntload;      
wire            intic0cntzero;      
wire            intic1cmpad;        
wire            intic1cmpau;        
wire            intic1cmpbd;        
wire            intic1cmpbu;        
wire            intic1cntload;      
wire            intic1cntzero;      
wire            intic2cmpad;        
wire            intic2cmpau;        
wire            intic2cmpbd;        
wire            intic2cmpbu;        
wire            intic2cntload;      
wire            intic2cntzero;      
wire            intic3cmpad;        
wire            intic3cmpau;        
wire            intic3cmpbd;        
wire            intic3cmpbu;        
wire            intic3cntload;      
wire            intic3cntzero;      
wire            intic4cmpad;        
wire            intic4cmpau;        
wire            intic4cmpbd;        
wire            intic4cmpbu;        
wire            intic4cntload;      
wire            intic4cntzero;      
wire            intic5cmpad;        
wire            intic5cmpau;        
wire            intic5cmpbd;        
wire            intic5cmpbu;        
wire            intic5cntload;      
wire            intic5cntzero;      
wire            inticfault;         
wire            pclk;               
wire            presetn;            
wire    [31:0]  pwm01count;         
wire    [31:0]  pwm01count_h;       
wire            pwm0_int;           
wire            pwm0en;             
wire            pwm0inv;            
wire    [31:0]  pwm0load;           
wire            pwm0mode;           
wire    [31:0]  pwm0trig_val;       
wire            pwm10en;            
wire            pwm10inv;           
wire            pwm11en;            
wire            pwm11inv;           
wire            pwm1_int;           
wire            pwm1en;             
wire            pwm1inv;            
wire    [31:0]  pwm1load;           
wire            pwm1mode;           
wire    [31:0]  pwm1trig_val;       
wire    [31:0]  pwm23count;         
wire    [31:0]  pwm23count_h;       
wire            pwm2_int;           
wire            pwm2en;             
wire            pwm2inv;            
wire    [31:0]  pwm2load;           
wire            pwm2mode;           
wire    [31:0]  pwm2trig_val;       
wire            pwm3_int;           
wire            pwm3en;             
wire            pwm3inv;            
wire    [31:0]  pwm3load;           
wire            pwm3mode;           
wire    [31:0]  pwm3trig_val;       
wire    [31:0]  pwm45count;         
wire    [31:0]  pwm45count_h;       
wire            pwm4_int;           
wire            pwm4en;             
wire            pwm4inv;            
wire    [31:0]  pwm4load;           
wire            pwm4mode;           
wire    [31:0]  pwm4trig_val;       
wire            pwm5_int;           
wire            pwm5en;             
wire            pwm5inv;            
wire    [31:0]  pwm5load;           
wire            pwm5mode;           
wire    [31:0]  pwm5trig_val;       
wire            pwm6en;             
wire            pwm6inv;            
wire            pwm7en;             
wire            pwm7inv;            
wire            pwm8en;             
wire            pwm8inv;            
wire            pwm9en;             
wire            pwm9inv;            
wire            pwm_0_oe;           
wire            pwm_0_out;          
wire            pwm_10_oe;          
wire            pwm_10_out;         
wire            pwm_11_oe;          
wire            pwm_11_out;         
wire            pwm_1_oe;           
wire            pwm_1_out;          
wire            pwm_2_oe;           
wire            pwm_2_out;          
wire            pwm_3_oe;           
wire            pwm_3_out;          
wire            pwm_4_oe;           
wire            pwm_4_out;          
wire            pwm_5_oe;           
wire            pwm_5_out;          
wire            pwm_6_oe;           
wire            pwm_6_out;          
wire            pwm_7_oe;           
wire            pwm_7_out;          
wire            pwm_8_oe;           
wire            pwm_8_out;          
wire            pwm_9_oe;           
wire            pwm_9_out;          
wire    [31:0]  pwm_cnt_0;          
wire    [31:0]  pwm_cnt_1;          
wire    [31:0]  pwm_cnt_2;          
wire    [31:0]  pwm_cnt_3;          
wire    [31:0]  pwm_cnt_4;          
wire    [31:0]  pwm_cnt_5;          
wire            pwm_idle;           
wire            pwm_tim0_etb_trig;  
wire            pwm_tim1_etb_trig;  
wire            pwm_tim2_etb_trig;  
wire            pwm_tim3_etb_trig;  
wire            pwm_tim4_etb_trig;  
wire            pwm_tim5_etb_trig;  
wire            pwm_xx_trig;        
wire            pwm_xx_trig_pre;    
wire            pwmint;             
wire    [31:0]  pwmis1;             
wire    [31:0]  pwmis2;             
wire    [31:0]  pwmris1;            
wire    [31:0]  pwmris2;            
wire    [1 :0]  sync0mode;          
wire    [1 :0]  sync1mode;          
wire    [1 :0]  sync2mode;          
wire    [1 :0]  sync3mode;          
wire    [1 :0]  sync4mode;          
wire    [1 :0]  sync5mode;          
wire            test_mode;          
wire    [31:0]  tim01count;         
wire    [31:0]  tim01count_h;       
wire            tim0en;             
wire            tim0ic;             
wire            tim0ie;             
wire    [31:0]  tim0load;           
wire            tim1en;             
wire            tim1ic;             
wire            tim1ie;             
wire    [31:0]  tim1load;           
wire    [31:0]  tim23count;         
wire    [31:0]  tim23count_h;       
wire            tim2en;             
wire            tim2ic;             
wire            tim2ie;             
wire    [31:0]  tim2load;           
wire            tim3en;             
wire            tim3ic;             
wire            tim3ie;             
wire    [31:0]  tim3load;           
wire    [31:0]  tim45count;         
wire    [31:0]  tim45count_h;       
wire            tim4en;             
wire            tim4ic;             
wire            tim4ie;             
wire    [31:0]  tim4load;           
wire            tim5en;             
wire            tim5ic;             
wire            tim5ie;             
wire    [31:0]  tim5load;           
wire    [31:0]  timis;              
wire    [31:0]  timris;             
wire            tr0end;             
wire            tr0enu;             
wire            tr1end;             
wire            tr1enu;             
wire            tr2end;             
wire            tr2enu;             
wire            tr3end;             
wire            tr3enu;             
wire            tr4end;             
wire            tr4enu;             
wire            tr5end;             
wire            tr5enu;             
wire            trigger0;           
wire            trigger1;           
wire            trigger2;           
wire            trigger3;           
wire            trigger4;           
wire            trigger5;           
wire            triginv;            
always @( cntdiv[2:0])
begin
  case(cntdiv[2:0])
    3'b000 : clkspec[6:0] = 7'h1;
    3'b001 : clkspec[6:0] = 7'h3;
    3'b010 : clkspec[6:0] = 7'h7;
    3'b011 : clkspec[6:0] = 7'hf;
    3'b100 : clkspec[6:0] = 7'h1f;
    3'b101 : clkspec[6:0] = 7'h3f;
    3'b110 : clkspec[6:0] = 7'h7f;
    3'b111 : clkspec[6:0] = 7'h7f;
    default: clkspec[6:0] = 7'h1;	
  endcase
end
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    clkcnt[6:0] <= 7'h0;
    clkdiv_en <= 1'b0;
  end
  else
    if(clkcnt[6:0] == clkspec[6:0])
    begin
      clkcnt[6:0] <= 7'h0;
      clkdiv_en <= 1'b1;
    end
    else
    begin
      clkcnt[6:0] <= clkcnt[6:0] + 7'h1;
      clkdiv_en <= 1'b0;
    end
end
gated_clk_cell  x_cpu_gated_clk (
  .clk_in               (pclk                ),
  .clk_out              (clkdiv              ),
  .external_en          (clkdiv_en           ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
assign clkdiv_temux = clkdiv;
assign clk_sel = cntdiven & ~test_mode;
clk_mux2 x_pwm_clkmux
(
.clk_sel(clk_sel),
.clk_a(pclk),
.clk_b(clkdiv_temux),
.clk_out(clksrc_tmp)
);
assign clksrc = clksrc_tmp;
assign ctrl_clk = clksrc;
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm0en_d <= 0;
    else
        pwm0en_d <= pwm0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm1en_d <= 0;
    else
        pwm1en_d <= pwm1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm2en_d <= 0;
    else
        pwm2en_d <= pwm2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm3en_d <= 0;
    else
        pwm3en_d <= pwm3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm4en_d <= 0;
    else
        pwm4en_d <= pwm4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm5en_d <= 0;
    else
        pwm5en_d <= pwm5en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm6en_d <= 0;
    else
        pwm6en_d <= pwm6en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm7en_d <= 0;
    else
        pwm7en_d <= pwm7en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm8en_d <= 0;
    else
        pwm8en_d <= pwm8en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm9en_d <= 0;
    else
        pwm9en_d <= pwm9en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm10en_d <= 0;
    else
        pwm10en_d <= pwm10en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm11en_d <= 0;
    else
        pwm11en_d <= pwm11en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap0en_d <= 0;
    else
        cap0en_d <= cap0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap1en_d <= 0;
    else
        cap1en_d <= cap1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap2en_d <= 0;
    else
        cap2en_d <= cap2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap3en_d <= 0;
    else
        cap3en_d <= cap3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap4en_d <= 0;
    else
        cap4en_d <= cap4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap5en_d <= 0;
    else
        cap5en_d <= cap5en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim0en_d <= 0;
    else
        tim0en_d <= tim0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim1en_d <= 0;
    else
        tim1en_d <= tim1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim2en_d <= 0;
    else
        tim2en_d <= tim2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim3en_d <= 0;
    else
        tim3en_d <= tim3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim4en_d <= 0;
    else
        tim4en_d <= tim4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim5en_d <= 0;
    else
        tim5en_d <= tim5en;
end
pwm_gen  pwm_0_inst (
  .cap_cnt                (cap_cnt_0             ),
  .cap_en                 (cap0en_d              ),
  .cap_load_value         (cap0match             ),
  .cap_mode               (cap0mode              ),
  .cap_select             (cap0eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_0           ),
  .compb_val              (compb_val_0           ),
  .deadband_delay_cnt     (delay0                ),
  .deadband_en            (db0en                 ),
  .i_capture              (i_capture_0           ),
  .int_cap_cnt_add        (int_cap0_cnt_add      ),
  .int_cap_cnt_match      (int_cap0_cnt_match    ),
  .int_clr_cap_cnt_add    (cap0timic             ),
  .int_clr_cap_cnt_match  (cap0cntic             ),
  .int_clr_pwm_cnt_load   (intic0cntload         ),
  .int_clr_pwm_cnt_zero   (intic0cntzero         ),
  .int_clr_pwm_compa_down (intic0cmpad           ),
  .int_clr_pwm_compa_up   (intic0cmpau           ),
  .int_clr_pwm_compb_down (intic0cmpbd           ),
  .int_clr_pwm_compb_up   (intic0cmpbu           ),
  .int_clr_tim_cnt_match  (tim0ic                ),
  .int_en_cap_cnt_add     (cap0timie             ),
  .int_en_cap_cnt_match   (cap0cntie             ),
  .int_en_pwm_cnt_load    (int0encntload         ),
  .int_en_pwm_cnt_zero    (int0encntzero         ),
  .int_en_pwm_compa_down  (int0encmpad           ),
  .int_en_pwm_compa_up    (int0encmpau           ),
  .int_en_pwm_compb_down  (int0encmpbd           ),
  .int_en_pwm_compb_up    (int0encmpbu           ),
  .int_en_tim_cnt_match   (tim0ie                ),
  .int_pwm_cnt_load       (int_pwm0_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm0_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm0_compa_down   ),
  .int_pwm_compa_up       (int_pwm0_compa_up     ),
  .int_pwm_compb_down     (int_pwm0_compb_down   ),
  .int_pwm_compb_up       (int_pwm0_compb_up     ),
  .int_tim_cnt_match      (int_tim0_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm0en_d              ),
  .pwm0_inv               (pwm0inv               ),
  .pwm1_en                (pwm1en_d              ),
  .pwm1_inv               (pwm1inv               ),
  .pwm_0_oe               (pwm_0_oe              ),
  .pwm_0_out              (pwm_0_out             ),
  .pwm_1_oe               (pwm_1_oe              ),
  .pwm_1_out              (pwm_1_out             ),
  .pwm_cnt                (pwm_cnt_0             ),
  .pwm_load_value         (pwm0load              ),
  .pwm_mode               (pwm0mode              ),
  .pwm_tim_etb_trig       (pwm_tim0_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync0mode             ),
  .tim_en                 (tim0en_d              ),
  .tim_load_value         (tim0load              ),
  .trend                  (tr0end                ),
  .trenu                  (tr0enu                ),
  .trig_val               (pwm0trig_val          ),
  .trigger                (trigger0              )
);
pwm_gen  pwm_1_inst (
  .cap_cnt                (cap_cnt_1             ),
  .cap_en                 (cap1en_d              ),
  .cap_load_value         (cap1match             ),
  .cap_mode               (cap1mode              ),
  .cap_select             (cap1eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_1           ),
  .compb_val              (compb_val_1           ),
  .deadband_delay_cnt     (delay1                ),
  .deadband_en            (db1en                 ),
  .i_capture              (i_capture_2           ),
  .int_cap_cnt_add        (int_cap1_cnt_add      ),
  .int_cap_cnt_match      (int_cap1_cnt_match    ),
  .int_clr_cap_cnt_add    (cap1timic             ),
  .int_clr_cap_cnt_match  (cap1cntic             ),
  .int_clr_pwm_cnt_load   (intic1cntload         ),
  .int_clr_pwm_cnt_zero   (intic1cntzero         ),
  .int_clr_pwm_compa_down (intic1cmpad           ),
  .int_clr_pwm_compa_up   (intic1cmpau           ),
  .int_clr_pwm_compb_down (intic1cmpbd           ),
  .int_clr_pwm_compb_up   (intic1cmpbu           ),
  .int_clr_tim_cnt_match  (tim1ic                ),
  .int_en_cap_cnt_add     (cap1timie             ),
  .int_en_cap_cnt_match   (cap1cntie             ),
  .int_en_pwm_cnt_load    (int1encntload         ),
  .int_en_pwm_cnt_zero    (int1encntzero         ),
  .int_en_pwm_compa_down  (int1encmpad           ),
  .int_en_pwm_compa_up    (int1encmpau           ),
  .int_en_pwm_compb_down  (int1encmpbd           ),
  .int_en_pwm_compb_up    (int1encmpbu           ),
  .int_en_tim_cnt_match   (tim1ie                ),
  .int_pwm_cnt_load       (int_pwm1_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm1_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm1_compa_down   ),
  .int_pwm_compa_up       (int_pwm1_compa_up     ),
  .int_pwm_compb_down     (int_pwm1_compb_down   ),
  .int_pwm_compb_up       (int_pwm1_compb_up     ),
  .int_tim_cnt_match      (int_tim1_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm2en_d              ),
  .pwm0_inv               (pwm2inv               ),
  .pwm1_en                (pwm3en_d              ),
  .pwm1_inv               (pwm3inv               ),
  .pwm_0_oe               (pwm_2_oe              ),
  .pwm_0_out              (pwm_2_out             ),
  .pwm_1_oe               (pwm_3_oe              ),
  .pwm_1_out              (pwm_3_out             ),
  .pwm_cnt                (pwm_cnt_1             ),
  .pwm_load_value         (pwm1load              ),
  .pwm_mode               (pwm1mode              ),
  .pwm_tim_etb_trig       (pwm_tim1_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync1mode             ),
  .tim_en                 (tim1en_d              ),
  .tim_load_value         (tim1load              ),
  .trend                  (tr1end                ),
  .trenu                  (tr1enu                ),
  .trig_val               (pwm1trig_val          ),
  .trigger                (trigger1              )
);
pwm_gen  pwm_2_inst (
  .cap_cnt                (cap_cnt_2             ),
  .cap_en                 (cap2en_d              ),
  .cap_load_value         (cap2match             ),
  .cap_mode               (cap2mode              ),
  .cap_select             (cap2eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_2           ),
  .compb_val              (compb_val_2           ),
  .deadband_delay_cnt     (delay2                ),
  .deadband_en            (db2en                 ),
  .i_capture              (i_capture_4           ),
  .int_cap_cnt_add        (int_cap2_cnt_add      ),
  .int_cap_cnt_match      (int_cap2_cnt_match    ),
  .int_clr_cap_cnt_add    (cap2timic             ),
  .int_clr_cap_cnt_match  (cap2cntic             ),
  .int_clr_pwm_cnt_load   (intic2cntload         ),
  .int_clr_pwm_cnt_zero   (intic2cntzero         ),
  .int_clr_pwm_compa_down (intic2cmpad           ),
  .int_clr_pwm_compa_up   (intic2cmpau           ),
  .int_clr_pwm_compb_down (intic2cmpbd           ),
  .int_clr_pwm_compb_up   (intic2cmpbu           ),
  .int_clr_tim_cnt_match  (tim2ic                ),
  .int_en_cap_cnt_add     (cap2timie             ),
  .int_en_cap_cnt_match   (cap2cntie             ),
  .int_en_pwm_cnt_load    (int2encntload         ),
  .int_en_pwm_cnt_zero    (int2encntzero         ),
  .int_en_pwm_compa_down  (int2encmpad           ),
  .int_en_pwm_compa_up    (int2encmpau           ),
  .int_en_pwm_compb_down  (int2encmpbd           ),
  .int_en_pwm_compb_up    (int2encmpbu           ),
  .int_en_tim_cnt_match   (tim2ie                ),
  .int_pwm_cnt_load       (int_pwm2_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm2_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm2_compa_down   ),
  .int_pwm_compa_up       (int_pwm2_compa_up     ),
  .int_pwm_compb_down     (int_pwm2_compb_down   ),
  .int_pwm_compb_up       (int_pwm2_compb_up     ),
  .int_tim_cnt_match      (int_tim2_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm4en_d              ),
  .pwm0_inv               (pwm4inv               ),
  .pwm1_en                (pwm5en_d              ),
  .pwm1_inv               (pwm5inv               ),
  .pwm_0_oe               (pwm_4_oe              ),
  .pwm_0_out              (pwm_4_out             ),
  .pwm_1_oe               (pwm_5_oe              ),
  .pwm_1_out              (pwm_5_out             ),
  .pwm_cnt                (pwm_cnt_2             ),
  .pwm_load_value         (pwm2load              ),
  .pwm_mode               (pwm2mode              ),
  .pwm_tim_etb_trig       (pwm_tim2_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync2mode             ),
  .tim_en                 (tim2en_d              ),
  .tim_load_value         (tim2load              ),
  .trend                  (tr2end                ),
  .trenu                  (tr2enu                ),
  .trig_val               (pwm2trig_val          ),
  .trigger                (trigger2              )
);
pwm_gen  pwm_3_inst (
  .cap_cnt                (cap_cnt_3             ),
  .cap_en                 (cap3en_d              ),
  .cap_load_value         (cap3match             ),
  .cap_mode               (cap3mode              ),
  .cap_select             (cap3eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_3           ),
  .compb_val              (compb_val_3           ),
  .deadband_delay_cnt     (delay3                ),
  .deadband_en            (db3en                 ),
  .i_capture              (i_capture_6           ),
  .int_cap_cnt_add        (int_cap3_cnt_add      ),
  .int_cap_cnt_match      (int_cap3_cnt_match    ),
  .int_clr_cap_cnt_add    (cap3timic             ),
  .int_clr_cap_cnt_match  (cap3cntic             ),
  .int_clr_pwm_cnt_load   (intic3cntload         ),
  .int_clr_pwm_cnt_zero   (intic3cntzero         ),
  .int_clr_pwm_compa_down (intic3cmpad           ),
  .int_clr_pwm_compa_up   (intic3cmpau           ),
  .int_clr_pwm_compb_down (intic3cmpbd           ),
  .int_clr_pwm_compb_up   (intic3cmpbu           ),
  .int_clr_tim_cnt_match  (tim3ic                ),
  .int_en_cap_cnt_add     (cap3timie             ),
  .int_en_cap_cnt_match   (cap3cntie             ),
  .int_en_pwm_cnt_load    (int3encntload         ),
  .int_en_pwm_cnt_zero    (int3encntzero         ),
  .int_en_pwm_compa_down  (int3encmpad           ),
  .int_en_pwm_compa_up    (int3encmpau           ),
  .int_en_pwm_compb_down  (int3encmpbd           ),
  .int_en_pwm_compb_up    (int3encmpbu           ),
  .int_en_tim_cnt_match   (tim3ie                ),
  .int_pwm_cnt_load       (int_pwm3_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm3_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm3_compa_down   ),
  .int_pwm_compa_up       (int_pwm3_compa_up     ),
  .int_pwm_compb_down     (int_pwm3_compb_down   ),
  .int_pwm_compb_up       (int_pwm3_compb_up     ),
  .int_tim_cnt_match      (int_tim3_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm6en_d              ),
  .pwm0_inv               (pwm6inv               ),
  .pwm1_en                (pwm7en_d              ),
  .pwm1_inv               (pwm7inv               ),
  .pwm_0_oe               (pwm_6_oe              ),
  .pwm_0_out              (pwm_6_out             ),
  .pwm_1_oe               (pwm_7_oe              ),
  .pwm_1_out              (pwm_7_out             ),
  .pwm_cnt                (pwm_cnt_3             ),
  .pwm_load_value         (pwm3load              ),
  .pwm_mode               (pwm3mode              ),
  .pwm_tim_etb_trig       (pwm_tim3_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync3mode             ),
  .tim_en                 (tim3en_d              ),
  .tim_load_value         (tim3load              ),
  .trend                  (tr3end                ),
  .trenu                  (tr3enu                ),
  .trig_val               (pwm3trig_val          ),
  .trigger                (trigger3              )
);
pwm_gen  pwm_4_inst (
  .cap_cnt                (cap_cnt_4             ),
  .cap_en                 (cap4en_d              ),
  .cap_load_value         (cap4match             ),
  .cap_mode               (cap4mode              ),
  .cap_select             (cap4eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_4           ),
  .compb_val              (compb_val_4           ),
  .deadband_delay_cnt     (delay4                ),
  .deadband_en            (db4en                 ),
  .i_capture              (i_capture_8           ),
  .int_cap_cnt_add        (int_cap4_cnt_add      ),
  .int_cap_cnt_match      (int_cap4_cnt_match    ),
  .int_clr_cap_cnt_add    (cap4timic             ),
  .int_clr_cap_cnt_match  (cap4cntic             ),
  .int_clr_pwm_cnt_load   (intic4cntload         ),
  .int_clr_pwm_cnt_zero   (intic4cntzero         ),
  .int_clr_pwm_compa_down (intic4cmpad           ),
  .int_clr_pwm_compa_up   (intic4cmpau           ),
  .int_clr_pwm_compb_down (intic4cmpbd           ),
  .int_clr_pwm_compb_up   (intic4cmpbu           ),
  .int_clr_tim_cnt_match  (tim4ic                ),
  .int_en_cap_cnt_add     (cap4timie             ),
  .int_en_cap_cnt_match   (cap4cntie             ),
  .int_en_pwm_cnt_load    (int4encntload         ),
  .int_en_pwm_cnt_zero    (int4encntzero         ),
  .int_en_pwm_compa_down  (int4encmpad           ),
  .int_en_pwm_compa_up    (int4encmpau           ),
  .int_en_pwm_compb_down  (int4encmpbd           ),
  .int_en_pwm_compb_up    (int4encmpbu           ),
  .int_en_tim_cnt_match   (tim4ie                ),
  .int_pwm_cnt_load       (int_pwm4_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm4_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm4_compa_down   ),
  .int_pwm_compa_up       (int_pwm4_compa_up     ),
  .int_pwm_compb_down     (int_pwm4_compb_down   ),
  .int_pwm_compb_up       (int_pwm4_compb_up     ),
  .int_tim_cnt_match      (int_tim4_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm8en_d              ),
  .pwm0_inv               (pwm8inv               ),
  .pwm1_en                (pwm9en_d              ),
  .pwm1_inv               (pwm9inv               ),
  .pwm_0_oe               (pwm_8_oe              ),
  .pwm_0_out              (pwm_8_out             ),
  .pwm_1_oe               (pwm_9_oe              ),
  .pwm_1_out              (pwm_9_out             ),
  .pwm_cnt                (pwm_cnt_4             ),
  .pwm_load_value         (pwm4load              ),
  .pwm_mode               (pwm4mode              ),
  .pwm_tim_etb_trig       (pwm_tim4_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync4mode             ),
  .tim_en                 (tim4en_d              ),
  .tim_load_value         (tim4load              ),
  .trend                  (tr4end                ),
  .trenu                  (tr4enu                ),
  .trig_val               (pwm4trig_val          ),
  .trigger                (trigger4              )
);
pwm_gen  pwm_5_inst (
  .cap_cnt                (cap_cnt_5             ),
  .cap_en                 (cap5en_d              ),
  .cap_load_value         (cap5match             ),
  .cap_mode               (cap5mode              ),
  .cap_select             (cap5eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_5           ),
  .compb_val              (compb_val_5           ),
  .deadband_delay_cnt     (delay5                ),
  .deadband_en            (db5en                 ),
  .i_capture              (i_capture_10          ),
  .int_cap_cnt_add        (int_cap5_cnt_add      ),
  .int_cap_cnt_match      (int_cap5_cnt_match    ),
  .int_clr_cap_cnt_add    (cap5timic             ),
  .int_clr_cap_cnt_match  (cap5cntic             ),
  .int_clr_pwm_cnt_load   (intic5cntload         ),
  .int_clr_pwm_cnt_zero   (intic5cntzero         ),
  .int_clr_pwm_compa_down (intic5cmpad           ),
  .int_clr_pwm_compa_up   (intic5cmpau           ),
  .int_clr_pwm_compb_down (intic5cmpbd           ),
  .int_clr_pwm_compb_up   (intic5cmpbu           ),
  .int_clr_tim_cnt_match  (tim5ic                ),
  .int_en_cap_cnt_add     (cap5timie             ),
  .int_en_cap_cnt_match   (cap5cntie             ),
  .int_en_pwm_cnt_load    (int5encntload         ),
  .int_en_pwm_cnt_zero    (int5encntzero         ),
  .int_en_pwm_compa_down  (int5encmpad           ),
  .int_en_pwm_compa_up    (int5encmpau           ),
  .int_en_pwm_compb_down  (int5encmpbd           ),
  .int_en_pwm_compb_up    (int5encmpbu           ),
  .int_en_tim_cnt_match   (tim5ie                ),
  .int_pwm_cnt_load       (int_pwm5_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm5_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm5_compa_down   ),
  .int_pwm_compa_up       (int_pwm5_compa_up     ),
  .int_pwm_compb_down     (int_pwm5_compb_down   ),
  .int_pwm_compb_up       (int_pwm5_compb_up     ),
  .int_tim_cnt_match      (int_tim5_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm10en_d             ),
  .pwm0_inv               (pwm10inv              ),
  .pwm1_en                (pwm11en_d             ),
  .pwm1_inv               (pwm11inv              ),
  .pwm_0_oe               (pwm_10_oe             ),
  .pwm_0_out              (pwm_10_out            ),
  .pwm_1_oe               (pwm_11_oe             ),
  .pwm_1_out              (pwm_11_out            ),
  .pwm_cnt                (pwm_cnt_5             ),
  .pwm_load_value         (pwm5load              ),
  .pwm_mode               (pwm5mode              ),
  .pwm_tim_etb_trig       (pwm_tim5_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync5mode             ),
  .tim_en                 (tim5en_d              ),
  .tim_load_value         (tim5load              ),
  .trend                  (tr5end                ),
  .trenu                  (tr5enu                ),
  .trig_val               (pwm5trig_val          ),
  .trigger                (trigger5              )
);
always@(posedge pclk or negedge presetn)begin
    if(!presetn)
        int_fault <= 0;
    else if(inticfault)
        int_fault <= 0;
    else if(fault & intenfault)
        int_fault <= 1;
end
assign pwm0_int = int_pwm0_compb_down | int_pwm0_compa_down | int_pwm0_compb_up | int_pwm0_compa_up | int_pwm0_cnt_load | int_pwm0_cnt_zero | int_cap0_cnt_add | int_cap0_cnt_match | int_tim0_cnt_match;
assign pwm1_int = int_pwm1_compb_down | int_pwm1_compa_down | int_pwm1_compb_up | int_pwm1_compa_up | int_pwm1_cnt_load | int_pwm1_cnt_zero | int_cap1_cnt_add | int_cap1_cnt_match | int_tim1_cnt_match;
assign pwm2_int = int_pwm2_compb_down | int_pwm2_compa_down | int_pwm2_compb_up | int_pwm2_compa_up | int_pwm2_cnt_load | int_pwm2_cnt_zero | int_cap2_cnt_add | int_cap2_cnt_match | int_tim2_cnt_match;
assign pwm3_int = int_pwm3_compb_down | int_pwm3_compa_down | int_pwm3_compb_up | int_pwm3_compa_up | int_pwm3_cnt_load | int_pwm3_cnt_zero | int_cap3_cnt_add | int_cap3_cnt_match | int_tim3_cnt_match;
assign pwm4_int = int_pwm4_compb_down | int_pwm4_compa_down | int_pwm4_compb_up | int_pwm4_compa_up | int_pwm4_cnt_load | int_pwm4_cnt_zero | int_cap4_cnt_add | int_cap4_cnt_match | int_tim4_cnt_match;
assign pwm5_int = int_pwm5_compb_down | int_pwm5_compa_down | int_pwm5_compb_up | int_pwm5_compa_up | int_pwm5_cnt_load | int_pwm5_cnt_zero | int_cap5_cnt_add | int_cap5_cnt_match | int_tim5_cnt_match;
assign pwmint= pwm0_int | pwm1_int | pwm2_int | pwm3_int | pwm4_int | pwm5_int | int_fault;
assign cap01t[31:0] = {cap_cnt_1[15:0],cap_cnt_0[15:0]};
assign cap23t[31:0] = {cap_cnt_3[15:0],cap_cnt_2[15:0]};
assign cap45t[31:0] = {cap_cnt_5[15:0],cap_cnt_4[15:0]};
assign cap01t_h[31:0] = {cap_cnt_1[31:16],cap_cnt_0[31:16]};
assign cap23t_h[31:0] = {cap_cnt_3[31:16],cap_cnt_2[31:16]};
assign cap45t_h[31:0] = {cap_cnt_5[31:16],cap_cnt_4[31:16]};
assign capis[31:0] = {20'b0,int_cap5_cnt_add,int_cap4_cnt_add,int_cap3_cnt_add,int_cap2_cnt_add,int_cap1_cnt_add,int_cap0_cnt_add,
		      int_cap5_cnt_match,int_cap4_cnt_match,int_cap3_cnt_match,int_cap2_cnt_match,int_cap1_cnt_match,int_cap0_cnt_match};
assign capris[31:0] = capis[31:0];
assign cnt0val[31:0] = pwm_cnt_0[31:0];
assign cnt1val[31:0] = pwm_cnt_1[31:0];
assign cnt2val[31:0] = pwm_cnt_2[31:0];
assign cnt3val[31:0] = pwm_cnt_3[31:0];
assign cnt4val[31:0] = pwm_cnt_4[31:0];
assign cnt5val[31:0] = pwm_cnt_5[31:0];
assign pwm01count[31:0] = {pwm_cnt_1[15:0],pwm_cnt_0[15:0]};
assign pwm23count[31:0] = {pwm_cnt_3[15:0],pwm_cnt_2[15:0]};
assign pwm45count[31:0] = {pwm_cnt_5[15:0],pwm_cnt_4[15:0]};
assign pwm01count_h[31:0] = {pwm_cnt_1[31:16],pwm_cnt_0[31:16]};
assign pwm23count_h[31:0] = {pwm_cnt_3[31:16],pwm_cnt_2[31:16]};
assign pwm45count_h[31:0] = {pwm_cnt_5[31:16],pwm_cnt_4[31:16]};
assign pwmris1[31:0] = {2'b0,int_pwm2_compb_down,int_pwm2_compa_down,int_pwm2_compb_up,int_pwm2_compa_up,int_pwm2_cnt_load,int_pwm2_cnt_zero,
		  2'b0,int_pwm1_compb_down,int_pwm1_compa_down,int_pwm1_compb_up,int_pwm1_compa_up,int_pwm1_cnt_load,int_pwm1_cnt_zero,
		  2'b0,int_pwm0_compb_down,int_pwm0_compa_down,int_pwm0_compb_up,int_pwm0_compa_up,int_pwm0_cnt_load,int_pwm0_cnt_zero,7'b0,int_fault};
assign pwmris2[31:0] = {10'b0,int_pwm5_compb_down,int_pwm5_compa_down,int_pwm5_compb_up,int_pwm5_compa_up,int_pwm5_cnt_load,int_pwm5_cnt_zero,
		   2'b0,int_pwm4_compb_down,int_pwm4_compa_down,int_pwm4_compb_up,int_pwm4_compa_up,int_pwm4_cnt_load,int_pwm4_cnt_zero,
		   2'b0,int_pwm3_compb_down,int_pwm3_compa_down,int_pwm3_compb_up,int_pwm3_compa_up,int_pwm3_cnt_load,int_pwm3_cnt_zero};
assign pwmis1[31:0] = pwmris1[31:0];
assign pwmis2[31:0] = pwmris2[31:0];
assign tim01count[31:0] = {pwm_cnt_1[15:0],pwm_cnt_0[15:0]};
assign tim23count[31:0] = {pwm_cnt_3[15:0],pwm_cnt_2[15:0]};
assign tim45count[31:0] = {pwm_cnt_5[15:0],pwm_cnt_4[15:0]};
assign tim01count_h[31:0] = {pwm_cnt_1[31:16],pwm_cnt_0[31:16]};
assign tim23count_h[31:0] = {pwm_cnt_3[31:16],pwm_cnt_2[31:16]};
assign tim45count_h[31:0] = {pwm_cnt_5[31:16],pwm_cnt_4[31:16]};
assign timis[31:0] = {26'b0,int_tim5_cnt_match,int_tim4_cnt_match,int_tim3_cnt_match,int_tim2_cnt_match,int_tim1_cnt_match,int_tim0_cnt_match};
assign timris[31:0] = timis[31:0];
assign pwm_xx_trig_pre = trigger0 | trigger1 | trigger2 | trigger3 | trigger4 | trigger5;
assign pwm_xx_trig = triginv ? ~pwm_xx_trig_pre : pwm_xx_trig_pre;
assign pwm_idle = ~(pwm0en_d | pwm1en_d | pwm2en_d | pwm3en_d | pwm4en_d | pwm5en_d | pwm6en_d | pwm7en_d | pwm8en_d | pwm9en_d | pwm10en_d | pwm11en_d | cap0en_d | cap1en_d | cap2en_d | cap3en_d | cap4en_d | cap5en_d | tim0en_d | tim1en_d | tim2en_d | tim3en_d | tim4en_d | tim5en_d);
endmodule
