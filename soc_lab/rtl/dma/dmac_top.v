/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module dmac_top(
  ch0_etb_evtdone,
  ch0_etb_htfrdone,
  ch0_etb_tfrdone,
  ch0_prot_out,
  ch10_etb_evtdone,
  ch10_etb_htfrdone,
  ch10_etb_tfrdone,
  ch10_prot_out,
  ch11_etb_evtdone,
  ch11_etb_htfrdone,
  ch11_etb_tfrdone,
  ch11_prot_out,
  ch12_etb_evtdone,
  ch12_etb_htfrdone,
  ch12_etb_tfrdone,
  ch12_prot_out,
  ch13_etb_evtdone,
  ch13_etb_htfrdone,
  ch13_etb_tfrdone,
  ch13_prot_out,
  ch14_etb_evtdone,
  ch14_etb_htfrdone,
  ch14_etb_tfrdone,
  ch14_prot_out,
  ch15_etb_evtdone,
  ch15_etb_htfrdone,
  ch15_etb_tfrdone,
  ch15_prot_out,
  ch1_etb_evtdone,
  ch1_etb_htfrdone,
  ch1_etb_tfrdone,
  ch1_prot_out,
  ch2_etb_evtdone,
  ch2_etb_htfrdone,
  ch2_etb_tfrdone,
  ch2_prot_out,
  ch3_etb_evtdone,
  ch3_etb_htfrdone,
  ch3_etb_tfrdone,
  ch3_prot_out,
  ch4_etb_evtdone,
  ch4_etb_htfrdone,
  ch4_etb_tfrdone,
  ch4_prot_out,
  ch5_etb_evtdone,
  ch5_etb_htfrdone,
  ch5_etb_tfrdone,
  ch5_prot_out,
  ch6_etb_evtdone,
  ch6_etb_htfrdone,
  ch6_etb_tfrdone,
  ch6_prot_out,
  ch7_etb_evtdone,
  ch7_etb_htfrdone,
  ch7_etb_tfrdone,
  ch7_prot_out,
  ch8_etb_evtdone,
  ch8_etb_htfrdone,
  ch8_etb_tfrdone,
  ch8_prot_out,
  ch9_etb_evtdone,
  ch9_etb_htfrdone,
  ch9_etb_tfrdone,
  ch9_prot_out,
  dmac_vic_if,
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
  hrst_n,
  m_haddr,
  m_hburst,
  m_hbusreq,
  m_hgrant,
  m_hlock,
  m_hprot,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hsize,
  m_htrans,
  m_hwdata,
  m_hwrite,
  s_haddr,
  s_hprot,
  s_hrdata,
  s_hready,
  s_hresp,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
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
input           m_hgrant;                  
input   [31:0]  m_hrdata;                  
input           m_hready;                  
input   [1 :0]  m_hresp;                   
input   [31:0]  s_haddr;                   
input   [3 :0]  s_hprot;                   
input           s_hsel;                    
input   [1 :0]  s_htrans;                  
input   [31:0]  s_hwdata;                  
input           s_hwrite;                  
output          ch0_etb_evtdone;           
output          ch0_etb_htfrdone;          
output          ch0_etb_tfrdone;           
output          ch0_prot_out;              
output          ch10_etb_evtdone;          
output          ch10_etb_htfrdone;         
output          ch10_etb_tfrdone;          
output          ch10_prot_out;             
output          ch11_etb_evtdone;          
output          ch11_etb_htfrdone;         
output          ch11_etb_tfrdone;          
output          ch11_prot_out;             
output          ch12_etb_evtdone;          
output          ch12_etb_htfrdone;         
output          ch12_etb_tfrdone;          
output          ch12_prot_out;             
output          ch13_etb_evtdone;          
output          ch13_etb_htfrdone;         
output          ch13_etb_tfrdone;          
output          ch13_prot_out;             
output          ch14_etb_evtdone;          
output          ch14_etb_htfrdone;         
output          ch14_etb_tfrdone;          
output          ch14_prot_out;             
output          ch15_etb_evtdone;          
output          ch15_etb_htfrdone;         
output          ch15_etb_tfrdone;          
output          ch15_prot_out;             
output          ch1_etb_evtdone;           
output          ch1_etb_htfrdone;          
output          ch1_etb_tfrdone;           
output          ch1_prot_out;              
output          ch2_etb_evtdone;           
output          ch2_etb_htfrdone;          
output          ch2_etb_tfrdone;           
output          ch2_prot_out;              
output          ch3_etb_evtdone;           
output          ch3_etb_htfrdone;          
output          ch3_etb_tfrdone;           
output          ch3_prot_out;              
output          ch4_etb_evtdone;           
output          ch4_etb_htfrdone;          
output          ch4_etb_tfrdone;           
output          ch4_prot_out;              
output          ch5_etb_evtdone;           
output          ch5_etb_htfrdone;          
output          ch5_etb_tfrdone;           
output          ch5_prot_out;              
output          ch6_etb_evtdone;           
output          ch6_etb_htfrdone;          
output          ch6_etb_tfrdone;           
output          ch6_prot_out;              
output          ch7_etb_evtdone;           
output          ch7_etb_htfrdone;          
output          ch7_etb_tfrdone;           
output          ch7_prot_out;              
output          ch8_etb_evtdone;           
output          ch8_etb_htfrdone;          
output          ch8_etb_tfrdone;           
output          ch8_prot_out;              
output          ch9_etb_evtdone;           
output          ch9_etb_htfrdone;          
output          ch9_etb_tfrdone;           
output          ch9_prot_out;              
output          dmac_vic_if;               
output  [31:0]  m_haddr;                   
output  [2 :0]  m_hburst;                  
output          m_hbusreq;                 
output          m_hlock;                   
output  [3 :0]  m_hprot;                   
output  [2 :0]  m_hsize;                   
output  [1 :0]  m_htrans;                  
output  [31:0]  m_hwdata;                  
output          m_hwrite;                  
output  [31:0]  s_hrdata;                  
output          s_hready;                  
output  [1 :0]  s_hresp;                   
wire            arb_bmux_transvld;         
wire            arb_bmux_trgvld;           
wire    [15:0]  busy_chn_code;             
wire            ch0_etb_evtdone;           
wire            ch0_etb_htfrdone;          
wire            ch0_etb_tfrdone;           
wire            ch0_prot_out;              
wire            ch0c_gbc_chbsy;            
wire            ch0c_gbc_chnen;            
wire            ch0c_gbc_sfwtrg;           
wire            ch0c_gbc_trgclr;           
wire            ch0chgen;                  
wire            ch10_etb_evtdone;          
wire            ch10_etb_htfrdone;         
wire            ch10_etb_tfrdone;          
wire            ch10_prot_out;             
wire            ch10c_gbc_chbsy;           
wire            ch10c_gbc_chnen;           
wire            ch10c_gbc_sfwtrg;          
wire            ch10c_gbc_trgclr;          
wire            ch10chgen;                 
wire            ch11_etb_evtdone;          
wire            ch11_etb_htfrdone;         
wire            ch11_etb_tfrdone;          
wire            ch11_prot_out;             
wire            ch11c_gbc_chbsy;           
wire            ch11c_gbc_chnen;           
wire            ch11c_gbc_sfwtrg;          
wire            ch11c_gbc_trgclr;          
wire            ch11chgen;                 
wire            ch12_etb_evtdone;          
wire            ch12_etb_htfrdone;         
wire            ch12_etb_tfrdone;          
wire            ch12_prot_out;             
wire            ch12c_gbc_chbsy;           
wire            ch12c_gbc_chnen;           
wire            ch12c_gbc_sfwtrg;          
wire            ch12c_gbc_trgclr;          
wire            ch12chgen;                 
wire            ch13_etb_evtdone;          
wire            ch13_etb_htfrdone;         
wire            ch13_etb_tfrdone;          
wire            ch13_prot_out;             
wire            ch13c_gbc_chbsy;           
wire            ch13c_gbc_chnen;           
wire            ch13c_gbc_sfwtrg;          
wire            ch13c_gbc_trgclr;          
wire            ch13chgen;                 
wire            ch14_etb_evtdone;          
wire            ch14_etb_htfrdone;         
wire            ch14_etb_tfrdone;          
wire            ch14_prot_out;             
wire            ch14c_gbc_chbsy;           
wire            ch14c_gbc_chnen;           
wire            ch14c_gbc_sfwtrg;          
wire            ch14c_gbc_trgclr;          
wire            ch14chgen;                 
wire            ch15_etb_evtdone;          
wire            ch15_etb_htfrdone;         
wire            ch15_etb_tfrdone;          
wire            ch15_prot_out;             
wire            ch15c_gbc_chbsy;           
wire            ch15c_gbc_chnen;           
wire            ch15c_gbc_sfwtrg;          
wire            ch15c_gbc_trgclr;          
wire            ch15chgen;                 
wire            ch1_etb_evtdone;           
wire            ch1_etb_htfrdone;          
wire            ch1_etb_tfrdone;           
wire            ch1_prot_out;              
wire            ch1c_gbc_chbsy;            
wire            ch1c_gbc_chnen;            
wire            ch1c_gbc_sfwtrg;           
wire            ch1c_gbc_trgclr;           
wire            ch1chgen;                  
wire            ch2_etb_evtdone;           
wire            ch2_etb_htfrdone;          
wire            ch2_etb_tfrdone;           
wire            ch2_prot_out;              
wire            ch2c_gbc_chbsy;            
wire            ch2c_gbc_chnen;            
wire            ch2c_gbc_sfwtrg;           
wire            ch2c_gbc_trgclr;           
wire            ch2chgen;                  
wire            ch3_etb_evtdone;           
wire            ch3_etb_htfrdone;          
wire            ch3_etb_tfrdone;           
wire            ch3_prot_out;              
wire            ch3c_gbc_chbsy;            
wire            ch3c_gbc_chnen;            
wire            ch3c_gbc_sfwtrg;           
wire            ch3c_gbc_trgclr;           
wire            ch3chgen;                  
wire            ch4_etb_evtdone;           
wire            ch4_etb_htfrdone;          
wire            ch4_etb_tfrdone;           
wire            ch4_prot_out;              
wire            ch4c_gbc_chbsy;            
wire            ch4c_gbc_chnen;            
wire            ch4c_gbc_sfwtrg;           
wire            ch4c_gbc_trgclr;           
wire            ch4chgen;                  
wire            ch5_etb_evtdone;           
wire            ch5_etb_htfrdone;          
wire            ch5_etb_tfrdone;           
wire            ch5_prot_out;              
wire            ch5c_gbc_chbsy;            
wire            ch5c_gbc_chnen;            
wire            ch5c_gbc_sfwtrg;           
wire            ch5c_gbc_trgclr;           
wire            ch5chgen;                  
wire            ch6_etb_evtdone;           
wire            ch6_etb_htfrdone;          
wire            ch6_etb_tfrdone;           
wire            ch6_prot_out;              
wire            ch6c_gbc_chbsy;            
wire            ch6c_gbc_chnen;            
wire            ch6c_gbc_sfwtrg;           
wire            ch6c_gbc_trgclr;           
wire            ch6chgen;                  
wire            ch7_etb_evtdone;           
wire            ch7_etb_htfrdone;          
wire            ch7_etb_tfrdone;           
wire            ch7_prot_out;              
wire            ch7c_gbc_chbsy;            
wire            ch7c_gbc_chnen;            
wire            ch7c_gbc_sfwtrg;           
wire            ch7c_gbc_trgclr;           
wire            ch7chgen;                  
wire            ch8_etb_evtdone;           
wire            ch8_etb_htfrdone;          
wire            ch8_etb_tfrdone;           
wire            ch8_prot_out;              
wire            ch8c_gbc_chbsy;            
wire            ch8c_gbc_chnen;            
wire            ch8c_gbc_sfwtrg;           
wire            ch8c_gbc_trgclr;           
wire            ch8chgen;                  
wire            ch9_etb_evtdone;           
wire            ch9_etb_htfrdone;          
wire            ch9_etb_tfrdone;           
wire            ch9_prot_out;              
wire            ch9c_gbc_chbsy;            
wire            ch9c_gbc_chnen;            
wire            ch9c_gbc_sfwtrg;           
wire            ch9c_gbc_trgclr;           
wire            ch9chgen;                  
wire    [11:0]  chregc0_fsmc_block_tl;     
wire    [2 :0]  chregc0_fsmc_chintmdc;     
wire    [31:0]  chregc0_fsmc_darn;         
wire            chregc0_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_dinc;         
wire    [1 :0]  chregc0_fsmc_dst_tr_width; 
wire            chregc0_fsmc_endlan;       
wire    [5 :0]  chregc0_fsmc_group_len;    
wire            chregc0_fsmc_grpmc;        
wire    [3 :0]  chregc0_fsmc_protctl;      
wire    [31:0]  chregc0_fsmc_sarn;         
wire            chregc0_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_sinc;         
wire    [1 :0]  chregc0_fsmc_src_tr_width; 
wire    [1 :0]  chregc0_fsmc_trgtmdc;      
wire    [11:0]  chregc10_fsmc_block_tl;    
wire    [2 :0]  chregc10_fsmc_chintmdc;    
wire    [31:0]  chregc10_fsmc_darn;        
wire            chregc10_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_dinc;        
wire    [1 :0]  chregc10_fsmc_dst_tr_width; 
wire            chregc10_fsmc_endlan;      
wire    [5 :0]  chregc10_fsmc_group_len;   
wire            chregc10_fsmc_grpmc;       
wire    [3 :0]  chregc10_fsmc_protctl;     
wire    [31:0]  chregc10_fsmc_sarn;        
wire            chregc10_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_sinc;        
wire    [1 :0]  chregc10_fsmc_src_tr_width; 
wire    [1 :0]  chregc10_fsmc_trgtmdc;     
wire    [11:0]  chregc11_fsmc_block_tl;    
wire    [2 :0]  chregc11_fsmc_chintmdc;    
wire    [31:0]  chregc11_fsmc_darn;        
wire            chregc11_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_dinc;        
wire    [1 :0]  chregc11_fsmc_dst_tr_width; 
wire            chregc11_fsmc_endlan;      
wire    [5 :0]  chregc11_fsmc_group_len;   
wire            chregc11_fsmc_grpmc;       
wire    [3 :0]  chregc11_fsmc_protctl;     
wire    [31:0]  chregc11_fsmc_sarn;        
wire            chregc11_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_sinc;        
wire    [1 :0]  chregc11_fsmc_src_tr_width; 
wire    [1 :0]  chregc11_fsmc_trgtmdc;     
wire    [11:0]  chregc12_fsmc_block_tl;    
wire    [2 :0]  chregc12_fsmc_chintmdc;    
wire    [31:0]  chregc12_fsmc_darn;        
wire            chregc12_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_dinc;        
wire    [1 :0]  chregc12_fsmc_dst_tr_width; 
wire            chregc12_fsmc_endlan;      
wire    [5 :0]  chregc12_fsmc_group_len;   
wire            chregc12_fsmc_grpmc;       
wire    [3 :0]  chregc12_fsmc_protctl;     
wire    [31:0]  chregc12_fsmc_sarn;        
wire            chregc12_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_sinc;        
wire    [1 :0]  chregc12_fsmc_src_tr_width; 
wire    [1 :0]  chregc12_fsmc_trgtmdc;     
wire    [11:0]  chregc13_fsmc_block_tl;    
wire    [2 :0]  chregc13_fsmc_chintmdc;    
wire    [31:0]  chregc13_fsmc_darn;        
wire            chregc13_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_dinc;        
wire    [1 :0]  chregc13_fsmc_dst_tr_width; 
wire            chregc13_fsmc_endlan;      
wire    [5 :0]  chregc13_fsmc_group_len;   
wire            chregc13_fsmc_grpmc;       
wire    [3 :0]  chregc13_fsmc_protctl;     
wire    [31:0]  chregc13_fsmc_sarn;        
wire            chregc13_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_sinc;        
wire    [1 :0]  chregc13_fsmc_src_tr_width; 
wire    [1 :0]  chregc13_fsmc_trgtmdc;     
wire    [11:0]  chregc14_fsmc_block_tl;    
wire    [2 :0]  chregc14_fsmc_chintmdc;    
wire    [31:0]  chregc14_fsmc_darn;        
wire            chregc14_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_dinc;        
wire    [1 :0]  chregc14_fsmc_dst_tr_width; 
wire            chregc14_fsmc_endlan;      
wire    [5 :0]  chregc14_fsmc_group_len;   
wire            chregc14_fsmc_grpmc;       
wire    [3 :0]  chregc14_fsmc_protctl;     
wire    [31:0]  chregc14_fsmc_sarn;        
wire            chregc14_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_sinc;        
wire    [1 :0]  chregc14_fsmc_src_tr_width; 
wire    [1 :0]  chregc14_fsmc_trgtmdc;     
wire    [11:0]  chregc15_fsmc_block_tl;    
wire    [2 :0]  chregc15_fsmc_chintmdc;    
wire    [31:0]  chregc15_fsmc_darn;        
wire            chregc15_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_dinc;        
wire    [1 :0]  chregc15_fsmc_dst_tr_width; 
wire            chregc15_fsmc_endlan;      
wire    [5 :0]  chregc15_fsmc_group_len;   
wire            chregc15_fsmc_grpmc;       
wire    [3 :0]  chregc15_fsmc_protctl;     
wire    [31:0]  chregc15_fsmc_sarn;        
wire            chregc15_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_sinc;        
wire    [1 :0]  chregc15_fsmc_src_tr_width; 
wire    [1 :0]  chregc15_fsmc_trgtmdc;     
wire    [11:0]  chregc1_fsmc_block_tl;     
wire    [2 :0]  chregc1_fsmc_chintmdc;     
wire    [31:0]  chregc1_fsmc_darn;         
wire            chregc1_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_dinc;         
wire    [1 :0]  chregc1_fsmc_dst_tr_width; 
wire            chregc1_fsmc_endlan;       
wire    [5 :0]  chregc1_fsmc_group_len;    
wire            chregc1_fsmc_grpmc;        
wire    [3 :0]  chregc1_fsmc_protctl;      
wire    [31:0]  chregc1_fsmc_sarn;         
wire            chregc1_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_sinc;         
wire    [1 :0]  chregc1_fsmc_src_tr_width; 
wire    [1 :0]  chregc1_fsmc_trgtmdc;      
wire    [11:0]  chregc2_fsmc_block_tl;     
wire    [2 :0]  chregc2_fsmc_chintmdc;     
wire    [31:0]  chregc2_fsmc_darn;         
wire            chregc2_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_dinc;         
wire    [1 :0]  chregc2_fsmc_dst_tr_width; 
wire            chregc2_fsmc_endlan;       
wire    [5 :0]  chregc2_fsmc_group_len;    
wire            chregc2_fsmc_grpmc;        
wire    [3 :0]  chregc2_fsmc_protctl;      
wire    [31:0]  chregc2_fsmc_sarn;         
wire            chregc2_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_sinc;         
wire    [1 :0]  chregc2_fsmc_src_tr_width; 
wire    [1 :0]  chregc2_fsmc_trgtmdc;      
wire    [11:0]  chregc3_fsmc_block_tl;     
wire    [2 :0]  chregc3_fsmc_chintmdc;     
wire    [31:0]  chregc3_fsmc_darn;         
wire            chregc3_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_dinc;         
wire    [1 :0]  chregc3_fsmc_dst_tr_width; 
wire            chregc3_fsmc_endlan;       
wire    [5 :0]  chregc3_fsmc_group_len;    
wire            chregc3_fsmc_grpmc;        
wire    [3 :0]  chregc3_fsmc_protctl;      
wire    [31:0]  chregc3_fsmc_sarn;         
wire            chregc3_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_sinc;         
wire    [1 :0]  chregc3_fsmc_src_tr_width; 
wire    [1 :0]  chregc3_fsmc_trgtmdc;      
wire    [11:0]  chregc4_fsmc_block_tl;     
wire    [2 :0]  chregc4_fsmc_chintmdc;     
wire    [31:0]  chregc4_fsmc_darn;         
wire            chregc4_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_dinc;         
wire    [1 :0]  chregc4_fsmc_dst_tr_width; 
wire            chregc4_fsmc_endlan;       
wire    [5 :0]  chregc4_fsmc_group_len;    
wire            chregc4_fsmc_grpmc;        
wire    [3 :0]  chregc4_fsmc_protctl;      
wire    [31:0]  chregc4_fsmc_sarn;         
wire            chregc4_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_sinc;         
wire    [1 :0]  chregc4_fsmc_src_tr_width; 
wire    [1 :0]  chregc4_fsmc_trgtmdc;      
wire    [11:0]  chregc5_fsmc_block_tl;     
wire    [2 :0]  chregc5_fsmc_chintmdc;     
wire    [31:0]  chregc5_fsmc_darn;         
wire            chregc5_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_dinc;         
wire    [1 :0]  chregc5_fsmc_dst_tr_width; 
wire            chregc5_fsmc_endlan;       
wire    [5 :0]  chregc5_fsmc_group_len;    
wire            chregc5_fsmc_grpmc;        
wire    [3 :0]  chregc5_fsmc_protctl;      
wire    [31:0]  chregc5_fsmc_sarn;         
wire            chregc5_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_sinc;         
wire    [1 :0]  chregc5_fsmc_src_tr_width; 
wire    [1 :0]  chregc5_fsmc_trgtmdc;      
wire    [11:0]  chregc6_fsmc_block_tl;     
wire    [2 :0]  chregc6_fsmc_chintmdc;     
wire    [31:0]  chregc6_fsmc_darn;         
wire            chregc6_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_dinc;         
wire    [1 :0]  chregc6_fsmc_dst_tr_width; 
wire            chregc6_fsmc_endlan;       
wire    [5 :0]  chregc6_fsmc_group_len;    
wire            chregc6_fsmc_grpmc;        
wire    [3 :0]  chregc6_fsmc_protctl;      
wire    [31:0]  chregc6_fsmc_sarn;         
wire            chregc6_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_sinc;         
wire    [1 :0]  chregc6_fsmc_src_tr_width; 
wire    [1 :0]  chregc6_fsmc_trgtmdc;      
wire    [11:0]  chregc7_fsmc_block_tl;     
wire    [2 :0]  chregc7_fsmc_chintmdc;     
wire    [31:0]  chregc7_fsmc_darn;         
wire            chregc7_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_dinc;         
wire    [1 :0]  chregc7_fsmc_dst_tr_width; 
wire            chregc7_fsmc_endlan;       
wire    [5 :0]  chregc7_fsmc_group_len;    
wire            chregc7_fsmc_grpmc;        
wire    [3 :0]  chregc7_fsmc_protctl;      
wire    [31:0]  chregc7_fsmc_sarn;         
wire            chregc7_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_sinc;         
wire    [1 :0]  chregc7_fsmc_src_tr_width; 
wire    [1 :0]  chregc7_fsmc_trgtmdc;      
wire    [11:0]  chregc8_fsmc_block_tl;     
wire    [2 :0]  chregc8_fsmc_chintmdc;     
wire    [31:0]  chregc8_fsmc_darn;         
wire            chregc8_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_dinc;         
wire    [1 :0]  chregc8_fsmc_dst_tr_width; 
wire            chregc8_fsmc_endlan;       
wire    [5 :0]  chregc8_fsmc_group_len;    
wire            chregc8_fsmc_grpmc;        
wire    [3 :0]  chregc8_fsmc_protctl;      
wire    [31:0]  chregc8_fsmc_sarn;         
wire            chregc8_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_sinc;         
wire    [1 :0]  chregc8_fsmc_src_tr_width; 
wire    [1 :0]  chregc8_fsmc_trgtmdc;      
wire    [11:0]  chregc9_fsmc_block_tl;     
wire    [2 :0]  chregc9_fsmc_chintmdc;     
wire    [31:0]  chregc9_fsmc_darn;         
wire            chregc9_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_dinc;         
wire    [1 :0]  chregc9_fsmc_dst_tr_width; 
wire            chregc9_fsmc_endlan;       
wire    [5 :0]  chregc9_fsmc_group_len;    
wire            chregc9_fsmc_grpmc;        
wire    [3 :0]  chregc9_fsmc_protctl;      
wire    [31:0]  chregc9_fsmc_sarn;         
wire            chregc9_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_sinc;         
wire    [1 :0]  chregc9_fsmc_src_tr_width; 
wire    [1 :0]  chregc9_fsmc_trgtmdc;      
wire            dmac_vic_if;               
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
wire            fsmc_chregc0_err_vld;      
wire            fsmc_chregc0_htfr_vld;     
wire            fsmc_chregc0_tfr_vld;      
wire            fsmc_chregc0_trgetcmp_vld; 
wire            fsmc_chregc10_err_vld;     
wire            fsmc_chregc10_htfr_vld;    
wire            fsmc_chregc10_tfr_vld;     
wire            fsmc_chregc10_trgetcmp_vld; 
wire            fsmc_chregc11_err_vld;     
wire            fsmc_chregc11_htfr_vld;    
wire            fsmc_chregc11_tfr_vld;     
wire            fsmc_chregc11_trgetcmp_vld; 
wire            fsmc_chregc12_err_vld;     
wire            fsmc_chregc12_htfr_vld;    
wire            fsmc_chregc12_tfr_vld;     
wire            fsmc_chregc12_trgetcmp_vld; 
wire            fsmc_chregc13_err_vld;     
wire            fsmc_chregc13_htfr_vld;    
wire            fsmc_chregc13_tfr_vld;     
wire            fsmc_chregc13_trgetcmp_vld; 
wire            fsmc_chregc14_err_vld;     
wire            fsmc_chregc14_htfr_vld;    
wire            fsmc_chregc14_tfr_vld;     
wire            fsmc_chregc14_trgetcmp_vld; 
wire            fsmc_chregc15_err_vld;     
wire            fsmc_chregc15_htfr_vld;    
wire            fsmc_chregc15_tfr_vld;     
wire            fsmc_chregc15_trgetcmp_vld; 
wire            fsmc_chregc1_err_vld;      
wire            fsmc_chregc1_htfr_vld;     
wire            fsmc_chregc1_tfr_vld;      
wire            fsmc_chregc1_trgetcmp_vld; 
wire            fsmc_chregc2_err_vld;      
wire            fsmc_chregc2_htfr_vld;     
wire            fsmc_chregc2_tfr_vld;      
wire            fsmc_chregc2_trgetcmp_vld; 
wire            fsmc_chregc3_err_vld;      
wire            fsmc_chregc3_htfr_vld;     
wire            fsmc_chregc3_tfr_vld;      
wire            fsmc_chregc3_trgetcmp_vld; 
wire            fsmc_chregc4_err_vld;      
wire            fsmc_chregc4_htfr_vld;     
wire            fsmc_chregc4_tfr_vld;      
wire            fsmc_chregc4_trgetcmp_vld; 
wire            fsmc_chregc5_err_vld;      
wire            fsmc_chregc5_htfr_vld;     
wire            fsmc_chregc5_tfr_vld;      
wire            fsmc_chregc5_trgetcmp_vld; 
wire            fsmc_chregc6_err_vld;      
wire            fsmc_chregc6_htfr_vld;     
wire            fsmc_chregc6_tfr_vld;      
wire            fsmc_chregc6_trgetcmp_vld; 
wire            fsmc_chregc7_err_vld;      
wire            fsmc_chregc7_htfr_vld;     
wire            fsmc_chregc7_tfr_vld;      
wire            fsmc_chregc7_trgetcmp_vld; 
wire            fsmc_chregc8_err_vld;      
wire            fsmc_chregc8_htfr_vld;     
wire            fsmc_chregc8_tfr_vld;      
wire            fsmc_chregc8_trgetcmp_vld; 
wire            fsmc_chregc9_err_vld;      
wire            fsmc_chregc9_htfr_vld;     
wire            fsmc_chregc9_tfr_vld;      
wire            fsmc_chregc9_trgetcmp_vld; 
wire            fsmc_chregc_pdvld_ch0;     
wire            fsmc_chregc_pdvld_ch1;     
wire            fsmc_chregc_pdvld_ch10;    
wire            fsmc_chregc_pdvld_ch11;    
wire            fsmc_chregc_pdvld_ch12;    
wire            fsmc_chregc_pdvld_ch13;    
wire            fsmc_chregc_pdvld_ch14;    
wire            fsmc_chregc_pdvld_ch15;    
wire            fsmc_chregc_pdvld_ch2;     
wire            fsmc_chregc_pdvld_ch3;     
wire            fsmc_chregc_pdvld_ch4;     
wire            fsmc_chregc_pdvld_ch5;     
wire            fsmc_chregc_pdvld_ch6;     
wire            fsmc_chregc_pdvld_ch7;     
wire            fsmc_chregc_pdvld_ch8;     
wire            fsmc_chregc_pdvld_ch9;     
wire            fsmc_regc_ch0en_clr;       
wire            fsmc_regc_ch10en_clr;      
wire            fsmc_regc_ch11en_clr;      
wire            fsmc_regc_ch12en_clr;      
wire            fsmc_regc_ch13en_clr;      
wire            fsmc_regc_ch14en_clr;      
wire            fsmc_regc_ch15en_clr;      
wire            fsmc_regc_ch1en_clr;       
wire            fsmc_regc_ch2en_clr;       
wire            fsmc_regc_ch3en_clr;       
wire            fsmc_regc_ch4en_clr;       
wire            fsmc_regc_ch5en_clr;       
wire            fsmc_regc_ch6en_clr;       
wire            fsmc_regc_ch7en_clr;       
wire            fsmc_regc_ch8en_clr;       
wire            fsmc_regc_ch9en_clr;       
wire            gbc_ch0c_hpreqvld;         
wire            gbc_ch0c_reqvld;           
wire            gbc_ch10c_hpreqvld;        
wire            gbc_ch10c_reqvld;          
wire            gbc_ch11c_hpreqvld;        
wire            gbc_ch11c_reqvld;          
wire            gbc_ch12c_hpreqvld;        
wire            gbc_ch12c_reqvld;          
wire            gbc_ch13c_hpreqvld;        
wire            gbc_ch13c_reqvld;          
wire            gbc_ch14c_hpreqvld;        
wire            gbc_ch14c_reqvld;          
wire            gbc_ch15c_hpreqvld;        
wire            gbc_ch15c_reqvld;          
wire            gbc_ch1c_hpreqvld;         
wire            gbc_ch1c_reqvld;           
wire            gbc_ch2c_hpreqvld;         
wire            gbc_ch2c_reqvld;           
wire            gbc_ch3c_hpreqvld;         
wire            gbc_ch3c_reqvld;           
wire            gbc_ch4c_hpreqvld;         
wire            gbc_ch4c_reqvld;           
wire            gbc_ch5c_hpreqvld;         
wire            gbc_ch5c_reqvld;           
wire            gbc_ch6c_hpreqvld;         
wire            gbc_ch6c_reqvld;           
wire            gbc_ch7c_hpreqvld;         
wire            gbc_ch7c_reqvld;           
wire            gbc_ch8c_hpreqvld;         
wire            gbc_ch8c_reqvld;           
wire            gbc_ch9c_hpreqvld;         
wire            gbc_ch9c_reqvld;           
wire            gbc_chnc_dmacen;           
wire            hclk;                      
wire            hready;                    
wire            hrst_n;                    
wire    [31:0]  m_addr_ch0;                
wire    [31:0]  m_addr_ch1;                
wire    [31:0]  m_addr_ch10;               
wire    [31:0]  m_addr_ch11;               
wire    [31:0]  m_addr_ch12;               
wire    [31:0]  m_addr_ch13;               
wire    [31:0]  m_addr_ch14;               
wire    [31:0]  m_addr_ch15;               
wire    [31:0]  m_addr_ch2;                
wire    [31:0]  m_addr_ch3;                
wire    [31:0]  m_addr_ch4;                
wire    [31:0]  m_addr_ch5;                
wire    [31:0]  m_addr_ch6;                
wire    [31:0]  m_addr_ch7;                
wire    [31:0]  m_addr_ch8;                
wire    [31:0]  m_addr_ch9;                
wire    [31:0]  m_haddr;                   
wire    [2 :0]  m_hburst;                  
wire            m_hbusreq;                 
wire            m_hgrant;                  
wire            m_hlock;                   
wire    [3 :0]  m_hprot;                   
wire    [31:0]  m_hrdata;                  
wire            m_hready;                  
wire    [1 :0]  m_hresp;                   
wire    [2 :0]  m_hsize;                   
wire    [2 :0]  m_hsize_ch0;               
wire    [2 :0]  m_hsize_ch1;               
wire    [2 :0]  m_hsize_ch10;              
wire    [2 :0]  m_hsize_ch11;              
wire    [2 :0]  m_hsize_ch12;              
wire    [2 :0]  m_hsize_ch13;              
wire    [2 :0]  m_hsize_ch14;              
wire    [2 :0]  m_hsize_ch15;              
wire    [2 :0]  m_hsize_ch2;               
wire    [2 :0]  m_hsize_ch3;               
wire    [2 :0]  m_hsize_ch4;               
wire    [2 :0]  m_hsize_ch5;               
wire    [2 :0]  m_hsize_ch6;               
wire    [2 :0]  m_hsize_ch7;               
wire    [2 :0]  m_hsize_ch8;               
wire    [2 :0]  m_hsize_ch9;               
wire    [1 :0]  m_htrans;                  
wire    [31:0]  m_hwdata;                  
wire    [31:0]  m_hwdata_ch0;              
wire    [31:0]  m_hwdata_ch1;              
wire    [31:0]  m_hwdata_ch10;             
wire    [31:0]  m_hwdata_ch11;             
wire    [31:0]  m_hwdata_ch12;             
wire    [31:0]  m_hwdata_ch13;             
wire    [31:0]  m_hwdata_ch14;             
wire    [31:0]  m_hwdata_ch15;             
wire    [31:0]  m_hwdata_ch2;              
wire    [31:0]  m_hwdata_ch3;              
wire    [31:0]  m_hwdata_ch4;              
wire    [31:0]  m_hwdata_ch5;              
wire    [31:0]  m_hwdata_ch6;              
wire    [31:0]  m_hwdata_ch7;              
wire    [31:0]  m_hwdata_ch8;              
wire    [31:0]  m_hwdata_ch9;              
wire            m_hwrite;                  
wire            m_hwrite_ch0;              
wire            m_hwrite_ch1;              
wire            m_hwrite_ch10;             
wire            m_hwrite_ch11;             
wire            m_hwrite_ch12;             
wire            m_hwrite_ch13;             
wire            m_hwrite_ch14;             
wire            m_hwrite_ch15;             
wire            m_hwrite_ch2;              
wire            m_hwrite_ch3;              
wire            m_hwrite_ch4;              
wire            m_hwrite_ch5;              
wire            m_hwrite_ch6;              
wire            m_hwrite_ch7;              
wire            m_hwrite_ch8;              
wire            m_hwrite_ch9;              
wire    [3 :0]  m_prot_ch0;                
wire    [3 :0]  m_prot_ch1;                
wire    [3 :0]  m_prot_ch10;               
wire    [3 :0]  m_prot_ch11;               
wire    [3 :0]  m_prot_ch12;               
wire    [3 :0]  m_prot_ch13;               
wire    [3 :0]  m_prot_ch14;               
wire    [3 :0]  m_prot_ch15;               
wire    [3 :0]  m_prot_ch2;                
wire    [3 :0]  m_prot_ch3;                
wire    [3 :0]  m_prot_ch4;                
wire    [3 :0]  m_prot_ch5;                
wire    [3 :0]  m_prot_ch6;                
wire    [3 :0]  m_prot_ch7;                
wire    [3 :0]  m_prot_ch8;                
wire    [3 :0]  m_prot_ch9;                
wire            regc_fsmc_ch0_srcdtlgc;    
wire            regc_fsmc_ch10_srcdtlgc;   
wire            regc_fsmc_ch11_srcdtlgc;   
wire            regc_fsmc_ch12_srcdtlgc;   
wire            regc_fsmc_ch13_srcdtlgc;   
wire            regc_fsmc_ch14_srcdtlgc;   
wire            regc_fsmc_ch15_srcdtlgc;   
wire            regc_fsmc_ch1_srcdtlgc;    
wire            regc_fsmc_ch2_srcdtlgc;    
wire            regc_fsmc_ch3_srcdtlgc;    
wire            regc_fsmc_ch4_srcdtlgc;    
wire            regc_fsmc_ch5_srcdtlgc;    
wire            regc_fsmc_ch6_srcdtlgc;    
wire            regc_fsmc_ch7_srcdtlgc;    
wire            regc_fsmc_ch8_srcdtlgc;    
wire            regc_fsmc_ch9_srcdtlgc;    
wire    [31:0]  s_haddr;                   
wire    [3 :0]  s_hprot;                   
wire    [31:0]  s_hrdata;                  
wire            s_hready;                  
wire    [1 :0]  s_hresp;                   
wire            s_hsel;                    
wire    [1 :0]  s_htrans;                  
wire    [31:0]  s_hwdata;                  
wire            s_hwrite;                  
bmux_ctrl  x_ahbbusmux_ctrl (
  .arb_bmux_transvld (arb_bmux_transvld),
  .arb_bmux_trgvld   (arb_bmux_trgvld  ),
  .busy_chn_code     (busy_chn_code    ),
  .gbc_chnc_dmacen   (gbc_chnc_dmacen  ),
  .hclk              (hclk             ),
  .hready            (hready           ),
  .hrst_n            (hrst_n           ),
  .m_addr_ch0        (m_addr_ch0       ),
  .m_addr_ch1        (m_addr_ch1       ),
  .m_addr_ch10       (m_addr_ch10      ),
  .m_addr_ch11       (m_addr_ch11      ),
  .m_addr_ch12       (m_addr_ch12      ),
  .m_addr_ch13       (m_addr_ch13      ),
  .m_addr_ch14       (m_addr_ch14      ),
  .m_addr_ch15       (m_addr_ch15      ),
  .m_addr_ch2        (m_addr_ch2       ),
  .m_addr_ch3        (m_addr_ch3       ),
  .m_addr_ch4        (m_addr_ch4       ),
  .m_addr_ch5        (m_addr_ch5       ),
  .m_addr_ch6        (m_addr_ch6       ),
  .m_addr_ch7        (m_addr_ch7       ),
  .m_addr_ch8        (m_addr_ch8       ),
  .m_addr_ch9        (m_addr_ch9       ),
  .m_haddr           (m_haddr          ),
  .m_hburst          (m_hburst         ),
  .m_hbusreq         (m_hbusreq        ),
  .m_hgrant          (m_hgrant         ),
  .m_hlock           (m_hlock          ),
  .m_hprot           (m_hprot          ),
  .m_hready          (m_hready         ),
  .m_hsize           (m_hsize          ),
  .m_hsize_ch0       (m_hsize_ch0      ),
  .m_hsize_ch1       (m_hsize_ch1      ),
  .m_hsize_ch10      (m_hsize_ch10     ),
  .m_hsize_ch11      (m_hsize_ch11     ),
  .m_hsize_ch12      (m_hsize_ch12     ),
  .m_hsize_ch13      (m_hsize_ch13     ),
  .m_hsize_ch14      (m_hsize_ch14     ),
  .m_hsize_ch15      (m_hsize_ch15     ),
  .m_hsize_ch2       (m_hsize_ch2      ),
  .m_hsize_ch3       (m_hsize_ch3      ),
  .m_hsize_ch4       (m_hsize_ch4      ),
  .m_hsize_ch5       (m_hsize_ch5      ),
  .m_hsize_ch6       (m_hsize_ch6      ),
  .m_hsize_ch7       (m_hsize_ch7      ),
  .m_hsize_ch8       (m_hsize_ch8      ),
  .m_hsize_ch9       (m_hsize_ch9      ),
  .m_htrans          (m_htrans         ),
  .m_hwdata          (m_hwdata         ),
  .m_hwdata_ch0      (m_hwdata_ch0     ),
  .m_hwdata_ch1      (m_hwdata_ch1     ),
  .m_hwdata_ch10     (m_hwdata_ch10    ),
  .m_hwdata_ch11     (m_hwdata_ch11    ),
  .m_hwdata_ch12     (m_hwdata_ch12    ),
  .m_hwdata_ch13     (m_hwdata_ch13    ),
  .m_hwdata_ch14     (m_hwdata_ch14    ),
  .m_hwdata_ch15     (m_hwdata_ch15    ),
  .m_hwdata_ch2      (m_hwdata_ch2     ),
  .m_hwdata_ch3      (m_hwdata_ch3     ),
  .m_hwdata_ch4      (m_hwdata_ch4     ),
  .m_hwdata_ch5      (m_hwdata_ch5     ),
  .m_hwdata_ch6      (m_hwdata_ch6     ),
  .m_hwdata_ch7      (m_hwdata_ch7     ),
  .m_hwdata_ch8      (m_hwdata_ch8     ),
  .m_hwdata_ch9      (m_hwdata_ch9     ),
  .m_hwrite          (m_hwrite         ),
  .m_hwrite_ch0      (m_hwrite_ch0     ),
  .m_hwrite_ch1      (m_hwrite_ch1     ),
  .m_hwrite_ch10     (m_hwrite_ch10    ),
  .m_hwrite_ch11     (m_hwrite_ch11    ),
  .m_hwrite_ch12     (m_hwrite_ch12    ),
  .m_hwrite_ch13     (m_hwrite_ch13    ),
  .m_hwrite_ch14     (m_hwrite_ch14    ),
  .m_hwrite_ch15     (m_hwrite_ch15    ),
  .m_hwrite_ch2      (m_hwrite_ch2     ),
  .m_hwrite_ch3      (m_hwrite_ch3     ),
  .m_hwrite_ch4      (m_hwrite_ch4     ),
  .m_hwrite_ch5      (m_hwrite_ch5     ),
  .m_hwrite_ch6      (m_hwrite_ch6     ),
  .m_hwrite_ch7      (m_hwrite_ch7     ),
  .m_hwrite_ch8      (m_hwrite_ch8     ),
  .m_hwrite_ch9      (m_hwrite_ch9     ),
  .m_prot_ch0        (m_prot_ch0       ),
  .m_prot_ch1        (m_prot_ch1       ),
  .m_prot_ch10       (m_prot_ch10      ),
  .m_prot_ch11       (m_prot_ch11      ),
  .m_prot_ch12       (m_prot_ch12      ),
  .m_prot_ch13       (m_prot_ch13      ),
  .m_prot_ch14       (m_prot_ch14      ),
  .m_prot_ch15       (m_prot_ch15      ),
  .m_prot_ch2        (m_prot_ch2       ),
  .m_prot_ch3        (m_prot_ch3       ),
  .m_prot_ch4        (m_prot_ch4       ),
  .m_prot_ch5        (m_prot_ch5       ),
  .m_prot_ch6        (m_prot_ch6       ),
  .m_prot_ch7        (m_prot_ch7       ),
  .m_prot_ch8        (m_prot_ch8       ),
  .m_prot_ch9        (m_prot_ch9       )
);
reg_ctrl  x_reg_ctrl (
  .ch0_prot_out               (ch0_prot_out              ),
  .ch0c_gbc_chbsy             (ch0c_gbc_chbsy            ),
  .ch0c_gbc_chnen             (ch0c_gbc_chnen            ),
  .ch0c_gbc_sfwtrg            (ch0c_gbc_sfwtrg           ),
  .ch10_prot_out              (ch10_prot_out             ),
  .ch10c_gbc_chbsy            (ch10c_gbc_chbsy           ),
  .ch10c_gbc_chnen            (ch10c_gbc_chnen           ),
  .ch10c_gbc_sfwtrg           (ch10c_gbc_sfwtrg          ),
  .ch11_prot_out              (ch11_prot_out             ),
  .ch11c_gbc_chbsy            (ch11c_gbc_chbsy           ),
  .ch11c_gbc_chnen            (ch11c_gbc_chnen           ),
  .ch11c_gbc_sfwtrg           (ch11c_gbc_sfwtrg          ),
  .ch12_prot_out              (ch12_prot_out             ),
  .ch12c_gbc_chbsy            (ch12c_gbc_chbsy           ),
  .ch12c_gbc_chnen            (ch12c_gbc_chnen           ),
  .ch12c_gbc_sfwtrg           (ch12c_gbc_sfwtrg          ),
  .ch13_prot_out              (ch13_prot_out             ),
  .ch13c_gbc_chbsy            (ch13c_gbc_chbsy           ),
  .ch13c_gbc_chnen            (ch13c_gbc_chnen           ),
  .ch13c_gbc_sfwtrg           (ch13c_gbc_sfwtrg          ),
  .ch14_prot_out              (ch14_prot_out             ),
  .ch14c_gbc_chbsy            (ch14c_gbc_chbsy           ),
  .ch14c_gbc_chnen            (ch14c_gbc_chnen           ),
  .ch14c_gbc_sfwtrg           (ch14c_gbc_sfwtrg          ),
  .ch15_prot_out              (ch15_prot_out             ),
  .ch15c_gbc_chbsy            (ch15c_gbc_chbsy           ),
  .ch15c_gbc_chnen            (ch15c_gbc_chnen           ),
  .ch15c_gbc_sfwtrg           (ch15c_gbc_sfwtrg          ),
  .ch1_prot_out               (ch1_prot_out              ),
  .ch1c_gbc_chbsy             (ch1c_gbc_chbsy            ),
  .ch1c_gbc_chnen             (ch1c_gbc_chnen            ),
  .ch1c_gbc_sfwtrg            (ch1c_gbc_sfwtrg           ),
  .ch2_prot_out               (ch2_prot_out              ),
  .ch2c_gbc_chbsy             (ch2c_gbc_chbsy            ),
  .ch2c_gbc_chnen             (ch2c_gbc_chnen            ),
  .ch2c_gbc_sfwtrg            (ch2c_gbc_sfwtrg           ),
  .ch3_prot_out               (ch3_prot_out              ),
  .ch3c_gbc_chbsy             (ch3c_gbc_chbsy            ),
  .ch3c_gbc_chnen             (ch3c_gbc_chnen            ),
  .ch3c_gbc_sfwtrg            (ch3c_gbc_sfwtrg           ),
  .ch4_prot_out               (ch4_prot_out              ),
  .ch4c_gbc_chbsy             (ch4c_gbc_chbsy            ),
  .ch4c_gbc_chnen             (ch4c_gbc_chnen            ),
  .ch4c_gbc_sfwtrg            (ch4c_gbc_sfwtrg           ),
  .ch5_prot_out               (ch5_prot_out              ),
  .ch5c_gbc_chbsy             (ch5c_gbc_chbsy            ),
  .ch5c_gbc_chnen             (ch5c_gbc_chnen            ),
  .ch5c_gbc_sfwtrg            (ch5c_gbc_sfwtrg           ),
  .ch6_prot_out               (ch6_prot_out              ),
  .ch6c_gbc_chbsy             (ch6c_gbc_chbsy            ),
  .ch6c_gbc_chnen             (ch6c_gbc_chnen            ),
  .ch6c_gbc_sfwtrg            (ch6c_gbc_sfwtrg           ),
  .ch7_prot_out               (ch7_prot_out              ),
  .ch7c_gbc_chbsy             (ch7c_gbc_chbsy            ),
  .ch7c_gbc_chnen             (ch7c_gbc_chnen            ),
  .ch7c_gbc_sfwtrg            (ch7c_gbc_sfwtrg           ),
  .ch8_prot_out               (ch8_prot_out              ),
  .ch8c_gbc_chbsy             (ch8c_gbc_chbsy            ),
  .ch8c_gbc_chnen             (ch8c_gbc_chnen            ),
  .ch8c_gbc_sfwtrg            (ch8c_gbc_sfwtrg           ),
  .ch9_prot_out               (ch9_prot_out              ),
  .ch9c_gbc_chbsy             (ch9c_gbc_chbsy            ),
  .ch9c_gbc_chnen             (ch9c_gbc_chnen            ),
  .ch9c_gbc_sfwtrg            (ch9c_gbc_sfwtrg           ),
  .chregc0_fsmc_block_tl      (chregc0_fsmc_block_tl     ),
  .chregc0_fsmc_chintmdc      (chregc0_fsmc_chintmdc     ),
  .chregc0_fsmc_darn          (chregc0_fsmc_darn         ),
  .chregc0_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc    ),
  .chregc0_fsmc_dinc          (chregc0_fsmc_dinc         ),
  .chregc0_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width ),
  .chregc0_fsmc_endlan        (chregc0_fsmc_endlan       ),
  .chregc0_fsmc_group_len     (chregc0_fsmc_group_len    ),
  .chregc0_fsmc_grpmc         (chregc0_fsmc_grpmc        ),
  .chregc0_fsmc_protctl       (chregc0_fsmc_protctl      ),
  .chregc0_fsmc_sarn          (chregc0_fsmc_sarn         ),
  .chregc0_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc    ),
  .chregc0_fsmc_sinc          (chregc0_fsmc_sinc         ),
  .chregc0_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width ),
  .chregc0_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc      ),
  .chregc10_fsmc_block_tl     (chregc10_fsmc_block_tl    ),
  .chregc10_fsmc_chintmdc     (chregc10_fsmc_chintmdc    ),
  .chregc10_fsmc_darn         (chregc10_fsmc_darn        ),
  .chregc10_fsmc_dgrpaddrc    (chregc10_fsmc_dgrpaddrc   ),
  .chregc10_fsmc_dinc         (chregc10_fsmc_dinc        ),
  .chregc10_fsmc_dst_tr_width (chregc10_fsmc_dst_tr_width),
  .chregc10_fsmc_endlan       (chregc10_fsmc_endlan      ),
  .chregc10_fsmc_group_len    (chregc10_fsmc_group_len   ),
  .chregc10_fsmc_grpmc        (chregc10_fsmc_grpmc       ),
  .chregc10_fsmc_protctl      (chregc10_fsmc_protctl     ),
  .chregc10_fsmc_sarn         (chregc10_fsmc_sarn        ),
  .chregc10_fsmc_sgrpaddrc    (chregc10_fsmc_sgrpaddrc   ),
  .chregc10_fsmc_sinc         (chregc10_fsmc_sinc        ),
  .chregc10_fsmc_src_tr_width (chregc10_fsmc_src_tr_width),
  .chregc10_fsmc_trgtmdc      (chregc10_fsmc_trgtmdc     ),
  .chregc11_fsmc_block_tl     (chregc11_fsmc_block_tl    ),
  .chregc11_fsmc_chintmdc     (chregc11_fsmc_chintmdc    ),
  .chregc11_fsmc_darn         (chregc11_fsmc_darn        ),
  .chregc11_fsmc_dgrpaddrc    (chregc11_fsmc_dgrpaddrc   ),
  .chregc11_fsmc_dinc         (chregc11_fsmc_dinc        ),
  .chregc11_fsmc_dst_tr_width (chregc11_fsmc_dst_tr_width),
  .chregc11_fsmc_endlan       (chregc11_fsmc_endlan      ),
  .chregc11_fsmc_group_len    (chregc11_fsmc_group_len   ),
  .chregc11_fsmc_grpmc        (chregc11_fsmc_grpmc       ),
  .chregc11_fsmc_protctl      (chregc11_fsmc_protctl     ),
  .chregc11_fsmc_sarn         (chregc11_fsmc_sarn        ),
  .chregc11_fsmc_sgrpaddrc    (chregc11_fsmc_sgrpaddrc   ),
  .chregc11_fsmc_sinc         (chregc11_fsmc_sinc        ),
  .chregc11_fsmc_src_tr_width (chregc11_fsmc_src_tr_width),
  .chregc11_fsmc_trgtmdc      (chregc11_fsmc_trgtmdc     ),
  .chregc12_fsmc_block_tl     (chregc12_fsmc_block_tl    ),
  .chregc12_fsmc_chintmdc     (chregc12_fsmc_chintmdc    ),
  .chregc12_fsmc_darn         (chregc12_fsmc_darn        ),
  .chregc12_fsmc_dgrpaddrc    (chregc12_fsmc_dgrpaddrc   ),
  .chregc12_fsmc_dinc         (chregc12_fsmc_dinc        ),
  .chregc12_fsmc_dst_tr_width (chregc12_fsmc_dst_tr_width),
  .chregc12_fsmc_endlan       (chregc12_fsmc_endlan      ),
  .chregc12_fsmc_group_len    (chregc12_fsmc_group_len   ),
  .chregc12_fsmc_grpmc        (chregc12_fsmc_grpmc       ),
  .chregc12_fsmc_protctl      (chregc12_fsmc_protctl     ),
  .chregc12_fsmc_sarn         (chregc12_fsmc_sarn        ),
  .chregc12_fsmc_sgrpaddrc    (chregc12_fsmc_sgrpaddrc   ),
  .chregc12_fsmc_sinc         (chregc12_fsmc_sinc        ),
  .chregc12_fsmc_src_tr_width (chregc12_fsmc_src_tr_width),
  .chregc12_fsmc_trgtmdc      (chregc12_fsmc_trgtmdc     ),
  .chregc13_fsmc_block_tl     (chregc13_fsmc_block_tl    ),
  .chregc13_fsmc_chintmdc     (chregc13_fsmc_chintmdc    ),
  .chregc13_fsmc_darn         (chregc13_fsmc_darn        ),
  .chregc13_fsmc_dgrpaddrc    (chregc13_fsmc_dgrpaddrc   ),
  .chregc13_fsmc_dinc         (chregc13_fsmc_dinc        ),
  .chregc13_fsmc_dst_tr_width (chregc13_fsmc_dst_tr_width),
  .chregc13_fsmc_endlan       (chregc13_fsmc_endlan      ),
  .chregc13_fsmc_group_len    (chregc13_fsmc_group_len   ),
  .chregc13_fsmc_grpmc        (chregc13_fsmc_grpmc       ),
  .chregc13_fsmc_protctl      (chregc13_fsmc_protctl     ),
  .chregc13_fsmc_sarn         (chregc13_fsmc_sarn        ),
  .chregc13_fsmc_sgrpaddrc    (chregc13_fsmc_sgrpaddrc   ),
  .chregc13_fsmc_sinc         (chregc13_fsmc_sinc        ),
  .chregc13_fsmc_src_tr_width (chregc13_fsmc_src_tr_width),
  .chregc13_fsmc_trgtmdc      (chregc13_fsmc_trgtmdc     ),
  .chregc14_fsmc_block_tl     (chregc14_fsmc_block_tl    ),
  .chregc14_fsmc_chintmdc     (chregc14_fsmc_chintmdc    ),
  .chregc14_fsmc_darn         (chregc14_fsmc_darn        ),
  .chregc14_fsmc_dgrpaddrc    (chregc14_fsmc_dgrpaddrc   ),
  .chregc14_fsmc_dinc         (chregc14_fsmc_dinc        ),
  .chregc14_fsmc_dst_tr_width (chregc14_fsmc_dst_tr_width),
  .chregc14_fsmc_endlan       (chregc14_fsmc_endlan      ),
  .chregc14_fsmc_group_len    (chregc14_fsmc_group_len   ),
  .chregc14_fsmc_grpmc        (chregc14_fsmc_grpmc       ),
  .chregc14_fsmc_protctl      (chregc14_fsmc_protctl     ),
  .chregc14_fsmc_sarn         (chregc14_fsmc_sarn        ),
  .chregc14_fsmc_sgrpaddrc    (chregc14_fsmc_sgrpaddrc   ),
  .chregc14_fsmc_sinc         (chregc14_fsmc_sinc        ),
  .chregc14_fsmc_src_tr_width (chregc14_fsmc_src_tr_width),
  .chregc14_fsmc_trgtmdc      (chregc14_fsmc_trgtmdc     ),
  .chregc15_fsmc_block_tl     (chregc15_fsmc_block_tl    ),
  .chregc15_fsmc_chintmdc     (chregc15_fsmc_chintmdc    ),
  .chregc15_fsmc_darn         (chregc15_fsmc_darn        ),
  .chregc15_fsmc_dgrpaddrc    (chregc15_fsmc_dgrpaddrc   ),
  .chregc15_fsmc_dinc         (chregc15_fsmc_dinc        ),
  .chregc15_fsmc_dst_tr_width (chregc15_fsmc_dst_tr_width),
  .chregc15_fsmc_endlan       (chregc15_fsmc_endlan      ),
  .chregc15_fsmc_group_len    (chregc15_fsmc_group_len   ),
  .chregc15_fsmc_grpmc        (chregc15_fsmc_grpmc       ),
  .chregc15_fsmc_protctl      (chregc15_fsmc_protctl     ),
  .chregc15_fsmc_sarn         (chregc15_fsmc_sarn        ),
  .chregc15_fsmc_sgrpaddrc    (chregc15_fsmc_sgrpaddrc   ),
  .chregc15_fsmc_sinc         (chregc15_fsmc_sinc        ),
  .chregc15_fsmc_src_tr_width (chregc15_fsmc_src_tr_width),
  .chregc15_fsmc_trgtmdc      (chregc15_fsmc_trgtmdc     ),
  .chregc1_fsmc_block_tl      (chregc1_fsmc_block_tl     ),
  .chregc1_fsmc_chintmdc      (chregc1_fsmc_chintmdc     ),
  .chregc1_fsmc_darn          (chregc1_fsmc_darn         ),
  .chregc1_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc    ),
  .chregc1_fsmc_dinc          (chregc1_fsmc_dinc         ),
  .chregc1_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width ),
  .chregc1_fsmc_endlan        (chregc1_fsmc_endlan       ),
  .chregc1_fsmc_group_len     (chregc1_fsmc_group_len    ),
  .chregc1_fsmc_grpmc         (chregc1_fsmc_grpmc        ),
  .chregc1_fsmc_protctl       (chregc1_fsmc_protctl      ),
  .chregc1_fsmc_sarn          (chregc1_fsmc_sarn         ),
  .chregc1_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc    ),
  .chregc1_fsmc_sinc          (chregc1_fsmc_sinc         ),
  .chregc1_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width ),
  .chregc1_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc      ),
  .chregc2_fsmc_block_tl      (chregc2_fsmc_block_tl     ),
  .chregc2_fsmc_chintmdc      (chregc2_fsmc_chintmdc     ),
  .chregc2_fsmc_darn          (chregc2_fsmc_darn         ),
  .chregc2_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc    ),
  .chregc2_fsmc_dinc          (chregc2_fsmc_dinc         ),
  .chregc2_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width ),
  .chregc2_fsmc_endlan        (chregc2_fsmc_endlan       ),
  .chregc2_fsmc_group_len     (chregc2_fsmc_group_len    ),
  .chregc2_fsmc_grpmc         (chregc2_fsmc_grpmc        ),
  .chregc2_fsmc_protctl       (chregc2_fsmc_protctl      ),
  .chregc2_fsmc_sarn          (chregc2_fsmc_sarn         ),
  .chregc2_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc    ),
  .chregc2_fsmc_sinc          (chregc2_fsmc_sinc         ),
  .chregc2_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width ),
  .chregc2_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc      ),
  .chregc3_fsmc_block_tl      (chregc3_fsmc_block_tl     ),
  .chregc3_fsmc_chintmdc      (chregc3_fsmc_chintmdc     ),
  .chregc3_fsmc_darn          (chregc3_fsmc_darn         ),
  .chregc3_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc    ),
  .chregc3_fsmc_dinc          (chregc3_fsmc_dinc         ),
  .chregc3_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width ),
  .chregc3_fsmc_endlan        (chregc3_fsmc_endlan       ),
  .chregc3_fsmc_group_len     (chregc3_fsmc_group_len    ),
  .chregc3_fsmc_grpmc         (chregc3_fsmc_grpmc        ),
  .chregc3_fsmc_protctl       (chregc3_fsmc_protctl      ),
  .chregc3_fsmc_sarn          (chregc3_fsmc_sarn         ),
  .chregc3_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc    ),
  .chregc3_fsmc_sinc          (chregc3_fsmc_sinc         ),
  .chregc3_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width ),
  .chregc3_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc      ),
  .chregc4_fsmc_block_tl      (chregc4_fsmc_block_tl     ),
  .chregc4_fsmc_chintmdc      (chregc4_fsmc_chintmdc     ),
  .chregc4_fsmc_darn          (chregc4_fsmc_darn         ),
  .chregc4_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc    ),
  .chregc4_fsmc_dinc          (chregc4_fsmc_dinc         ),
  .chregc4_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width ),
  .chregc4_fsmc_endlan        (chregc4_fsmc_endlan       ),
  .chregc4_fsmc_group_len     (chregc4_fsmc_group_len    ),
  .chregc4_fsmc_grpmc         (chregc4_fsmc_grpmc        ),
  .chregc4_fsmc_protctl       (chregc4_fsmc_protctl      ),
  .chregc4_fsmc_sarn          (chregc4_fsmc_sarn         ),
  .chregc4_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc    ),
  .chregc4_fsmc_sinc          (chregc4_fsmc_sinc         ),
  .chregc4_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width ),
  .chregc4_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc      ),
  .chregc5_fsmc_block_tl      (chregc5_fsmc_block_tl     ),
  .chregc5_fsmc_chintmdc      (chregc5_fsmc_chintmdc     ),
  .chregc5_fsmc_darn          (chregc5_fsmc_darn         ),
  .chregc5_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc    ),
  .chregc5_fsmc_dinc          (chregc5_fsmc_dinc         ),
  .chregc5_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width ),
  .chregc5_fsmc_endlan        (chregc5_fsmc_endlan       ),
  .chregc5_fsmc_group_len     (chregc5_fsmc_group_len    ),
  .chregc5_fsmc_grpmc         (chregc5_fsmc_grpmc        ),
  .chregc5_fsmc_protctl       (chregc5_fsmc_protctl      ),
  .chregc5_fsmc_sarn          (chregc5_fsmc_sarn         ),
  .chregc5_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc    ),
  .chregc5_fsmc_sinc          (chregc5_fsmc_sinc         ),
  .chregc5_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width ),
  .chregc5_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc      ),
  .chregc6_fsmc_block_tl      (chregc6_fsmc_block_tl     ),
  .chregc6_fsmc_chintmdc      (chregc6_fsmc_chintmdc     ),
  .chregc6_fsmc_darn          (chregc6_fsmc_darn         ),
  .chregc6_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc    ),
  .chregc6_fsmc_dinc          (chregc6_fsmc_dinc         ),
  .chregc6_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width ),
  .chregc6_fsmc_endlan        (chregc6_fsmc_endlan       ),
  .chregc6_fsmc_group_len     (chregc6_fsmc_group_len    ),
  .chregc6_fsmc_grpmc         (chregc6_fsmc_grpmc        ),
  .chregc6_fsmc_protctl       (chregc6_fsmc_protctl      ),
  .chregc6_fsmc_sarn          (chregc6_fsmc_sarn         ),
  .chregc6_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc    ),
  .chregc6_fsmc_sinc          (chregc6_fsmc_sinc         ),
  .chregc6_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width ),
  .chregc6_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc      ),
  .chregc7_fsmc_block_tl      (chregc7_fsmc_block_tl     ),
  .chregc7_fsmc_chintmdc      (chregc7_fsmc_chintmdc     ),
  .chregc7_fsmc_darn          (chregc7_fsmc_darn         ),
  .chregc7_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc    ),
  .chregc7_fsmc_dinc          (chregc7_fsmc_dinc         ),
  .chregc7_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width ),
  .chregc7_fsmc_endlan        (chregc7_fsmc_endlan       ),
  .chregc7_fsmc_group_len     (chregc7_fsmc_group_len    ),
  .chregc7_fsmc_grpmc         (chregc7_fsmc_grpmc        ),
  .chregc7_fsmc_protctl       (chregc7_fsmc_protctl      ),
  .chregc7_fsmc_sarn          (chregc7_fsmc_sarn         ),
  .chregc7_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc    ),
  .chregc7_fsmc_sinc          (chregc7_fsmc_sinc         ),
  .chregc7_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width ),
  .chregc7_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc      ),
  .chregc8_fsmc_block_tl      (chregc8_fsmc_block_tl     ),
  .chregc8_fsmc_chintmdc      (chregc8_fsmc_chintmdc     ),
  .chregc8_fsmc_darn          (chregc8_fsmc_darn         ),
  .chregc8_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc    ),
  .chregc8_fsmc_dinc          (chregc8_fsmc_dinc         ),
  .chregc8_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width ),
  .chregc8_fsmc_endlan        (chregc8_fsmc_endlan       ),
  .chregc8_fsmc_group_len     (chregc8_fsmc_group_len    ),
  .chregc8_fsmc_grpmc         (chregc8_fsmc_grpmc        ),
  .chregc8_fsmc_protctl       (chregc8_fsmc_protctl      ),
  .chregc8_fsmc_sarn          (chregc8_fsmc_sarn         ),
  .chregc8_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc    ),
  .chregc8_fsmc_sinc          (chregc8_fsmc_sinc         ),
  .chregc8_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width ),
  .chregc8_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc      ),
  .chregc9_fsmc_block_tl      (chregc9_fsmc_block_tl     ),
  .chregc9_fsmc_chintmdc      (chregc9_fsmc_chintmdc     ),
  .chregc9_fsmc_darn          (chregc9_fsmc_darn         ),
  .chregc9_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc    ),
  .chregc9_fsmc_dinc          (chregc9_fsmc_dinc         ),
  .chregc9_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width ),
  .chregc9_fsmc_endlan        (chregc9_fsmc_endlan       ),
  .chregc9_fsmc_group_len     (chregc9_fsmc_group_len    ),
  .chregc9_fsmc_grpmc         (chregc9_fsmc_grpmc        ),
  .chregc9_fsmc_protctl       (chregc9_fsmc_protctl      ),
  .chregc9_fsmc_sarn          (chregc9_fsmc_sarn         ),
  .chregc9_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc    ),
  .chregc9_fsmc_sinc          (chregc9_fsmc_sinc         ),
  .chregc9_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width ),
  .chregc9_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc      ),
  .dmac_vic_if                (dmac_vic_if               ),
  .fsmc_chregc0_err_vld       (fsmc_chregc0_err_vld      ),
  .fsmc_chregc0_htfr_vld      (fsmc_chregc0_htfr_vld     ),
  .fsmc_chregc0_tfr_vld       (fsmc_chregc0_tfr_vld      ),
  .fsmc_chregc0_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld ),
  .fsmc_chregc10_err_vld      (fsmc_chregc10_err_vld     ),
  .fsmc_chregc10_htfr_vld     (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc10_tfr_vld      (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc10_trgetcmp_vld (fsmc_chregc10_trgetcmp_vld),
  .fsmc_chregc11_err_vld      (fsmc_chregc11_err_vld     ),
  .fsmc_chregc11_htfr_vld     (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc11_tfr_vld      (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc11_trgetcmp_vld (fsmc_chregc11_trgetcmp_vld),
  .fsmc_chregc12_err_vld      (fsmc_chregc12_err_vld     ),
  .fsmc_chregc12_htfr_vld     (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc12_tfr_vld      (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc12_trgetcmp_vld (fsmc_chregc12_trgetcmp_vld),
  .fsmc_chregc13_err_vld      (fsmc_chregc13_err_vld     ),
  .fsmc_chregc13_htfr_vld     (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc13_tfr_vld      (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc13_trgetcmp_vld (fsmc_chregc13_trgetcmp_vld),
  .fsmc_chregc14_err_vld      (fsmc_chregc14_err_vld     ),
  .fsmc_chregc14_htfr_vld     (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc14_tfr_vld      (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc14_trgetcmp_vld (fsmc_chregc14_trgetcmp_vld),
  .fsmc_chregc15_err_vld      (fsmc_chregc15_err_vld     ),
  .fsmc_chregc15_htfr_vld     (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc15_tfr_vld      (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc15_trgetcmp_vld (fsmc_chregc15_trgetcmp_vld),
  .fsmc_chregc1_err_vld       (fsmc_chregc1_err_vld      ),
  .fsmc_chregc1_htfr_vld      (fsmc_chregc1_htfr_vld     ),
  .fsmc_chregc1_tfr_vld       (fsmc_chregc1_tfr_vld      ),
  .fsmc_chregc1_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld ),
  .fsmc_chregc2_err_vld       (fsmc_chregc2_err_vld      ),
  .fsmc_chregc2_htfr_vld      (fsmc_chregc2_htfr_vld     ),
  .fsmc_chregc2_tfr_vld       (fsmc_chregc2_tfr_vld      ),
  .fsmc_chregc2_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld ),
  .fsmc_chregc3_err_vld       (fsmc_chregc3_err_vld      ),
  .fsmc_chregc3_htfr_vld      (fsmc_chregc3_htfr_vld     ),
  .fsmc_chregc3_tfr_vld       (fsmc_chregc3_tfr_vld      ),
  .fsmc_chregc3_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld ),
  .fsmc_chregc4_err_vld       (fsmc_chregc4_err_vld      ),
  .fsmc_chregc4_htfr_vld      (fsmc_chregc4_htfr_vld     ),
  .fsmc_chregc4_tfr_vld       (fsmc_chregc4_tfr_vld      ),
  .fsmc_chregc4_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld ),
  .fsmc_chregc5_err_vld       (fsmc_chregc5_err_vld      ),
  .fsmc_chregc5_htfr_vld      (fsmc_chregc5_htfr_vld     ),
  .fsmc_chregc5_tfr_vld       (fsmc_chregc5_tfr_vld      ),
  .fsmc_chregc5_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld ),
  .fsmc_chregc6_err_vld       (fsmc_chregc6_err_vld      ),
  .fsmc_chregc6_htfr_vld      (fsmc_chregc6_htfr_vld     ),
  .fsmc_chregc6_tfr_vld       (fsmc_chregc6_tfr_vld      ),
  .fsmc_chregc6_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld ),
  .fsmc_chregc7_err_vld       (fsmc_chregc7_err_vld      ),
  .fsmc_chregc7_htfr_vld      (fsmc_chregc7_htfr_vld     ),
  .fsmc_chregc7_tfr_vld       (fsmc_chregc7_tfr_vld      ),
  .fsmc_chregc7_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld ),
  .fsmc_chregc8_err_vld       (fsmc_chregc8_err_vld      ),
  .fsmc_chregc8_htfr_vld      (fsmc_chregc8_htfr_vld     ),
  .fsmc_chregc8_tfr_vld       (fsmc_chregc8_tfr_vld      ),
  .fsmc_chregc8_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld ),
  .fsmc_chregc9_err_vld       (fsmc_chregc9_err_vld      ),
  .fsmc_chregc9_htfr_vld      (fsmc_chregc9_htfr_vld     ),
  .fsmc_chregc9_tfr_vld       (fsmc_chregc9_tfr_vld      ),
  .fsmc_chregc9_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld ),
  .fsmc_chregc_pdvld_ch0      (fsmc_chregc_pdvld_ch0     ),
  .fsmc_chregc_pdvld_ch1      (fsmc_chregc_pdvld_ch1     ),
  .fsmc_chregc_pdvld_ch10     (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_pdvld_ch11     (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_pdvld_ch12     (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_pdvld_ch13     (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_pdvld_ch14     (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_pdvld_ch15     (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_pdvld_ch2      (fsmc_chregc_pdvld_ch2     ),
  .fsmc_chregc_pdvld_ch3      (fsmc_chregc_pdvld_ch3     ),
  .fsmc_chregc_pdvld_ch4      (fsmc_chregc_pdvld_ch4     ),
  .fsmc_chregc_pdvld_ch5      (fsmc_chregc_pdvld_ch5     ),
  .fsmc_chregc_pdvld_ch6      (fsmc_chregc_pdvld_ch6     ),
  .fsmc_chregc_pdvld_ch7      (fsmc_chregc_pdvld_ch7     ),
  .fsmc_chregc_pdvld_ch8      (fsmc_chregc_pdvld_ch8     ),
  .fsmc_chregc_pdvld_ch9      (fsmc_chregc_pdvld_ch9     ),
  .fsmc_regc_ch0en_clr        (fsmc_regc_ch0en_clr       ),
  .fsmc_regc_ch10en_clr       (fsmc_regc_ch10en_clr      ),
  .fsmc_regc_ch11en_clr       (fsmc_regc_ch11en_clr      ),
  .fsmc_regc_ch12en_clr       (fsmc_regc_ch12en_clr      ),
  .fsmc_regc_ch13en_clr       (fsmc_regc_ch13en_clr      ),
  .fsmc_regc_ch14en_clr       (fsmc_regc_ch14en_clr      ),
  .fsmc_regc_ch15en_clr       (fsmc_regc_ch15en_clr      ),
  .fsmc_regc_ch1en_clr        (fsmc_regc_ch1en_clr       ),
  .fsmc_regc_ch2en_clr        (fsmc_regc_ch2en_clr       ),
  .fsmc_regc_ch3en_clr        (fsmc_regc_ch3en_clr       ),
  .fsmc_regc_ch4en_clr        (fsmc_regc_ch4en_clr       ),
  .fsmc_regc_ch5en_clr        (fsmc_regc_ch5en_clr       ),
  .fsmc_regc_ch6en_clr        (fsmc_regc_ch6en_clr       ),
  .fsmc_regc_ch7en_clr        (fsmc_regc_ch7en_clr       ),
  .fsmc_regc_ch8en_clr        (fsmc_regc_ch8en_clr       ),
  .fsmc_regc_ch9en_clr        (fsmc_regc_ch9en_clr       ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_ch0_srcdtlgc     (regc_fsmc_ch0_srcdtlgc    ),
  .regc_fsmc_ch10_srcdtlgc    (regc_fsmc_ch10_srcdtlgc   ),
  .regc_fsmc_ch11_srcdtlgc    (regc_fsmc_ch11_srcdtlgc   ),
  .regc_fsmc_ch12_srcdtlgc    (regc_fsmc_ch12_srcdtlgc   ),
  .regc_fsmc_ch13_srcdtlgc    (regc_fsmc_ch13_srcdtlgc   ),
  .regc_fsmc_ch14_srcdtlgc    (regc_fsmc_ch14_srcdtlgc   ),
  .regc_fsmc_ch15_srcdtlgc    (regc_fsmc_ch15_srcdtlgc   ),
  .regc_fsmc_ch1_srcdtlgc     (regc_fsmc_ch1_srcdtlgc    ),
  .regc_fsmc_ch2_srcdtlgc     (regc_fsmc_ch2_srcdtlgc    ),
  .regc_fsmc_ch3_srcdtlgc     (regc_fsmc_ch3_srcdtlgc    ),
  .regc_fsmc_ch4_srcdtlgc     (regc_fsmc_ch4_srcdtlgc    ),
  .regc_fsmc_ch5_srcdtlgc     (regc_fsmc_ch5_srcdtlgc    ),
  .regc_fsmc_ch6_srcdtlgc     (regc_fsmc_ch6_srcdtlgc    ),
  .regc_fsmc_ch7_srcdtlgc     (regc_fsmc_ch7_srcdtlgc    ),
  .regc_fsmc_ch8_srcdtlgc     (regc_fsmc_ch8_srcdtlgc    ),
  .regc_fsmc_ch9_srcdtlgc     (regc_fsmc_ch9_srcdtlgc    ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata                   (s_hrdata                  ),
  .s_hready                   (s_hready                  ),
  .s_hresp                    (s_hresp                   ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
arb_ctrl  x_arb_ctrl (
  .arb_bmux_transvld  (arb_bmux_transvld ),
  .arb_bmux_trgvld    (arb_bmux_trgvld   ),
  .busy_chn_code      (busy_chn_code     ),
  .ch0c_gbc_chnen     (ch0c_gbc_chnen    ),
  .ch0c_gbc_sfwtrg    (ch0c_gbc_sfwtrg   ),
  .ch0c_gbc_trgclr    (ch0c_gbc_trgclr   ),
  .ch0chgen           (ch0chgen          ),
  .ch10c_gbc_chnen    (ch10c_gbc_chnen   ),
  .ch10c_gbc_sfwtrg   (ch10c_gbc_sfwtrg  ),
  .ch10c_gbc_trgclr   (ch10c_gbc_trgclr  ),
  .ch10chgen          (ch10chgen         ),
  .ch11c_gbc_chnen    (ch11c_gbc_chnen   ),
  .ch11c_gbc_sfwtrg   (ch11c_gbc_sfwtrg  ),
  .ch11c_gbc_trgclr   (ch11c_gbc_trgclr  ),
  .ch11chgen          (ch11chgen         ),
  .ch12c_gbc_chnen    (ch12c_gbc_chnen   ),
  .ch12c_gbc_sfwtrg   (ch12c_gbc_sfwtrg  ),
  .ch12c_gbc_trgclr   (ch12c_gbc_trgclr  ),
  .ch12chgen          (ch12chgen         ),
  .ch13c_gbc_chnen    (ch13c_gbc_chnen   ),
  .ch13c_gbc_sfwtrg   (ch13c_gbc_sfwtrg  ),
  .ch13c_gbc_trgclr   (ch13c_gbc_trgclr  ),
  .ch13chgen          (ch13chgen         ),
  .ch14c_gbc_chnen    (ch14c_gbc_chnen   ),
  .ch14c_gbc_sfwtrg   (ch14c_gbc_sfwtrg  ),
  .ch14c_gbc_trgclr   (ch14c_gbc_trgclr  ),
  .ch14chgen          (ch14chgen         ),
  .ch15c_gbc_chnen    (ch15c_gbc_chnen   ),
  .ch15c_gbc_sfwtrg   (ch15c_gbc_sfwtrg  ),
  .ch15c_gbc_trgclr   (ch15c_gbc_trgclr  ),
  .ch15chgen          (ch15chgen         ),
  .ch1c_gbc_chnen     (ch1c_gbc_chnen    ),
  .ch1c_gbc_sfwtrg    (ch1c_gbc_sfwtrg   ),
  .ch1c_gbc_trgclr    (ch1c_gbc_trgclr   ),
  .ch1chgen           (ch1chgen          ),
  .ch2c_gbc_chnen     (ch2c_gbc_chnen    ),
  .ch2c_gbc_sfwtrg    (ch2c_gbc_sfwtrg   ),
  .ch2c_gbc_trgclr    (ch2c_gbc_trgclr   ),
  .ch2chgen           (ch2chgen          ),
  .ch3c_gbc_chnen     (ch3c_gbc_chnen    ),
  .ch3c_gbc_sfwtrg    (ch3c_gbc_sfwtrg   ),
  .ch3c_gbc_trgclr    (ch3c_gbc_trgclr   ),
  .ch3chgen           (ch3chgen          ),
  .ch4c_gbc_chnen     (ch4c_gbc_chnen    ),
  .ch4c_gbc_sfwtrg    (ch4c_gbc_sfwtrg   ),
  .ch4c_gbc_trgclr    (ch4c_gbc_trgclr   ),
  .ch4chgen           (ch4chgen          ),
  .ch5c_gbc_chnen     (ch5c_gbc_chnen    ),
  .ch5c_gbc_sfwtrg    (ch5c_gbc_sfwtrg   ),
  .ch5c_gbc_trgclr    (ch5c_gbc_trgclr   ),
  .ch5chgen           (ch5chgen          ),
  .ch6c_gbc_chnen     (ch6c_gbc_chnen    ),
  .ch6c_gbc_sfwtrg    (ch6c_gbc_sfwtrg   ),
  .ch6c_gbc_trgclr    (ch6c_gbc_trgclr   ),
  .ch6chgen           (ch6chgen          ),
  .ch7c_gbc_chnen     (ch7c_gbc_chnen    ),
  .ch7c_gbc_sfwtrg    (ch7c_gbc_sfwtrg   ),
  .ch7c_gbc_trgclr    (ch7c_gbc_trgclr   ),
  .ch7chgen           (ch7chgen          ),
  .ch8c_gbc_chnen     (ch8c_gbc_chnen    ),
  .ch8c_gbc_sfwtrg    (ch8c_gbc_sfwtrg   ),
  .ch8c_gbc_trgclr    (ch8c_gbc_trgclr   ),
  .ch8chgen           (ch8chgen          ),
  .ch9c_gbc_chnen     (ch9c_gbc_chnen    ),
  .ch9c_gbc_sfwtrg    (ch9c_gbc_sfwtrg   ),
  .ch9c_gbc_trgclr    (ch9c_gbc_trgclr   ),
  .ch9chgen           (ch9chgen          ),
  .chreq0             (gbc_ch0c_reqvld   ),
  .chreq1             (gbc_ch1c_reqvld   ),
  .chreq10            (gbc_ch10c_reqvld  ),
  .chreq11            (gbc_ch11c_reqvld  ),
  .chreq12            (gbc_ch12c_reqvld  ),
  .chreq13            (gbc_ch13c_reqvld  ),
  .chreq14            (gbc_ch14c_reqvld  ),
  .chreq15            (gbc_ch15c_reqvld  ),
  .chreq2             (gbc_ch2c_reqvld   ),
  .chreq3             (gbc_ch3c_reqvld   ),
  .chreq4             (gbc_ch4c_reqvld   ),
  .chreq5             (gbc_ch5c_reqvld   ),
  .chreq6             (gbc_ch6c_reqvld   ),
  .chreq7             (gbc_ch7c_reqvld   ),
  .chreq8             (gbc_ch8c_reqvld   ),
  .chreq9             (gbc_ch9c_reqvld   ),
  .etb_dmacch0_trg    (etb_dmacch0_trg   ),
  .etb_dmacch10_trg   (etb_dmacch10_trg  ),
  .etb_dmacch11_trg   (etb_dmacch11_trg  ),
  .etb_dmacch12_trg   (etb_dmacch12_trg  ),
  .etb_dmacch13_trg   (etb_dmacch13_trg  ),
  .etb_dmacch14_trg   (etb_dmacch14_trg  ),
  .etb_dmacch15_trg   (etb_dmacch15_trg  ),
  .etb_dmacch1_trg    (etb_dmacch1_trg   ),
  .etb_dmacch2_trg    (etb_dmacch2_trg   ),
  .etb_dmacch3_trg    (etb_dmacch3_trg   ),
  .etb_dmacch4_trg    (etb_dmacch4_trg   ),
  .etb_dmacch5_trg    (etb_dmacch5_trg   ),
  .etb_dmacch6_trg    (etb_dmacch6_trg   ),
  .etb_dmacch7_trg    (etb_dmacch7_trg   ),
  .etb_dmacch8_trg    (etb_dmacch8_trg   ),
  .etb_dmacch9_trg    (etb_dmacch9_trg   ),
  .hclk               (hclk              ),
  .hpreq0             (gbc_ch0c_hpreqvld ),
  .hpreq1             (gbc_ch1c_hpreqvld ),
  .hpreq10            (gbc_ch10c_hpreqvld),
  .hpreq11            (gbc_ch11c_hpreqvld),
  .hpreq12            (gbc_ch12c_hpreqvld),
  .hpreq13            (gbc_ch13c_hpreqvld),
  .hpreq14            (gbc_ch14c_hpreqvld),
  .hpreq15            (gbc_ch15c_hpreqvld),
  .hpreq2             (gbc_ch2c_hpreqvld ),
  .hpreq3             (gbc_ch3c_hpreqvld ),
  .hpreq4             (gbc_ch4c_hpreqvld ),
  .hpreq5             (gbc_ch5c_hpreqvld ),
  .hpreq6             (gbc_ch6c_hpreqvld ),
  .hpreq7             (gbc_ch7c_hpreqvld ),
  .hpreq8             (gbc_ch8c_hpreqvld ),
  .hpreq9             (gbc_ch9c_hpreqvld ),
  .hrst_n             (hrst_n            )
);
ch_ctrl  x_chfsm_ctrl (
  .busy_chn_code              (busy_chn_code             ),
  .ch0_etb_evtdone            (ch0_etb_evtdone           ),
  .ch0_etb_htfrdone           (ch0_etb_htfrdone          ),
  .ch0_etb_tfrdone            (ch0_etb_tfrdone           ),
  .ch0c_gbc_chbsy             (ch0c_gbc_chbsy            ),
  .ch0c_gbc_chnen             (ch0c_gbc_chnen            ),
  .ch0c_gbc_trgclr            (ch0c_gbc_trgclr           ),
  .ch0chgen                   (ch0chgen                  ),
  .ch10_etb_evtdone           (ch10_etb_evtdone          ),
  .ch10_etb_htfrdone          (ch10_etb_htfrdone         ),
  .ch10_etb_tfrdone           (ch10_etb_tfrdone          ),
  .ch10c_gbc_chbsy            (ch10c_gbc_chbsy           ),
  .ch10c_gbc_chnen            (ch10c_gbc_chnen           ),
  .ch10c_gbc_trgclr           (ch10c_gbc_trgclr          ),
  .ch10chgen                  (ch10chgen                 ),
  .ch11_etb_evtdone           (ch11_etb_evtdone          ),
  .ch11_etb_htfrdone          (ch11_etb_htfrdone         ),
  .ch11_etb_tfrdone           (ch11_etb_tfrdone          ),
  .ch11c_gbc_chbsy            (ch11c_gbc_chbsy           ),
  .ch11c_gbc_chnen            (ch11c_gbc_chnen           ),
  .ch11c_gbc_trgclr           (ch11c_gbc_trgclr          ),
  .ch11chgen                  (ch11chgen                 ),
  .ch12_etb_evtdone           (ch12_etb_evtdone          ),
  .ch12_etb_htfrdone          (ch12_etb_htfrdone         ),
  .ch12_etb_tfrdone           (ch12_etb_tfrdone          ),
  .ch12c_gbc_chbsy            (ch12c_gbc_chbsy           ),
  .ch12c_gbc_chnen            (ch12c_gbc_chnen           ),
  .ch12c_gbc_trgclr           (ch12c_gbc_trgclr          ),
  .ch12chgen                  (ch12chgen                 ),
  .ch13_etb_evtdone           (ch13_etb_evtdone          ),
  .ch13_etb_htfrdone          (ch13_etb_htfrdone         ),
  .ch13_etb_tfrdone           (ch13_etb_tfrdone          ),
  .ch13c_gbc_chbsy            (ch13c_gbc_chbsy           ),
  .ch13c_gbc_chnen            (ch13c_gbc_chnen           ),
  .ch13c_gbc_trgclr           (ch13c_gbc_trgclr          ),
  .ch13chgen                  (ch13chgen                 ),
  .ch14_etb_evtdone           (ch14_etb_evtdone          ),
  .ch14_etb_htfrdone          (ch14_etb_htfrdone         ),
  .ch14_etb_tfrdone           (ch14_etb_tfrdone          ),
  .ch14c_gbc_chbsy            (ch14c_gbc_chbsy           ),
  .ch14c_gbc_chnen            (ch14c_gbc_chnen           ),
  .ch14c_gbc_trgclr           (ch14c_gbc_trgclr          ),
  .ch14chgen                  (ch14chgen                 ),
  .ch15_etb_evtdone           (ch15_etb_evtdone          ),
  .ch15_etb_htfrdone          (ch15_etb_htfrdone         ),
  .ch15_etb_tfrdone           (ch15_etb_tfrdone          ),
  .ch15c_gbc_chbsy            (ch15c_gbc_chbsy           ),
  .ch15c_gbc_chnen            (ch15c_gbc_chnen           ),
  .ch15c_gbc_trgclr           (ch15c_gbc_trgclr          ),
  .ch15chgen                  (ch15chgen                 ),
  .ch1_etb_evtdone            (ch1_etb_evtdone           ),
  .ch1_etb_htfrdone           (ch1_etb_htfrdone          ),
  .ch1_etb_tfrdone            (ch1_etb_tfrdone           ),
  .ch1c_gbc_chbsy             (ch1c_gbc_chbsy            ),
  .ch1c_gbc_chnen             (ch1c_gbc_chnen            ),
  .ch1c_gbc_trgclr            (ch1c_gbc_trgclr           ),
  .ch1chgen                   (ch1chgen                  ),
  .ch2_etb_evtdone            (ch2_etb_evtdone           ),
  .ch2_etb_htfrdone           (ch2_etb_htfrdone          ),
  .ch2_etb_tfrdone            (ch2_etb_tfrdone           ),
  .ch2c_gbc_chbsy             (ch2c_gbc_chbsy            ),
  .ch2c_gbc_chnen             (ch2c_gbc_chnen            ),
  .ch2c_gbc_trgclr            (ch2c_gbc_trgclr           ),
  .ch2chgen                   (ch2chgen                  ),
  .ch3_etb_evtdone            (ch3_etb_evtdone           ),
  .ch3_etb_htfrdone           (ch3_etb_htfrdone          ),
  .ch3_etb_tfrdone            (ch3_etb_tfrdone           ),
  .ch3c_gbc_chbsy             (ch3c_gbc_chbsy            ),
  .ch3c_gbc_chnen             (ch3c_gbc_chnen            ),
  .ch3c_gbc_trgclr            (ch3c_gbc_trgclr           ),
  .ch3chgen                   (ch3chgen                  ),
  .ch4_etb_evtdone            (ch4_etb_evtdone           ),
  .ch4_etb_htfrdone           (ch4_etb_htfrdone          ),
  .ch4_etb_tfrdone            (ch4_etb_tfrdone           ),
  .ch4c_gbc_chbsy             (ch4c_gbc_chbsy            ),
  .ch4c_gbc_chnen             (ch4c_gbc_chnen            ),
  .ch4c_gbc_trgclr            (ch4c_gbc_trgclr           ),
  .ch4chgen                   (ch4chgen                  ),
  .ch5_etb_evtdone            (ch5_etb_evtdone           ),
  .ch5_etb_htfrdone           (ch5_etb_htfrdone          ),
  .ch5_etb_tfrdone            (ch5_etb_tfrdone           ),
  .ch5c_gbc_chbsy             (ch5c_gbc_chbsy            ),
  .ch5c_gbc_chnen             (ch5c_gbc_chnen            ),
  .ch5c_gbc_trgclr            (ch5c_gbc_trgclr           ),
  .ch5chgen                   (ch5chgen                  ),
  .ch6_etb_evtdone            (ch6_etb_evtdone           ),
  .ch6_etb_htfrdone           (ch6_etb_htfrdone          ),
  .ch6_etb_tfrdone            (ch6_etb_tfrdone           ),
  .ch6c_gbc_chbsy             (ch6c_gbc_chbsy            ),
  .ch6c_gbc_chnen             (ch6c_gbc_chnen            ),
  .ch6c_gbc_trgclr            (ch6c_gbc_trgclr           ),
  .ch6chgen                   (ch6chgen                  ),
  .ch7_etb_evtdone            (ch7_etb_evtdone           ),
  .ch7_etb_htfrdone           (ch7_etb_htfrdone          ),
  .ch7_etb_tfrdone            (ch7_etb_tfrdone           ),
  .ch7c_gbc_chbsy             (ch7c_gbc_chbsy            ),
  .ch7c_gbc_chnen             (ch7c_gbc_chnen            ),
  .ch7c_gbc_trgclr            (ch7c_gbc_trgclr           ),
  .ch7chgen                   (ch7chgen                  ),
  .ch8_etb_evtdone            (ch8_etb_evtdone           ),
  .ch8_etb_htfrdone           (ch8_etb_htfrdone          ),
  .ch8_etb_tfrdone            (ch8_etb_tfrdone           ),
  .ch8c_gbc_chbsy             (ch8c_gbc_chbsy            ),
  .ch8c_gbc_chnen             (ch8c_gbc_chnen            ),
  .ch8c_gbc_trgclr            (ch8c_gbc_trgclr           ),
  .ch8chgen                   (ch8chgen                  ),
  .ch9_etb_evtdone            (ch9_etb_evtdone           ),
  .ch9_etb_htfrdone           (ch9_etb_htfrdone          ),
  .ch9_etb_tfrdone            (ch9_etb_tfrdone           ),
  .ch9c_gbc_chbsy             (ch9c_gbc_chbsy            ),
  .ch9c_gbc_chnen             (ch9c_gbc_chnen            ),
  .ch9c_gbc_trgclr            (ch9c_gbc_trgclr           ),
  .ch9chgen                   (ch9chgen                  ),
  .chregc0_fsmc_block_tl      (chregc0_fsmc_block_tl     ),
  .chregc0_fsmc_chintmdc      (chregc0_fsmc_chintmdc     ),
  .chregc0_fsmc_darn          (chregc0_fsmc_darn         ),
  .chregc0_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc    ),
  .chregc0_fsmc_dinc          (chregc0_fsmc_dinc         ),
  .chregc0_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width ),
  .chregc0_fsmc_endlan        (chregc0_fsmc_endlan       ),
  .chregc0_fsmc_group_len     (chregc0_fsmc_group_len    ),
  .chregc0_fsmc_grpmc         (chregc0_fsmc_grpmc        ),
  .chregc0_fsmc_protctl       (chregc0_fsmc_protctl      ),
  .chregc0_fsmc_sarn          (chregc0_fsmc_sarn         ),
  .chregc0_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc    ),
  .chregc0_fsmc_sinc          (chregc0_fsmc_sinc         ),
  .chregc0_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width ),
  .chregc0_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc      ),
  .chregc10_fsmc_block_tl     (chregc10_fsmc_block_tl    ),
  .chregc10_fsmc_chintmdc     (chregc10_fsmc_chintmdc    ),
  .chregc10_fsmc_darn         (chregc10_fsmc_darn        ),
  .chregc10_fsmc_dgrpaddrc    (chregc10_fsmc_dgrpaddrc   ),
  .chregc10_fsmc_dinc         (chregc10_fsmc_dinc        ),
  .chregc10_fsmc_dst_tr_width (chregc10_fsmc_dst_tr_width),
  .chregc10_fsmc_endlan       (chregc10_fsmc_endlan      ),
  .chregc10_fsmc_group_len    (chregc10_fsmc_group_len   ),
  .chregc10_fsmc_grpmc        (chregc10_fsmc_grpmc       ),
  .chregc10_fsmc_protctl      (chregc10_fsmc_protctl     ),
  .chregc10_fsmc_sarn         (chregc10_fsmc_sarn        ),
  .chregc10_fsmc_sgrpaddrc    (chregc10_fsmc_sgrpaddrc   ),
  .chregc10_fsmc_sinc         (chregc10_fsmc_sinc        ),
  .chregc10_fsmc_src_tr_width (chregc10_fsmc_src_tr_width),
  .chregc10_fsmc_trgtmdc      (chregc10_fsmc_trgtmdc     ),
  .chregc11_fsmc_block_tl     (chregc11_fsmc_block_tl    ),
  .chregc11_fsmc_chintmdc     (chregc11_fsmc_chintmdc    ),
  .chregc11_fsmc_darn         (chregc11_fsmc_darn        ),
  .chregc11_fsmc_dgrpaddrc    (chregc11_fsmc_dgrpaddrc   ),
  .chregc11_fsmc_dinc         (chregc11_fsmc_dinc        ),
  .chregc11_fsmc_dst_tr_width (chregc11_fsmc_dst_tr_width),
  .chregc11_fsmc_endlan       (chregc11_fsmc_endlan      ),
  .chregc11_fsmc_group_len    (chregc11_fsmc_group_len   ),
  .chregc11_fsmc_grpmc        (chregc11_fsmc_grpmc       ),
  .chregc11_fsmc_protctl      (chregc11_fsmc_protctl     ),
  .chregc11_fsmc_sarn         (chregc11_fsmc_sarn        ),
  .chregc11_fsmc_sgrpaddrc    (chregc11_fsmc_sgrpaddrc   ),
  .chregc11_fsmc_sinc         (chregc11_fsmc_sinc        ),
  .chregc11_fsmc_src_tr_width (chregc11_fsmc_src_tr_width),
  .chregc11_fsmc_trgtmdc      (chregc11_fsmc_trgtmdc     ),
  .chregc12_fsmc_block_tl     (chregc12_fsmc_block_tl    ),
  .chregc12_fsmc_chintmdc     (chregc12_fsmc_chintmdc    ),
  .chregc12_fsmc_darn         (chregc12_fsmc_darn        ),
  .chregc12_fsmc_dgrpaddrc    (chregc12_fsmc_dgrpaddrc   ),
  .chregc12_fsmc_dinc         (chregc12_fsmc_dinc        ),
  .chregc12_fsmc_dst_tr_width (chregc12_fsmc_dst_tr_width),
  .chregc12_fsmc_endlan       (chregc12_fsmc_endlan      ),
  .chregc12_fsmc_group_len    (chregc12_fsmc_group_len   ),
  .chregc12_fsmc_grpmc        (chregc12_fsmc_grpmc       ),
  .chregc12_fsmc_protctl      (chregc12_fsmc_protctl     ),
  .chregc12_fsmc_sarn         (chregc12_fsmc_sarn        ),
  .chregc12_fsmc_sgrpaddrc    (chregc12_fsmc_sgrpaddrc   ),
  .chregc12_fsmc_sinc         (chregc12_fsmc_sinc        ),
  .chregc12_fsmc_src_tr_width (chregc12_fsmc_src_tr_width),
  .chregc12_fsmc_trgtmdc      (chregc12_fsmc_trgtmdc     ),
  .chregc13_fsmc_block_tl     (chregc13_fsmc_block_tl    ),
  .chregc13_fsmc_chintmdc     (chregc13_fsmc_chintmdc    ),
  .chregc13_fsmc_darn         (chregc13_fsmc_darn        ),
  .chregc13_fsmc_dgrpaddrc    (chregc13_fsmc_dgrpaddrc   ),
  .chregc13_fsmc_dinc         (chregc13_fsmc_dinc        ),
  .chregc13_fsmc_dst_tr_width (chregc13_fsmc_dst_tr_width),
  .chregc13_fsmc_endlan       (chregc13_fsmc_endlan      ),
  .chregc13_fsmc_group_len    (chregc13_fsmc_group_len   ),
  .chregc13_fsmc_grpmc        (chregc13_fsmc_grpmc       ),
  .chregc13_fsmc_protctl      (chregc13_fsmc_protctl     ),
  .chregc13_fsmc_sarn         (chregc13_fsmc_sarn        ),
  .chregc13_fsmc_sgrpaddrc    (chregc13_fsmc_sgrpaddrc   ),
  .chregc13_fsmc_sinc         (chregc13_fsmc_sinc        ),
  .chregc13_fsmc_src_tr_width (chregc13_fsmc_src_tr_width),
  .chregc13_fsmc_trgtmdc      (chregc13_fsmc_trgtmdc     ),
  .chregc14_fsmc_block_tl     (chregc14_fsmc_block_tl    ),
  .chregc14_fsmc_chintmdc     (chregc14_fsmc_chintmdc    ),
  .chregc14_fsmc_darn         (chregc14_fsmc_darn        ),
  .chregc14_fsmc_dgrpaddrc    (chregc14_fsmc_dgrpaddrc   ),
  .chregc14_fsmc_dinc         (chregc14_fsmc_dinc        ),
  .chregc14_fsmc_dst_tr_width (chregc14_fsmc_dst_tr_width),
  .chregc14_fsmc_endlan       (chregc14_fsmc_endlan      ),
  .chregc14_fsmc_group_len    (chregc14_fsmc_group_len   ),
  .chregc14_fsmc_grpmc        (chregc14_fsmc_grpmc       ),
  .chregc14_fsmc_protctl      (chregc14_fsmc_protctl     ),
  .chregc14_fsmc_sarn         (chregc14_fsmc_sarn        ),
  .chregc14_fsmc_sgrpaddrc    (chregc14_fsmc_sgrpaddrc   ),
  .chregc14_fsmc_sinc         (chregc14_fsmc_sinc        ),
  .chregc14_fsmc_src_tr_width (chregc14_fsmc_src_tr_width),
  .chregc14_fsmc_trgtmdc      (chregc14_fsmc_trgtmdc     ),
  .chregc15_fsmc_block_tl     (chregc15_fsmc_block_tl    ),
  .chregc15_fsmc_chintmdc     (chregc15_fsmc_chintmdc    ),
  .chregc15_fsmc_darn         (chregc15_fsmc_darn        ),
  .chregc15_fsmc_dgrpaddrc    (chregc15_fsmc_dgrpaddrc   ),
  .chregc15_fsmc_dinc         (chregc15_fsmc_dinc        ),
  .chregc15_fsmc_dst_tr_width (chregc15_fsmc_dst_tr_width),
  .chregc15_fsmc_endlan       (chregc15_fsmc_endlan      ),
  .chregc15_fsmc_group_len    (chregc15_fsmc_group_len   ),
  .chregc15_fsmc_grpmc        (chregc15_fsmc_grpmc       ),
  .chregc15_fsmc_protctl      (chregc15_fsmc_protctl     ),
  .chregc15_fsmc_sarn         (chregc15_fsmc_sarn        ),
  .chregc15_fsmc_sgrpaddrc    (chregc15_fsmc_sgrpaddrc   ),
  .chregc15_fsmc_sinc         (chregc15_fsmc_sinc        ),
  .chregc15_fsmc_src_tr_width (chregc15_fsmc_src_tr_width),
  .chregc15_fsmc_trgtmdc      (chregc15_fsmc_trgtmdc     ),
  .chregc1_fsmc_block_tl      (chregc1_fsmc_block_tl     ),
  .chregc1_fsmc_chintmdc      (chregc1_fsmc_chintmdc     ),
  .chregc1_fsmc_darn          (chregc1_fsmc_darn         ),
  .chregc1_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc    ),
  .chregc1_fsmc_dinc          (chregc1_fsmc_dinc         ),
  .chregc1_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width ),
  .chregc1_fsmc_endlan        (chregc1_fsmc_endlan       ),
  .chregc1_fsmc_group_len     (chregc1_fsmc_group_len    ),
  .chregc1_fsmc_grpmc         (chregc1_fsmc_grpmc        ),
  .chregc1_fsmc_protctl       (chregc1_fsmc_protctl      ),
  .chregc1_fsmc_sarn          (chregc1_fsmc_sarn         ),
  .chregc1_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc    ),
  .chregc1_fsmc_sinc          (chregc1_fsmc_sinc         ),
  .chregc1_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width ),
  .chregc1_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc      ),
  .chregc2_fsmc_block_tl      (chregc2_fsmc_block_tl     ),
  .chregc2_fsmc_chintmdc      (chregc2_fsmc_chintmdc     ),
  .chregc2_fsmc_darn          (chregc2_fsmc_darn         ),
  .chregc2_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc    ),
  .chregc2_fsmc_dinc          (chregc2_fsmc_dinc         ),
  .chregc2_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width ),
  .chregc2_fsmc_endlan        (chregc2_fsmc_endlan       ),
  .chregc2_fsmc_group_len     (chregc2_fsmc_group_len    ),
  .chregc2_fsmc_grpmc         (chregc2_fsmc_grpmc        ),
  .chregc2_fsmc_protctl       (chregc2_fsmc_protctl      ),
  .chregc2_fsmc_sarn          (chregc2_fsmc_sarn         ),
  .chregc2_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc    ),
  .chregc2_fsmc_sinc          (chregc2_fsmc_sinc         ),
  .chregc2_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width ),
  .chregc2_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc      ),
  .chregc3_fsmc_block_tl      (chregc3_fsmc_block_tl     ),
  .chregc3_fsmc_chintmdc      (chregc3_fsmc_chintmdc     ),
  .chregc3_fsmc_darn          (chregc3_fsmc_darn         ),
  .chregc3_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc    ),
  .chregc3_fsmc_dinc          (chregc3_fsmc_dinc         ),
  .chregc3_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width ),
  .chregc3_fsmc_endlan        (chregc3_fsmc_endlan       ),
  .chregc3_fsmc_group_len     (chregc3_fsmc_group_len    ),
  .chregc3_fsmc_grpmc         (chregc3_fsmc_grpmc        ),
  .chregc3_fsmc_protctl       (chregc3_fsmc_protctl      ),
  .chregc3_fsmc_sarn          (chregc3_fsmc_sarn         ),
  .chregc3_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc    ),
  .chregc3_fsmc_sinc          (chregc3_fsmc_sinc         ),
  .chregc3_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width ),
  .chregc3_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc      ),
  .chregc4_fsmc_block_tl      (chregc4_fsmc_block_tl     ),
  .chregc4_fsmc_chintmdc      (chregc4_fsmc_chintmdc     ),
  .chregc4_fsmc_darn          (chregc4_fsmc_darn         ),
  .chregc4_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc    ),
  .chregc4_fsmc_dinc          (chregc4_fsmc_dinc         ),
  .chregc4_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width ),
  .chregc4_fsmc_endlan        (chregc4_fsmc_endlan       ),
  .chregc4_fsmc_group_len     (chregc4_fsmc_group_len    ),
  .chregc4_fsmc_grpmc         (chregc4_fsmc_grpmc        ),
  .chregc4_fsmc_protctl       (chregc4_fsmc_protctl      ),
  .chregc4_fsmc_sarn          (chregc4_fsmc_sarn         ),
  .chregc4_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc    ),
  .chregc4_fsmc_sinc          (chregc4_fsmc_sinc         ),
  .chregc4_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width ),
  .chregc4_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc      ),
  .chregc5_fsmc_block_tl      (chregc5_fsmc_block_tl     ),
  .chregc5_fsmc_chintmdc      (chregc5_fsmc_chintmdc     ),
  .chregc5_fsmc_darn          (chregc5_fsmc_darn         ),
  .chregc5_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc    ),
  .chregc5_fsmc_dinc          (chregc5_fsmc_dinc         ),
  .chregc5_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width ),
  .chregc5_fsmc_endlan        (chregc5_fsmc_endlan       ),
  .chregc5_fsmc_group_len     (chregc5_fsmc_group_len    ),
  .chregc5_fsmc_grpmc         (chregc5_fsmc_grpmc        ),
  .chregc5_fsmc_protctl       (chregc5_fsmc_protctl      ),
  .chregc5_fsmc_sarn          (chregc5_fsmc_sarn         ),
  .chregc5_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc    ),
  .chregc5_fsmc_sinc          (chregc5_fsmc_sinc         ),
  .chregc5_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width ),
  .chregc5_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc      ),
  .chregc6_fsmc_block_tl      (chregc6_fsmc_block_tl     ),
  .chregc6_fsmc_chintmdc      (chregc6_fsmc_chintmdc     ),
  .chregc6_fsmc_darn          (chregc6_fsmc_darn         ),
  .chregc6_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc    ),
  .chregc6_fsmc_dinc          (chregc6_fsmc_dinc         ),
  .chregc6_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width ),
  .chregc6_fsmc_endlan        (chregc6_fsmc_endlan       ),
  .chregc6_fsmc_group_len     (chregc6_fsmc_group_len    ),
  .chregc6_fsmc_grpmc         (chregc6_fsmc_grpmc        ),
  .chregc6_fsmc_protctl       (chregc6_fsmc_protctl      ),
  .chregc6_fsmc_sarn          (chregc6_fsmc_sarn         ),
  .chregc6_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc    ),
  .chregc6_fsmc_sinc          (chregc6_fsmc_sinc         ),
  .chregc6_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width ),
  .chregc6_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc      ),
  .chregc7_fsmc_block_tl      (chregc7_fsmc_block_tl     ),
  .chregc7_fsmc_chintmdc      (chregc7_fsmc_chintmdc     ),
  .chregc7_fsmc_darn          (chregc7_fsmc_darn         ),
  .chregc7_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc    ),
  .chregc7_fsmc_dinc          (chregc7_fsmc_dinc         ),
  .chregc7_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width ),
  .chregc7_fsmc_endlan        (chregc7_fsmc_endlan       ),
  .chregc7_fsmc_group_len     (chregc7_fsmc_group_len    ),
  .chregc7_fsmc_grpmc         (chregc7_fsmc_grpmc        ),
  .chregc7_fsmc_protctl       (chregc7_fsmc_protctl      ),
  .chregc7_fsmc_sarn          (chregc7_fsmc_sarn         ),
  .chregc7_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc    ),
  .chregc7_fsmc_sinc          (chregc7_fsmc_sinc         ),
  .chregc7_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width ),
  .chregc7_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc      ),
  .chregc8_fsmc_block_tl      (chregc8_fsmc_block_tl     ),
  .chregc8_fsmc_chintmdc      (chregc8_fsmc_chintmdc     ),
  .chregc8_fsmc_darn          (chregc8_fsmc_darn         ),
  .chregc8_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc    ),
  .chregc8_fsmc_dinc          (chregc8_fsmc_dinc         ),
  .chregc8_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width ),
  .chregc8_fsmc_endlan        (chregc8_fsmc_endlan       ),
  .chregc8_fsmc_group_len     (chregc8_fsmc_group_len    ),
  .chregc8_fsmc_grpmc         (chregc8_fsmc_grpmc        ),
  .chregc8_fsmc_protctl       (chregc8_fsmc_protctl      ),
  .chregc8_fsmc_sarn          (chregc8_fsmc_sarn         ),
  .chregc8_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc    ),
  .chregc8_fsmc_sinc          (chregc8_fsmc_sinc         ),
  .chregc8_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width ),
  .chregc8_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc      ),
  .chregc9_fsmc_block_tl      (chregc9_fsmc_block_tl     ),
  .chregc9_fsmc_chintmdc      (chregc9_fsmc_chintmdc     ),
  .chregc9_fsmc_darn          (chregc9_fsmc_darn         ),
  .chregc9_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc    ),
  .chregc9_fsmc_dinc          (chregc9_fsmc_dinc         ),
  .chregc9_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width ),
  .chregc9_fsmc_endlan        (chregc9_fsmc_endlan       ),
  .chregc9_fsmc_group_len     (chregc9_fsmc_group_len    ),
  .chregc9_fsmc_grpmc         (chregc9_fsmc_grpmc        ),
  .chregc9_fsmc_protctl       (chregc9_fsmc_protctl      ),
  .chregc9_fsmc_sarn          (chregc9_fsmc_sarn         ),
  .chregc9_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc    ),
  .chregc9_fsmc_sinc          (chregc9_fsmc_sinc         ),
  .chregc9_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width ),
  .chregc9_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc      ),
  .fsmc_chregc0_err_vld       (fsmc_chregc0_err_vld      ),
  .fsmc_chregc0_htfr_vld      (fsmc_chregc0_htfr_vld     ),
  .fsmc_chregc0_tfr_vld       (fsmc_chregc0_tfr_vld      ),
  .fsmc_chregc0_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld ),
  .fsmc_chregc10_err_vld      (fsmc_chregc10_err_vld     ),
  .fsmc_chregc10_htfr_vld     (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc10_tfr_vld      (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc10_trgetcmp_vld (fsmc_chregc10_trgetcmp_vld),
  .fsmc_chregc11_err_vld      (fsmc_chregc11_err_vld     ),
  .fsmc_chregc11_htfr_vld     (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc11_tfr_vld      (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc11_trgetcmp_vld (fsmc_chregc11_trgetcmp_vld),
  .fsmc_chregc12_err_vld      (fsmc_chregc12_err_vld     ),
  .fsmc_chregc12_htfr_vld     (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc12_tfr_vld      (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc12_trgetcmp_vld (fsmc_chregc12_trgetcmp_vld),
  .fsmc_chregc13_err_vld      (fsmc_chregc13_err_vld     ),
  .fsmc_chregc13_htfr_vld     (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc13_tfr_vld      (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc13_trgetcmp_vld (fsmc_chregc13_trgetcmp_vld),
  .fsmc_chregc14_err_vld      (fsmc_chregc14_err_vld     ),
  .fsmc_chregc14_htfr_vld     (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc14_tfr_vld      (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc14_trgetcmp_vld (fsmc_chregc14_trgetcmp_vld),
  .fsmc_chregc15_err_vld      (fsmc_chregc15_err_vld     ),
  .fsmc_chregc15_htfr_vld     (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc15_tfr_vld      (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc15_trgetcmp_vld (fsmc_chregc15_trgetcmp_vld),
  .fsmc_chregc1_err_vld       (fsmc_chregc1_err_vld      ),
  .fsmc_chregc1_htfr_vld      (fsmc_chregc1_htfr_vld     ),
  .fsmc_chregc1_tfr_vld       (fsmc_chregc1_tfr_vld      ),
  .fsmc_chregc1_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld ),
  .fsmc_chregc2_err_vld       (fsmc_chregc2_err_vld      ),
  .fsmc_chregc2_htfr_vld      (fsmc_chregc2_htfr_vld     ),
  .fsmc_chregc2_tfr_vld       (fsmc_chregc2_tfr_vld      ),
  .fsmc_chregc2_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld ),
  .fsmc_chregc3_err_vld       (fsmc_chregc3_err_vld      ),
  .fsmc_chregc3_htfr_vld      (fsmc_chregc3_htfr_vld     ),
  .fsmc_chregc3_tfr_vld       (fsmc_chregc3_tfr_vld      ),
  .fsmc_chregc3_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld ),
  .fsmc_chregc4_err_vld       (fsmc_chregc4_err_vld      ),
  .fsmc_chregc4_htfr_vld      (fsmc_chregc4_htfr_vld     ),
  .fsmc_chregc4_tfr_vld       (fsmc_chregc4_tfr_vld      ),
  .fsmc_chregc4_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld ),
  .fsmc_chregc5_err_vld       (fsmc_chregc5_err_vld      ),
  .fsmc_chregc5_htfr_vld      (fsmc_chregc5_htfr_vld     ),
  .fsmc_chregc5_tfr_vld       (fsmc_chregc5_tfr_vld      ),
  .fsmc_chregc5_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld ),
  .fsmc_chregc6_err_vld       (fsmc_chregc6_err_vld      ),
  .fsmc_chregc6_htfr_vld      (fsmc_chregc6_htfr_vld     ),
  .fsmc_chregc6_tfr_vld       (fsmc_chregc6_tfr_vld      ),
  .fsmc_chregc6_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld ),
  .fsmc_chregc7_err_vld       (fsmc_chregc7_err_vld      ),
  .fsmc_chregc7_htfr_vld      (fsmc_chregc7_htfr_vld     ),
  .fsmc_chregc7_tfr_vld       (fsmc_chregc7_tfr_vld      ),
  .fsmc_chregc7_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld ),
  .fsmc_chregc8_err_vld       (fsmc_chregc8_err_vld      ),
  .fsmc_chregc8_htfr_vld      (fsmc_chregc8_htfr_vld     ),
  .fsmc_chregc8_tfr_vld       (fsmc_chregc8_tfr_vld      ),
  .fsmc_chregc8_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld ),
  .fsmc_chregc9_err_vld       (fsmc_chregc9_err_vld      ),
  .fsmc_chregc9_htfr_vld      (fsmc_chregc9_htfr_vld     ),
  .fsmc_chregc9_tfr_vld       (fsmc_chregc9_tfr_vld      ),
  .fsmc_chregc9_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld ),
  .fsmc_chregc_pdvld_ch0      (fsmc_chregc_pdvld_ch0     ),
  .fsmc_chregc_pdvld_ch1      (fsmc_chregc_pdvld_ch1     ),
  .fsmc_chregc_pdvld_ch10     (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_pdvld_ch11     (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_pdvld_ch12     (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_pdvld_ch13     (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_pdvld_ch14     (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_pdvld_ch15     (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_pdvld_ch2      (fsmc_chregc_pdvld_ch2     ),
  .fsmc_chregc_pdvld_ch3      (fsmc_chregc_pdvld_ch3     ),
  .fsmc_chregc_pdvld_ch4      (fsmc_chregc_pdvld_ch4     ),
  .fsmc_chregc_pdvld_ch5      (fsmc_chregc_pdvld_ch5     ),
  .fsmc_chregc_pdvld_ch6      (fsmc_chregc_pdvld_ch6     ),
  .fsmc_chregc_pdvld_ch7      (fsmc_chregc_pdvld_ch7     ),
  .fsmc_chregc_pdvld_ch8      (fsmc_chregc_pdvld_ch8     ),
  .fsmc_chregc_pdvld_ch9      (fsmc_chregc_pdvld_ch9     ),
  .fsmc_regc_ch0en_clr        (fsmc_regc_ch0en_clr       ),
  .fsmc_regc_ch10en_clr       (fsmc_regc_ch10en_clr      ),
  .fsmc_regc_ch11en_clr       (fsmc_regc_ch11en_clr      ),
  .fsmc_regc_ch12en_clr       (fsmc_regc_ch12en_clr      ),
  .fsmc_regc_ch13en_clr       (fsmc_regc_ch13en_clr      ),
  .fsmc_regc_ch14en_clr       (fsmc_regc_ch14en_clr      ),
  .fsmc_regc_ch15en_clr       (fsmc_regc_ch15en_clr      ),
  .fsmc_regc_ch1en_clr        (fsmc_regc_ch1en_clr       ),
  .fsmc_regc_ch2en_clr        (fsmc_regc_ch2en_clr       ),
  .fsmc_regc_ch3en_clr        (fsmc_regc_ch3en_clr       ),
  .fsmc_regc_ch4en_clr        (fsmc_regc_ch4en_clr       ),
  .fsmc_regc_ch5en_clr        (fsmc_regc_ch5en_clr       ),
  .fsmc_regc_ch6en_clr        (fsmc_regc_ch6en_clr       ),
  .fsmc_regc_ch7en_clr        (fsmc_regc_ch7en_clr       ),
  .fsmc_regc_ch8en_clr        (fsmc_regc_ch8en_clr       ),
  .fsmc_regc_ch9en_clr        (fsmc_regc_ch9en_clr       ),
  .gbc_ch0c_hpreqvld          (gbc_ch0c_hpreqvld         ),
  .gbc_ch0c_reqvld            (gbc_ch0c_reqvld           ),
  .gbc_ch10c_hpreqvld         (gbc_ch10c_hpreqvld        ),
  .gbc_ch10c_reqvld           (gbc_ch10c_reqvld          ),
  .gbc_ch11c_hpreqvld         (gbc_ch11c_hpreqvld        ),
  .gbc_ch11c_reqvld           (gbc_ch11c_reqvld          ),
  .gbc_ch12c_hpreqvld         (gbc_ch12c_hpreqvld        ),
  .gbc_ch12c_reqvld           (gbc_ch12c_reqvld          ),
  .gbc_ch13c_hpreqvld         (gbc_ch13c_hpreqvld        ),
  .gbc_ch13c_reqvld           (gbc_ch13c_reqvld          ),
  .gbc_ch14c_hpreqvld         (gbc_ch14c_hpreqvld        ),
  .gbc_ch14c_reqvld           (gbc_ch14c_reqvld          ),
  .gbc_ch15c_hpreqvld         (gbc_ch15c_hpreqvld        ),
  .gbc_ch15c_reqvld           (gbc_ch15c_reqvld          ),
  .gbc_ch1c_hpreqvld          (gbc_ch1c_hpreqvld         ),
  .gbc_ch1c_reqvld            (gbc_ch1c_reqvld           ),
  .gbc_ch2c_hpreqvld          (gbc_ch2c_hpreqvld         ),
  .gbc_ch2c_reqvld            (gbc_ch2c_reqvld           ),
  .gbc_ch3c_hpreqvld          (gbc_ch3c_hpreqvld         ),
  .gbc_ch3c_reqvld            (gbc_ch3c_reqvld           ),
  .gbc_ch4c_hpreqvld          (gbc_ch4c_hpreqvld         ),
  .gbc_ch4c_reqvld            (gbc_ch4c_reqvld           ),
  .gbc_ch5c_hpreqvld          (gbc_ch5c_hpreqvld         ),
  .gbc_ch5c_reqvld            (gbc_ch5c_reqvld           ),
  .gbc_ch6c_hpreqvld          (gbc_ch6c_hpreqvld         ),
  .gbc_ch6c_reqvld            (gbc_ch6c_reqvld           ),
  .gbc_ch7c_hpreqvld          (gbc_ch7c_hpreqvld         ),
  .gbc_ch7c_reqvld            (gbc_ch7c_reqvld           ),
  .gbc_ch8c_hpreqvld          (gbc_ch8c_hpreqvld         ),
  .gbc_ch8c_reqvld            (gbc_ch8c_reqvld           ),
  .gbc_ch9c_hpreqvld          (gbc_ch9c_hpreqvld         ),
  .gbc_ch9c_reqvld            (gbc_ch9c_reqvld           ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .hclk                       (hclk                      ),
  .hready                     (hready                    ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_ch0                 (m_addr_ch0                ),
  .m_addr_ch1                 (m_addr_ch1                ),
  .m_addr_ch10                (m_addr_ch10               ),
  .m_addr_ch11                (m_addr_ch11               ),
  .m_addr_ch12                (m_addr_ch12               ),
  .m_addr_ch13                (m_addr_ch13               ),
  .m_addr_ch14                (m_addr_ch14               ),
  .m_addr_ch15                (m_addr_ch15               ),
  .m_addr_ch2                 (m_addr_ch2                ),
  .m_addr_ch3                 (m_addr_ch3                ),
  .m_addr_ch4                 (m_addr_ch4                ),
  .m_addr_ch5                 (m_addr_ch5                ),
  .m_addr_ch6                 (m_addr_ch6                ),
  .m_addr_ch7                 (m_addr_ch7                ),
  .m_addr_ch8                 (m_addr_ch8                ),
  .m_addr_ch9                 (m_addr_ch9                ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_ch0                (m_hsize_ch0               ),
  .m_hsize_ch1                (m_hsize_ch1               ),
  .m_hsize_ch10               (m_hsize_ch10              ),
  .m_hsize_ch11               (m_hsize_ch11              ),
  .m_hsize_ch12               (m_hsize_ch12              ),
  .m_hsize_ch13               (m_hsize_ch13              ),
  .m_hsize_ch14               (m_hsize_ch14              ),
  .m_hsize_ch15               (m_hsize_ch15              ),
  .m_hsize_ch2                (m_hsize_ch2               ),
  .m_hsize_ch3                (m_hsize_ch3               ),
  .m_hsize_ch4                (m_hsize_ch4               ),
  .m_hsize_ch5                (m_hsize_ch5               ),
  .m_hsize_ch6                (m_hsize_ch6               ),
  .m_hsize_ch7                (m_hsize_ch7               ),
  .m_hsize_ch8                (m_hsize_ch8               ),
  .m_hsize_ch9                (m_hsize_ch9               ),
  .m_hwdata_ch0               (m_hwdata_ch0              ),
  .m_hwdata_ch1               (m_hwdata_ch1              ),
  .m_hwdata_ch10              (m_hwdata_ch10             ),
  .m_hwdata_ch11              (m_hwdata_ch11             ),
  .m_hwdata_ch12              (m_hwdata_ch12             ),
  .m_hwdata_ch13              (m_hwdata_ch13             ),
  .m_hwdata_ch14              (m_hwdata_ch14             ),
  .m_hwdata_ch15              (m_hwdata_ch15             ),
  .m_hwdata_ch2               (m_hwdata_ch2              ),
  .m_hwdata_ch3               (m_hwdata_ch3              ),
  .m_hwdata_ch4               (m_hwdata_ch4              ),
  .m_hwdata_ch5               (m_hwdata_ch5              ),
  .m_hwdata_ch6               (m_hwdata_ch6              ),
  .m_hwdata_ch7               (m_hwdata_ch7              ),
  .m_hwdata_ch8               (m_hwdata_ch8              ),
  .m_hwdata_ch9               (m_hwdata_ch9              ),
  .m_hwrite_ch0               (m_hwrite_ch0              ),
  .m_hwrite_ch1               (m_hwrite_ch1              ),
  .m_hwrite_ch10              (m_hwrite_ch10             ),
  .m_hwrite_ch11              (m_hwrite_ch11             ),
  .m_hwrite_ch12              (m_hwrite_ch12             ),
  .m_hwrite_ch13              (m_hwrite_ch13             ),
  .m_hwrite_ch14              (m_hwrite_ch14             ),
  .m_hwrite_ch15              (m_hwrite_ch15             ),
  .m_hwrite_ch2               (m_hwrite_ch2              ),
  .m_hwrite_ch3               (m_hwrite_ch3              ),
  .m_hwrite_ch4               (m_hwrite_ch4              ),
  .m_hwrite_ch5               (m_hwrite_ch5              ),
  .m_hwrite_ch6               (m_hwrite_ch6              ),
  .m_hwrite_ch7               (m_hwrite_ch7              ),
  .m_hwrite_ch8               (m_hwrite_ch8              ),
  .m_hwrite_ch9               (m_hwrite_ch9              ),
  .m_prot_ch0                 (m_prot_ch0                ),
  .m_prot_ch1                 (m_prot_ch1                ),
  .m_prot_ch10                (m_prot_ch10               ),
  .m_prot_ch11                (m_prot_ch11               ),
  .m_prot_ch12                (m_prot_ch12               ),
  .m_prot_ch13                (m_prot_ch13               ),
  .m_prot_ch14                (m_prot_ch14               ),
  .m_prot_ch15                (m_prot_ch15               ),
  .m_prot_ch2                 (m_prot_ch2                ),
  .m_prot_ch3                 (m_prot_ch3                ),
  .m_prot_ch4                 (m_prot_ch4                ),
  .m_prot_ch5                 (m_prot_ch5                ),
  .m_prot_ch6                 (m_prot_ch6                ),
  .m_prot_ch7                 (m_prot_ch7                ),
  .m_prot_ch8                 (m_prot_ch8                ),
  .m_prot_ch9                 (m_prot_ch9                ),
  .regc_fsmc_ch0_srcdtlgc     (regc_fsmc_ch0_srcdtlgc    ),
  .regc_fsmc_ch10_srcdtlgc    (regc_fsmc_ch10_srcdtlgc   ),
  .regc_fsmc_ch11_srcdtlgc    (regc_fsmc_ch11_srcdtlgc   ),
  .regc_fsmc_ch12_srcdtlgc    (regc_fsmc_ch12_srcdtlgc   ),
  .regc_fsmc_ch13_srcdtlgc    (regc_fsmc_ch13_srcdtlgc   ),
  .regc_fsmc_ch14_srcdtlgc    (regc_fsmc_ch14_srcdtlgc   ),
  .regc_fsmc_ch15_srcdtlgc    (regc_fsmc_ch15_srcdtlgc   ),
  .regc_fsmc_ch1_srcdtlgc     (regc_fsmc_ch1_srcdtlgc    ),
  .regc_fsmc_ch2_srcdtlgc     (regc_fsmc_ch2_srcdtlgc    ),
  .regc_fsmc_ch3_srcdtlgc     (regc_fsmc_ch3_srcdtlgc    ),
  .regc_fsmc_ch4_srcdtlgc     (regc_fsmc_ch4_srcdtlgc    ),
  .regc_fsmc_ch5_srcdtlgc     (regc_fsmc_ch5_srcdtlgc    ),
  .regc_fsmc_ch6_srcdtlgc     (regc_fsmc_ch6_srcdtlgc    ),
  .regc_fsmc_ch7_srcdtlgc     (regc_fsmc_ch7_srcdtlgc    ),
  .regc_fsmc_ch8_srcdtlgc     (regc_fsmc_ch8_srcdtlgc    ),
  .regc_fsmc_ch9_srcdtlgc     (regc_fsmc_ch9_srcdtlgc    )
);
endmodule
