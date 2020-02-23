/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clic_reg_if(
  clic_tcipif_cmplt,
  clic_tcipif_rdata,
  cliccfg_data,
  clicth_data,
  clicthcfg_data,
  ctrl_xx_cliccfg_updt_val,
  ctrl_xx_cliccfg_updt_vld,
  ctrl_xx_clicth_updt_val,
  ctrl_xx_clicth_updt_vld,
  ctrl_xx_clicthcfg_hi_updt_vld,
  ctrl_xx_clicthcfg_lo_updt_vld,
  ctrl_xx_clicthcfg_updt_val,
  ctrl_xx_clicthcfg_updt_vld,
  ctrl_xx_intcfg_updt_val,
  ctrl_xx_intcfg_updt_vld,
  ctrl_xx_intie_updt_val,
  ctrl_xx_intie_updt_vld,
  ctrl_xx_intip_sw_clear_pending,
  ctrl_xx_intip_sw_set_pending,
  ctrl_xx_intip_updt_vld,
  ctrl_xx_intsec_updt_val,
  ctrl_xx_prot_sec,
  intcfg_read_data_0,
  intcfg_read_data_1,
  intcfg_read_data_10,
  intcfg_read_data_11,
  intcfg_read_data_12,
  intcfg_read_data_13,
  intcfg_read_data_14,
  intcfg_read_data_15,
  intcfg_read_data_2,
  intcfg_read_data_3,
  intcfg_read_data_4,
  intcfg_read_data_5,
  intcfg_read_data_6,
  intcfg_read_data_7,
  intcfg_read_data_8,
  intcfg_read_data_9,
  intie_read_data_0,
  intie_read_data_1,
  intie_read_data_10,
  intie_read_data_11,
  intie_read_data_12,
  intie_read_data_13,
  intie_read_data_14,
  intie_read_data_15,
  intie_read_data_2,
  intie_read_data_3,
  intie_read_data_4,
  intie_read_data_5,
  intie_read_data_6,
  intie_read_data_7,
  intie_read_data_8,
  intie_read_data_9,
  intip_read_data_0,
  intip_read_data_1,
  intip_read_data_10,
  intip_read_data_11,
  intip_read_data_12,
  intip_read_data_13,
  intip_read_data_14,
  intip_read_data_15,
  intip_read_data_2,
  intip_read_data_3,
  intip_read_data_4,
  intip_read_data_5,
  intip_read_data_6,
  intip_read_data_7,
  intip_read_data_8,
  intip_read_data_9,
  tcipif_clic_addr,
  tcipif_clic_sel,
  tcipif_clic_size,
  tcipif_clic_wdata,
  tcipif_clic_write
);
input   [7  :0]  cliccfg_data;                 
input   [7  :0]  clicth_data;                  
input   [9  :0]  clicthcfg_data;               
input   [31 :0]  intcfg_read_data_0;           
input   [31 :0]  intcfg_read_data_1;           
input   [31 :0]  intcfg_read_data_10;          
input   [31 :0]  intcfg_read_data_11;          
input   [31 :0]  intcfg_read_data_12;          
input   [31 :0]  intcfg_read_data_13;          
input   [31 :0]  intcfg_read_data_14;          
input   [31 :0]  intcfg_read_data_15;          
input   [31 :0]  intcfg_read_data_2;           
input   [31 :0]  intcfg_read_data_3;           
input   [31 :0]  intcfg_read_data_4;           
input   [31 :0]  intcfg_read_data_5;           
input   [31 :0]  intcfg_read_data_6;           
input   [31 :0]  intcfg_read_data_7;           
input   [31 :0]  intcfg_read_data_8;           
input   [31 :0]  intcfg_read_data_9;           
input   [31 :0]  intie_read_data_0;            
input   [31 :0]  intie_read_data_1;            
input   [31 :0]  intie_read_data_10;           
input   [31 :0]  intie_read_data_11;           
input   [31 :0]  intie_read_data_12;           
input   [31 :0]  intie_read_data_13;           
input   [31 :0]  intie_read_data_14;           
input   [31 :0]  intie_read_data_15;           
input   [31 :0]  intie_read_data_2;            
input   [31 :0]  intie_read_data_3;            
input   [31 :0]  intie_read_data_4;            
input   [31 :0]  intie_read_data_5;            
input   [31 :0]  intie_read_data_6;            
input   [31 :0]  intie_read_data_7;            
input   [31 :0]  intie_read_data_8;            
input   [31 :0]  intie_read_data_9;            
input   [31 :0]  intip_read_data_0;            
input   [31 :0]  intip_read_data_1;            
input   [31 :0]  intip_read_data_10;           
input   [31 :0]  intip_read_data_11;           
input   [31 :0]  intip_read_data_12;           
input   [31 :0]  intip_read_data_13;           
input   [31 :0]  intip_read_data_14;           
input   [31 :0]  intip_read_data_15;           
input   [31 :0]  intip_read_data_2;            
input   [31 :0]  intip_read_data_3;            
input   [31 :0]  intip_read_data_4;            
input   [31 :0]  intip_read_data_5;            
input   [31 :0]  intip_read_data_6;            
input   [31 :0]  intip_read_data_7;            
input   [31 :0]  intip_read_data_8;            
input   [31 :0]  intip_read_data_9;            
input   [15 :0]  tcipif_clic_addr;             
input            tcipif_clic_sel;              
input   [1  :0]  tcipif_clic_size;             
input   [31 :0]  tcipif_clic_wdata;            
input            tcipif_clic_write;            
output           clic_tcipif_cmplt;            
output  [31 :0]  clic_tcipif_rdata;            
output  [7  :0]  ctrl_xx_cliccfg_updt_val;     
output           ctrl_xx_cliccfg_updt_vld;     
output  [7  :0]  ctrl_xx_clicth_updt_val;      
output           ctrl_xx_clicth_updt_vld;      
output           ctrl_xx_clicthcfg_hi_updt_vld; 
output           ctrl_xx_clicthcfg_lo_updt_vld; 
output  [9  :0]  ctrl_xx_clicthcfg_updt_val;   
output           ctrl_xx_clicthcfg_updt_vld;   
output  [511:0]  ctrl_xx_intcfg_updt_val;      
output  [63 :0]  ctrl_xx_intcfg_updt_vld;      
output  [63 :0]  ctrl_xx_intie_updt_val;       
output  [63 :0]  ctrl_xx_intie_updt_vld;       
output  [63 :0]  ctrl_xx_intip_sw_clear_pending; 
output  [63 :0]  ctrl_xx_intip_sw_set_pending; 
output  [15 :0]  ctrl_xx_intip_updt_vld;       
output  [63 :0]  ctrl_xx_intsec_updt_val;      
output           ctrl_xx_prot_sec;             
reg     [3  :0]  ctrl_reg_size_msk;            
wire    [31 :0]  clic_intcfg_rdata;            
wire    [31 :0]  clic_intie_rdata;             
wire    [31 :0]  clic_intip_rdata;             
wire             clic_tcipif_cmplt;            
wire    [31 :0]  clic_tcipif_rdata;            
wire    [7  :0]  cliccfg_data;                 
wire    [31 :0]  cliccfg_rdata;                
wire             clicintcfg_rd_sel;            
wire             clicintcfg_wr_sel;            
wire             clicintie_rd_sel;             
wire             clicintie_wr_sel;             
wire             clicintip_rd_sel;             
wire             clicintip_wr_sel;             
wire    [7  :0]  clicth_data;                  
wire    [31 :0]  clicth_rdata;                 
wire    [9  :0]  clicthcfg_data;               
wire    [31 :0]  clicthcfg_rdata;              
wire    [11 :0]  ctrl_reg_addr;                
wire             ctrl_xx_cliccfg_read_vld;     
wire    [7  :0]  ctrl_xx_cliccfg_updt_val;     
wire             ctrl_xx_cliccfg_updt_vld;     
wire             ctrl_xx_clicth_read_vld;      
wire    [7  :0]  ctrl_xx_clicth_updt_val;      
wire             ctrl_xx_clicth_updt_vld;      
wire             ctrl_xx_clicthcfg_hi_updt_vld; 
wire             ctrl_xx_clicthcfg_lo_updt_vld; 
wire             ctrl_xx_clicthcfg_read_vld;   
wire    [9  :0]  ctrl_xx_clicthcfg_updt_val;   
wire             ctrl_xx_clicthcfg_updt_vld;   
wire    [15 :0]  ctrl_xx_intcfg_read_vld;      
wire    [15 :0]  ctrl_xx_intie_read_vld;       
wire    [15 :0]  ctrl_xx_intip_read_vld;       
wire             ctrl_xx_prot_sec;             
wire    [31 :0]  intcfg_read_data_0;           
wire    [31 :0]  intcfg_read_data_1;           
wire    [31 :0]  intcfg_read_data_10;          
wire    [31 :0]  intcfg_read_data_11;          
wire    [31 :0]  intcfg_read_data_12;          
wire    [31 :0]  intcfg_read_data_13;          
wire    [31 :0]  intcfg_read_data_14;          
wire    [31 :0]  intcfg_read_data_15;          
wire    [31 :0]  intcfg_read_data_2;           
wire    [31 :0]  intcfg_read_data_3;           
wire    [31 :0]  intcfg_read_data_4;           
wire    [31 :0]  intcfg_read_data_5;           
wire    [31 :0]  intcfg_read_data_6;           
wire    [31 :0]  intcfg_read_data_7;           
wire    [31 :0]  intcfg_read_data_8;           
wire    [31 :0]  intcfg_read_data_9;           
wire    [31 :0]  intie_read_data_0;            
wire    [31 :0]  intie_read_data_1;            
wire    [31 :0]  intie_read_data_10;           
wire    [31 :0]  intie_read_data_11;           
wire    [31 :0]  intie_read_data_12;           
wire    [31 :0]  intie_read_data_13;           
wire    [31 :0]  intie_read_data_14;           
wire    [31 :0]  intie_read_data_15;           
wire    [31 :0]  intie_read_data_2;            
wire    [31 :0]  intie_read_data_3;            
wire    [31 :0]  intie_read_data_4;            
wire    [31 :0]  intie_read_data_5;            
wire    [31 :0]  intie_read_data_6;            
wire    [31 :0]  intie_read_data_7;            
wire    [31 :0]  intie_read_data_8;            
wire    [31 :0]  intie_read_data_9;            
wire    [31 :0]  intip_read_data_0;            
wire    [31 :0]  intip_read_data_1;            
wire    [31 :0]  intip_read_data_10;           
wire    [31 :0]  intip_read_data_11;           
wire    [31 :0]  intip_read_data_12;           
wire    [31 :0]  intip_read_data_13;           
wire    [31 :0]  intip_read_data_14;           
wire    [31 :0]  intip_read_data_15;           
wire    [31 :0]  intip_read_data_2;            
wire    [31 :0]  intip_read_data_3;            
wire    [31 :0]  intip_read_data_4;            
wire    [31 :0]  intip_read_data_5;            
wire    [31 :0]  intip_read_data_6;            
wire    [31 :0]  intip_read_data_7;            
wire    [31 :0]  intip_read_data_8;            
wire    [31 :0]  intip_read_data_9;            
wire    [15 :0]  tcipif_clic_addr;             
wire             tcipif_clic_sel;              
wire    [1  :0]  tcipif_clic_size;             
wire    [31 :0]  tcipif_clic_wdata;            
wire             tcipif_clic_write;            
parameter CLICINTIP_BASE   = 2'b00;
parameter CLICINTIE_BASE   = 2'b01;
parameter CLICINTCFG_BASE  = 2'b10;
parameter CLICCFG          = 10'h300;
parameter CLICTH           = 10'h301;
parameter CLICTHCFG        = 10'h302;
parameter CLICINTNUM       = 64;
assign clic_tcipif_cmplt       = tcipif_clic_sel;
assign ctrl_reg_addr[11:0] = {12{tcipif_clic_sel}} & tcipif_clic_addr[11:0];
assign clicintip_wr_sel       = tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTIP_BASE);
assign clicintie_wr_sel       = tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTIE_BASE);
assign clicintcfg_wr_sel      = tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTCFG_BASE);
assign clicintip_rd_sel       = !tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTIP_BASE);
assign clicintie_rd_sel       = !tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTIE_BASE);
assign clicintcfg_rd_sel      = !tcipif_clic_write && (ctrl_reg_addr[11:10] == CLICINTCFG_BASE);
always @( ctrl_reg_addr[1:0]
       or tcipif_clic_size[1:0])
begin
  casez({ctrl_reg_addr[1:0],tcipif_clic_size[1:0]})
  4'b0000:ctrl_reg_size_msk[3:0] = 4'b0001;
  4'b0100:ctrl_reg_size_msk[3:0] = 4'b0010;
  4'b1000:ctrl_reg_size_msk[3:0] = 4'b0100;
  4'b1100:ctrl_reg_size_msk[3:0] = 4'b1000;
  4'b0?01:ctrl_reg_size_msk[3:0] = 4'b0011;
  4'b1?01:ctrl_reg_size_msk[3:0] = 4'b1100;
  4'b??10:ctrl_reg_size_msk[3:0] = 4'b1111;
  default:ctrl_reg_size_msk[3:0] = 4'b1111;
  endcase
end
wire [CLICINTNUM-1:0] ctrl_xx_intie_updt_vld;
wire [CLICINTNUM-1:0] ctrl_xx_intie_updt_val;
wire [CLICINTNUM-1:0] ctrl_xx_intsec_updt_val;
wire [CLICINTNUM/4-1:0] ctrl_xx_intip_updt_vld;
wire [CLICINTNUM-1:0] ctrl_xx_intip_sw_clear_pending;
wire [CLICINTNUM-1:0] ctrl_xx_intip_sw_set_pending;
wire [CLICINTNUM-1:0] ctrl_xx_intcfg_updt_vld;
wire [CLICINTNUM*8-1:0] ctrl_xx_intcfg_updt_val;
genvar i;
generate
for(i=0;i<CLICINTNUM/4;i=i+1)
begin:CLICINTIE
  assign ctrl_xx_intie_updt_vld[i*4+:4]  = ctrl_reg_size_msk[3:0] & {4{clicintie_wr_sel && (ctrl_reg_addr[9:2] == (8'h40+i))}};
  assign ctrl_xx_intie_read_vld[i]       = {{clicintie_rd_sel && (ctrl_reg_addr[9:2] == (8'h40+i))}};
  assign ctrl_xx_intie_updt_val[i*4+0]   = tcipif_clic_wdata[0];
  assign ctrl_xx_intie_updt_val[i*4+1]   = tcipif_clic_wdata[8];
  assign ctrl_xx_intie_updt_val[i*4+2]   = tcipif_clic_wdata[16];
  assign ctrl_xx_intie_updt_val[i*4+3]   = tcipif_clic_wdata[24];
  assign ctrl_xx_intsec_updt_val[i*4+0]  = tcipif_clic_wdata[7];
  assign ctrl_xx_intsec_updt_val[i*4+1]  = tcipif_clic_wdata[15];
  assign ctrl_xx_intsec_updt_val[i*4+2]  = tcipif_clic_wdata[23];
  assign ctrl_xx_intsec_updt_val[i*4+3]  = tcipif_clic_wdata[31];
end
endgenerate
genvar j;
generate 
for(j=0;j<CLICINTNUM/4;j=j+1)
begin:CLICINTIP
  assign ctrl_xx_intip_updt_vld[j]  = {{clicintip_wr_sel && (ctrl_reg_addr[9:2] == (8'h40+j))}};
  assign ctrl_xx_intip_read_vld[j]  = {{clicintip_rd_sel && (ctrl_reg_addr[9:2] == (8'h40+j))}};
  assign ctrl_xx_intip_sw_clear_pending[j*4+0]  = ctrl_reg_size_msk[0] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[0]==1'b0);
  assign ctrl_xx_intip_sw_clear_pending[j*4+1]  = ctrl_reg_size_msk[1] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[8]==1'b0);
  assign ctrl_xx_intip_sw_clear_pending[j*4+2]  = ctrl_reg_size_msk[2] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[16]==1'b0);
  assign ctrl_xx_intip_sw_clear_pending[j*4+3]  = ctrl_reg_size_msk[3] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[24]==1'b0);
  assign ctrl_xx_intip_sw_set_pending[j*4+0]    = ctrl_reg_size_msk[0] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[0]==1'b1);
  assign ctrl_xx_intip_sw_set_pending[j*4+1]    = ctrl_reg_size_msk[1] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[8]==1'b1);
  assign ctrl_xx_intip_sw_set_pending[j*4+2]    = ctrl_reg_size_msk[2] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[16]==1'b1);
  assign ctrl_xx_intip_sw_set_pending[j*4+3]    = ctrl_reg_size_msk[3] && ctrl_xx_intip_updt_vld[j] && (tcipif_clic_wdata[24]==1'b1);
end
endgenerate
genvar m;
generate 
for(m=0;m<CLICINTNUM/4;m=m+1)
begin:CLICINTCFG
  assign ctrl_xx_intcfg_updt_vld[m*4+:4] = ctrl_reg_size_msk[3:0] & {4{clicintcfg_wr_sel && (ctrl_reg_addr[9:2] == (8'h40+m))}};
  assign ctrl_xx_intcfg_read_vld[m]      = {{clicintcfg_rd_sel && (ctrl_reg_addr[9:2] == (8'h40+m))}};
  assign ctrl_xx_intcfg_updt_val[m*32+7:m*32]      = tcipif_clic_wdata[7:0];
  assign ctrl_xx_intcfg_updt_val[m*32+15:m*32+8]   = tcipif_clic_wdata[15:8];
  assign ctrl_xx_intcfg_updt_val[m*32+23:m*32+16]  = tcipif_clic_wdata[23:16];
  assign ctrl_xx_intcfg_updt_val[m*32+31:m*32+24]  = tcipif_clic_wdata[31:24];
end
endgenerate
assign ctrl_xx_cliccfg_updt_vld       = ctrl_reg_size_msk[0] && tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICCFG));
assign ctrl_xx_clicth_updt_vld        = ctrl_reg_size_msk[3] && tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICTH));
assign ctrl_xx_clicthcfg_lo_updt_vld     = ctrl_reg_size_msk[0] && tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICTHCFG));
assign ctrl_xx_clicthcfg_hi_updt_vld     = ctrl_reg_size_msk[1] && tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICTHCFG));
assign ctrl_xx_cliccfg_read_vld       = !tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICCFG));
assign ctrl_xx_clicth_read_vld        = !tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICTH));
assign ctrl_xx_clicthcfg_read_vld     = !tcipif_clic_write && (ctrl_reg_addr[11:2] == (CLICTHCFG));
assign ctrl_xx_cliccfg_updt_val[7:0]  = tcipif_clic_wdata[7:0];
assign ctrl_xx_clicth_updt_val[7:0]   = tcipif_clic_wdata[31:24];
assign ctrl_xx_clicthcfg_updt_val[9:0]= tcipif_clic_wdata[9:0];
assign ctrl_xx_clicthcfg_updt_vld  = ctrl_xx_clicthcfg_hi_updt_vld || ctrl_xx_clicthcfg_lo_updt_vld;
assign clic_intie_rdata[31:0]  = {32{ctrl_xx_intie_read_vld[0]}} & intie_read_data_0[31:0] | 
			{32{ctrl_xx_intie_read_vld[1]}} & intie_read_data_1[31:0] | 
			{32{ctrl_xx_intie_read_vld[2]}} & intie_read_data_2[31:0] | 
			{32{ctrl_xx_intie_read_vld[3]}} & intie_read_data_3[31:0] |
			{32{ctrl_xx_intie_read_vld[4]}} & intie_read_data_4[31:0] | 
			{32{ctrl_xx_intie_read_vld[5]}} & intie_read_data_5[31:0] | 
			{32{ctrl_xx_intie_read_vld[6]}} & intie_read_data_6[31:0] | 
			{32{ctrl_xx_intie_read_vld[7]}} & intie_read_data_7[31:0] |
			{32{ctrl_xx_intie_read_vld[8]}} & intie_read_data_8[31:0] | 
			{32{ctrl_xx_intie_read_vld[9]}} & intie_read_data_9[31:0] | 
			{32{ctrl_xx_intie_read_vld[10]}} & intie_read_data_10[31:0] | 
			{32{ctrl_xx_intie_read_vld[11]}} & intie_read_data_11[31:0] |
			{32{ctrl_xx_intie_read_vld[12]}} & intie_read_data_12[31:0] | 
			{32{ctrl_xx_intie_read_vld[13]}} & intie_read_data_13[31:0] | 
			{32{ctrl_xx_intie_read_vld[14]}} & intie_read_data_14[31:0] | 
			{32{ctrl_xx_intie_read_vld[15]}} & intie_read_data_15[31:0];
assign clic_intip_rdata[31:0]  = 
			{32{ctrl_xx_intip_read_vld[0]}} & intip_read_data_0[31:0] | 
			{32{ctrl_xx_intip_read_vld[1]}} & intip_read_data_1[31:0] | 
			{32{ctrl_xx_intip_read_vld[2]}} & intip_read_data_2[31:0] | 
			{32{ctrl_xx_intip_read_vld[3]}} & intip_read_data_3[31:0] |
			{32{ctrl_xx_intip_read_vld[4]}} & intip_read_data_4[31:0] | 
			{32{ctrl_xx_intip_read_vld[5]}} & intip_read_data_5[31:0] | 
			{32{ctrl_xx_intip_read_vld[6]}} & intip_read_data_6[31:0] | 
			{32{ctrl_xx_intip_read_vld[7]}} & intip_read_data_7[31:0] |
			{32{ctrl_xx_intip_read_vld[8]}} & intip_read_data_8[31:0] | 
			{32{ctrl_xx_intip_read_vld[9]}} & intip_read_data_9[31:0] | 
			{32{ctrl_xx_intip_read_vld[10]}} & intip_read_data_10[31:0] | 
			{32{ctrl_xx_intip_read_vld[11]}} & intip_read_data_11[31:0] |
			{32{ctrl_xx_intip_read_vld[12]}} & intip_read_data_12[31:0] | 
			{32{ctrl_xx_intip_read_vld[13]}} & intip_read_data_13[31:0] | 
			{32{ctrl_xx_intip_read_vld[14]}} & intip_read_data_14[31:0] | 
			{32{ctrl_xx_intip_read_vld[15]}} & intip_read_data_15[31:0];
assign clic_intcfg_rdata[31:0]  = 
			{32{ctrl_xx_intcfg_read_vld[0]}} & intcfg_read_data_0[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[1]}} & intcfg_read_data_1[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[2]}} & intcfg_read_data_2[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[3]}} & intcfg_read_data_3[31:0] |
			{32{ctrl_xx_intcfg_read_vld[4]}} & intcfg_read_data_4[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[5]}} & intcfg_read_data_5[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[6]}} & intcfg_read_data_6[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[7]}} & intcfg_read_data_7[31:0] |
			{32{ctrl_xx_intcfg_read_vld[8]}} & intcfg_read_data_8[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[9]}} & intcfg_read_data_9[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[10]}} & intcfg_read_data_10[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[11]}} & intcfg_read_data_11[31:0] |
			{32{ctrl_xx_intcfg_read_vld[12]}} & intcfg_read_data_12[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[13]}} & intcfg_read_data_13[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[14]}} & intcfg_read_data_14[31:0] | 
			{32{ctrl_xx_intcfg_read_vld[15]}} & intcfg_read_data_15[31:0];
assign cliccfg_rdata[31:0] = {32{ctrl_xx_cliccfg_read_vld}} & {24'b0,cliccfg_data[7:0]};
assign clicth_rdata[31:0]  = {32{ctrl_xx_clicth_read_vld}} & {clicth_data[7:0],24'b0};
assign clicthcfg_rdata[31:0]  = {32{ctrl_xx_clicthcfg_read_vld}} & {22'b0,clicthcfg_data[9:0]};
assign clic_tcipif_rdata[31:0] = clic_intie_rdata[31:0] 
                               | clic_intip_rdata[31:0] 
                               | clic_intcfg_rdata[31:0] 
                               | cliccfg_rdata[31:0]
                               | clicth_rdata[31:0]
                               | clicthcfg_rdata[31:0];
  assign ctrl_xx_prot_sec = 1'b0;
endmodule
