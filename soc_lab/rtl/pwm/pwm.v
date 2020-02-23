/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pwm(
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
  fault,
  i_capedge0,
  i_capedge10,
  i_capedge2,
  i_capedge4,
  i_capedge6,
  i_capedge8,
  o_pwm0,
  o_pwm1,
  o_pwm10,
  o_pwm11,
  o_pwm2,
  o_pwm3,
  o_pwm4,
  o_pwm5,
  o_pwm6,
  o_pwm7,
  o_pwm8,
  o_pwm9,
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwm0oe_n,
  pwm10oe_n,
  pwm11oe_n,
  pwm1oe_n,
  pwm2oe_n,
  pwm3oe_n,
  pwm4oe_n,
  pwm5oe_n,
  pwm6oe_n,
  pwm7oe_n,
  pwm8oe_n,
  pwm9oe_n,
  pwm_idle,
  pwm_tim0_etb_trig,
  pwm_tim1_etb_trig,
  pwm_tim2_etb_trig,
  pwm_tim3_etb_trig,
  pwm_tim4_etb_trig,
  pwm_tim5_etb_trig,
  pwm_xx_trig,
  pwmint,
  pwrite,
  test_mode
);
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
input           fault;                
input           i_capedge0;           
input           i_capedge10;          
input           i_capedge2;           
input           i_capedge4;           
input           i_capedge6;           
input           i_capedge8;           
input   [31:0]  paddr;                
input           pclk;                 
input           penable;              
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input           pwrite;               
input           test_mode;            
output          o_pwm0;               
output          o_pwm1;               
output          o_pwm10;              
output          o_pwm11;              
output          o_pwm2;               
output          o_pwm3;               
output          o_pwm4;               
output          o_pwm5;               
output          o_pwm6;               
output          o_pwm7;               
output          o_pwm8;               
output          o_pwm9;               
output  [31:0]  prdata;               
output          pwm0oe_n;             
output          pwm10oe_n;            
output          pwm11oe_n;            
output          pwm1oe_n;             
output          pwm2oe_n;             
output          pwm3oe_n;             
output          pwm4oe_n;             
output          pwm5oe_n;             
output          pwm6oe_n;             
output          pwm7oe_n;             
output          pwm8oe_n;             
output          pwm9oe_n;             
output          pwm_idle;             
output          pwm_tim0_etb_trig;    
output          pwm_tim1_etb_trig;    
output          pwm_tim2_etb_trig;    
output          pwm_tim3_etb_trig;    
output          pwm_tim4_etb_trig;    
output          pwm_tim5_etb_trig;    
output          pwm_xx_trig;          
output          pwmint;               
reg             fault_d;              
reg             fault_d2;             
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
wire            fault;                
wire            i_capedge0;           
wire            i_capedge10;          
wire            i_capedge2;           
wire            i_capedge4;           
wire            i_capedge6;           
wire            i_capedge8;           
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
wire            o_pwm0;               
wire            o_pwm1;               
wire            o_pwm10;              
wire            o_pwm11;              
wire            o_pwm2;               
wire            o_pwm3;               
wire            o_pwm4;               
wire            o_pwm5;               
wire            o_pwm6;               
wire            o_pwm7;               
wire            o_pwm8;               
wire            o_pwm9;               
wire    [31:0]  paddr;                
wire            pclk;                 
wire            penable;              
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire    [31:0]  pwm01count;           
wire    [31:0]  pwm01count_h;         
wire            pwm0en;               
wire            pwm0inv;              
wire    [31:0]  pwm0load;             
wire            pwm0mode;             
wire            pwm0oe;               
wire            pwm0oe_n;             
wire    [31:0]  pwm0trig_val;         
wire            pwm10en;              
wire            pwm10inv;             
wire            pwm10oe;              
wire            pwm10oe_n;            
wire            pwm11en;              
wire            pwm11inv;             
wire            pwm11oe;              
wire            pwm11oe_n;            
wire            pwm1en;               
wire            pwm1inv;              
wire    [31:0]  pwm1load;             
wire            pwm1mode;             
wire            pwm1oe;               
wire            pwm1oe_n;             
wire    [31:0]  pwm1trig_val;         
wire    [31:0]  pwm23count;           
wire    [31:0]  pwm23count_h;         
wire            pwm2en;               
wire            pwm2inv;              
wire    [31:0]  pwm2load;             
wire            pwm2mode;             
wire            pwm2oe;               
wire            pwm2oe_n;             
wire    [31:0]  pwm2trig_val;         
wire            pwm3en;               
wire            pwm3inv;              
wire    [31:0]  pwm3load;             
wire            pwm3mode;             
wire            pwm3oe;               
wire            pwm3oe_n;             
wire    [31:0]  pwm3trig_val;         
wire    [31:0]  pwm45count;           
wire    [31:0]  pwm45count_h;         
wire            pwm4en;               
wire            pwm4inv;              
wire    [31:0]  pwm4load;             
wire            pwm4mode;             
wire            pwm4oe;               
wire            pwm4oe_n;             
wire    [31:0]  pwm4trig_val;         
wire            pwm5en;               
wire            pwm5inv;              
wire    [31:0]  pwm5load;             
wire            pwm5mode;             
wire            pwm5oe;               
wire            pwm5oe_n;             
wire    [31:0]  pwm5trig_val;         
wire            pwm6en;               
wire            pwm6inv;              
wire            pwm6oe;               
wire            pwm6oe_n;             
wire            pwm7en;               
wire            pwm7inv;              
wire            pwm7oe;               
wire            pwm7oe_n;             
wire            pwm8en;               
wire            pwm8inv;              
wire            pwm8oe;               
wire            pwm8oe_n;             
wire            pwm9en;               
wire            pwm9inv;              
wire            pwm9oe;               
wire            pwm9oe_n;             
wire            pwm_idle;             
wire            pwm_tim0_etb_trig;    
wire            pwm_tim1_etb_trig;    
wire            pwm_tim2_etb_trig;    
wire            pwm_tim3_etb_trig;    
wire            pwm_tim4_etb_trig;    
wire            pwm_tim5_etb_trig;    
wire            pwm_xx_trig;          
wire            pwmint;               
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
wire            triginv;              
always@(posedge pclk or negedge presetn)
    if(!presetn)begin
	fault_d  <= 0;
        fault_d2 <= 0;
    end
    else begin
        fault_d  <= fault;
        fault_d2 <= fault_d;
    end
pwm_ctrl  x_pwm_ctrl (
  .cap01t            (cap01t           ),
  .cap01t_h          (cap01t_h         ),
  .cap0cntic         (cap0cntic        ),
  .cap0cntie         (cap0cntie        ),
  .cap0en            (cap0en           ),
  .cap0eventa        (cap0eventa       ),
  .cap0match         (cap0match        ),
  .cap0mode          (cap0mode         ),
  .cap0timic         (cap0timic        ),
  .cap0timie         (cap0timie        ),
  .cap1cntic         (cap1cntic        ),
  .cap1cntie         (cap1cntie        ),
  .cap1en            (cap1en           ),
  .cap1eventa        (cap1eventa       ),
  .cap1match         (cap1match        ),
  .cap1mode          (cap1mode         ),
  .cap1timic         (cap1timic        ),
  .cap1timie         (cap1timie        ),
  .cap23t            (cap23t           ),
  .cap23t_h          (cap23t_h         ),
  .cap2cntic         (cap2cntic        ),
  .cap2cntie         (cap2cntie        ),
  .cap2en            (cap2en           ),
  .cap2eventa        (cap2eventa       ),
  .cap2match         (cap2match        ),
  .cap2mode          (cap2mode         ),
  .cap2timic         (cap2timic        ),
  .cap2timie         (cap2timie        ),
  .cap3cntic         (cap3cntic        ),
  .cap3cntie         (cap3cntie        ),
  .cap3en            (cap3en           ),
  .cap3eventa        (cap3eventa       ),
  .cap3match         (cap3match        ),
  .cap3mode          (cap3mode         ),
  .cap3timic         (cap3timic        ),
  .cap3timie         (cap3timie        ),
  .cap45t            (cap45t           ),
  .cap45t_h          (cap45t_h         ),
  .cap4cntic         (cap4cntic        ),
  .cap4cntie         (cap4cntie        ),
  .cap4en            (cap4en           ),
  .cap4eventa        (cap4eventa       ),
  .cap4match         (cap4match        ),
  .cap4mode          (cap4mode         ),
  .cap4timic         (cap4timic        ),
  .cap4timie         (cap4timie        ),
  .cap5cntic         (cap5cntic        ),
  .cap5cntie         (cap5cntie        ),
  .cap5en            (cap5en           ),
  .cap5eventa        (cap5eventa       ),
  .cap5match         (cap5match        ),
  .cap5mode          (cap5mode         ),
  .cap5timic         (cap5timic        ),
  .cap5timie         (cap5timie        ),
  .capis             (capis            ),
  .capris            (capris           ),
  .cnt0val           (cnt0val          ),
  .cnt1val           (cnt1val          ),
  .cnt2val           (cnt2val          ),
  .cnt3val           (cnt3val          ),
  .cnt4val           (cnt4val          ),
  .cnt5val           (cnt5val          ),
  .cntdiv            (cntdiv           ),
  .cntdiven          (cntdiven         ),
  .compa_val_0       (compa_val_0      ),
  .compa_val_1       (compa_val_1      ),
  .compa_val_2       (compa_val_2      ),
  .compa_val_3       (compa_val_3      ),
  .compa_val_4       (compa_val_4      ),
  .compa_val_5       (compa_val_5      ),
  .compb_val_0       (compb_val_0      ),
  .compb_val_1       (compb_val_1      ),
  .compb_val_2       (compb_val_2      ),
  .compb_val_3       (compb_val_3      ),
  .compb_val_4       (compb_val_4      ),
  .compb_val_5       (compb_val_5      ),
  .db0en             (db0en            ),
  .db1en             (db1en            ),
  .db2en             (db2en            ),
  .db3en             (db3en            ),
  .db4en             (db4en            ),
  .db5en             (db5en            ),
  .delay0            (delay0           ),
  .delay1            (delay1           ),
  .delay2            (delay2           ),
  .delay3            (delay3           ),
  .delay4            (delay4           ),
  .delay5            (delay5           ),
  .fault             (fault_d2         ),
  .i_capture_0       (i_capedge0       ),
  .i_capture_10      (i_capedge10      ),
  .i_capture_2       (i_capedge2       ),
  .i_capture_4       (i_capedge4       ),
  .i_capture_6       (i_capedge6       ),
  .i_capture_8       (i_capedge8       ),
  .int0encmpad       (int0encmpad      ),
  .int0encmpau       (int0encmpau      ),
  .int0encmpbd       (int0encmpbd      ),
  .int0encmpbu       (int0encmpbu      ),
  .int0encntload     (int0encntload    ),
  .int0encntzero     (int0encntzero    ),
  .int1encmpad       (int1encmpad      ),
  .int1encmpau       (int1encmpau      ),
  .int1encmpbd       (int1encmpbd      ),
  .int1encmpbu       (int1encmpbu      ),
  .int1encntload     (int1encntload    ),
  .int1encntzero     (int1encntzero    ),
  .int2encmpad       (int2encmpad      ),
  .int2encmpau       (int2encmpau      ),
  .int2encmpbd       (int2encmpbd      ),
  .int2encmpbu       (int2encmpbu      ),
  .int2encntload     (int2encntload    ),
  .int2encntzero     (int2encntzero    ),
  .int3encmpad       (int3encmpad      ),
  .int3encmpau       (int3encmpau      ),
  .int3encmpbd       (int3encmpbd      ),
  .int3encmpbu       (int3encmpbu      ),
  .int3encntload     (int3encntload    ),
  .int3encntzero     (int3encntzero    ),
  .int4encmpad       (int4encmpad      ),
  .int4encmpau       (int4encmpau      ),
  .int4encmpbd       (int4encmpbd      ),
  .int4encmpbu       (int4encmpbu      ),
  .int4encntload     (int4encntload    ),
  .int4encntzero     (int4encntzero    ),
  .int5encmpad       (int5encmpad      ),
  .int5encmpau       (int5encmpau      ),
  .int5encmpbd       (int5encmpbd      ),
  .int5encmpbu       (int5encmpbu      ),
  .int5encntload     (int5encntload    ),
  .int5encntzero     (int5encntzero    ),
  .intenfault        (intenfault       ),
  .intic0cmpad       (intic0cmpad      ),
  .intic0cmpau       (intic0cmpau      ),
  .intic0cmpbd       (intic0cmpbd      ),
  .intic0cmpbu       (intic0cmpbu      ),
  .intic0cntload     (intic0cntload    ),
  .intic0cntzero     (intic0cntzero    ),
  .intic1cmpad       (intic1cmpad      ),
  .intic1cmpau       (intic1cmpau      ),
  .intic1cmpbd       (intic1cmpbd      ),
  .intic1cmpbu       (intic1cmpbu      ),
  .intic1cntload     (intic1cntload    ),
  .intic1cntzero     (intic1cntzero    ),
  .intic2cmpad       (intic2cmpad      ),
  .intic2cmpau       (intic2cmpau      ),
  .intic2cmpbd       (intic2cmpbd      ),
  .intic2cmpbu       (intic2cmpbu      ),
  .intic2cntload     (intic2cntload    ),
  .intic2cntzero     (intic2cntzero    ),
  .intic3cmpad       (intic3cmpad      ),
  .intic3cmpau       (intic3cmpau      ),
  .intic3cmpbd       (intic3cmpbd      ),
  .intic3cmpbu       (intic3cmpbu      ),
  .intic3cntload     (intic3cntload    ),
  .intic3cntzero     (intic3cntzero    ),
  .intic4cmpad       (intic4cmpad      ),
  .intic4cmpau       (intic4cmpau      ),
  .intic4cmpbd       (intic4cmpbd      ),
  .intic4cmpbu       (intic4cmpbu      ),
  .intic4cntload     (intic4cntload    ),
  .intic4cntzero     (intic4cntzero    ),
  .intic5cmpad       (intic5cmpad      ),
  .intic5cmpau       (intic5cmpau      ),
  .intic5cmpbd       (intic5cmpbd      ),
  .intic5cmpbu       (intic5cmpbu      ),
  .intic5cntload     (intic5cntload    ),
  .intic5cntzero     (intic5cntzero    ),
  .inticfault        (inticfault       ),
  .pclk              (pclk             ),
  .presetn           (presetn          ),
  .pwm01count        (pwm01count       ),
  .pwm01count_h      (pwm01count_h     ),
  .pwm0en            (pwm0en           ),
  .pwm0inv           (pwm0inv          ),
  .pwm0load          (pwm0load         ),
  .pwm0mode          (pwm0mode         ),
  .pwm0trig_val      (pwm0trig_val     ),
  .pwm10en           (pwm10en          ),
  .pwm10inv          (pwm10inv         ),
  .pwm11en           (pwm11en          ),
  .pwm11inv          (pwm11inv         ),
  .pwm1en            (pwm1en           ),
  .pwm1inv           (pwm1inv          ),
  .pwm1load          (pwm1load         ),
  .pwm1mode          (pwm1mode         ),
  .pwm1trig_val      (pwm1trig_val     ),
  .pwm23count        (pwm23count       ),
  .pwm23count_h      (pwm23count_h     ),
  .pwm2en            (pwm2en           ),
  .pwm2inv           (pwm2inv          ),
  .pwm2load          (pwm2load         ),
  .pwm2mode          (pwm2mode         ),
  .pwm2trig_val      (pwm2trig_val     ),
  .pwm3en            (pwm3en           ),
  .pwm3inv           (pwm3inv          ),
  .pwm3load          (pwm3load         ),
  .pwm3mode          (pwm3mode         ),
  .pwm3trig_val      (pwm3trig_val     ),
  .pwm45count        (pwm45count       ),
  .pwm45count_h      (pwm45count_h     ),
  .pwm4en            (pwm4en           ),
  .pwm4inv           (pwm4inv          ),
  .pwm4load          (pwm4load         ),
  .pwm4mode          (pwm4mode         ),
  .pwm4trig_val      (pwm4trig_val     ),
  .pwm5en            (pwm5en           ),
  .pwm5inv           (pwm5inv          ),
  .pwm5load          (pwm5load         ),
  .pwm5mode          (pwm5mode         ),
  .pwm5trig_val      (pwm5trig_val     ),
  .pwm6en            (pwm6en           ),
  .pwm6inv           (pwm6inv          ),
  .pwm7en            (pwm7en           ),
  .pwm7inv           (pwm7inv          ),
  .pwm8en            (pwm8en           ),
  .pwm8inv           (pwm8inv          ),
  .pwm9en            (pwm9en           ),
  .pwm9inv           (pwm9inv          ),
  .pwm_0_oe          (pwm0oe           ),
  .pwm_0_out         (o_pwm0           ),
  .pwm_10_oe         (pwm10oe          ),
  .pwm_10_out        (o_pwm10          ),
  .pwm_11_oe         (pwm11oe          ),
  .pwm_11_out        (o_pwm11          ),
  .pwm_1_oe          (pwm1oe           ),
  .pwm_1_out         (o_pwm1           ),
  .pwm_2_oe          (pwm2oe           ),
  .pwm_2_out         (o_pwm2           ),
  .pwm_3_oe          (pwm3oe           ),
  .pwm_3_out         (o_pwm3           ),
  .pwm_4_oe          (pwm4oe           ),
  .pwm_4_out         (o_pwm4           ),
  .pwm_5_oe          (pwm5oe           ),
  .pwm_5_out         (o_pwm5           ),
  .pwm_6_oe          (pwm6oe           ),
  .pwm_6_out         (o_pwm6           ),
  .pwm_7_oe          (pwm7oe           ),
  .pwm_7_out         (o_pwm7           ),
  .pwm_8_oe          (pwm8oe           ),
  .pwm_8_out         (o_pwm8           ),
  .pwm_9_oe          (pwm9oe           ),
  .pwm_9_out         (o_pwm9           ),
  .pwm_idle          (pwm_idle         ),
  .pwm_tim0_etb_trig (pwm_tim0_etb_trig),
  .pwm_tim1_etb_trig (pwm_tim1_etb_trig),
  .pwm_tim2_etb_trig (pwm_tim2_etb_trig),
  .pwm_tim3_etb_trig (pwm_tim3_etb_trig),
  .pwm_tim4_etb_trig (pwm_tim4_etb_trig),
  .pwm_tim5_etb_trig (pwm_tim5_etb_trig),
  .pwm_xx_trig       (pwm_xx_trig      ),
  .pwmint            (pwmint           ),
  .pwmis1            (pwmis1           ),
  .pwmis2            (pwmis2           ),
  .pwmris1           (pwmris1          ),
  .pwmris2           (pwmris2          ),
  .sync0mode         (sync0mode        ),
  .sync1mode         (sync1mode        ),
  .sync2mode         (sync2mode        ),
  .sync3mode         (sync3mode        ),
  .sync4mode         (sync4mode        ),
  .sync5mode         (sync5mode        ),
  .test_mode         (test_mode        ),
  .tim01count        (tim01count       ),
  .tim01count_h      (tim01count_h     ),
  .tim0en            (tim0en           ),
  .tim0ic            (tim0ic           ),
  .tim0ie            (tim0ie           ),
  .tim0load          (tim0load         ),
  .tim1en            (tim1en           ),
  .tim1ic            (tim1ic           ),
  .tim1ie            (tim1ie           ),
  .tim1load          (tim1load         ),
  .tim23count        (tim23count       ),
  .tim23count_h      (tim23count_h     ),
  .tim2en            (tim2en           ),
  .tim2ic            (tim2ic           ),
  .tim2ie            (tim2ie           ),
  .tim2load          (tim2load         ),
  .tim3en            (tim3en           ),
  .tim3ic            (tim3ic           ),
  .tim3ie            (tim3ie           ),
  .tim3load          (tim3load         ),
  .tim45count        (tim45count       ),
  .tim45count_h      (tim45count_h     ),
  .tim4en            (tim4en           ),
  .tim4ic            (tim4ic           ),
  .tim4ie            (tim4ie           ),
  .tim4load          (tim4load         ),
  .tim5en            (tim5en           ),
  .tim5ic            (tim5ic           ),
  .tim5ie            (tim5ie           ),
  .tim5load          (tim5load         ),
  .timis             (timis            ),
  .timris            (timris           ),
  .tr0end            (tr0end           ),
  .tr0enu            (tr0enu           ),
  .tr1end            (tr1end           ),
  .tr1enu            (tr1enu           ),
  .tr2end            (tr2end           ),
  .tr2enu            (tr2enu           ),
  .tr3end            (tr3end           ),
  .tr3enu            (tr3enu           ),
  .tr4end            (tr4end           ),
  .tr4enu            (tr4enu           ),
  .tr5end            (tr5end           ),
  .tr5enu            (tr5enu           ),
  .triginv           (triginv          )
);
pwm_apbif  x_pwm_apbif (
  .cap01t                (cap01t               ),
  .cap01t_h              (cap01t_h             ),
  .cap0cntic             (cap0cntic            ),
  .cap0cntie             (cap0cntie            ),
  .cap0en                (cap0en               ),
  .cap0eventa            (cap0eventa           ),
  .cap0match             (cap0match            ),
  .cap0mode              (cap0mode             ),
  .cap0timic             (cap0timic            ),
  .cap0timie             (cap0timie            ),
  .cap1cntic             (cap1cntic            ),
  .cap1cntie             (cap1cntie            ),
  .cap1en                (cap1en               ),
  .cap1eventa            (cap1eventa           ),
  .cap1match             (cap1match            ),
  .cap1mode              (cap1mode             ),
  .cap1timic             (cap1timic            ),
  .cap1timie             (cap1timie            ),
  .cap23t                (cap23t               ),
  .cap23t_h              (cap23t_h             ),
  .cap2cntic             (cap2cntic            ),
  .cap2cntie             (cap2cntie            ),
  .cap2en                (cap2en               ),
  .cap2eventa            (cap2eventa           ),
  .cap2match             (cap2match            ),
  .cap2mode              (cap2mode             ),
  .cap2timic             (cap2timic            ),
  .cap2timie             (cap2timie            ),
  .cap3cntic             (cap3cntic            ),
  .cap3cntie             (cap3cntie            ),
  .cap3en                (cap3en               ),
  .cap3eventa            (cap3eventa           ),
  .cap3match             (cap3match            ),
  .cap3mode              (cap3mode             ),
  .cap3timic             (cap3timic            ),
  .cap3timie             (cap3timie            ),
  .cap45t                (cap45t               ),
  .cap45t_h              (cap45t_h             ),
  .cap4cntic             (cap4cntic            ),
  .cap4cntie             (cap4cntie            ),
  .cap4en                (cap4en               ),
  .cap4eventa            (cap4eventa           ),
  .cap4match             (cap4match            ),
  .cap4mode              (cap4mode             ),
  .cap4timic             (cap4timic            ),
  .cap4timie             (cap4timie            ),
  .cap5cntic             (cap5cntic            ),
  .cap5cntie             (cap5cntie            ),
  .cap5en                (cap5en               ),
  .cap5eventa            (cap5eventa           ),
  .cap5match             (cap5match            ),
  .cap5mode              (cap5mode             ),
  .cap5timic             (cap5timic            ),
  .cap5timie             (cap5timie            ),
  .capis                 (capis                ),
  .capris                (capris               ),
  .cnt0val               (cnt0val              ),
  .cnt1val               (cnt1val              ),
  .cnt2val               (cnt2val              ),
  .cnt3val               (cnt3val              ),
  .cnt4val               (cnt4val              ),
  .cnt5val               (cnt5val              ),
  .cntdiv                (cntdiv               ),
  .cntdiven              (cntdiven             ),
  .compa_val_0           (compa_val_0          ),
  .compa_val_1           (compa_val_1          ),
  .compa_val_2           (compa_val_2          ),
  .compa_val_3           (compa_val_3          ),
  .compa_val_4           (compa_val_4          ),
  .compa_val_5           (compa_val_5          ),
  .compb_val_0           (compb_val_0          ),
  .compb_val_1           (compb_val_1          ),
  .compb_val_2           (compb_val_2          ),
  .compb_val_3           (compb_val_3          ),
  .compb_val_4           (compb_val_4          ),
  .compb_val_5           (compb_val_5          ),
  .db0en                 (db0en                ),
  .db1en                 (db1en                ),
  .db2en                 (db2en                ),
  .db3en                 (db3en                ),
  .db4en                 (db4en                ),
  .db5en                 (db5en                ),
  .delay0                (delay0               ),
  .delay1                (delay1               ),
  .delay2                (delay2               ),
  .delay3                (delay3               ),
  .delay4                (delay4               ),
  .delay5                (delay5               ),
  .etb_pwm_trig_tim0_off (etb_pwm_trig_tim0_off),
  .etb_pwm_trig_tim0_on  (etb_pwm_trig_tim0_on ),
  .etb_pwm_trig_tim1_off (etb_pwm_trig_tim1_off),
  .etb_pwm_trig_tim1_on  (etb_pwm_trig_tim1_on ),
  .etb_pwm_trig_tim2_off (etb_pwm_trig_tim2_off),
  .etb_pwm_trig_tim2_on  (etb_pwm_trig_tim2_on ),
  .etb_pwm_trig_tim3_off (etb_pwm_trig_tim3_off),
  .etb_pwm_trig_tim3_on  (etb_pwm_trig_tim3_on ),
  .etb_pwm_trig_tim4_off (etb_pwm_trig_tim4_off),
  .etb_pwm_trig_tim4_on  (etb_pwm_trig_tim4_on ),
  .etb_pwm_trig_tim5_off (etb_pwm_trig_tim5_off),
  .etb_pwm_trig_tim5_on  (etb_pwm_trig_tim5_on ),
  .int0encmpad           (int0encmpad          ),
  .int0encmpau           (int0encmpau          ),
  .int0encmpbd           (int0encmpbd          ),
  .int0encmpbu           (int0encmpbu          ),
  .int0encntload         (int0encntload        ),
  .int0encntzero         (int0encntzero        ),
  .int1encmpad           (int1encmpad          ),
  .int1encmpau           (int1encmpau          ),
  .int1encmpbd           (int1encmpbd          ),
  .int1encmpbu           (int1encmpbu          ),
  .int1encntload         (int1encntload        ),
  .int1encntzero         (int1encntzero        ),
  .int2encmpad           (int2encmpad          ),
  .int2encmpau           (int2encmpau          ),
  .int2encmpbd           (int2encmpbd          ),
  .int2encmpbu           (int2encmpbu          ),
  .int2encntload         (int2encntload        ),
  .int2encntzero         (int2encntzero        ),
  .int3encmpad           (int3encmpad          ),
  .int3encmpau           (int3encmpau          ),
  .int3encmpbd           (int3encmpbd          ),
  .int3encmpbu           (int3encmpbu          ),
  .int3encntload         (int3encntload        ),
  .int3encntzero         (int3encntzero        ),
  .int4encmpad           (int4encmpad          ),
  .int4encmpau           (int4encmpau          ),
  .int4encmpbd           (int4encmpbd          ),
  .int4encmpbu           (int4encmpbu          ),
  .int4encntload         (int4encntload        ),
  .int4encntzero         (int4encntzero        ),
  .int5encmpad           (int5encmpad          ),
  .int5encmpau           (int5encmpau          ),
  .int5encmpbd           (int5encmpbd          ),
  .int5encmpbu           (int5encmpbu          ),
  .int5encntload         (int5encntload        ),
  .int5encntzero         (int5encntzero        ),
  .intenfault            (intenfault           ),
  .intic0cmpad           (intic0cmpad          ),
  .intic0cmpau           (intic0cmpau          ),
  .intic0cmpbd           (intic0cmpbd          ),
  .intic0cmpbu           (intic0cmpbu          ),
  .intic0cntload         (intic0cntload        ),
  .intic0cntzero         (intic0cntzero        ),
  .intic1cmpad           (intic1cmpad          ),
  .intic1cmpau           (intic1cmpau          ),
  .intic1cmpbd           (intic1cmpbd          ),
  .intic1cmpbu           (intic1cmpbu          ),
  .intic1cntload         (intic1cntload        ),
  .intic1cntzero         (intic1cntzero        ),
  .intic2cmpad           (intic2cmpad          ),
  .intic2cmpau           (intic2cmpau          ),
  .intic2cmpbd           (intic2cmpbd          ),
  .intic2cmpbu           (intic2cmpbu          ),
  .intic2cntload         (intic2cntload        ),
  .intic2cntzero         (intic2cntzero        ),
  .intic3cmpad           (intic3cmpad          ),
  .intic3cmpau           (intic3cmpau          ),
  .intic3cmpbd           (intic3cmpbd          ),
  .intic3cmpbu           (intic3cmpbu          ),
  .intic3cntload         (intic3cntload        ),
  .intic3cntzero         (intic3cntzero        ),
  .intic4cmpad           (intic4cmpad          ),
  .intic4cmpau           (intic4cmpau          ),
  .intic4cmpbd           (intic4cmpbd          ),
  .intic4cmpbu           (intic4cmpbu          ),
  .intic4cntload         (intic4cntload        ),
  .intic4cntzero         (intic4cntzero        ),
  .intic5cmpad           (intic5cmpad          ),
  .intic5cmpau           (intic5cmpau          ),
  .intic5cmpbd           (intic5cmpbd          ),
  .intic5cmpbu           (intic5cmpbu          ),
  .intic5cntload         (intic5cntload        ),
  .intic5cntzero         (intic5cntzero        ),
  .inticfault            (inticfault           ),
  .paddr                 (paddr                ),
  .pclk                  (pclk                 ),
  .penable               (penable              ),
  .prdata                (prdata               ),
  .presetn               (presetn              ),
  .psel                  (psel                 ),
  .pwdata                (pwdata               ),
  .pwm01count            (pwm01count           ),
  .pwm01count_h          (pwm01count_h         ),
  .pwm0en                (pwm0en               ),
  .pwm0inv               (pwm0inv              ),
  .pwm0load              (pwm0load             ),
  .pwm0mode              (pwm0mode             ),
  .pwm0trig_val          (pwm0trig_val         ),
  .pwm10en               (pwm10en              ),
  .pwm10inv              (pwm10inv             ),
  .pwm11en               (pwm11en              ),
  .pwm11inv              (pwm11inv             ),
  .pwm1en                (pwm1en               ),
  .pwm1inv               (pwm1inv              ),
  .pwm1load              (pwm1load             ),
  .pwm1mode              (pwm1mode             ),
  .pwm1trig_val          (pwm1trig_val         ),
  .pwm23count            (pwm23count           ),
  .pwm23count_h          (pwm23count_h         ),
  .pwm2en                (pwm2en               ),
  .pwm2inv               (pwm2inv              ),
  .pwm2load              (pwm2load             ),
  .pwm2mode              (pwm2mode             ),
  .pwm2trig_val          (pwm2trig_val         ),
  .pwm3en                (pwm3en               ),
  .pwm3inv               (pwm3inv              ),
  .pwm3load              (pwm3load             ),
  .pwm3mode              (pwm3mode             ),
  .pwm3trig_val          (pwm3trig_val         ),
  .pwm45count            (pwm45count           ),
  .pwm45count_h          (pwm45count_h         ),
  .pwm4en                (pwm4en               ),
  .pwm4inv               (pwm4inv              ),
  .pwm4load              (pwm4load             ),
  .pwm4mode              (pwm4mode             ),
  .pwm4trig_val          (pwm4trig_val         ),
  .pwm5en                (pwm5en               ),
  .pwm5inv               (pwm5inv              ),
  .pwm5load              (pwm5load             ),
  .pwm5mode              (pwm5mode             ),
  .pwm5trig_val          (pwm5trig_val         ),
  .pwm6en                (pwm6en               ),
  .pwm6inv               (pwm6inv              ),
  .pwm7en                (pwm7en               ),
  .pwm7inv               (pwm7inv              ),
  .pwm8en                (pwm8en               ),
  .pwm8inv               (pwm8inv              ),
  .pwm9en                (pwm9en               ),
  .pwm9inv               (pwm9inv              ),
  .pwmis1                (pwmis1               ),
  .pwmis2                (pwmis2               ),
  .pwmris1               (pwmris1              ),
  .pwmris2               (pwmris2              ),
  .pwrite                (pwrite               ),
  .sync0mode             (sync0mode            ),
  .sync1mode             (sync1mode            ),
  .sync2mode             (sync2mode            ),
  .sync3mode             (sync3mode            ),
  .sync4mode             (sync4mode            ),
  .sync5mode             (sync5mode            ),
  .tim01count            (tim01count           ),
  .tim01count_h          (tim01count_h         ),
  .tim0en                (tim0en               ),
  .tim0ic                (tim0ic               ),
  .tim0ie                (tim0ie               ),
  .tim0load              (tim0load             ),
  .tim1en                (tim1en               ),
  .tim1ic                (tim1ic               ),
  .tim1ie                (tim1ie               ),
  .tim1load              (tim1load             ),
  .tim23count            (tim23count           ),
  .tim23count_h          (tim23count_h         ),
  .tim2en                (tim2en               ),
  .tim2ic                (tim2ic               ),
  .tim2ie                (tim2ie               ),
  .tim2load              (tim2load             ),
  .tim3en                (tim3en               ),
  .tim3ic                (tim3ic               ),
  .tim3ie                (tim3ie               ),
  .tim3load              (tim3load             ),
  .tim45count            (tim45count           ),
  .tim45count_h          (tim45count_h         ),
  .tim4en                (tim4en               ),
  .tim4ic                (tim4ic               ),
  .tim4ie                (tim4ie               ),
  .tim4load              (tim4load             ),
  .tim5en                (tim5en               ),
  .tim5ic                (tim5ic               ),
  .tim5ie                (tim5ie               ),
  .tim5load              (tim5load             ),
  .timis                 (timis                ),
  .timris                (timris               ),
  .tr0end                (tr0end               ),
  .tr0enu                (tr0enu               ),
  .tr1end                (tr1end               ),
  .tr1enu                (tr1enu               ),
  .tr2end                (tr2end               ),
  .tr2enu                (tr2enu               ),
  .tr3end                (tr3end               ),
  .tr3enu                (tr3enu               ),
  .tr4end                (tr4end               ),
  .tr4enu                (tr4enu               ),
  .tr5end                (tr5end               ),
  .tr5enu                (tr5enu               ),
  .triginv               (triginv              )
);
assign pwm0oe_n  = ~pwm0oe;
assign pwm1oe_n  = ~pwm1oe;
assign pwm2oe_n  = ~pwm2oe;
assign pwm3oe_n  = ~pwm3oe;
assign pwm4oe_n  = ~pwm4oe;
assign pwm5oe_n  = ~pwm5oe;
assign pwm6oe_n  = ~pwm6oe;
assign pwm7oe_n  = ~pwm7oe;
assign pwm8oe_n  = ~pwm8oe;
assign pwm9oe_n  = ~pwm9oe;
assign pwm10oe_n = ~pwm10oe;
assign pwm11oe_n = ~pwm11oe;
endmodule
