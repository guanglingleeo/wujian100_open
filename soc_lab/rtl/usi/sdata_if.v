/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module sdata_if(
  clk,
  f_nss,
  f_rxd,
  f_scl,
  f_scl_d,
  f_sda,
  i2c_en,
  i2c_mode,
  i2cm_en,
  i2cs_en,
  i_nss_in,
  i_scl_in,
  i_sd1_in,
  i_sda_in,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  r_scl,
  r_scl_d,
  r_sda,
  rst_n,
  scl_out,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  sda_out,
  sdata_en,
  spi_mo,
  spi_rx_en,
  spi_so,
  spim_en,
  spim_nss,
  spim_sck,
  spis_en,
  txd_out,
  uart_en
);
input          clk;      
input          i2c_en;   
input          i2c_mode; 
input          i2cm_en;  
input          i2cs_en;  
input          nss_in;   
input          rst_n;    
input          scl_out;  
input          sclk_in;  
input          sd0_in;   
input          sd1_in;   
input          sda_out;  
input          sdata_en; 
input          spi_mo;   
input          spi_rx_en; 
input          spi_so;   
input          spim_en;  
input          spim_nss; 
input          spim_sck; 
input          spis_en;  
input          txd_out;  
input          uart_en;  
output         f_nss;    
output         f_rxd;    
output         f_scl;    
output  [2:0]  f_scl_d;  
output         f_sda;    
output         i_nss_in; 
output         i_scl_in; 
output         i_sd1_in; 
output         i_sda_in; 
output         nss_ie_n; 
output         nss_oe_n; 
output         nss_out;  
output         r_scl;    
output  [2:0]  r_scl_d;  
output         r_sda;    
output         sclk_ie_n; 
output         sclk_oe_n; 
output         sclk_out; 
output         sd0_ie_n; 
output         sd0_oe_n; 
output         sd0_out;  
output         sd1_ie_n; 
output         sd1_oe_n; 
output         sd1_out;  
reg     [2:0]  f_sclk_d; 
reg     [3:0]  nss_in_d; 
reg     [2:0]  r_sclk_d; 
reg     [3:0]  sclk_in_d; 
reg     [3:0]  sd0_in_d; 
reg     [3:0]  sd1_in_d; 
wire           clk;      
wire           f_nss;    
wire           f_rxd;    
wire           f_scl;    
wire    [2:0]  f_scl_d;  
wire           f_sclk;   
wire           f_sd0;    
wire           f_sda;    
wire           i2c_en;   
wire           i2c_mode; 
wire           i2cm_en;  
wire           i2cs_en;  
wire           i_nss_in; 
wire           i_scl_in; 
wire           i_sd1_in; 
wire           i_sda_in; 
wire           nss_ie_n; 
wire           nss_in;   
wire           nss_oe_n; 
wire           nss_out;  
wire           r_scl;    
wire    [2:0]  r_scl_d;  
wire           r_sclk;   
wire           r_sd0;    
wire           r_sda;    
wire           rst_n;    
wire           scl_out;  
wire           sclk_ie_n; 
wire           sclk_in;  
wire           sclk_oe_n; 
wire           sclk_out; 
wire           sd0_ie_n; 
wire           sd0_in;   
wire           sd0_oe_n; 
wire           sd0_out;  
wire           sd1_ie_n; 
wire           sd1_in;   
wire           sd1_oe_n; 
wire           sd1_out;  
wire           sda_out;  
wire           sdata_en; 
wire           spi_mo;   
wire           spi_rx_en; 
wire           spi_so;   
wire           spim_en;  
wire           spim_nss; 
wire           spim_sck; 
wire           spis_en;  
wire           txd_out;  
wire           uart_en;  
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sd0_in_d[3:0] <= 4'hf;
    else if(sdata_en)
        sd0_in_d[3:0] <= {sd0_in_d[2:0], sd0_in};
    else
        sd0_in_d[3:0] <= 4'hf;
end
assign  r_sd0 = sd0_in_d[2] & ~sd0_in_d[3];
assign  f_sd0 = ~sd0_in_d[2] & sd0_in_d[3];
assign  r_sda = r_sd0;
assign  f_sda = f_sd0;
assign  i_sda_in = sd0_in_d[2];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sd1_in_d[3:0] <= 4'd15;
    else if(sdata_en)
        sd1_in_d[3:0] <= {sd1_in_d[2:0], sd1_in};
    else
        sd1_in_d[3:0] <= 4'd15;
end
assign  i_sd1_in = sd1_in_d[2];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sclk_in_d[3:0] <= 4'hf;
    else if(sdata_en)
        sclk_in_d[3:0] <= {sclk_in_d[2:0], sclk_in};
    else
        sclk_in_d[3:0] <= 4'hf;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        f_sclk_d[2:0]   <= 3'd0;    
        r_sclk_d[2:0]   <= 3'd0;    
    end
    else if(i2c_en)
    begin
        f_sclk_d[2:0]   <= {f_sclk_d[1:0], f_sclk};
        r_sclk_d[2:0]   <= {r_sclk_d[1:0], r_sclk};
    end
end
assign  r_sclk = sclk_in_d[2] & ~sclk_in_d[3];
assign  f_sclk = ~sclk_in_d[2] & sclk_in_d[3];
assign  r_scl  = r_sclk;
assign  f_scl  = f_sclk;
assign  f_rxd  = f_sclk;
assign  i_scl_in  = sclk_in_d[2];
assign  r_scl_d[2:0] = r_sclk_d[2:0];
assign  f_scl_d[2:0] = f_sclk_d[2:0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nss_in_d[3:0]   <= 4'hf;
    else
        nss_in_d[3:0]   <= {nss_in_d[2:0], nss_in};
end
assign  f_nss = ~nss_in_d[2] & nss_in_d[3];
assign  i_nss_in = nss_in_d[2];
assign  sclk_oe_n = (scl_out | (i2c_mode ? ~i2cm_en : ~i2cs_en)) & (~spim_en);
assign  sclk_out  = (scl_out & i2cm_en) | (spim_sck & spim_en);
assign  sclk_ie_n = ~uart_en & ~(i2cm_en | i2cs_en) & ~((spim_en & spi_rx_en) | spis_en);
assign  sd0_oe_n  = ((sda_out | ~i2c_en) & ~uart_en & ~spim_en);
assign  sd0_out   = (sda_out & i2c_en) | (txd_out & uart_en) | (spi_mo & spim_en);
assign  sd0_ie_n  = ~spis_en & ~i2c_en; 
assign  sd1_oe_n  = ~spis_en;
assign  sd1_out   = (spi_so & spis_en);
assign  sd1_ie_n  = ~spim_en;
assign  nss_oe_n  = ~spim_en;
assign  nss_out   = (spim_nss | ~spim_en);
assign  nss_ie_n  = spim_en; 
endmodule
