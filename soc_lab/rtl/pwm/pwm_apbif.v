/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

`define pwmcfg_OFFSET          7'b0000000
`define pwminverttrig_OFFSET   7'b0000001
`define pwm01trig_OFFSET       7'b0000010
`define pwm23trig_OFFSET       7'b0000011
`define pwm45trig_OFFSET       7'b0000100
`define pwminten1_OFFSET       7'b0000101
`define pwminten2_OFFSET       7'b0000110
`define pwmris1_OFFSET         7'b0000111
`define pwmris2_OFFSET         7'b0001000
`define pwmic1_OFFSET          7'b0001001
`define pwmic2_OFFSET          7'b0001010
`define pwmis1_OFFSET          7'b0001011
`define pwmis2_OFFSET          7'b0001100
`define pwmctl_OFFSET          7'b0001101
`define pwm01load_OFFSET       7'b0001110
`define pwm23load_OFFSET       7'b0001111
`define pwm45load_OFFSET       7'b0010000
`define pwm01count_OFFSET      7'b0010001
`define pwm23count_OFFSET      7'b0010010
`define pwm45count_OFFSET      7'b0010011
`define pwm0cmp_OFFSET         7'b0010100
`define pwm1cmp_OFFSET         7'b0010101
`define pwm2cmp_OFFSET         7'b0010110
`define pwm3cmp_OFFSET         7'b0010111
`define pwm4cmp_OFFSET         7'b0011000
`define pwm5cmp_OFFSET         7'b0011001
`define pwm01db_OFFSET         7'b0011010
`define pwm23db_OFFSET         7'b0011011
`define pwm45db_OFFSET         7'b0011100
`define capctl_OFFSET          7'b0011101
`define capinten_OFFSET        7'b0011110
`define capris_OFFSET          7'b0011111
`define capic_OFFSET           7'b0100000
`define capis_OFFSET           7'b0100001
`define cap01t_OFFSET          7'b0100010
`define cap23t_OFFSET          7'b0100011
`define cap45t_OFFSET          7'b0100100
`define cap01match_OFFSET      7'b0100101
`define cap23match_OFFSET      7'b0100110
`define cap45match_OFFSET      7'b0100111
`define timinten_OFFSET        7'b0101000
`define timris_OFFSET          7'b0101001
`define timic_OFFSET           7'b0101010
`define timis_OFFSET           7'b0101011
`define tim01load_OFFSET       7'b0101100
`define tim23load_OFFSET       7'b0101101
`define tim45load_OFFSET       7'b0101110
`define tim01count_OFFSET      7'b0101111
`define tim23count_OFFSET      7'b0110000
`define tim45count_OFFSET      7'b0110001
`define cnt01val_OFFSET        7'b0110010
`define cnt23val_OFFSET        7'b0110011
`define cnt45val_OFFSET        7'b0110100
module pwm_apbif(
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
  etb_pwm_trig_tim0_off,
  etb_pwm_trig_tim0_on,
  etb_pwm_trig_tim1_off,
  etb_pwm_trig_tim1_on,
  etb_pwm_trig_tim2_off,
  etb_pwm_trig_tim2_on,
  etb_pwm_trig_tim3_off,
  etb_pwm_trig_tim3_on,
  etb_pwm_trig_tim4_off,
  etb_pwm_trig_tim4_on,
  etb_pwm_trig_tim5_off,
  etb_pwm_trig_tim5_on,
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
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
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
  pwmis1,
  pwmis2,
  pwmris1,
  pwmris2,
  pwrite,
  sync0mode,
  sync1mode,
  sync2mode,
  sync3mode,
  sync4mode,
  sync5mode,
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
input   [31:0]  cap01t;               
input   [31:0]  cap01t_h;             
input   [31:0]  cap23t;               
input   [31:0]  cap23t_h;             
input   [31:0]  cap45t;               
input   [31:0]  cap45t_h;             
input   [31:0]  capis;                
input   [31:0]  capris;               
input   [31:0]  cnt0val;              
input   [31:0]  cnt1val;              
input   [31:0]  cnt2val;              
input   [31:0]  cnt3val;              
input   [31:0]  cnt4val;              
input   [31:0]  cnt5val;              
input           etb_pwm_trig_tim0_off; 
input           etb_pwm_trig_tim0_on; 
input           etb_pwm_trig_tim1_off; 
input           etb_pwm_trig_tim1_on; 
input           etb_pwm_trig_tim2_off; 
input           etb_pwm_trig_tim2_on; 
input           etb_pwm_trig_tim3_off; 
input           etb_pwm_trig_tim3_on; 
input           etb_pwm_trig_tim4_off; 
input           etb_pwm_trig_tim4_on; 
input           etb_pwm_trig_tim5_off; 
input           etb_pwm_trig_tim5_on; 
input   [31:0]  paddr;                
input           pclk;                 
input           penable;              
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input   [31:0]  pwm01count;           
input   [31:0]  pwm01count_h;         
input   [31:0]  pwm23count;           
input   [31:0]  pwm23count_h;         
input   [31:0]  pwm45count;           
input   [31:0]  pwm45count_h;         
input   [31:0]  pwmis1;               
input   [31:0]  pwmis2;               
input   [31:0]  pwmris1;              
input   [31:0]  pwmris2;              
input           pwrite;               
input   [31:0]  tim01count;           
input   [31:0]  tim01count_h;         
input   [31:0]  tim23count;           
input   [31:0]  tim23count_h;         
input   [31:0]  tim45count;           
input   [31:0]  tim45count_h;         
input   [31:0]  timis;                
input   [31:0]  timris;               
output          cap0cntic;            
output          cap0cntie;            
output          cap0en;               
output  [1 :0]  cap0eventa;           
output  [31:0]  cap0match;            
output          cap0mode;             
output          cap0timic;            
output          cap0timie;            
output          cap1cntic;            
output          cap1cntie;            
output          cap1en;               
output  [1 :0]  cap1eventa;           
output  [31:0]  cap1match;            
output          cap1mode;             
output          cap1timic;            
output          cap1timie;            
output          cap2cntic;            
output          cap2cntie;            
output          cap2en;               
output  [1 :0]  cap2eventa;           
output  [31:0]  cap2match;            
output          cap2mode;             
output          cap2timic;            
output          cap2timie;            
output          cap3cntic;            
output          cap3cntie;            
output          cap3en;               
output  [1 :0]  cap3eventa;           
output  [31:0]  cap3match;            
output          cap3mode;             
output          cap3timic;            
output          cap3timie;            
output          cap4cntic;            
output          cap4cntie;            
output          cap4en;               
output  [1 :0]  cap4eventa;           
output  [31:0]  cap4match;            
output          cap4mode;             
output          cap4timic;            
output          cap4timie;            
output          cap5cntic;            
output          cap5cntie;            
output          cap5en;               
output  [1 :0]  cap5eventa;           
output  [31:0]  cap5match;            
output          cap5mode;             
output          cap5timic;            
output          cap5timie;            
output  [2 :0]  cntdiv;               
output          cntdiven;             
output  [31:0]  compa_val_0;          
output  [31:0]  compa_val_1;          
output  [31:0]  compa_val_2;          
output  [31:0]  compa_val_3;          
output  [31:0]  compa_val_4;          
output  [31:0]  compa_val_5;          
output  [31:0]  compb_val_0;          
output  [31:0]  compb_val_1;          
output  [31:0]  compb_val_2;          
output  [31:0]  compb_val_3;          
output  [31:0]  compb_val_4;          
output  [31:0]  compb_val_5;          
output          db0en;                
output          db1en;                
output          db2en;                
output          db3en;                
output          db4en;                
output          db5en;                
output  [11:0]  delay0;               
output  [11:0]  delay1;               
output  [11:0]  delay2;               
output  [11:0]  delay3;               
output  [11:0]  delay4;               
output  [11:0]  delay5;               
output          int0encmpad;          
output          int0encmpau;          
output          int0encmpbd;          
output          int0encmpbu;          
output          int0encntload;        
output          int0encntzero;        
output          int1encmpad;          
output          int1encmpau;          
output          int1encmpbd;          
output          int1encmpbu;          
output          int1encntload;        
output          int1encntzero;        
output          int2encmpad;          
output          int2encmpau;          
output          int2encmpbd;          
output          int2encmpbu;          
output          int2encntload;        
output          int2encntzero;        
output          int3encmpad;          
output          int3encmpau;          
output          int3encmpbd;          
output          int3encmpbu;          
output          int3encntload;        
output          int3encntzero;        
output          int4encmpad;          
output          int4encmpau;          
output          int4encmpbd;          
output          int4encmpbu;          
output          int4encntload;        
output          int4encntzero;        
output          int5encmpad;          
output          int5encmpau;          
output          int5encmpbd;          
output          int5encmpbu;          
output          int5encntload;        
output          int5encntzero;        
output          intenfault;           
output          intic0cmpad;          
output          intic0cmpau;          
output          intic0cmpbd;          
output          intic0cmpbu;          
output          intic0cntload;        
output          intic0cntzero;        
output          intic1cmpad;          
output          intic1cmpau;          
output          intic1cmpbd;          
output          intic1cmpbu;          
output          intic1cntload;        
output          intic1cntzero;        
output          intic2cmpad;          
output          intic2cmpau;          
output          intic2cmpbd;          
output          intic2cmpbu;          
output          intic2cntload;        
output          intic2cntzero;        
output          intic3cmpad;          
output          intic3cmpau;          
output          intic3cmpbd;          
output          intic3cmpbu;          
output          intic3cntload;        
output          intic3cntzero;        
output          intic4cmpad;          
output          intic4cmpau;          
output          intic4cmpbd;          
output          intic4cmpbu;          
output          intic4cntload;        
output          intic4cntzero;        
output          intic5cmpad;          
output          intic5cmpau;          
output          intic5cmpbd;          
output          intic5cmpbu;          
output          intic5cntload;        
output          intic5cntzero;        
output          inticfault;           
output  [31:0]  prdata;               
output          pwm0en;               
output          pwm0inv;              
output  [31:0]  pwm0load;             
output          pwm0mode;             
output  [31:0]  pwm0trig_val;         
output          pwm10en;              
output          pwm10inv;             
output          pwm11en;              
output          pwm11inv;             
output          pwm1en;               
output          pwm1inv;              
output  [31:0]  pwm1load;             
output          pwm1mode;             
output  [31:0]  pwm1trig_val;         
output          pwm2en;               
output          pwm2inv;              
output  [31:0]  pwm2load;             
output          pwm2mode;             
output  [31:0]  pwm2trig_val;         
output          pwm3en;               
output          pwm3inv;              
output  [31:0]  pwm3load;             
output          pwm3mode;             
output  [31:0]  pwm3trig_val;         
output          pwm4en;               
output          pwm4inv;              
output  [31:0]  pwm4load;             
output          pwm4mode;             
output  [31:0]  pwm4trig_val;         
output          pwm5en;               
output          pwm5inv;              
output  [31:0]  pwm5load;             
output          pwm5mode;             
output  [31:0]  pwm5trig_val;         
output          pwm6en;               
output          pwm6inv;              
output          pwm7en;               
output          pwm7inv;              
output          pwm8en;               
output          pwm8inv;              
output          pwm9en;               
output          pwm9inv;              
output  [1 :0]  sync0mode;            
output  [1 :0]  sync1mode;            
output  [1 :0]  sync2mode;            
output  [1 :0]  sync3mode;            
output  [1 :0]  sync4mode;            
output  [1 :0]  sync5mode;            
output          tim0en;               
output          tim0ic;               
output          tim0ie;               
output  [31:0]  tim0load;             
output          tim1en;               
output          tim1ic;               
output          tim1ie;               
output  [31:0]  tim1load;             
output          tim2en;               
output          tim2ic;               
output          tim2ie;               
output  [31:0]  tim2load;             
output          tim3en;               
output          tim3ic;               
output          tim3ie;               
output  [31:0]  tim3load;             
output          tim4en;               
output          tim4ic;               
output          tim4ie;               
output  [31:0]  tim4load;             
output          tim5en;               
output          tim5ic;               
output          tim5ie;               
output  [31:0]  tim5load;             
output          tr0end;               
output          tr0enu;               
output          tr1end;               
output          tr1enu;               
output          tr2end;               
output          tr2enu;               
output          tr3end;               
output          tr3enu;               
output          tr4end;               
output          tr4enu;               
output          tr5end;               
output          tr5enu;               
output          triginv;              
reg             etb_pwmcfg18;         
reg             etb_pwmcfg19;         
reg             etb_pwmcfg20;         
reg             etb_pwmcfg21;         
reg             etb_pwmcfg22;         
reg             etb_pwmcfg23;         
reg     [31:0]  int_cap01match;       
reg     [31:0]  int_cap01match_h;     
reg     [31:0]  int_cap23match;       
reg     [31:0]  int_cap23match_h;     
reg     [31:0]  int_cap45match;       
reg     [31:0]  int_cap45match_h;     
reg     [17:0]  int_capctl;           
reg     [11:0]  int_capic;            
reg     [11:0]  int_capinten;         
reg     [25:0]  int_pwm01db;          
reg     [31:0]  int_pwm01load;        
reg     [31:0]  int_pwm01load_h;      
reg     [31:0]  int_pwm01trig;        
reg     [31:0]  int_pwm01trig_h;      
reg     [31:0]  int_pwm0cmp;          
reg     [31:0]  int_pwm0cmp_h;        
reg     [31:0]  int_pwm1cmp;          
reg     [31:0]  int_pwm1cmp_h;        
reg     [25:0]  int_pwm23db;          
reg     [31:0]  int_pwm23load;        
reg     [31:0]  int_pwm23load_h;      
reg     [31:0]  int_pwm23trig;        
reg     [31:0]  int_pwm23trig_h;      
reg     [31:0]  int_pwm2cmp;          
reg     [31:0]  int_pwm2cmp_h;        
reg     [31:0]  int_pwm3cmp;          
reg     [31:0]  int_pwm3cmp_h;        
reg     [25:0]  int_pwm45db;          
reg     [31:0]  int_pwm45load;        
reg     [31:0]  int_pwm45load_h;      
reg     [31:0]  int_pwm45trig;        
reg     [31:0]  int_pwm45trig_h;      
reg     [31:0]  int_pwm4cmp;          
reg     [31:0]  int_pwm4cmp_h;        
reg     [31:0]  int_pwm5cmp;          
reg     [31:0]  int_pwm5cmp_h;        
reg     [27:0]  int_pwmcfg;           
reg     [17:0]  int_pwmctl;           
reg     [29:0]  int_pwmic1;           
reg     [21:0]  int_pwmic2;           
reg     [29:0]  int_pwminten1;        
reg     [21:0]  int_pwminten2;        
reg     [24:0]  int_pwminverttrig;    
reg     [31:0]  int_tim01load;        
reg     [31:0]  int_tim01load_h;      
reg     [31:0]  int_tim23load;        
reg     [31:0]  int_tim23load_h;      
reg     [31:0]  int_tim45load;        
reg     [31:0]  int_tim45load_h;      
reg     [5 :0]  int_timic;            
reg     [5 :0]  int_timinten;         
reg     [31:0]  iprdata;              
wire    [31:0]  cap01match;           
wire    [31:0]  cap01match_h;         
wire            cap01match_wen;       
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
wire    [31:0]  cap23match;           
wire    [31:0]  cap23match_h;         
wire            cap23match_wen;       
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
wire    [31:0]  cap45match;           
wire    [31:0]  cap45match_h;         
wire            cap45match_wen;       
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
wire    [17:0]  capctl;               
wire            capctl_wen;           
wire    [11:0]  capic;                
wire            capic_wen;            
wire    [11:0]  capinten;             
wire            capinten_wen;         
wire    [31:0]  capis;                
wire    [31:0]  capris;               
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
wire            etb_pwm_trig_tim0_off; 
wire            etb_pwm_trig_tim0_on; 
wire            etb_pwm_trig_tim1_off; 
wire            etb_pwm_trig_tim1_on; 
wire            etb_pwm_trig_tim2_off; 
wire            etb_pwm_trig_tim2_on; 
wire            etb_pwm_trig_tim3_off; 
wire            etb_pwm_trig_tim3_on; 
wire            etb_pwm_trig_tim4_off; 
wire            etb_pwm_trig_tim4_on; 
wire            etb_pwm_trig_tim5_off; 
wire            etb_pwm_trig_tim5_on; 
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
wire    [31:0]  paddr;                
wire            pclk;                 
wire            penable;              
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire    [31:0]  pwm01count;           
wire    [31:0]  pwm01count_h;         
wire    [25:0]  pwm01db;              
wire            pwm01db_wen;          
wire    [31:0]  pwm01load;            
wire    [31:0]  pwm01load_h;          
wire            pwm01load_wen;        
wire    [31:0]  pwm01trig;            
wire    [31:0]  pwm01trig_h;          
wire            pwm01trig_wen;        
wire    [31:0]  pwm0cmp;              
wire    [31:0]  pwm0cmp_h;            
wire            pwm0cmp_wen;          
wire            pwm0en;               
wire            pwm0inv;              
wire    [31:0]  pwm0load;             
wire            pwm0mode;             
wire    [31:0]  pwm0trig_val;         
wire            pwm10en;              
wire            pwm10inv;             
wire            pwm11en;              
wire            pwm11inv;             
wire    [31:0]  pwm1cmp;              
wire    [31:0]  pwm1cmp_h;            
wire            pwm1cmp_wen;          
wire            pwm1en;               
wire            pwm1inv;              
wire    [31:0]  pwm1load;             
wire            pwm1mode;             
wire    [31:0]  pwm1trig_val;         
wire    [31:0]  pwm23count;           
wire    [31:0]  pwm23count_h;         
wire    [25:0]  pwm23db;              
wire            pwm23db_wen;          
wire    [31:0]  pwm23load;            
wire    [31:0]  pwm23load_h;          
wire            pwm23load_wen;        
wire    [31:0]  pwm23trig;            
wire    [31:0]  pwm23trig_h;          
wire            pwm23trig_wen;        
wire    [31:0]  pwm2cmp;              
wire    [31:0]  pwm2cmp_h;            
wire            pwm2cmp_wen;          
wire            pwm2en;               
wire            pwm2inv;              
wire    [31:0]  pwm2load;             
wire            pwm2mode;             
wire    [31:0]  pwm2trig_val;         
wire    [31:0]  pwm3cmp;              
wire    [31:0]  pwm3cmp_h;            
wire            pwm3cmp_wen;          
wire            pwm3en;               
wire            pwm3inv;              
wire    [31:0]  pwm3load;             
wire            pwm3mode;             
wire    [31:0]  pwm3trig_val;         
wire    [31:0]  pwm45count;           
wire    [31:0]  pwm45count_h;         
wire    [25:0]  pwm45db;              
wire            pwm45db_wen;          
wire    [31:0]  pwm45load;            
wire    [31:0]  pwm45load_h;          
wire            pwm45load_wen;        
wire    [31:0]  pwm45trig;            
wire    [31:0]  pwm45trig_h;          
wire            pwm45trig_wen;        
wire    [31:0]  pwm4cmp;              
wire    [31:0]  pwm4cmp_h;            
wire            pwm4cmp_wen;          
wire            pwm4en;               
wire            pwm4inv;              
wire    [31:0]  pwm4load;             
wire            pwm4mode;             
wire    [31:0]  pwm4trig_val;         
wire    [31:0]  pwm5cmp;              
wire    [31:0]  pwm5cmp_h;            
wire            pwm5cmp_wen;          
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
wire    [27:0]  pwmcfg;               
wire            pwmcfg_wen;           
wire    [17:0]  pwmctl;               
wire            pwmctl_wen;           
wire            pwmic1_wen;           
wire            pwmic2_wen;           
wire            pwminten1_wen;        
wire            pwminten2_wen;        
wire    [24:0]  pwminverttrig;        
wire            pwminverttrig_wen;    
wire    [31:0]  pwmis1;               
wire    [31:0]  pwmis2;               
wire    [31:0]  pwmris1;              
wire    [31:0]  pwmris2;              
wire            pwrite;               
wire    [1 :0]  sync0mode;            
wire    [1 :0]  sync1mode;            
wire    [1 :0]  sync2mode;            
wire    [1 :0]  sync3mode;            
wire    [1 :0]  sync4mode;            
wire    [1 :0]  sync5mode;            
wire    [31:0]  tim01count;           
wire    [31:0]  tim01count_h;         
wire    [31:0]  tim01load;            
wire    [31:0]  tim01load_h;          
wire            tim01load_wen;        
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
wire    [31:0]  tim23load;            
wire    [31:0]  tim23load_h;          
wire            tim23load_wen;        
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
wire    [31:0]  tim45load;            
wire    [31:0]  tim45load_h;          
wire            tim45load_wen;        
wire            tim4en;               
wire            tim4ic;               
wire            tim4ie;               
wire    [31:0]  tim4load;             
wire            tim5en;               
wire            tim5ic;               
wire            tim5ie;               
wire    [31:0]  tim5load;             
wire    [5 :0]  timic;                
wire            timic_wen;            
wire    [5 :0]  timinten;             
wire            timinten_wen;         
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
wire            triginv;              
wire            write_reg_sel;        
assign write_reg_sel  		= psel & penable & pwrite & (paddr[11:9] == 3'b000);
assign pwmcfg_wen 		= write_reg_sel & (paddr[8:2] == `pwmcfg_OFFSET);
assign pwminverttrig_wen 	= write_reg_sel & (paddr[8:2] == `pwminverttrig_OFFSET); 
assign pwm01trig_wen 		= write_reg_sel & (paddr[8:2] == `pwm01trig_OFFSET); 
assign pwm23trig_wen 		= write_reg_sel & (paddr[8:2] == `pwm23trig_OFFSET); 
assign pwm45trig_wen	 	= write_reg_sel & (paddr[8:2] == `pwm45trig_OFFSET); 
assign pwminten1_wen 		= write_reg_sel & (paddr[8:2] == `pwminten1_OFFSET); 
assign pwminten2_wen 		= write_reg_sel & (paddr[8:2] == `pwminten2_OFFSET); 
assign pwmic1_wen 		= write_reg_sel & (paddr[8:2] == `pwmic1_OFFSET); 
assign pwmic2_wen 		= write_reg_sel & (paddr[8:2] == `pwmic2_OFFSET); 
assign pwmctl_wen 		= write_reg_sel & (paddr[8:2] == `pwmctl_OFFSET); 
assign pwm01load_wen 		= write_reg_sel & (paddr[8:2] == `pwm01load_OFFSET); 
assign pwm23load_wen 		= write_reg_sel & (paddr[8:2] == `pwm23load_OFFSET); 
assign pwm45load_wen 		= write_reg_sel & (paddr[8:2] == `pwm45load_OFFSET); 
assign pwm0cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm0cmp_OFFSET); 
assign pwm1cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm1cmp_OFFSET); 
assign pwm2cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm2cmp_OFFSET); 
assign pwm3cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm3cmp_OFFSET); 
assign pwm4cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm4cmp_OFFSET); 
assign pwm5cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm5cmp_OFFSET); 
assign pwm01db_wen 		= write_reg_sel & (paddr[8:2] == `pwm01db_OFFSET); 
assign pwm23db_wen 		= write_reg_sel & (paddr[8:2] == `pwm23db_OFFSET); 
assign pwm45db_wen 		= write_reg_sel & (paddr[8:2] == `pwm45db_OFFSET); 
assign capctl_wen 		= write_reg_sel & (paddr[8:2] == `capctl_OFFSET); 
assign capinten_wen 		= write_reg_sel & (paddr[8:2] == `capinten_OFFSET); 
assign capic_wen 		= write_reg_sel & (paddr[8:2] == `capic_OFFSET); 
assign cap01match_wen 		= write_reg_sel & (paddr[8:2] == `cap01match_OFFSET); 
assign cap23match_wen 		= write_reg_sel & (paddr[8:2] == `cap23match_OFFSET); 
assign cap45match_wen 		= write_reg_sel & (paddr[8:2] == `cap45match_OFFSET); 
assign timinten_wen 		= write_reg_sel & (paddr[8:2] == `timinten_OFFSET); 
assign timic_wen 		= write_reg_sel & (paddr[8:2] == `timic_OFFSET); 
assign tim01load_wen 		= write_reg_sel & (paddr[8:2] == `tim01load_OFFSET); 
assign tim23load_wen 		= write_reg_sel & (paddr[8:2] == `tim23load_OFFSET); 
assign tim45load_wen 		= write_reg_sel & (paddr[8:2] == `tim45load_OFFSET); 
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmcfg[27:0] <= {28{1'b0}};
  else if(pwmcfg_wen)
    int_pwmcfg[27:0] <= pwdata[27:0];
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg18 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg18 <= pwdata[18];
    else if(etb_pwm_trig_tim0_on)
        etb_pwmcfg18 <= 1'b1;
    else if(etb_pwm_trig_tim0_off)
        etb_pwmcfg18 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg19 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg19 <= pwdata[19];
    else if(etb_pwm_trig_tim1_on)
        etb_pwmcfg19 <= 1'b1;
    else if(etb_pwm_trig_tim1_off)
        etb_pwmcfg19 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg20 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg20 <= pwdata[20];
    else if(etb_pwm_trig_tim2_on)
        etb_pwmcfg20 <= 1'b1;
    else if(etb_pwm_trig_tim2_off)
        etb_pwmcfg20 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg21 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg21 <= pwdata[21];
    else if(etb_pwm_trig_tim3_on)
        etb_pwmcfg21 <= 1'b1;
    else if(etb_pwm_trig_tim3_off)
        etb_pwmcfg21 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg22 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg22 <= pwdata[22];
    else if(etb_pwm_trig_tim4_on)
        etb_pwmcfg22 <= 1'b1;
    else if(etb_pwm_trig_tim4_off)
        etb_pwmcfg22 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg23 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg23 <= pwdata[23];
    else if(etb_pwm_trig_tim5_on)
        etb_pwmcfg23 <= 1'b1;
    else if(etb_pwm_trig_tim5_off)
        etb_pwmcfg23 <= 1'b0;
end
assign pwmcfg[27:0] = int_pwmcfg[27:0] | {4'b0000,etb_pwmcfg23,etb_pwmcfg22,etb_pwmcfg21,etb_pwmcfg20,etb_pwmcfg19,etb_pwmcfg18,18'b00_0000_0000_0000_0000};
assign pwm0en = pwmcfg[0];
assign pwm1en = pwmcfg[1];
assign pwm2en = pwmcfg[2];
assign pwm3en = pwmcfg[3];
assign pwm4en = pwmcfg[4];
assign pwm5en = pwmcfg[5];
assign pwm6en = pwmcfg[6];
assign pwm7en = pwmcfg[7];
assign pwm8en = pwmcfg[8]; 
assign pwm9en = pwmcfg[9]; 
assign pwm10en = pwmcfg[10]; 
assign pwm11en = pwmcfg[11]; 
assign cap0en = pwmcfg[12]; 
assign cap1en = pwmcfg[13]; 
assign cap2en = pwmcfg[14]; 
assign cap3en = pwmcfg[15]; 
assign cap4en = pwmcfg[16]; 
assign cap5en = pwmcfg[17]; 
assign tim0en = pwmcfg[18];
assign tim1en = pwmcfg[19];
assign tim2en = pwmcfg[20];
assign tim3en = pwmcfg[21];
assign tim4en = pwmcfg[22];
assign tim5en = pwmcfg[23];
assign cntdiv[2:0] = pwmcfg[26:24];
assign cntdiven = pwmcfg[27];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminverttrig[24:0] <= {25{1'b0}};
  else
    if(pwminverttrig_wen)
      int_pwminverttrig[24:0] <= pwdata[24:0];
end
assign pwminverttrig[24:0] = int_pwminverttrig[24:0];
assign pwm0inv = pwminverttrig[0];
assign pwm1inv = pwminverttrig[1];
assign pwm2inv = pwminverttrig[2];
assign pwm3inv = pwminverttrig[3];
assign pwm4inv = pwminverttrig[4];
assign pwm5inv = pwminverttrig[5];
assign pwm6inv = pwminverttrig[6];
assign pwm7inv = pwminverttrig[7];
assign pwm8inv = pwminverttrig[8];
assign pwm9inv = pwminverttrig[9];
assign pwm10inv = pwminverttrig[10];
assign pwm11inv = pwminverttrig[11];
assign triginv = pwminverttrig[12];
assign tr0enu = pwminverttrig[13];
assign tr0end = pwminverttrig[14];
assign tr1enu = pwminverttrig[15];
assign tr1end = pwminverttrig[16];
assign tr2enu = pwminverttrig[17];
assign tr2end = pwminverttrig[18];
assign tr3enu = pwminverttrig[19];
assign tr3end = pwminverttrig[20];
assign tr4enu = pwminverttrig[21];
assign tr4end = pwminverttrig[22];
assign tr5enu = pwminverttrig[23];
assign tr5end = pwminverttrig[24];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01trig[31:0] <= {32{1'b0}};
  else
    if(pwm01trig_wen)
      int_pwm01trig[31:0] <= pwdata[31:0];
end
assign pwm01trig[31:0] = int_pwm01trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23trig[31:0] <= {32{1'b0}};
  else
    if(pwm23trig_wen)
      int_pwm23trig[31:0] <= pwdata[31:0];
end
assign pwm23trig[31:0] = int_pwm23trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45trig[31:0] <= {32{1'b0}};
  else
    if(pwm45trig_wen)
      int_pwm45trig[31:0] <= pwdata[31:0];
end
assign pwm45trig[31:0] = int_pwm45trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h35))
      int_pwm01trig_h[31:0] <= pwdata[31:0];
end
assign pwm01trig_h[31:0] = int_pwm01trig_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h36))
      int_pwm23trig_h[31:0] <= pwdata[31:0];
end
assign pwm23trig_h[31:0] = int_pwm23trig_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h37))
      int_pwm45trig_h[31:0] <= pwdata[31:0];
end
assign pwm45trig_h[31:0] = int_pwm45trig_h[31:0];
assign pwm0trig_val[31:0] = {pwm01trig_h[15:0],pwm01trig[15:0]};
assign pwm1trig_val[31:0] = {pwm01trig_h[31:16],pwm01trig[31:16]};
assign pwm2trig_val[31:0] = {pwm23trig_h[15:0],pwm23trig[15:0]};
assign pwm3trig_val[31:0] = {pwm23trig_h[31:16],pwm23trig[31:16]};
assign pwm4trig_val[31:0] = {pwm45trig_h[15:0],pwm45trig[15:0]};
assign pwm5trig_val[31:0] = {pwm45trig_h[31:16],pwm45trig[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[0:0] <= {1{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[0:0] <= pwdata[0:0];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[13:8] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[13:8] <= pwdata[13:8];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[21:16] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[21:16] <= pwdata[21:16];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[29:24] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[29:24] <= pwdata[29:24];
end
assign intenfault = 	int_pwminten1[0];
assign int0encntzero = 	int_pwminten1[8];
assign int0encntload = 	int_pwminten1[9];
assign int0encmpau = 	int_pwminten1[10];
assign int0encmpbu = 	int_pwminten1[11];
assign int0encmpad =	int_pwminten1[12];
assign int0encmpbd = 	int_pwminten1[13];
assign int1encntzero = 	int_pwminten1[16];
assign int1encntload = 	int_pwminten1[17];
assign int1encmpau = 	int_pwminten1[18];
assign int1encmpbu = 	int_pwminten1[19];
assign int1encmpad = 	int_pwminten1[20];
assign int1encmpbd = 	int_pwminten1[21];
assign int2encntzero = 	int_pwminten1[24];
assign int2encntload = 	int_pwminten1[25];
assign int2encmpau = 	int_pwminten1[26];
assign int2encmpbu = 	int_pwminten1[27];
assign int2encmpad = 	int_pwminten1[28];
assign int2encmpbd = 	int_pwminten1[29];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[5:0] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[5:0] <= pwdata[5:0];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[13:8] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[13:8] <= pwdata[13:8];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[21:16] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[21:16] <= pwdata[21:16];
end
assign int3encntzero = 	int_pwminten2[0];
assign int3encntload = 	int_pwminten2[1];
assign int3encmpau = 	int_pwminten2[2];
assign int3encmpbu = 	int_pwminten2[3];
assign int3encmpad = 	int_pwminten2[4];
assign int3encmpbd = 	int_pwminten2[5];
assign int4encntzero = 	int_pwminten2[8];
assign int4encntload = 	int_pwminten2[9];
assign int4encmpau = 	int_pwminten2[10];
assign int4encmpbu = 	int_pwminten2[11];
assign int4encmpad = 	int_pwminten2[12];
assign int4encmpbd = 	int_pwminten2[13];
assign int5encntzero = 	int_pwminten2[16];
assign int5encntload = 	int_pwminten2[17];
assign int5encmpau = 	int_pwminten2[18];
assign int5encmpbu = 	int_pwminten2[19];
assign int5encmpad = 	int_pwminten2[20];
assign int5encmpbd = 	int_pwminten2[21];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[0:0] <= {1{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[0:0] <= pwdata[0:0];
  else
      int_pwmic1[0:0] <= {1{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[13:8] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[13:8] <= pwdata[13:8];
  else
      int_pwmic1[13:8] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[21:16] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[21:16] <= pwdata[21:16];
  else
      int_pwmic1[21:16] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[29:24] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[29:24] <= pwdata[29:24];
  else
      int_pwmic1[29:24] <= {6{1'b0}};
end
assign inticfault = 	int_pwmic1[0];
assign intic0cntzero = 	int_pwmic1[8];
assign intic0cntload = 	int_pwmic1[9];
assign intic0cmpau = 	int_pwmic1[10];
assign intic0cmpbu = 	int_pwmic1[11];
assign intic0cmpad = 	int_pwmic1[12];
assign intic0cmpbd = 	int_pwmic1[13];
assign intic1cntzero = 	int_pwmic1[16];
assign intic1cntload = 	int_pwmic1[17];
assign intic1cmpau = 	int_pwmic1[18];
assign intic1cmpbu = 	int_pwmic1[19];
assign intic1cmpad = 	int_pwmic1[20];
assign intic1cmpbd = 	int_pwmic1[21];
assign intic2cntzero = 	int_pwmic1[24];
assign intic2cntload = 	int_pwmic1[25];
assign intic2cmpau = 	int_pwmic1[26];
assign intic2cmpbu = 	int_pwmic1[27];
assign intic2cmpad = 	int_pwmic1[28];
assign intic2cmpbd = 	int_pwmic1[29];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[5:0] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[5:0] <= pwdata[5:0];
  else
      int_pwmic2[5:0] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[13:8] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[13:8] <= pwdata[13:8];
  else
      int_pwmic2[13:8] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[21:16] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[21:16] <= pwdata[21:16];
  else
      int_pwmic2[21:16] <= {6{1'b0}};
end
assign intic3cntzero = 	int_pwmic2[0];
assign intic3cntload =	int_pwmic2[1];
assign intic3cmpau = 	int_pwmic2[2];
assign intic3cmpbu = 	int_pwmic2[3];
assign intic3cmpad = 	int_pwmic2[4];
assign intic3cmpbd = 	int_pwmic2[5];
assign intic4cntzero = 	int_pwmic2[8];
assign intic4cntload = 	int_pwmic2[9];
assign intic4cmpau = 	int_pwmic2[10];
assign intic4cmpbu = 	int_pwmic2[11];
assign intic4cmpad = 	int_pwmic2[12];
assign intic4cmpbd = 	int_pwmic2[13];
assign intic5cntzero = 	int_pwmic2[16];
assign intic5cntload = 	int_pwmic2[17];
assign intic5cmpau = 	int_pwmic2[18];
assign intic5cmpbu = 	int_pwmic2[19];
assign intic5cmpad = 	int_pwmic2[20];
assign intic5cmpbd = 	int_pwmic2[21];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmctl[17:0] <= {18{1'b0}};
  else
    if(pwmctl_wen)
      int_pwmctl[17:0] <= pwdata[17:0];
end
assign pwmctl[17:0] = int_pwmctl[17:0];
assign pwm0mode = pwmctl[0];
assign pwm1mode = pwmctl[1];
assign pwm2mode = pwmctl[2];
assign pwm3mode = pwmctl[3];
assign pwm4mode = pwmctl[4];
assign pwm5mode = pwmctl[5];
assign sync0mode[1:0] = pwmctl[7:6];
assign sync1mode[1:0] = pwmctl[9:8];
assign sync2mode[1:0] = pwmctl[11:10];
assign sync3mode[1:0] = pwmctl[13:12];
assign sync4mode[1:0] = pwmctl[15:14];
assign sync5mode[1:0] = pwmctl[17:16];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01load[31:0] <= {32{1'b0}};
  else
    if(pwm01load_wen)
      int_pwm01load[31:0] <= pwdata[31:0];
end
assign pwm01load[31:0] = int_pwm01load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23load[31:0] <= {32{1'b0}};
  else
    if(pwm23load_wen)
      int_pwm23load[31:0] <= pwdata[31:0];
end
assign pwm23load[31:0] = int_pwm23load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45load[31:0] <= {32{1'b0}};
  else
    if(pwm45load_wen)
      int_pwm45load[31:0] <= pwdata[31:0];
end
assign pwm45load[31:0] = int_pwm45load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h41)
      int_pwm01load_h[31:0] <= pwdata[31:0];
end
assign pwm01load_h[31:0] = int_pwm01load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h42)
      int_pwm23load_h[31:0] <= pwdata[31:0];
end
assign pwm23load_h[31:0] = int_pwm23load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h43)
      int_pwm45load_h[31:0] <= pwdata[31:0];
end
assign pwm45load_h[31:0] = int_pwm45load_h[31:0];
assign pwm0load[31:0] = {pwm01load_h[15:0],pwm01load[15:0]};
assign pwm1load[31:0] = {pwm01load_h[31:16],pwm01load[31:16]};
assign pwm2load[31:0] = {pwm23load_h[15:0],pwm23load[15:0]};
assign pwm3load[31:0] = {pwm23load_h[31:16],pwm23load[31:16]};
assign pwm4load[31:0] = {pwm45load_h[15:0],pwm45load[15:0]};
assign pwm5load[31:0] = {pwm45load_h[31:16],pwm45load[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm0cmp[31:0] <= {32{1'b0}};
  else
    if(pwm0cmp_wen)
      int_pwm0cmp[31:0] <= pwdata[31:0];
end
assign pwm0cmp[31:0] = int_pwm0cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm1cmp[31:0] <= {32{1'b0}};
  else
    if(pwm1cmp_wen)
      int_pwm1cmp[31:0] <= pwdata[31:0];
end
assign pwm1cmp[31:0] = int_pwm1cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm2cmp[31:0] <= {32{1'b0}};
  else
    if(pwm2cmp_wen)
      int_pwm2cmp[31:0] <= pwdata[31:0];
end
assign pwm2cmp[31:0] = int_pwm2cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm3cmp[31:0] <= {32{1'b0}};
  else
    if(pwm3cmp_wen)
      int_pwm3cmp[31:0] <= pwdata[31:0];
end
assign pwm3cmp[31:0] = int_pwm3cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm4cmp[31:0] <= {32{1'b0}};
  else
    if(pwm4cmp_wen)
      int_pwm4cmp[31:0] <= pwdata[31:0];
end
assign pwm4cmp[31:0] = int_pwm4cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm5cmp[31:0] <= {32{1'b0}};
  else
    if(pwm5cmp_wen)
      int_pwm5cmp[31:0] <= pwdata[31:0];
end
assign pwm5cmp[31:0] = int_pwm5cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm0cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[7:2] == 6'h38))
      int_pwm0cmp_h[31:0] <= pwdata[31:0];
end
assign pwm0cmp_h[31:0] = int_pwm0cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm1cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[7:2] == 6'h39))
      int_pwm1cmp_h[31:0] <= pwdata[31:0];
end
assign pwm1cmp_h[31:0] = int_pwm1cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm2cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3a))
      int_pwm2cmp_h[31:0] <= pwdata[31:0];
end
assign pwm2cmp_h[31:0] = int_pwm2cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm3cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3b))
      int_pwm3cmp_h[31:0] <= pwdata[31:0];
end
assign pwm3cmp_h[31:0] = int_pwm3cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm4cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3c))
      int_pwm4cmp_h[31:0] <= pwdata[31:0];
end
assign pwm4cmp_h[31:0] = int_pwm4cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm5cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3d))
      int_pwm5cmp_h[31:0] <= pwdata[31:0];
end
assign pwm5cmp_h[31:0] = int_pwm5cmp_h[31:0];
assign compa_val_0[31:0] = {pwm0cmp_h[15:0],pwm0cmp[15:0]};
assign compa_val_1[31:0] = {pwm1cmp_h[15:0],pwm1cmp[15:0]};
assign compa_val_2[31:0] = {pwm2cmp_h[15:0],pwm2cmp[15:0]};
assign compa_val_3[31:0] = {pwm3cmp_h[15:0],pwm3cmp[15:0]};
assign compa_val_4[31:0] = {pwm4cmp_h[15:0],pwm4cmp[15:0]};
assign compa_val_5[31:0] = {pwm5cmp_h[15:0],pwm5cmp[15:0]};
assign compb_val_0[31:0] = {pwm0cmp_h[31:16],pwm0cmp[31:16]};
assign compb_val_1[31:0] = {pwm1cmp_h[31:16],pwm1cmp[31:16]};
assign compb_val_2[31:0] = {pwm2cmp_h[31:16],pwm2cmp[31:16]};
assign compb_val_3[31:0] = {pwm3cmp_h[31:16],pwm3cmp[31:16]};
assign compb_val_4[31:0] = {pwm4cmp_h[31:16],pwm4cmp[31:16]};
assign compb_val_5[31:0] = {pwm5cmp_h[31:16],pwm5cmp[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01db[25:0] <= {26{1'b0}};
  else
    if(pwm01db_wen)
      int_pwm01db[25:0] <= pwdata[25:0];
end
assign pwm01db[25:0] = int_pwm01db[25:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23db[25:0] <= {26{1'b0}};
  else
    if(pwm23db_wen)
      int_pwm23db[25:0] <= pwdata[25:0];
end
assign pwm23db[25:0] = int_pwm23db[25:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45db[25:0] <= {26{1'b0}};
  else
    if(pwm45db_wen)
      int_pwm45db[25:0] <= pwdata[25:0];
end
assign pwm45db[25:0] = int_pwm45db[25:0];
assign db0en = pwm01db[24];
assign db1en = pwm01db[25];
assign db2en = pwm23db[24];
assign db3en = pwm23db[25];
assign db4en = pwm45db[24];
assign db5en = pwm45db[25];
assign delay0[11:0] = pwm01db[11:0];
assign delay1[11:0] = pwm01db[23:12];
assign delay2[11:0] = pwm23db[11:0];
assign delay3[11:0] = pwm23db[23:12];
assign delay4[11:0] = pwm45db[11:0];
assign delay5[11:0] = pwm45db[23:12];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capctl[17:0] <= {18{1'b0}};
  else
    if(capctl_wen)
      int_capctl[17:0] <= pwdata[17:0];
end
assign capctl[17:0] = int_capctl[17:0];
assign cap0mode = capctl[0];
assign cap1mode = capctl[1];
assign cap2mode = capctl[2];
assign cap3mode = capctl[3];
assign cap4mode = capctl[4];
assign cap5mode = capctl[5];
assign cap0eventa[1:0] = capctl[7:6];
assign cap1eventa[1:0] = capctl[9:8];
assign cap2eventa[1:0] = capctl[11:10];
assign cap3eventa[1:0] = capctl[13:12];
assign cap4eventa[1:0] = capctl[15:14];
assign cap5eventa[1:0] = capctl[17:16];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capinten[11:0] <= {12{1'b0}};
  else
    if(capinten_wen)
      int_capinten[11:0] <= pwdata[11:0];
end
assign capinten[11:0] = int_capinten[11:0];
assign cap0cntie = capinten[0];
assign cap1cntie = capinten[1];
assign cap2cntie = capinten[2];
assign cap3cntie = capinten[3];
assign cap4cntie = capinten[4];
assign cap5cntie = capinten[5];
assign cap0timie = capinten[6];
assign cap1timie = capinten[7];
assign cap2timie = capinten[8];
assign cap3timie = capinten[9];
assign cap4timie = capinten[10];
assign cap5timie = capinten[11];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capic[11:0] <= {12{1'b0}};
  else if(capic_wen)
      int_capic[11:0] <= pwdata[11:0];
  else
      int_capic[11:0] <= {12{1'b0}};
end
assign capic[11:0] = int_capic[11:0];
assign cap0cntic = capic[0];
assign cap1cntic = capic[1];
assign cap2cntic = capic[2];
assign cap3cntic = capic[3];
assign cap4cntic = capic[4];
assign cap5cntic = capic[5];
assign cap0timic = capic[6];
assign cap1timic = capic[7];
assign cap2timic = capic[8];
assign cap3timic = capic[9];
assign cap4timic = capic[10];
assign cap5timic = capic[11];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap01match[31:0] <= {32{1'b0}};
  else
    if(cap01match_wen)
      int_cap01match[31:0] <= pwdata[31:0];
end
assign cap01match[31:0] = int_cap01match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap23match[31:0] <= {32{1'b0}};
  else
    if(cap23match_wen)
      int_cap23match[31:0] <= pwdata[31:0];
end
assign cap23match[31:0] = int_cap23match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap45match[31:0] <= {32{1'b0}};
  else
    if(cap45match_wen)
      int_cap45match[31:0] <= pwdata[31:0];
end
assign cap45match[31:0] = int_cap45match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap01match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h44))
      int_cap01match_h[31:0] <= pwdata[31:0];
end
assign cap01match_h[31:0] = int_cap01match_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap23match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h45))
      int_cap23match_h[31:0] <= pwdata[31:0];
end
assign cap23match_h[31:0] = int_cap23match_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap45match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h46))
      int_cap45match_h[31:0] <= pwdata[31:0];
end
assign cap45match_h[31:0] = int_cap45match_h[31:0];
assign cap0match[31:0] = {cap01match_h[15:0],cap01match[15:0]};
assign cap1match[31:0] = {cap01match_h[31:16],cap01match[31:16]};
assign cap2match[31:0] = {cap23match_h[15:0],cap23match[15:0]};
assign cap3match[31:0] = {cap23match_h[31:16],cap23match[31:16]};
assign cap4match[31:0] = {cap45match_h[15:0],cap45match[15:0]};
assign cap5match[31:0] = {cap45match_h[31:16],cap45match[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_timinten[5:0] <= {6{1'b0}};
  else
    if(timinten_wen)
      int_timinten[5:0] <= pwdata[5:0];
end
assign timinten[5:0] = int_timinten[5:0];
assign tim0ie = timinten[0];
assign tim1ie = timinten[1];
assign tim2ie = timinten[2];
assign tim3ie = timinten[3];
assign tim4ie = timinten[4];
assign tim5ie = timinten[5];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_timic[5:0] <= {6{1'b0}};
  else if(timic_wen)
      int_timic[5:0] <= pwdata[5:0];
  else
      int_timic[5:0] <= {6{1'b0}};
end
assign timic[5:0] = int_timic[5:0];
assign tim0ic = timic[0];
assign tim1ic = timic[1];
assign tim2ic = timic[2];
assign tim3ic = timic[3];
assign tim4ic = timic[4];
assign tim5ic = timic[5];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim01load[31:0] <= {32{1'b0}};
  else
    if(tim01load_wen)
      int_tim01load[31:0] <= pwdata[31:0];
end
assign tim01load[31:0] = int_tim01load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim23load[31:0] <= {32{1'b0}};
  else
    if(tim23load_wen)
      int_tim23load[31:0] <= pwdata[31:0];
end
assign tim23load[31:0] = int_tim23load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim45load[31:0] <= {32{1'b0}};
  else
    if(tim45load_wen)
      int_tim45load[31:0] <= pwdata[31:0];
end
assign tim45load[31:0] = int_tim45load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim01load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 6'h3e))
      int_tim01load_h[31:0] <= pwdata[31:0];
end
assign tim01load_h[31:0] = int_tim01load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim23load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 6'h3f))
      int_tim23load_h[31:0] <= pwdata[31:0];
end
assign tim23load_h[31:0] = int_tim23load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim45load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h40))
      int_tim45load_h[31:0] <= pwdata[31:0];
end
assign tim45load_h[31:0] = int_tim45load_h[31:0];
assign tim0load[31:0] = {tim01load_h[15:0],tim01load[15:0]};
assign tim1load[31:0] = {tim01load_h[31:16],tim01load[31:16]};
assign tim2load[31:0] = {tim23load_h[15:0],tim23load[15:0]};
assign tim3load[31:0] = {tim23load_h[31:16],tim23load[31:16]};
assign tim4load[31:0] = {tim45load_h[15:0],tim45load[15:0]};
assign tim5load[31:0] = {tim45load_h[31:16],tim45load[31:16]};
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
    iprdata[31:0] <= {32{1'b0}};
  else
    if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0) && (paddr[11:9] == 3'b000))
      case(paddr[8:2])
        `pwmcfg_OFFSET         : iprdata <= {4'b0,pwmcfg[27:0]};
        `pwminverttrig_OFFSET  : iprdata <= {7'b0,pwminverttrig[24:0]}; 
        `pwminten1_OFFSET      : iprdata <= {2'b0,int_pwminten1[29:24],2'b0,int_pwminten1[21:16],2'b0,int_pwminten1[13:8],7'b0,int_pwminten1[0]}; 
        `pwminten2_OFFSET      : iprdata <= {10'b0,int_pwminten2[21:16],2'b0,int_pwminten2[13:8],2'b0,int_pwminten2[5:0]}; 
        `pwmris1_OFFSET        : iprdata <= pwmris1[31:0]; 
        `pwmris2_OFFSET        : iprdata <= pwmris2[31:0]; 
        `pwmic1_OFFSET         : iprdata <= {2'b0,int_pwmic1[29:24],2'b0,int_pwmic1[21:16],2'b0,int_pwmic1[13:8],7'b0,int_pwmic1[0]}; 
        `pwmic2_OFFSET         : iprdata <= {10'b0,int_pwmic2[21:16],2'b0,int_pwmic2[13:8],2'b0,int_pwmic2[5:0]}; 
        `pwmis1_OFFSET         : iprdata <= pwmis1[31:0];
        `pwmis2_OFFSET         : iprdata <= pwmis2[31:0];
        `pwmctl_OFFSET         : iprdata <= {14'b0,pwmctl[17:0]};
        `pwm01load_OFFSET      : iprdata <= pwm01load;
        `pwm23load_OFFSET      : iprdata <= pwm23load;
        `pwm45load_OFFSET      : iprdata <= pwm45load;
        `pwm01count_OFFSET     : iprdata <= pwm01count[31:0];
        `pwm23count_OFFSET     : iprdata <= pwm23count[31:0];
        `pwm45count_OFFSET     : iprdata <= pwm45count[31:0];
        `pwm0cmp_OFFSET        : iprdata <= pwm0cmp;
        `pwm1cmp_OFFSET        : iprdata <= pwm1cmp; 
        `pwm2cmp_OFFSET        : iprdata <= pwm2cmp; 
        `pwm3cmp_OFFSET        : iprdata <= pwm3cmp; 
        `pwm4cmp_OFFSET        : iprdata <= pwm4cmp; 
        `pwm5cmp_OFFSET        : iprdata <= pwm5cmp; 
        `pwm01db_OFFSET        : iprdata <= {6'b0,pwm01db[25:0]}; 
        `pwm23db_OFFSET        : iprdata <= {6'b0,pwm23db[25:0]};
        `pwm45db_OFFSET        : iprdata <= {6'b0,pwm45db[25:0]};
        `capctl_OFFSET         : iprdata <= {14'b0,capctl[17:0]};
        `capinten_OFFSET       : iprdata <= {20'b0,capinten[11:0]};
        `capris_OFFSET         : iprdata <= capris[31:0];
        `capic_OFFSET          : iprdata <= {20'b0,capic[11:0]};
        `capis_OFFSET          : iprdata <= capis[31:0];
        `cap01t_OFFSET         : iprdata <= cap01t[31:0];
        `cap23t_OFFSET         : iprdata <= cap23t[31:0];
        `cap45t_OFFSET         : iprdata <= cap45t[31:0];
        `cap01match_OFFSET     : iprdata <= cap01match;
        `cap23match_OFFSET     : iprdata <= cap23match;
        `cap45match_OFFSET     : iprdata <= cap45match;
        `timinten_OFFSET       : iprdata <= {26'b0,timinten[5:0]};
        `timris_OFFSET         : iprdata <= timris[31:0];
        `timic_OFFSET          : iprdata <= {26'b0,timic[5:0]};
        `timis_OFFSET          : iprdata <= timis[31:0];
        `tim01load_OFFSET      : iprdata <= tim01load;
        `tim23load_OFFSET      : iprdata <= tim23load;
        `tim45load_OFFSET      : iprdata <= tim45load;
	`pwm01trig_OFFSET      : iprdata <= pwm01trig;
	`pwm23trig_OFFSET      : iprdata <= pwm23trig;
        `pwm45trig_OFFSET      : iprdata <= pwm45trig;
	`tim01count_OFFSET     : iprdata <= tim01count[31:0];
	`tim23count_OFFSET     : iprdata <= tim23count[31:0];
	`tim45count_OFFSET     : iprdata <= tim45count[31:0];
	`cnt01val_OFFSET       : iprdata <= {cnt1val[15:0],cnt0val[15:0]};
	`cnt23val_OFFSET       : iprdata <= {cnt3val[15:0],cnt2val[15:0]};
	`cnt45val_OFFSET       : iprdata <= {cnt5val[15:0],cnt4val[15:0]};
        7'h35                  : iprdata <= pwm01trig_h;
 	7'h36                  : iprdata <= pwm23trig_h;
        7'h37                  : iprdata <= pwm45trig_h;
	7'h38                  : iprdata <= pwm0cmp_h;
	7'h39                  : iprdata <= pwm1cmp_h;
	7'h3a                  : iprdata <= pwm2cmp_h;
 	7'h3b                  : iprdata <= pwm3cmp_h;
        7'h3c                  : iprdata <= pwm4cmp_h;
	7'h3d                  : iprdata <= pwm5cmp_h;
	7'h3e                  : iprdata <= tim01load_h;
	7'h3f                  : iprdata <= tim23load_h;
 	7'h40                  : iprdata <= tim45load_h;
        7'h41                  : iprdata <= pwm01load_h;
	7'h42                  : iprdata <= pwm23load_h;
	7'h43                  : iprdata <= pwm45load_h;
	7'h44                  : iprdata <= cap01match_h;
	7'h45                  : iprdata <= cap23match_h;
	7'h46                  : iprdata <= cap45match_h;
        7'h47		       : iprdata <= pwm01count_h[31:0];
	7'h48		       : iprdata <= pwm23count_h[31:0];
	7'h49		       : iprdata <= pwm45count_h[31:0];
        7'h4a		       : iprdata <= cap01t_h[31:0];
	7'h4b		       : iprdata <= cap23t_h[31:0];
	7'h4c		       : iprdata <= cap45t_h[31:0];
 	7'h4d		       : iprdata <= tim01count_h[31:0];
	7'h4e		       : iprdata <= tim23count_h[31:0];
	7'h4f		       : iprdata <= tim45count_h[31:0];
	7'h50		       : iprdata <= {cnt1val[31:16],cnt0val[31:16]};
	7'h51		       : iprdata <= {cnt3val[31:16],cnt2val[31:16]};
	7'h52		       : iprdata <= {cnt5val[31:16],cnt4val[31:16]};
        default                : iprdata <= {32{1'b0}};
      endcase
    else
      iprdata <= {32{1'b0}};
end
assign prdata[31:0] = iprdata;
endmodule
