/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module gbregc(
  ch0c_gbc_chbsy,
  ch0c_gbc_pdvld,
  ch0regc_gbc_chiif,
  ch10c_gbc_chbsy,
  ch10c_gbc_pdvld,
  ch10regc_gbc_chiif,
  ch11c_gbc_chbsy,
  ch11c_gbc_pdvld,
  ch11regc_gbc_chiif,
  ch12c_gbc_chbsy,
  ch12c_gbc_pdvld,
  ch12regc_gbc_chiif,
  ch13c_gbc_chbsy,
  ch13c_gbc_pdvld,
  ch13regc_gbc_chiif,
  ch14c_gbc_chbsy,
  ch14c_gbc_pdvld,
  ch14regc_gbc_chiif,
  ch15c_gbc_chbsy,
  ch15c_gbc_pdvld,
  ch15regc_gbc_chiif,
  ch1c_gbc_chbsy,
  ch1c_gbc_pdvld,
  ch1regc_gbc_chiif,
  ch2c_gbc_chbsy,
  ch2c_gbc_pdvld,
  ch2regc_gbc_chiif,
  ch3c_gbc_chbsy,
  ch3c_gbc_pdvld,
  ch3regc_gbc_chiif,
  ch4c_gbc_chbsy,
  ch4c_gbc_pdvld,
  ch4regc_gbc_chiif,
  ch5c_gbc_chbsy,
  ch5c_gbc_pdvld,
  ch5regc_gbc_chiif,
  ch6c_gbc_chbsy,
  ch6c_gbc_pdvld,
  ch6regc_gbc_chiif,
  ch7c_gbc_chbsy,
  ch7c_gbc_pdvld,
  ch7regc_gbc_chiif,
  ch8c_gbc_chbsy,
  ch8c_gbc_pdvld,
  ch8regc_gbc_chiif,
  ch9c_gbc_chbsy,
  ch9c_gbc_pdvld,
  ch9regc_gbc_chiif,
  dmac_vic_if,
  gbc_chnc_dmacen,
  hclk,
  hrst_n,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hready,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           ch0c_gbc_chbsy;    
input           ch0c_gbc_pdvld;    
input           ch0regc_gbc_chiif; 
input           ch10c_gbc_chbsy;   
input           ch10c_gbc_pdvld;   
input           ch10regc_gbc_chiif; 
input           ch11c_gbc_chbsy;   
input           ch11c_gbc_pdvld;   
input           ch11regc_gbc_chiif; 
input           ch12c_gbc_chbsy;   
input           ch12c_gbc_pdvld;   
input           ch12regc_gbc_chiif; 
input           ch13c_gbc_chbsy;   
input           ch13c_gbc_pdvld;   
input           ch13regc_gbc_chiif; 
input           ch14c_gbc_chbsy;   
input           ch14c_gbc_pdvld;   
input           ch14regc_gbc_chiif; 
input           ch15c_gbc_chbsy;   
input           ch15c_gbc_pdvld;   
input           ch15regc_gbc_chiif; 
input           ch1c_gbc_chbsy;    
input           ch1c_gbc_pdvld;    
input           ch1regc_gbc_chiif; 
input           ch2c_gbc_chbsy;    
input           ch2c_gbc_pdvld;    
input           ch2regc_gbc_chiif; 
input           ch3c_gbc_chbsy;    
input           ch3c_gbc_pdvld;    
input           ch3regc_gbc_chiif; 
input           ch4c_gbc_chbsy;    
input           ch4c_gbc_pdvld;    
input           ch4regc_gbc_chiif; 
input           ch5c_gbc_chbsy;    
input           ch5c_gbc_pdvld;    
input           ch5regc_gbc_chiif; 
input           ch6c_gbc_chbsy;    
input           ch6c_gbc_pdvld;    
input           ch6regc_gbc_chiif; 
input           ch7c_gbc_chbsy;    
input           ch7c_gbc_pdvld;    
input           ch7regc_gbc_chiif; 
input           ch8c_gbc_chbsy;    
input           ch8c_gbc_pdvld;    
input           ch8regc_gbc_chiif; 
input           ch9c_gbc_chbsy;    
input           ch9c_gbc_pdvld;    
input           ch9regc_gbc_chiif; 
input           hclk;              
input           hrst_n;            
input   [31:0]  s_haddr;           
input   [3 :0]  s_hprot;           
input           s_hsel;            
input   [1 :0]  s_htrans;          
input   [31:0]  s_hwdata;          
input           s_hwrite;          
output          dmac_vic_if;       
output          gbc_chnc_dmacen;   
output  [31:0]  s_hrdata_chn;      
output          s_hready;          
reg             chpendifr_re;      
reg             chsr_re;           
reg             dmaccfg_re;        
reg             dmaccfg_we;        
reg             dmacen;            
wire            a_nonseq;          
wire            a_seq;             
wire            ch0c_gbc_chbsy;    
wire            ch0c_gbc_pdvld;    
wire            ch0intf;           
wire            ch0regc_gbc_chiif; 
wire            ch10c_gbc_chbsy;   
wire            ch10c_gbc_pdvld;   
wire            ch10intf;          
wire            ch10regc_gbc_chiif; 
wire            ch11c_gbc_chbsy;   
wire            ch11c_gbc_pdvld;   
wire            ch11intf;          
wire            ch11regc_gbc_chiif; 
wire            ch12c_gbc_chbsy;   
wire            ch12c_gbc_pdvld;   
wire            ch12intf;          
wire            ch12regc_gbc_chiif; 
wire            ch13c_gbc_chbsy;   
wire            ch13c_gbc_pdvld;   
wire            ch13intf;          
wire            ch13regc_gbc_chiif; 
wire            ch14c_gbc_chbsy;   
wire            ch14c_gbc_pdvld;   
wire            ch14intf;          
wire            ch14regc_gbc_chiif; 
wire            ch15c_gbc_chbsy;   
wire            ch15c_gbc_pdvld;   
wire            ch15intf;          
wire            ch15regc_gbc_chiif; 
wire            ch1c_gbc_chbsy;    
wire            ch1c_gbc_pdvld;    
wire            ch1intf;           
wire            ch1regc_gbc_chiif; 
wire            ch2c_gbc_chbsy;    
wire            ch2c_gbc_pdvld;    
wire            ch2intf;           
wire            ch2regc_gbc_chiif; 
wire            ch3c_gbc_chbsy;    
wire            ch3c_gbc_pdvld;    
wire            ch3intf;           
wire            ch3regc_gbc_chiif; 
wire            ch4c_gbc_chbsy;    
wire            ch4c_gbc_pdvld;    
wire            ch4intf;           
wire            ch4regc_gbc_chiif; 
wire            ch5c_gbc_chbsy;    
wire            ch5c_gbc_pdvld;    
wire            ch5intf;           
wire            ch5regc_gbc_chiif; 
wire            ch6c_gbc_chbsy;    
wire            ch6c_gbc_pdvld;    
wire            ch6intf;           
wire            ch6regc_gbc_chiif; 
wire            ch7c_gbc_chbsy;    
wire            ch7c_gbc_pdvld;    
wire            ch7intf;           
wire            ch7regc_gbc_chiif; 
wire            ch8c_gbc_chbsy;    
wire            ch8c_gbc_pdvld;    
wire            ch8intf;           
wire            ch8regc_gbc_chiif; 
wire            ch9c_gbc_chbsy;    
wire            ch9c_gbc_pdvld;    
wire            ch9intf;           
wire            ch9regc_gbc_chiif; 
wire            chpendifr_re_nxt;  
wire    [31:0]  chppendifr_r;      
wire    [31:0]  chsr_r;            
wire            chsr_re_nxt;       
wire            dmac_vic_if;       
wire    [31:0]  dmaccfg_r;         
wire            dmaccfg_re_nxt;    
wire            dmaccfg_we_nxt;    
wire            gbc_chnc_dmacen;   
wire            hclk;              
wire            hrst_n;            
wire            reg_burst;         
wire    [31:0]  s_haddr;           
wire    [3 :0]  s_hprot;           
wire    [31:0]  s_hrdata_chn;      
wire            s_hready;          
wire            s_hsel;            
wire    [1 :0]  s_htrans;          
wire    [31:0]  s_hwdata;          
wire            s_hwrite;          
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     GLB_BAS_ADR      =   10'h330  ;
parameter     CHPENDIFR_ADR                =   GLB_BAS_ADR + 10'h00  ; 
parameter     CHSR_ADR                     =   GLB_BAS_ADR + 10'h08  ; 
parameter     DMACCFG_ADR                  =   GLB_BAS_ADR + 10'h0C  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ)   ;
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign s_hready     = 1'b1 ;
    assign  chpendifr_re_nxt = (s_haddr[9:0] == CHPENDIFR_ADR) & (~s_hwrite) & reg_burst  ;
    always@(posedge  hclk or negedge hrst_n)   
    begin    
        if(~hrst_n)     begin  
             chpendifr_re <= 1'b0 ;
        end
        else    begin  
             chpendifr_re <= chpendifr_re_nxt ;
        end
    end
assign     chppendifr_r[31:0]  = {16'h0,ch15c_gbc_pdvld,ch14c_gbc_pdvld,ch13c_gbc_pdvld,ch12c_gbc_pdvld,ch11c_gbc_pdvld,ch10c_gbc_pdvld,
                                        ch9c_gbc_pdvld,ch8c_gbc_pdvld,ch7c_gbc_pdvld,ch6c_gbc_pdvld,ch5c_gbc_pdvld,ch4c_gbc_pdvld,
                                        ch3c_gbc_pdvld,ch2c_gbc_pdvld,ch1c_gbc_pdvld,ch0c_gbc_pdvld};
assign  chsr_re_nxt = (s_haddr[9:0] == CHSR_ADR) & (~s_hwrite) & reg_burst  ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chsr_re<= 1'b0 ;
    end
    else    begin   
         chsr_re <= chsr_re_nxt ;
    end
end
assign   chsr_r[31:0] = {16'h0 , ch15c_gbc_chbsy ,  ch14c_gbc_chbsy ,  ch13c_gbc_chbsy ,  ch12c_gbc_chbsy ,  ch11c_gbc_chbsy , 
                        ch10c_gbc_chbsy ,  ch9c_gbc_chbsy ,  ch8c_gbc_chbsy ,  ch7c_gbc_chbsy ,  ch6c_gbc_chbsy ,  ch5c_gbc_chbsy , 
                        ch4c_gbc_chbsy ,  ch3c_gbc_chbsy ,  ch2c_gbc_chbsy ,  ch1c_gbc_chbsy ,  ch0c_gbc_chbsy } ;
assign  dmaccfg_re_nxt = (s_haddr[9:0] == DMACCFG_ADR) & (~s_hwrite) & reg_burst ;
assign  dmaccfg_we_nxt = (s_haddr[9:0] == DMACCFG_ADR) & ( s_hwrite) & reg_burst ;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin    
         dmaccfg_re <= 1'b0 ;
         dmaccfg_we <= 1'b0 ;
    end
    else    begin  
         dmaccfg_re <= dmaccfg_re_nxt ;
         dmaccfg_we <= dmaccfg_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin    
        dmacen <= 1'b0 ;
    end
    else   if(dmaccfg_we)
        dmacen <= s_hwdata[0] ;
end
assign   dmaccfg_r[31:0] = {31'h0 , dmacen } ; 
assign   gbc_chnc_dmacen = dmacen ;
assign   s_hrdata_chn[31:0] =  
                               chpendifr_re ?  chppendifr_r[31:0] :  
                               chsr_re      ?  chsr_r[31:0]       : 
                               dmaccfg_re   ?  dmaccfg_r[31:0]    : 32'h0 ;
assign   ch15intf = ch15regc_gbc_chiif ;  
assign   ch14intf = ch14regc_gbc_chiif ;  
assign   ch13intf = ch13regc_gbc_chiif ;  
assign   ch12intf = ch12regc_gbc_chiif ;  
assign   ch11intf = ch11regc_gbc_chiif ;  
assign   ch10intf = ch10regc_gbc_chiif ;  
assign   ch9intf  = ch9regc_gbc_chiif  ;  
assign   ch8intf  = ch8regc_gbc_chiif  ;  
assign   ch7intf  = ch7regc_gbc_chiif  ;  
assign   ch6intf  = ch6regc_gbc_chiif  ;   
assign   ch5intf  = ch5regc_gbc_chiif  ;   
assign   ch4intf  = ch4regc_gbc_chiif  ;   
assign   ch3intf  = ch3regc_gbc_chiif  ;    
assign   ch2intf  = ch2regc_gbc_chiif  ;   
assign   ch1intf  = ch1regc_gbc_chiif  ;   
assign   ch0intf  = ch0regc_gbc_chiif  ;    
assign   dmac_vic_if = ch0intf | ch2intf | ch4intf | ch6intf | ch8intf | ch10intf | ch12intf | ch14intf | 
                       ch1intf | ch3intf | ch5intf | ch7intf | ch9intf | ch11intf | ch13intf | ch15intf      ;
endmodule
