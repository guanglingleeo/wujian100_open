/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module bmux_ctrl(
  arb_bmux_transvld,
  arb_bmux_trgvld,
  busy_chn_code,
  gbc_chnc_dmacen,
  hclk,
  hready,
  hrst_n,
  m_addr_ch0,
  m_addr_ch1,
  m_addr_ch10,
  m_addr_ch11,
  m_addr_ch12,
  m_addr_ch13,
  m_addr_ch14,
  m_addr_ch15,
  m_addr_ch2,
  m_addr_ch3,
  m_addr_ch4,
  m_addr_ch5,
  m_addr_ch6,
  m_addr_ch7,
  m_addr_ch8,
  m_addr_ch9,
  m_haddr,
  m_hburst,
  m_hbusreq,
  m_hgrant,
  m_hlock,
  m_hprot,
  m_hready,
  m_hsize,
  m_hsize_ch0,
  m_hsize_ch1,
  m_hsize_ch10,
  m_hsize_ch11,
  m_hsize_ch12,
  m_hsize_ch13,
  m_hsize_ch14,
  m_hsize_ch15,
  m_hsize_ch2,
  m_hsize_ch3,
  m_hsize_ch4,
  m_hsize_ch5,
  m_hsize_ch6,
  m_hsize_ch7,
  m_hsize_ch8,
  m_hsize_ch9,
  m_htrans,
  m_hwdata,
  m_hwdata_ch0,
  m_hwdata_ch1,
  m_hwdata_ch10,
  m_hwdata_ch11,
  m_hwdata_ch12,
  m_hwdata_ch13,
  m_hwdata_ch14,
  m_hwdata_ch15,
  m_hwdata_ch2,
  m_hwdata_ch3,
  m_hwdata_ch4,
  m_hwdata_ch5,
  m_hwdata_ch6,
  m_hwdata_ch7,
  m_hwdata_ch8,
  m_hwdata_ch9,
  m_hwrite,
  m_hwrite_ch0,
  m_hwrite_ch1,
  m_hwrite_ch10,
  m_hwrite_ch11,
  m_hwrite_ch12,
  m_hwrite_ch13,
  m_hwrite_ch14,
  m_hwrite_ch15,
  m_hwrite_ch2,
  m_hwrite_ch3,
  m_hwrite_ch4,
  m_hwrite_ch5,
  m_hwrite_ch6,
  m_hwrite_ch7,
  m_hwrite_ch8,
  m_hwrite_ch9,
  m_prot_ch0,
  m_prot_ch1,
  m_prot_ch10,
  m_prot_ch11,
  m_prot_ch12,
  m_prot_ch13,
  m_prot_ch14,
  m_prot_ch15,
  m_prot_ch2,
  m_prot_ch3,
  m_prot_ch4,
  m_prot_ch5,
  m_prot_ch6,
  m_prot_ch7,
  m_prot_ch8,
  m_prot_ch9
);
input           arb_bmux_transvld; 
input           arb_bmux_trgvld;  
input   [15:0]  busy_chn_code;    
input           gbc_chnc_dmacen;  
input           hclk;             
input           hrst_n;           
input   [31:0]  m_addr_ch0;       
input   [31:0]  m_addr_ch1;       
input   [31:0]  m_addr_ch10;      
input   [31:0]  m_addr_ch11;      
input   [31:0]  m_addr_ch12;      
input   [31:0]  m_addr_ch13;      
input   [31:0]  m_addr_ch14;      
input   [31:0]  m_addr_ch15;      
input   [31:0]  m_addr_ch2;       
input   [31:0]  m_addr_ch3;       
input   [31:0]  m_addr_ch4;       
input   [31:0]  m_addr_ch5;       
input   [31:0]  m_addr_ch6;       
input   [31:0]  m_addr_ch7;       
input   [31:0]  m_addr_ch8;       
input   [31:0]  m_addr_ch9;       
input           m_hgrant;         
input           m_hready;         
input   [2 :0]  m_hsize_ch0;      
input   [2 :0]  m_hsize_ch1;      
input   [2 :0]  m_hsize_ch10;     
input   [2 :0]  m_hsize_ch11;     
input   [2 :0]  m_hsize_ch12;     
input   [2 :0]  m_hsize_ch13;     
input   [2 :0]  m_hsize_ch14;     
input   [2 :0]  m_hsize_ch15;     
input   [2 :0]  m_hsize_ch2;      
input   [2 :0]  m_hsize_ch3;      
input   [2 :0]  m_hsize_ch4;      
input   [2 :0]  m_hsize_ch5;      
input   [2 :0]  m_hsize_ch6;      
input   [2 :0]  m_hsize_ch7;      
input   [2 :0]  m_hsize_ch8;      
input   [2 :0]  m_hsize_ch9;      
input   [31:0]  m_hwdata_ch0;     
input   [31:0]  m_hwdata_ch1;     
input   [31:0]  m_hwdata_ch10;    
input   [31:0]  m_hwdata_ch11;    
input   [31:0]  m_hwdata_ch12;    
input   [31:0]  m_hwdata_ch13;    
input   [31:0]  m_hwdata_ch14;    
input   [31:0]  m_hwdata_ch15;    
input   [31:0]  m_hwdata_ch2;     
input   [31:0]  m_hwdata_ch3;     
input   [31:0]  m_hwdata_ch4;     
input   [31:0]  m_hwdata_ch5;     
input   [31:0]  m_hwdata_ch6;     
input   [31:0]  m_hwdata_ch7;     
input   [31:0]  m_hwdata_ch8;     
input   [31:0]  m_hwdata_ch9;     
input           m_hwrite_ch0;     
input           m_hwrite_ch1;     
input           m_hwrite_ch10;    
input           m_hwrite_ch11;    
input           m_hwrite_ch12;    
input           m_hwrite_ch13;    
input           m_hwrite_ch14;    
input           m_hwrite_ch15;    
input           m_hwrite_ch2;     
input           m_hwrite_ch3;     
input           m_hwrite_ch4;     
input           m_hwrite_ch5;     
input           m_hwrite_ch6;     
input           m_hwrite_ch7;     
input           m_hwrite_ch8;     
input           m_hwrite_ch9;     
input   [3 :0]  m_prot_ch0;       
input   [3 :0]  m_prot_ch1;       
input   [3 :0]  m_prot_ch10;      
input   [3 :0]  m_prot_ch11;      
input   [3 :0]  m_prot_ch12;      
input   [3 :0]  m_prot_ch13;      
input   [3 :0]  m_prot_ch14;      
input   [3 :0]  m_prot_ch15;      
input   [3 :0]  m_prot_ch2;       
input   [3 :0]  m_prot_ch3;       
input   [3 :0]  m_prot_ch4;       
input   [3 :0]  m_prot_ch5;       
input   [3 :0]  m_prot_ch6;       
input   [3 :0]  m_prot_ch7;       
input   [3 :0]  m_prot_ch8;       
input   [3 :0]  m_prot_ch9;       
output          hready;           
output  [31:0]  m_haddr;          
output  [2 :0]  m_hburst;         
output          m_hbusreq;        
output          m_hlock;          
output  [3 :0]  m_hprot;          
output  [2 :0]  m_hsize;          
output  [1 :0]  m_htrans;         
output  [31:0]  m_hwdata;         
output          m_hwrite;         
reg     [15:0]  data_chnl_cd;     
reg     [31:0]  m_haddr;          
reg             m_hbusreq;        
reg             m_hgrant_d1;      
reg     [3 :0]  m_hprot;          
reg     [2 :0]  m_hsize;          
reg     [31:0]  m_hwdata;         
reg             m_hwrite_i;       
wire            arb_bmux_transvld; 
wire            arb_bmux_trgvld;  
wire            bus_grant_det;    
wire    [15:0]  busy_chn_code;    
wire    [15:0]  data_chnl_cd_nxt; 
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
wire    [2 :0]  m_hburst;         
wire            m_hgrant;         
wire            m_hlock;          
wire            m_hready;         
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
always @(*) begin
    case(data_chnl_cd)  // synopsys parallel_case
        16'h0001: m_hwdata[31:0] = m_hwdata_ch0[31:0];
        16'h0002: m_hwdata[31:0] = m_hwdata_ch1[31:0];
        16'h0004: m_hwdata[31:0] = m_hwdata_ch2[31:0];
        16'h0008: m_hwdata[31:0] = m_hwdata_ch3[31:0];
        16'h0010: m_hwdata[31:0] = m_hwdata_ch4[31:0];
        16'h0020: m_hwdata[31:0] = m_hwdata_ch5[31:0];
        16'h0040: m_hwdata[31:0] = m_hwdata_ch6[31:0];
        16'h0080: m_hwdata[31:0] = m_hwdata_ch7[31:0];
        16'h0100: m_hwdata[31:0] = m_hwdata_ch8[31:0];
        16'h0200: m_hwdata[31:0] = m_hwdata_ch9[31:0];
        16'h0400: m_hwdata[31:0] = m_hwdata_ch10[31:0];
        16'h0800: m_hwdata[31:0] = m_hwdata_ch11[31:0];
        16'h1000: m_hwdata[31:0] = m_hwdata_ch12[31:0];
        16'h2000: m_hwdata[31:0] = m_hwdata_ch13[31:0];
        16'h4000: m_hwdata[31:0] = m_hwdata_ch14[31:0];
        16'h8000: m_hwdata[31:0] = m_hwdata_ch15[31:0];
        default : m_hwdata[31:0] = 32'hxxxxxxxx;
    endcase
end
assign  data_chnl_cd_nxt[15:0] = hready ? busy_chn_code[15:0] : data_chnl_cd[15:0] ; 
always@(posedge  hclk or negedge hrst_n)   
begin 
    if(~hrst_n)     begin 
        //data_chnl_cd[3:0] <= 4'b00 ; 
        data_chnl_cd[15:0] <= 16'h0 ; 
    end 
    else    begin 
        data_chnl_cd[15:0] <= data_chnl_cd_nxt[15:0] ;
    end 
end  
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hprot[3:0] = m_prot_ch0[3:0];
        16'h0002: m_hprot[3:0] = m_prot_ch1[3:0];
        16'h0004: m_hprot[3:0] = m_prot_ch2[3:0];
        16'h0008: m_hprot[3:0] = m_prot_ch3[3:0];
        16'h0010: m_hprot[3:0] = m_prot_ch4[3:0];
        16'h0020: m_hprot[3:0] = m_prot_ch5[3:0];
        16'h0040: m_hprot[3:0] = m_prot_ch6[3:0];
        16'h0080: m_hprot[3:0] = m_prot_ch7[3:0];
        16'h0100: m_hprot[3:0] = m_prot_ch8[3:0];
        16'h0200: m_hprot[3:0] = m_prot_ch9[3:0];
        16'h0400: m_hprot[3:0] = m_prot_ch10[3:0];
        16'h0800: m_hprot[3:0] = m_prot_ch11[3:0];
        16'h1000: m_hprot[3:0] = m_prot_ch12[3:0];
        16'h2000: m_hprot[3:0] = m_prot_ch13[3:0];
        16'h4000: m_hprot[3:0] = m_prot_ch14[3:0];
        16'h8000: m_hprot[3:0] = m_prot_ch15[3:0];
        default : m_hprot[3:0] = 4'hx;
    endcase
end
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hsize[2:0] = m_hsize_ch0[2:0];
        16'h0002: m_hsize[2:0] = m_hsize_ch1[2:0];
        16'h0004: m_hsize[2:0] = m_hsize_ch2[2:0];
        16'h0008: m_hsize[2:0] = m_hsize_ch3[2:0];
        16'h0010: m_hsize[2:0] = m_hsize_ch4[2:0];
        16'h0020: m_hsize[2:0] = m_hsize_ch5[2:0];
        16'h0040: m_hsize[2:0] = m_hsize_ch6[2:0];
        16'h0080: m_hsize[2:0] = m_hsize_ch7[2:0];
        16'h0100: m_hsize[2:0] = m_hsize_ch8[2:0];
        16'h0200: m_hsize[2:0] = m_hsize_ch9[2:0];
        16'h0400: m_hsize[2:0] = m_hsize_ch10[2:0];
        16'h0800: m_hsize[2:0] = m_hsize_ch11[2:0];
        16'h1000: m_hsize[2:0] = m_hsize_ch12[2:0];
        16'h2000: m_hsize[2:0] = m_hsize_ch13[2:0];
        16'h4000: m_hsize[2:0] = m_hsize_ch14[2:0];
        16'h8000: m_hsize[2:0] = m_hsize_ch15[2:0];
        default : m_hsize[2:0] = 3'bxxx;
    endcase
end
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hwrite_i = m_hwrite_ch0;
        16'h0002: m_hwrite_i = m_hwrite_ch1;
        16'h0004: m_hwrite_i = m_hwrite_ch2;
        16'h0008: m_hwrite_i = m_hwrite_ch3;
        16'h0010: m_hwrite_i = m_hwrite_ch4;
        16'h0020: m_hwrite_i = m_hwrite_ch5;
        16'h0040: m_hwrite_i = m_hwrite_ch6;
        16'h0080: m_hwrite_i = m_hwrite_ch7;
        16'h0100: m_hwrite_i = m_hwrite_ch8;
        16'h0200: m_hwrite_i = m_hwrite_ch9;
        16'h0400: m_hwrite_i = m_hwrite_ch10;
        16'h0800: m_hwrite_i = m_hwrite_ch11;
        16'h1000: m_hwrite_i = m_hwrite_ch12;
        16'h2000: m_hwrite_i = m_hwrite_ch13;
        16'h4000: m_hwrite_i = m_hwrite_ch14;
        16'h8000: m_hwrite_i = m_hwrite_ch15;
        default : m_hwrite_i = 1'bx;
    endcase
end
assign    m_hwrite = m_hwrite_i & bus_grant_det ;
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_haddr[31:0] = m_addr_ch0[31:0];
        16'h0002: m_haddr[31:0] = m_addr_ch1[31:0];
        16'h0004: m_haddr[31:0] = m_addr_ch2[31:0];
        16'h0008: m_haddr[31:0] = m_addr_ch3[31:0];
        16'h0010: m_haddr[31:0] = m_addr_ch4[31:0];
        16'h0020: m_haddr[31:0] = m_addr_ch5[31:0];
        16'h0040: m_haddr[31:0] = m_addr_ch6[31:0];
        16'h0080: m_haddr[31:0] = m_addr_ch7[31:0];
        16'h0100: m_haddr[31:0] = m_addr_ch8[31:0];
        16'h0200: m_haddr[31:0] = m_addr_ch9[31:0];
        16'h0400: m_haddr[31:0] = m_addr_ch10[31:0];
        16'h0800: m_haddr[31:0] = m_addr_ch11[31:0];
        16'h1000: m_haddr[31:0] = m_addr_ch12[31:0];
        16'h2000: m_haddr[31:0] = m_addr_ch13[31:0];
        16'h4000: m_haddr[31:0] = m_addr_ch14[31:0];
        16'h8000: m_haddr[31:0] = m_addr_ch15[31:0];
        default : m_haddr[31:0] = 32'hxxxxxxxx;
    endcase
end
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin  
        m_hbusreq <= 1'b0 ;
    end
    else if (arb_bmux_trgvld)
        m_hbusreq <= 1'b1 ;
    else if(~arb_bmux_trgvld & m_hready)
        m_hbusreq <= 1'b0 ;
    else
        m_hbusreq <= m_hbusreq ;
end
assign   bus_grant_det = (m_htrans[1:0] == 2'b10 ) ;
assign   hready = m_hready & m_hgrant_d1 & m_hbusreq ; 
assign   m_hburst[2:0] = 3'b000 ; 
assign   m_hlock       = 1'b0 ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin  
        m_hgrant_d1 <= 1'b0 ;
    end
    else if(m_hgrant&m_hready) 
        m_hgrant_d1 <= 1'b1 ;
    else if (~m_hgrant)
        m_hgrant_d1 <= 1'b0 ;
end
assign     m_htrans[1:0] = arb_bmux_transvld&m_hgrant_d1&gbc_chnc_dmacen&m_hbusreq ?  2'b10 : 2'b00 ; 
endmodule
