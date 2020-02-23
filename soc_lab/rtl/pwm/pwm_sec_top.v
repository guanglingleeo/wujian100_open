/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pwm_sec_top(
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
  pprot,
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
  test_mode,
  tipc_pwm_trust
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
input   [2 :0]  pprot;                
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input           pwrite;               
input           test_mode;            
input           tipc_pwm_trust;       
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
wire    [31:0]  i_prdata;             
wire            i_psel;               
wire            i_pwrite;             
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
wire    [2 :0]  pprot;                
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire            pwm0oe_n;             
wire            pwm10oe_n;            
wire            pwm11oe_n;            
wire            pwm1oe_n;             
wire            pwm2oe_n;             
wire            pwm3oe_n;             
wire            pwm4oe_n;             
wire            pwm5oe_n;             
wire            pwm6oe_n;             
wire            pwm7oe_n;             
wire            pwm8oe_n;             
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
wire            pwrite;               
wire            test_mode;            
wire            tipc_pwm_trust;       
pwm  x_pwm (
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
  .fault                 (fault                ),
  .i_capedge0            (i_capedge0           ),
  .i_capedge10           (i_capedge10          ),
  .i_capedge2            (i_capedge2           ),
  .i_capedge4            (i_capedge4           ),
  .i_capedge6            (i_capedge6           ),
  .i_capedge8            (i_capedge8           ),
  .o_pwm0                (o_pwm0               ),
  .o_pwm1                (o_pwm1               ),
  .o_pwm10               (o_pwm10              ),
  .o_pwm11               (o_pwm11              ),
  .o_pwm2                (o_pwm2               ),
  .o_pwm3                (o_pwm3               ),
  .o_pwm4                (o_pwm4               ),
  .o_pwm5                (o_pwm5               ),
  .o_pwm6                (o_pwm6               ),
  .o_pwm7                (o_pwm7               ),
  .o_pwm8                (o_pwm8               ),
  .o_pwm9                (o_pwm9               ),
  .paddr                 (paddr                ),
  .pclk                  (pclk                 ),
  .penable               (penable              ),
  .prdata                (i_prdata             ),
  .presetn               (presetn              ),
  .psel                  (i_psel               ),
  .pwdata                (pwdata               ),
  .pwm0oe_n              (pwm0oe_n             ),
  .pwm10oe_n             (pwm10oe_n            ),
  .pwm11oe_n             (pwm11oe_n            ),
  .pwm1oe_n              (pwm1oe_n             ),
  .pwm2oe_n              (pwm2oe_n             ),
  .pwm3oe_n              (pwm3oe_n             ),
  .pwm4oe_n              (pwm4oe_n             ),
  .pwm5oe_n              (pwm5oe_n             ),
  .pwm6oe_n              (pwm6oe_n             ),
  .pwm7oe_n              (pwm7oe_n             ),
  .pwm8oe_n              (pwm8oe_n             ),
  .pwm9oe_n              (pwm9oe_n             ),
  .pwm_idle              (pwm_idle             ),
  .pwm_tim0_etb_trig     (pwm_tim0_etb_trig    ),
  .pwm_tim1_etb_trig     (pwm_tim1_etb_trig    ),
  .pwm_tim2_etb_trig     (pwm_tim2_etb_trig    ),
  .pwm_tim3_etb_trig     (pwm_tim3_etb_trig    ),
  .pwm_tim4_etb_trig     (pwm_tim4_etb_trig    ),
  .pwm_tim5_etb_trig     (pwm_tim5_etb_trig    ),
  .pwm_xx_trig           (pwm_xx_trig          ),
  .pwmint                (pwmint               ),
  .pwrite                (i_pwrite             ),
  .test_mode             (test_mode            )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite =  pwrite ;
assign i_psel =  psel ;
endmodule
