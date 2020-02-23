/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module arb_ctrl(
  arb_bmux_transvld,
  arb_bmux_trgvld,
  busy_chn_code,
  ch0c_gbc_chnen,
  ch0c_gbc_sfwtrg,
  ch0c_gbc_trgclr,
  ch0chgen,
  ch10c_gbc_chnen,
  ch10c_gbc_sfwtrg,
  ch10c_gbc_trgclr,
  ch10chgen,
  ch11c_gbc_chnen,
  ch11c_gbc_sfwtrg,
  ch11c_gbc_trgclr,
  ch11chgen,
  ch12c_gbc_chnen,
  ch12c_gbc_sfwtrg,
  ch12c_gbc_trgclr,
  ch12chgen,
  ch13c_gbc_chnen,
  ch13c_gbc_sfwtrg,
  ch13c_gbc_trgclr,
  ch13chgen,
  ch14c_gbc_chnen,
  ch14c_gbc_sfwtrg,
  ch14c_gbc_trgclr,
  ch14chgen,
  ch15c_gbc_chnen,
  ch15c_gbc_sfwtrg,
  ch15c_gbc_trgclr,
  ch15chgen,
  ch1c_gbc_chnen,
  ch1c_gbc_sfwtrg,
  ch1c_gbc_trgclr,
  ch1chgen,
  ch2c_gbc_chnen,
  ch2c_gbc_sfwtrg,
  ch2c_gbc_trgclr,
  ch2chgen,
  ch3c_gbc_chnen,
  ch3c_gbc_sfwtrg,
  ch3c_gbc_trgclr,
  ch3chgen,
  ch4c_gbc_chnen,
  ch4c_gbc_sfwtrg,
  ch4c_gbc_trgclr,
  ch4chgen,
  ch5c_gbc_chnen,
  ch5c_gbc_sfwtrg,
  ch5c_gbc_trgclr,
  ch5chgen,
  ch6c_gbc_chnen,
  ch6c_gbc_sfwtrg,
  ch6c_gbc_trgclr,
  ch6chgen,
  ch7c_gbc_chnen,
  ch7c_gbc_sfwtrg,
  ch7c_gbc_trgclr,
  ch7chgen,
  ch8c_gbc_chnen,
  ch8c_gbc_sfwtrg,
  ch8c_gbc_trgclr,
  ch8chgen,
  ch9c_gbc_chnen,
  ch9c_gbc_sfwtrg,
  ch9c_gbc_trgclr,
  ch9chgen,
  chreq0,
  chreq1,
  chreq10,
  chreq11,
  chreq12,
  chreq13,
  chreq14,
  chreq15,
  chreq2,
  chreq3,
  chreq4,
  chreq5,
  chreq6,
  chreq7,
  chreq8,
  chreq9,
  etb_dmacch0_trg,
  etb_dmacch10_trg,
  etb_dmacch11_trg,
  etb_dmacch12_trg,
  etb_dmacch13_trg,
  etb_dmacch14_trg,
  etb_dmacch15_trg,
  etb_dmacch1_trg,
  etb_dmacch2_trg,
  etb_dmacch3_trg,
  etb_dmacch4_trg,
  etb_dmacch5_trg,
  etb_dmacch6_trg,
  etb_dmacch7_trg,
  etb_dmacch8_trg,
  etb_dmacch9_trg,
  hclk,
  hpreq0,
  hpreq1,
  hpreq10,
  hpreq11,
  hpreq12,
  hpreq13,
  hpreq14,
  hpreq15,
  hpreq2,
  hpreq3,
  hpreq4,
  hpreq5,
  hpreq6,
  hpreq7,
  hpreq8,
  hpreq9,
  hrst_n
);
input           ch0c_gbc_chnen;   
input           ch0c_gbc_sfwtrg;  
input           ch0c_gbc_trgclr;  
input           ch0chgen;         
input           ch10c_gbc_chnen;  
input           ch10c_gbc_sfwtrg; 
input           ch10c_gbc_trgclr; 
input           ch10chgen;        
input           ch11c_gbc_chnen;  
input           ch11c_gbc_sfwtrg; 
input           ch11c_gbc_trgclr; 
input           ch11chgen;        
input           ch12c_gbc_chnen;  
input           ch12c_gbc_sfwtrg; 
input           ch12c_gbc_trgclr; 
input           ch12chgen;        
input           ch13c_gbc_chnen;  
input           ch13c_gbc_sfwtrg; 
input           ch13c_gbc_trgclr; 
input           ch13chgen;        
input           ch14c_gbc_chnen;  
input           ch14c_gbc_sfwtrg; 
input           ch14c_gbc_trgclr; 
input           ch14chgen;        
input           ch15c_gbc_chnen;  
input           ch15c_gbc_sfwtrg; 
input           ch15c_gbc_trgclr; 
input           ch15chgen;        
input           ch1c_gbc_chnen;   
input           ch1c_gbc_sfwtrg;  
input           ch1c_gbc_trgclr;  
input           ch1chgen;         
input           ch2c_gbc_chnen;   
input           ch2c_gbc_sfwtrg;  
input           ch2c_gbc_trgclr;  
input           ch2chgen;         
input           ch3c_gbc_chnen;   
input           ch3c_gbc_sfwtrg;  
input           ch3c_gbc_trgclr;  
input           ch3chgen;         
input           ch4c_gbc_chnen;   
input           ch4c_gbc_sfwtrg;  
input           ch4c_gbc_trgclr;  
input           ch4chgen;         
input           ch5c_gbc_chnen;   
input           ch5c_gbc_sfwtrg;  
input           ch5c_gbc_trgclr;  
input           ch5chgen;         
input           ch6c_gbc_chnen;   
input           ch6c_gbc_sfwtrg;  
input           ch6c_gbc_trgclr;  
input           ch6chgen;         
input           ch7c_gbc_chnen;   
input           ch7c_gbc_sfwtrg;  
input           ch7c_gbc_trgclr;  
input           ch7chgen;         
input           ch8c_gbc_chnen;   
input           ch8c_gbc_sfwtrg;  
input           ch8c_gbc_trgclr;  
input           ch8chgen;         
input           ch9c_gbc_chnen;   
input           ch9c_gbc_sfwtrg;  
input           ch9c_gbc_trgclr;  
input           ch9chgen;         
input           etb_dmacch0_trg;  
input           etb_dmacch10_trg; 
input           etb_dmacch11_trg; 
input           etb_dmacch12_trg; 
input           etb_dmacch13_trg; 
input           etb_dmacch14_trg; 
input           etb_dmacch15_trg; 
input           etb_dmacch1_trg;  
input           etb_dmacch2_trg;  
input           etb_dmacch3_trg;  
input           etb_dmacch4_trg;  
input           etb_dmacch5_trg;  
input           etb_dmacch6_trg;  
input           etb_dmacch7_trg;  
input           etb_dmacch8_trg;  
input           etb_dmacch9_trg;  
input           hclk;             
input           hrst_n;           
output          arb_bmux_transvld; 
output          arb_bmux_trgvld;  
output  [15:0]  busy_chn_code;    
output          chreq0;           
output          chreq1;           
output          chreq10;          
output          chreq11;          
output          chreq12;          
output          chreq13;          
output          chreq14;          
output          chreq15;          
output          chreq2;           
output          chreq3;           
output          chreq4;           
output          chreq5;           
output          chreq6;           
output          chreq7;           
output          chreq8;           
output          chreq9;           
output          hpreq0;           
output          hpreq1;           
output          hpreq10;          
output          hpreq11;          
output          hpreq12;          
output          hpreq13;          
output          hpreq14;          
output          hpreq15;          
output          hpreq2;           
output          hpreq3;           
output          hpreq4;           
output          hpreq5;           
output          hpreq6;           
output          hpreq7;           
output          hpreq8;           
output          hpreq9;           
reg     [15:0]  busy_chn_cod;     
reg             trg_req_d0;       
wire    [15:0]  actv_chn_cod;     
wire            arb_bmux_transvld; 
wire            arb_bmux_trgvld;  
wire    [15:0]  busy_chn_code;    
wire            ch0c_gbc_chnen;   
wire            ch0c_gbc_sfwtrg;  
wire            ch0c_gbc_trgclr;  
wire            ch0chgen;         
wire            ch0trg_latch;     
wire            ch10c_gbc_chnen;  
wire            ch10c_gbc_sfwtrg; 
wire            ch10c_gbc_trgclr; 
wire            ch10chgen;        
wire            ch10trg_latch;    
wire            ch11c_gbc_chnen;  
wire            ch11c_gbc_sfwtrg; 
wire            ch11c_gbc_trgclr; 
wire            ch11chgen;        
wire            ch11trg_latch;    
wire            ch12c_gbc_chnen;  
wire            ch12c_gbc_sfwtrg; 
wire            ch12c_gbc_trgclr; 
wire            ch12chgen;        
wire            ch12trg_latch;    
wire            ch13c_gbc_chnen;  
wire            ch13c_gbc_sfwtrg; 
wire            ch13c_gbc_trgclr; 
wire            ch13chgen;        
wire            ch13trg_latch;    
wire            ch14c_gbc_chnen;  
wire            ch14c_gbc_sfwtrg; 
wire            ch14c_gbc_trgclr; 
wire            ch14chgen;        
wire            ch14trg_latch;    
wire            ch15c_gbc_chnen;  
wire            ch15c_gbc_sfwtrg; 
wire            ch15c_gbc_trgclr; 
wire            ch15chgen;        
wire            ch15trg_latch;    
wire            ch1c_gbc_chnen;   
wire            ch1c_gbc_sfwtrg;  
wire            ch1c_gbc_trgclr;  
wire            ch1chgen;         
wire            ch1trg_latch;     
wire            ch2c_gbc_chnen;   
wire            ch2c_gbc_sfwtrg;  
wire            ch2c_gbc_trgclr;  
wire            ch2chgen;         
wire            ch2trg_latch;     
wire            ch3c_gbc_chnen;   
wire            ch3c_gbc_sfwtrg;  
wire            ch3c_gbc_trgclr;  
wire            ch3chgen;         
wire            ch3trg_latch;     
wire            ch4c_gbc_chnen;   
wire            ch4c_gbc_sfwtrg;  
wire            ch4c_gbc_trgclr;  
wire            ch4chgen;         
wire            ch4trg_latch;     
wire            ch5c_gbc_chnen;   
wire            ch5c_gbc_sfwtrg;  
wire            ch5c_gbc_trgclr;  
wire            ch5chgen;         
wire            ch5trg_latch;     
wire            ch6c_gbc_chnen;   
wire            ch6c_gbc_sfwtrg;  
wire            ch6c_gbc_trgclr;  
wire            ch6chgen;         
wire            ch6trg_latch;     
wire            ch7c_gbc_chnen;   
wire            ch7c_gbc_sfwtrg;  
wire            ch7c_gbc_trgclr;  
wire            ch7chgen;         
wire            ch7trg_latch;     
wire            ch8c_gbc_chnen;   
wire            ch8c_gbc_sfwtrg;  
wire            ch8c_gbc_trgclr;  
wire            ch8chgen;         
wire            ch8trg_latch;     
wire            ch9c_gbc_chnen;   
wire            ch9c_gbc_sfwtrg;  
wire            ch9c_gbc_trgclr;  
wire            ch9chgen;         
wire            ch9trg_latch;     
wire            chchgen;          
wire    [15:0]  chntrg_all;       
wire            chreq0;           
wire            chreq1;           
wire            chreq10;          
wire            chreq11;          
wire            chreq12;          
wire            chreq13;          
wire            chreq14;          
wire            chreq15;          
wire            chreq2;           
wire            chreq3;           
wire            chreq4;           
wire            chreq5;           
wire            chreq6;           
wire            chreq7;           
wire            chreq8;           
wire            chreq9;           
wire            etb_dmacch0_trg;  
wire            etb_dmacch10_trg; 
wire            etb_dmacch11_trg; 
wire            etb_dmacch12_trg; 
wire            etb_dmacch13_trg; 
wire            etb_dmacch14_trg; 
wire            etb_dmacch15_trg; 
wire            etb_dmacch1_trg;  
wire            etb_dmacch2_trg;  
wire            etb_dmacch3_trg;  
wire            etb_dmacch4_trg;  
wire            etb_dmacch5_trg;  
wire            etb_dmacch6_trg;  
wire            etb_dmacch7_trg;  
wire            etb_dmacch8_trg;  
wire            etb_dmacch9_trg;  
wire            hclk;             
wire            hpreq0;           
wire            hpreq1;           
wire            hpreq10;          
wire            hpreq11;          
wire            hpreq12;          
wire            hpreq13;          
wire            hpreq14;          
wire            hpreq15;          
wire            hpreq2;           
wire            hpreq3;           
wire            hpreq4;           
wire            hpreq5;           
wire            hpreq6;           
wire            hpreq7;           
wire            hpreq8;           
wire            hpreq9;           
wire            hrst_n;           
wire            trg_req;          
wire            trg_req_latch;    
chntrg_latch  U_CH0TRGLATCH (
  .chnc_gbc_chnen  (ch0c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch0c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch0c_gbc_trgclr),
  .chntrg_latch    (ch0trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch0_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
chntrg_latch  U_CH1TRGLATCH (
  .chnc_gbc_chnen  (ch1c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch1c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch1c_gbc_trgclr),
  .chntrg_latch    (ch1trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch1_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`ifndef    CH2_OFF    
chntrg_latch  U_CH2TRGLATCH (
  .chnc_gbc_chnen  (ch2c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch2c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch2c_gbc_trgclr),
  .chntrg_latch    (ch2trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch2_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH3_OFF    
chntrg_latch  U_CH3TRGLATCH (
  .chnc_gbc_chnen  (ch3c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch3c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch3c_gbc_trgclr),
  .chntrg_latch    (ch3trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch3_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH4_OFF    
chntrg_latch  U_CH4TRGLATCH (
  .chnc_gbc_chnen  (ch4c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch4c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch4c_gbc_trgclr),
  .chntrg_latch    (ch4trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch4_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH5_OFF    
chntrg_latch  U_CH5TRGLATCH (
  .chnc_gbc_chnen  (ch5c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch5c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch5c_gbc_trgclr),
  .chntrg_latch    (ch5trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch5_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH6_OFF    
chntrg_latch  U_CH6TRGLATCH (
  .chnc_gbc_chnen  (ch6c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch6c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch6c_gbc_trgclr),
  .chntrg_latch    (ch6trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch6_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH7_OFF    
chntrg_latch  U_CH7TRGLATCH (
  .chnc_gbc_chnen  (ch7c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch7c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch7c_gbc_trgclr),
  .chntrg_latch    (ch7trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch7_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH8_OFF    
chntrg_latch  U_CH8TRGLATCH (
  .chnc_gbc_chnen  (ch8c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch8c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch8c_gbc_trgclr),
  .chntrg_latch    (ch8trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch8_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH9_OFF    
chntrg_latch  U_CH9TRGLATCH (
  .chnc_gbc_chnen  (ch9c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch9c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch9c_gbc_trgclr),
  .chntrg_latch    (ch9trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch9_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH10_OFF    
chntrg_latch  U_CH10TRGLATCH (
  .chnc_gbc_chnen   (ch10c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch10c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch10c_gbc_trgclr),
  .chntrg_latch     (ch10trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch10_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH11_OFF    
chntrg_latch  U_CH11TRGLATCH (
  .chnc_gbc_chnen   (ch11c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch11c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch11c_gbc_trgclr),
  .chntrg_latch     (ch11trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch11_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH12_OFF    
chntrg_latch  U_CH12TRGLATCH (
  .chnc_gbc_chnen   (ch12c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch12c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch12c_gbc_trgclr),
  .chntrg_latch     (ch12trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch12_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH13_OFF    
chntrg_latch  U_CH13TRGLATCH (
  .chnc_gbc_chnen   (ch13c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch13c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch13c_gbc_trgclr),
  .chntrg_latch     (ch13trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch13_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH14_OFF    
chntrg_latch  U_CH14TRGLATCH (
  .chnc_gbc_chnen   (ch14c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch14c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch14c_gbc_trgclr),
  .chntrg_latch     (ch14trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch14_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH15_OFF    
chntrg_latch  U_CH15TRGLATCH (
  .chnc_gbc_chnen   (ch15c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch15c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch15c_gbc_trgclr),
  .chntrg_latch     (ch15trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch15_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
assign    chntrg_all[15:0] = { (ch15trg_latch&(~ch15c_gbc_trgclr) )   , (ch14trg_latch&(~ch14c_gbc_trgclr))   , (ch13trg_latch&(~ch13c_gbc_trgclr) )   , (ch12trg_latch&(~ch12c_gbc_trgclr))  , 
                               (ch11trg_latch&(~ch11c_gbc_trgclr) )   , (ch10trg_latch&(~ch10c_gbc_trgclr))   , (ch9trg_latch &(~ch9c_gbc_trgclr ) )   , (ch8trg_latch &(~ch8c_gbc_trgclr ))   , 
                               (ch7trg_latch &(~ch7c_gbc_trgclr ) )   , (ch6trg_latch &(~ch6c_gbc_trgclr ))   ,  (ch5trg_latch&(~ch5c_gbc_trgclr ) )   , (ch4trg_latch &(~ch4c_gbc_trgclr ))   , 
                               (ch3trg_latch &(~ch3c_gbc_trgclr ) )   , (ch2trg_latch &(~ch2c_gbc_trgclr ))   ,  (ch1trg_latch&(~ch1c_gbc_trgclr ) )   , (ch0trg_latch &(~ch0c_gbc_trgclr ))     } ;
assign   arb_bmux_trgvld = | { ch0trg_latch ,ch2trg_latch ,ch4trg_latch ,ch6trg_latch ,ch8trg_latch ,ch10trg_latch ,ch12trg_latch ,ch14trg_latch ,
                               ch1trg_latch ,ch3trg_latch ,ch5trg_latch ,ch7trg_latch ,ch9trg_latch ,ch11trg_latch ,ch13trg_latch ,ch15trg_latch    } ;
assign   arb_bmux_transvld = |{(ch0trg_latch&busy_chn_cod[0]),   (ch1trg_latch&busy_chn_cod[1]),   (ch2trg_latch&busy_chn_cod[2]),   (ch3trg_latch&busy_chn_cod[3]),
                               (ch4trg_latch&busy_chn_cod[4]),   (ch5trg_latch&busy_chn_cod[5]),   (ch6trg_latch&busy_chn_cod[6]),   (ch7trg_latch&busy_chn_cod[7]),
                               (ch8trg_latch&busy_chn_cod[8]),   (ch9trg_latch&busy_chn_cod[9]),   (ch10trg_latch&busy_chn_cod[10]), (ch11trg_latch&busy_chn_cod[11]),
                               (ch12trg_latch&busy_chn_cod[12]), (ch13trg_latch&busy_chn_cod[13]), (ch14trg_latch&busy_chn_cod[14]), (ch15trg_latch&busy_chn_cod[15])};
hpchn_decd  U_HPCHNS (
  .actv_chn_cod (actv_chn_cod),
  .chntrg_all   (chntrg_all  )
);
assign   chchgen = |{(ch0chgen&busy_chn_cod[0]),   (ch1chgen&busy_chn_cod[1]),   (ch2chgen&busy_chn_cod[2]),   (ch3chgen&busy_chn_cod[3]),
                     (ch4chgen&busy_chn_cod[4]),   (ch5chgen&busy_chn_cod[5]),   (ch6chgen&busy_chn_cod[6]),   (ch7chgen&busy_chn_cod[7]),
                     (ch8chgen&busy_chn_cod[8]),   (ch9chgen&busy_chn_cod[9]),   (ch10chgen&busy_chn_cod[10]), (ch11chgen&busy_chn_cod[11]),
                     (ch12chgen&busy_chn_cod[12]), (ch13chgen&busy_chn_cod[13]), (ch14chgen&busy_chn_cod[14]), (ch15chgen&busy_chn_cod[15])};
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        busy_chn_cod[15:0] <= 16'b0 ;
    end
    else    if(chchgen | trg_req_latch)  begin
        busy_chn_cod[15:0] <= actv_chn_cod[15:0] ;
    end
end
assign    busy_chn_code[15:0] = busy_chn_cod[15:0] ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin   
        trg_req_d0 <= 1'b0 ;
    end
    else    begin 
        trg_req_d0 <= trg_req ;
    end 
end 
assign    trg_req = |chntrg_all[15:0] ;
assign    trg_req_latch = trg_req & ( ~trg_req_d0 ) ;
assign    chreq15 = busy_chn_cod[15] & ch15trg_latch ;
assign    chreq14 = busy_chn_cod[14] & ch14trg_latch  ;
assign    chreq13 = busy_chn_cod[13] & ch13trg_latch ;
assign    chreq12 = busy_chn_cod[12] & ch12trg_latch  ;
assign    chreq11 = busy_chn_cod[11] & ch11trg_latch ;
assign    chreq10 = busy_chn_cod[10] &  ch10trg_latch ;
assign    chreq9 = busy_chn_cod[9] & ch9trg_latch ;
assign    chreq8 = busy_chn_cod[8] & ch8trg_latch  ;
assign    chreq7 = busy_chn_cod[7] & ch7trg_latch ;
assign    chreq6 = busy_chn_cod[6] & ch6trg_latch ;
assign    chreq5 = busy_chn_cod[5] & ch5trg_latch ;
assign    chreq4 = busy_chn_cod[4] & ch4trg_latch ;
assign    chreq3 = busy_chn_cod[3] & ch3trg_latch ;
assign    chreq2 = busy_chn_cod[2] & ch2trg_latch  ;
assign    chreq1 = busy_chn_cod[1] & ch1trg_latch ;
assign    chreq0  = busy_chn_cod[0] & ch0trg_latch ;
assign    hpreq0  = ch0c_gbc_trgclr & ( ~actv_chn_cod[0]) & trg_req  ;
assign    hpreq1  = ( ~actv_chn_cod[1])  & trg_req  ;
assign    hpreq2  = ( ~actv_chn_cod[2])  & trg_req  ;
assign    hpreq3  = ( ~actv_chn_cod[3])  & trg_req  ;
assign    hpreq4  = ( ~actv_chn_cod[4])  & trg_req  ;
assign    hpreq5  = ( ~actv_chn_cod[5])  & trg_req  ;
assign    hpreq6  = ( ~actv_chn_cod[6])  & trg_req  ;
assign    hpreq7  = ( ~actv_chn_cod[7])  & trg_req  ;
assign    hpreq8  = ( ~actv_chn_cod[8])  & trg_req  ;
assign    hpreq9  = ( ~actv_chn_cod[9])  & trg_req  ;
assign    hpreq10 = ( ~actv_chn_cod[10]) & trg_req  ;
assign    hpreq11 = ( ~actv_chn_cod[11]) & trg_req  ;
assign    hpreq12 = ( ~actv_chn_cod[12]) & trg_req  ;
assign    hpreq13 = ( ~actv_chn_cod[13]) & trg_req  ;
assign    hpreq14 = ( ~actv_chn_cod[14]) & trg_req  ;
assign    hpreq15 = ( ~actv_chn_cod[15]) & trg_req  ;
endmodule
