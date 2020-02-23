/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module A7f(
  cp0_had_cpuid_idx0,
  cp0_had_int_exit,
  cp0_had_lpmd_b,
  cp0_had_mcause_data,
  A117,
  A1858a,
  A118,
  A18589,
  A119,
  A18588,
  A11a,
  A18587,
  A11b,
  A18586,
  A11c,
  had_core_dbg_mode_req,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_ifu_ir,
  had_ifu_ir_vld,
  had_iu_force_dbg_en,
  had_iu_int_vld,
  had_iu_pc,
  had_iu_rte_pc_sel,
  had_iu_xx_fdb,
  had_tcipif_cmplt,
  had_tcipif_rdata,
  hadrst_b,
  iu_had_fast_retire_acc_err_pc_update,
  iu_had_fast_retire_acc_err_pc_val,
  iu_had_int_ack,
  iu_had_retire_with_had_int,
  iu_had_xx_data,
  iu_had_xx_data_vld,
  iu_had_xx_dbg_ack,
  iu_had_xx_retire_pc,
  iu_yy_xx_dbgon,
  A13d,
  A18564,
  A13e,
  A18563,
  A145,
  A1855c,
  A146,
  A1855b,
  A147,
  A1855a,
  A148,
  A18559,
  A149,
  A18558,
  A14a,
  A18557,
  A14b,
  A18556,
  A14c,
  A18555,
  A14d,
  A18554,
  A14e,
  A18553,
  A14f,
  A18552,
  A150,
  A18551,
  A151,
  A18550,
  A152,
  A161,
  A153,
  tcipif_had_addr,
  tcipif_had_sel,
  tcipif_had_wdata,
  tcipif_had_write
);
input   [31:0]  cp0_had_cpuid_idx0;                  
input           cp0_had_int_exit;                    
input   [1 :0]  cp0_had_lpmd_b;                      
input   [31:0]  cp0_had_mcause_data;                 
input           A117;                              
input           A1858a;                  
input           A118;               
input           A18589;                
input           A119;                
input           A18588;                
input           A11a;                 
input           A18587;                        
input   [31:0]  A11b;                         
input           A18586;                 
input           A11c;                  
input           hadrst_b;                            
input           iu_had_fast_retire_acc_err_pc_update; 
input   [30:0]  iu_had_fast_retire_acc_err_pc_val;   
input           iu_had_int_ack;                      
input           iu_had_retire_with_had_int;          
input   [31:0]  iu_had_xx_data;                      
input           iu_had_xx_data_vld;                  
input           iu_had_xx_dbg_ack;                   
input   [31:0]  iu_had_xx_retire_pc;                 
input           iu_yy_xx_dbgon;                      
input           A13d;                      
input           A18564;               
input   [31:0]  A13e;                        
input           A18563;                   
input   [15:0]  tcipif_had_addr;                     
input           tcipif_had_sel;                      
input   [31:0]  tcipif_had_wdata;                    
input           tcipif_had_write;                    
output          had_core_dbg_mode_req;               
output  [31:0]  had_idu_wbbr_data;                   
output          had_idu_wbbr_vld;                    
output  [31:0]  had_ifu_ir;                          
output          had_ifu_ir_vld;                      
output          had_iu_force_dbg_en;                 
output          had_iu_int_vld;                      
output  [30:0]  had_iu_pc;                           
output          had_iu_rte_pc_sel;                   
output          had_iu_xx_fdb;                       
output          had_tcipif_cmplt;                    
output  [31:0]  had_tcipif_rdata;                    
output  [31:0]  A145;                     
output          A1855c;                 
output  [2 :0]  A146;                     
output  [7 :0]  A1855b;                     
output  [31:0]  A147;                     
output  [2 :0]  A1855a;                     
output  [7 :0]  A148;                     
output  [31:0]  A18559;                     
output          A149;                       
output  [31:0]  A18558;                     
output          A14a;                       
output  [31:0]  A18557;                     
output          A14b;                       
output          A18556;                       
output          A14c;                        
output          A18555;                  
output          A14d;                   
output          A18554;                   
output          A14e;                
output  [8 :0]  A18553;                      
output          A14f;                  
output          A18552;                  
output  [31:0]  A150;                      
output          A18551;                   
output          A151;                 
output          A18550;                  
output  [1 :0]  A152;                         
output          A161;                       
output          A153;                      
reg             A18622;                                
reg     [31:0]  A80;                            
reg     [31:0]  A18621;                            
reg     [31:0]  A81;                            
reg     [31:0]  A18620;                            
reg     [31:0]  A82;                            
reg     [7 :0]  A1861f;                            
reg     [7 :0]  A83;                            
reg     [1 :0]  A1861e;                                
reg             A84;                                 
reg             A1861d;                                 
reg             A85;                                 
reg     [7 :0]  A1861c;                            
reg     [7 :0]  A86;                      
reg             A1861b;                     
reg     [1 :0]  A87;                      
reg             A1861a;                     
reg             A88;                             
reg     [2 :0]  A18619;                             
reg     [2 :0]  A89;                             
reg             A18618;                      
reg             A8a;                      
reg             A18617;                      
reg             A8b;                           
reg             A18616;                              
reg             A8c;                             
reg             A18615;                                 
reg     [30:0]  A8d;                                  
reg             A18614;                         
reg     [31:0]  A8e;                          
reg             A18613;                                 
reg             A8f;                                  
reg     [31:0]  A18612;                            
wire            A90;                            
wire            A18611;                            
wire            A91;                            
wire            A18610;                            
wire            A92;                            
wire    [31:0]  A1860f;                            
wire    [31:0]  A93;                            
wire    [31:0]  A1860e;                            
wire    [31:0]  A94;                            
wire            A1860d;                            
wire            A95;                            
wire    [7 :0]  A1860c;                            
wire    [7 :0]  A96;                            
wire    [7 :0]  A1860b;                            
wire    [7 :0]  A97;                            
wire    [7 :0]  A1860a;                            
wire    [7 :0]  A98;                            
wire    [7 :0]  A18609;                            
wire            A99;                              
wire            A18608;                          
wire            A9a;                       
wire            A18607;                              
wire            A9b;                          
wire            A18606;                       
wire    [1 :0]  A9c;                            
wire            A18605;                            
wire    [31:0]  cp0_had_cpuid_idx0;                  
wire    [1 :0]  cp0_had_lpmd_b;                      
wire    [31:0]  cp0_had_mcause_data;                 
wire            A18603;                 
wire            A117;                              
wire    [15:0]  A18602;                             
wire            Aa0;                             
wire            A1858a;                  
wire            A118;               
wire            A18589;                
wire            A119;                
wire            A18588;                
wire            A11a;                 
wire    [31:0]  A185fe;                        
wire    [31:0]  Aa4;                           
wire    [31:0]  A185fd;                           
wire    [31:0]  Aa5;                            
wire    [31:0]  A185fc;                        
wire            Aa6;                
wire            A18587;                        
wire    [31:0]  A11b;                         
wire            A18586;                 
wire            A11c;                  
wire    [31:0]  A185f9;                         
wire    [31:0]  Aa9;                           
wire            A185f8;                           
wire    [31:0]  Aaa;                           
wire            A185f7;                           
wire    [31:0]  Aab;                           
wire            A185f6;                             
wire            Aac;                             
wire            A185f5;                  
wire            Aad;               
wire            A185f4;                  
wire            Aae;               
wire            A185f3;                  
wire            Aaf;               
wire            A185f2;                  
wire            Ab0;               
wire            A185f1;                  
wire            Ab1;               
wire            A185f0;                  
wire            Ab2;               
wire            A185ef;                  
wire            Ab3;               
wire            A185ee;                  
wire            Ab4;               
wire            A185ed;                  
wire            Ab5;               
wire            A185ec;                  
wire            Ab6;               
wire            A185eb;                  
wire            Ab7;               
wire            A185ea;                  
wire            Ab8;               
wire            A185e9;                  
wire            Ab9;               
wire            A185e8;                  
wire            Aba;               
wire            A185e7;                  
wire            Abb;               
wire            A185e6;                  
wire            Abc;               
wire            A185e5;                  
wire            Abd;               
wire            A185e4;                  
wire            Abe;               
wire            A185e3;                  
wire            Abf;               
wire            A185e2;                
wire            Ac0;                   
wire            A185e1;                
wire            Ac1;                 
wire            A185e0;              
wire            Ac2;                 
wire            A185df;              
wire            Ac3;                 
wire            A185de;              
wire            Ac4;                  
wire            A185dd;               
wire            Ac5;              
wire            A185dc;           
wire            Ac6;                 
wire            A185db;              
wire            Ac7;               
wire            A185da;             
wire            Ac8;          
wire            A185d9;                   
wire            Ac9;                
wire            A185d8;                  
wire            Aca;               
wire            A185d7;                   
wire            Acb;                
wire            A185d6;                    
wire            Acc;                 
wire            A185d5;                    
wire            Acd;                  
wire            A185d4;               
wire            Ace;                  
wire            A185d3;               
wire            Acf;                  
wire            A185d2;               
wire            Ad0;                  
wire            A185d1;               
wire            Ad1;                  
wire            A185d0;               
wire            Ad2;                    
wire            A185cf;                 
wire            Ad3;              
wire            A185ce;           
wire            Ad4;                   
wire            A185cd;                
wire    [4 :0]  Ad5;                     
wire            A185cc;                
wire            Ad6;             
wire            A185cb;                    
wire            Ad7;                 
wire            A185ca;                  
wire            Ad8;               
wire            A185c9;                             
wire            had_core_dbg_mode_req;               
wire    [31:0]  had_idu_wbbr_data;                   
wire            had_idu_wbbr_vld;                    
wire    [31:0]  had_ifu_ir;                          
wire            had_ifu_ir_vld;                      
wire            had_iu_force_dbg_en;                 
wire            had_iu_int_vld;                      
wire    [30:0]  had_iu_pc;                           
wire            had_iu_rte_pc_sel;                   
wire            had_iu_xx_fdb;                       
wire            had_tcipif_cmplt;                    
wire    [31:0]  had_tcipif_rdata;                    
wire            hadrst_b;                            
wire            A185c2;                         
wire            Ae0;                         
wire    [6 :0]  A185c1;                            
wire    [2 :0]  Ae1;                      
wire    [3 :0]  A185c0;                      
wire            Ae2;                  
wire            A185bf;                  
wire            Ae3;                  
wire            A185be;                            
wire            Ae4;                     
wire            A185bd;                     
wire    [31:0]  Ae5;                             
wire            A185bc;                    
wire    [31:0]  Ae6;                            
wire            A185bb;                         
wire    [15:0]  Ae7;                             
wire    [31:0]  A185ba;                              
wire            iu_had_fast_retire_acc_err_pc_update; 
wire    [30:0]  iu_had_fast_retire_acc_err_pc_val;   
wire            iu_had_int_ack;                      
wire            iu_had_retire_with_had_int;          
wire    [31:0]  iu_had_xx_data;                      
wire            iu_had_xx_data_vld;                  
wire            iu_had_xx_dbg_ack;                   
wire    [31:0]  iu_had_xx_retire_pc;                 
wire            iu_yy_xx_dbgon;                      
wire            A185b5;                           
wire            Aed;                     
wire            A13d;                      
wire            A18564;               
wire    [31:0]  A13e;                        
wire            A18563;                   
wire            A185b2;                           
wire    [31:0]  Af0;                            
wire    [3 :0]  A185b1;                            
wire    [31:0]  Af1;                            
wire    [31:0]  A185b0;                              
wire            Af2;                              
wire    [1 :0]  A185af;                                  
wire            Af3;                      
wire            A185ae;                         
wire    [31:0]  Af4;                        
wire    [31:0]  A185ad;                             
wire            Af5;                             
wire    [31:0]  A145;                     
wire            A1855c;                 
wire    [2 :0]  A146;                     
wire    [7 :0]  A1855b;                     
wire    [31:0]  A147;                     
wire    [2 :0]  A1855a;                     
wire    [7 :0]  A148;                     
wire    [31:0]  A18559;                     
wire            A149;                       
wire    [31:0]  A18558;                     
wire            A14a;                       
wire    [31:0]  A18557;                     
wire            A14b;                       
wire            A18556;                       
wire            A14c;                        
wire            A18555;                  
wire            A14d;                   
wire            A18554;                   
wire            A14e;                
wire    [8 :0]  A18553;                      
wire            A14f;                  
wire            A18552;                  
wire    [31:0]  A150;                      
wire            A18551;                   
wire            A151;                 
wire            A18550;                  
wire    [1 :0]  A152;                         
wire            A161;                       
wire            A153;                      
wire    [31:0]  A104;                       
wire            A1859d;                          
wire            A105;                        
wire            A1859c;                            
wire            A106;              
wire            A1859b;                 
wire    [15:0]  tcipif_had_addr;                     
wire            tcipif_had_sel;                      
wire    [31:0]  tcipif_had_wdata;                    
wire            A18599;                   
wire            A109;                      
wire            A18598;                            
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A1861c[7:0] <= 8'h82;  
  else if (A13d)
    A1861c[7:0] <= 8'h82;
  else if (A18564)
    A1861c[7:0] <= A13e[7:0];
  else
    A1861c[7:0] <= A1861c[7:0];
end
assign A185c9 = A1861c[7];
assign Aac = A1861c[6];
assign A185f6 = A1861c[5];
assign A109       = 1'b0;
assign Ad5[4:0] = A109 ?  tcipif_had_addr[6:2] : A1861c[4:0];
assign A18605 = A18563 && A185e3;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A1861e[1:0] <= 2'b0;
  else if (A13d)
    A1861e[1:0] <= 2'b0;
  else if (A18605)
    A1861e[1:0] <= A13e[1:0];
  else
    A1861e[1:0] <= A1861e[1:0];
end
  assign A9c[1:0] = {1'b0, A1861e[0]};
assign A18608    = A9c[1:0] == 2'b0;
assign A9a = tcipif_had_addr[11:7] == 5'b0;
assign A99        = A109 ? A9a : A18608;
  assign A9b    = A9c[1:0] == 2'b1;
  assign A18606 = tcipif_had_addr[11:7] == 5'b1;
  assign A18607        = A109 ? A18606 : A9b;
assign A185e3     = (Ad5[4:0] == 5'b11110);  
assign A185d6       = (Ad5[4:0] == 5'b00010) && A99;
assign A185cb       = 1'b0;
assign A185e2   = (Ad5[4:0] == 5'b01100) && A99;
assign A185d7      = (Ad5[4:0] == 5'b01110) && A99;
assign A185ca     = (Ad5[4:0] == 5'b10001) && A99;
assign A185d5       = (Ad5[4:0] == 5'b10100) && A99;
assign Ac0      = (Ad5[4:0] == 5'b10101) && A99;
assign Ac2    = (Ad5[4:0] == 5'b11000) && A99;
assign Ac6    = (Ad5[4:0] == 5'b11001) && A99;
assign A185cc   = (Ad5[4:0] == 5'b11111) && A99;
assign Ad4      = (Ad5[4:0] == 5'b10010) && A99;
assign Ad2       = (Ad5[4:0] == 5'b10011) && A99;
assign A185d9      = (Ad5[4:0] == 5'b01101) && A99;
assign A185d8     = 1'b0;
assign Acd     = 1'b0;
assign Ace     = 1'b0;
assign A185f5     = (Ad5[4:0] == 5'b00111) && A99;
assign A185ec     = (Ad5[4:0] == 5'b01001) && A99;
assign A185f4     = (Ad5[4:0] == 5'b01000) && A99;
assign A185eb     = (Ad5[4:0] == 5'b01010) && A99;
assign A185f3     = (Ad5[4:0] == 5'b00000) && A18607;
assign A185f2     = (Ad5[4:0] == 5'b00010) && A18607;
assign A185f1     = (Ad5[4:0] == 5'b00100) && A18607;
assign A185ea     = 1'b0;
assign A185e9     = 1'b0;
assign A185e8     = 1'b0;
assign A185f0     = 1'b0;
assign A185ef     = 1'b0;
assign A185ee     = 1'b0;
assign A185ed     = 1'b0;
assign A185e7     = 1'b0;
assign A185e6     = 1'b0;
assign A185e5     = 1'b0;
assign A185e4     = 1'b0;
assign Ac1    = 1'b0;
assign Ac4     = 1'b0;
assign Ac3    = 1'b0;
assign Ad0     = 1'b0;
assign Acf     = 1'b0;
assign Ad1     = 1'b0;
assign Ac5  = 1'b0;
assign Ad3  = 1'b0;
assign A185da = 1'b0;
assign A1859b           = 1'b0;
assign Aa6          = A18563;
assign A104[31:0]       = A109 ? tcipif_had_wdata[31:0]
                                                  : A13e[31:0];
assign A185ba[31:28] = 4'b0001;  
assign A185ba[27:26] = cp0_had_cpuid_idx0[27:26];
assign A185ba[25:18] = 8'b0;
assign A185ba[17]    = 1'b0;
assign A185ba[16]    = 1'b0;
assign A185ba[15:12] = 4'd5;
assign A185ba[11:8]  = 4'd11;
assign A185ba[7:4]   = 4'b0011;  
assign A185ba[3:0]   = 4'b0001;
assign A90 = Aa6 && A185f5;
always @(posedge A117)
begin
  if (A90)
    A80[31:0] <= A104[31:0];
  else
    A80[31:0] <= A80[31:0];
end
assign A1860d = Aa6 && A185ec;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A1861f[7:0] <= 8'b0;
  else if (A1860d)
    A1861f[7:0] <= A104[7:0];
  else
    A1861f[7:0] <= A1861f[7:0];
end
assign A18611 = Aa6 && A185f4;
always @(posedge A117)
begin
  if (A18611)
    A18621[31:0] <= A104[31:0];
  else
    A18621[31:0] <= A18621[31:0];
end
assign A95 = Aa6 && A185eb;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A83[7:0] <= 8'b0;
  else if (A95)
    A83[7:0] <= A104[7:0];
  else
    A83[7:0] <= A83[7:0];
end
assign A18598 = A18563 && (A185ca
                                     || Ac2
                                     || Ac6);
always @(posedge A117)
begin
  if (A18598)
    A18612[31:0] <= A13e[31:0];
  else if (iu_had_xx_data_vld)
    A18612[31:0] <= iu_had_xx_data[31:0];
  else
    A18612[31:0] <= A18612[31:0];
end
assign Aed   = A18563 && iu_yy_xx_dbgon;
assign A18599 = A1859b && !iu_had_retire_with_had_int;
assign Af5 = ((Aed && A18603) || A18599)
               && Ad4;
always @(posedge A117)
begin
  if (iu_had_int_ack) begin
    A87[1:0]     <= cp0_had_mcause_data[29:28];
    A86[7:0]     <= cp0_had_mcause_data[23:16];
    A1861b         <= cp0_had_mcause_data[27];
    A1861a         <= cp0_had_mcause_data[26];
  end
  else if (Af5) begin
    A87[1:0]     <= A104[29:28];
    A86[7:0]     <= A104[23:16];
    A1861b         <= A104[27];
    A1861a         <= A104[26];
  end
end
assign A185ad[31:0]      = {1'b0,1'b0,A87[1:0],A1861b,A1861a,2'b0,A86[7:0],16'b0};
assign Af2 = (Aed || A18599)
              && Ad2;
always @(posedge A117)
begin
  if (iu_had_fast_retire_acc_err_pc_update || iu_had_int_ack)
    A8d[30:0] <= iu_had_fast_retire_acc_err_pc_val[30:0];
  else if (iu_had_xx_dbg_ack)
    A8d[30:0] <= iu_had_xx_retire_pc[31:1];
  else if (Af2)
    A8d[30:0] <= A104[31:1];
  else
    A8d[30:0] <= A8d[30:0];
end
assign A185b0[31:0] = {A8d[30:0], 1'b0};
assign Aa0 = A18563 && Ac0;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b) begin
    A85         <= 1'b0;
    A1861d         <= 1'b0;
  end
  else if (Aa0) begin
    A85         <= A13e[8];
    A1861d         <= A13e[7];
  end
  else if (A18586) begin
    A85         <= A18587;
    A1861d         <= 1'b0;
  end
  else begin
    A85         <= A85;
    A1861d         <= A1861d;
  end
end
assign A18602[15:0] = {7'b0, A85, A1861d, 7'b0};
assign A185bc = A18563 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b) begin
    A88      <= 1'b0;  
    A8b    <= 1'b0;  
    A18616       <= 1'b0;  
    A8c      <= 1'b0;  
  end
  else if (A185bc) begin
    A88      <= A13e[21];
    A8b    <= A13e[20];
    A18616       <= A13e[15];
    A8c      <= A13e[13];
  end
  else begin
    A88      <= A88;
    A8b    <= A8b;
    A18616       <= A18616;
    A8c      <= A8c;
  end
end
assign A185c2 = Aa6 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b) begin
    A18619[2:0] <= 3'b0;  
  end
  else if (A185c2) begin
    A18619[2:0] <= A104[2:0];
  end
  else begin
    A18619[2:0] <= A18619[2:0];
  end
end
  assign Ae0 = Aa6 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b) begin
    A89[2:0]  <= 3'b0;
  end
  else if (Ae0) begin
    A89[2:0]  <= A104[8:6];
  end
  else begin
    A89[2:0]  <= A89[2:0];
  end
end
assign Ae2 = Aa6 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A18618 <= 1'b0;
  else if (Ae2)
    A18618 <= A104[22];
  else
    A18618 <= A18618;
end
assign A185bf = Aa6 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A8a <= 1'b0;
  else if (A185bf)
    A8a <= A104[23];
  else
    A8a <= A8a;
end
assign Ae3 = Aa6 && A185d9;
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A18617 <= 1'b0;
  else if (Ae3)
    A18617 <= A104[24];
  else
    A18617 <= A18617;
end
assign Ae1[2:0] = {A18617, A8a, A18618};
assign A185c0[3:0] = 4'b0;
assign A185c1[6:0] = {A185c0[3:0], Ae1[2:0]};
assign A185be = 1'b0;
assign Ae4 = 1'b0;
assign A185bd = 1'b0;
assign Ae5[31:0] = {2'b0, A185be, A185c1[6:0], A88, A8b,
                        Ae4, A185bd, 2'b0, A18616, 1'b0,
                        A8c, 4'b0, A89[2:0], 3'b0, A18619[2:0]};
assign A1855c = (A185c1[6:0] != 7'b0)
                          || (A89[2:0]  != 3'b0)
                          || (A18619[2:0]  != 3'b0);
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A18622 <= 1'b0;
  else if (A118)
    A18622 <= 1'b1;
  else if (A1858a)
    A18622 <= 1'b0;
  else
    A18622 <= A18622;
end
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A84 <= 1'b0;
  else if (A18589)
    A84 <= 1'b1;
  else if (A1858a)
    A84 <= 1'b0;
  else
    A84 <= A84;
end
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A18615 <= 1'b0;
  else if (A119)
    A18615 <= 1'b1;
  else if (A1858a)
    A18615 <= 1'b0;
  else
    A18615 <= A18615;
end
always @(posedge A117 or negedge hadrst_b)
begin                                                                                               
  if (!hadrst_b)
    A18613 <= 1'b0;
  else if (A18588)
    A18613 <= 1'b1;
  else if (A1858a)
    A18613 <= 1'b0;
  else
    A18613 <= A18613;
end
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
    A8f <= 1'b0;
  else if (A11a)
    A8f <= 1'b1;
  else if (A1858a)
    A8f <= 1'b0;
  else
    A8f <= A8f;
end
assign Af3 = !cp0_had_lpmd_b[1] || !cp0_had_lpmd_b[0];
always @(posedge A117 or negedge hadrst_b)
begin
  if (!hadrst_b)
  begin
    A18614 <= 1'b0;
  end
  else
  begin
    if (A1858a)
      A18614 <= 1'b0;
    else if (iu_yy_xx_dbgon)
      A18614 <= 1'b1;
    else
      A18614 <= A18614;
  end
end
assign A185af[1:0] = {A18614, Af3};
assign had_core_dbg_mode_req = A18614 && !iu_yy_xx_dbgon;
assign Ae7[15:0] = {6'b0, A18622, A84,
                        A18615, A18613, A8f, 3'b0, A185af[1:0]};
assign A185bb = 1'b0;
assign A185f8 = 1'b0;
assign A185f7 = 1'b0;
assign A185b2  = 1'b0; 
assign A185b5  = 1'b0;
assign A1859d = 1'b0; 
assign A14e = 1'b0;
assign had_iu_rte_pc_sel = 1'b0;
assign had_iu_int_vld = 1'b0;
assign Ae6[31:0] = {26'b0, A1859d,
                         A185b5, A185b2, 
                         A185f7, A185f8, A185bb};
assign Aa9[31:0] = 32'b0;
assign Aaa[31:0] = 32'b0;
assign Aa4[31:0] = 32'b0;
assign A185fd[31:0] = 32'b0;
assign Aa5[31:0]  = 32'b0;
assign A1859c = 1'b0;
assign A18603 = 1'b1;
assign A106 = A18603 || ~(A18603 || A1859c);
assign A105 = A18603? Aa4[10] : 1'b0; 
assign A91 = Aa6 && A185f3;
always @(posedge A117)
begin
  if (A91)
    A81[31:0] <= A104[31:0];
  else
    A81[31:0] <= A81[31:0];
end
assign A18610 = Aa6 && A185f2;
always @(posedge A117)
begin
  if (A18610)
    A18620[31:0] <= A104[31:0];
  else
    A18620[31:0] <= A18620[31:0];
end
assign A92 = Aa6 && A185f1;
always @(posedge A117)
begin
  if (A92)
    A82[31:0] <= A104[31:0];
  else
    A82[31:0] <= A82[31:0];
end
assign A1860f[31:0] = 32'b0;
assign A93[31:0] = 32'b0;
assign A1860e[31:0] = 32'b0;
assign A94[31:0] = 32'b0;
assign A1860c[7:0] = 8'b0;
assign A96[7:0] = 8'b0;
assign A1860b[7:0] = 8'b0;
assign A97[7:0] = 8'b0;
assign A1860a[7:0] = 8'b0;
assign A98[7:0] = 8'b0;
assign A18609[7:0] = 8'b0;
assign A185b1[3:0]  = 4'b0;
assign Af0[31:0] = 32'b0;
assign Af1[31:0] = 32'b0;
assign A185ae        = 1'b0;
assign Af4[31:0] = 32'b0;
assign A185fc[31:0] = {31'b0, A185ae};
assign had_iu_force_dbg_en = 1'b0;
assign Aab[31:0] = 32'b0;
assign Abf      = A185e3   && !A109;
assign Acc        = A185d6     && !A109;
assign Ad7        = 1'b0;
assign Acb       = A185d7    && !A109;
assign Ad8      = A185ca   && !A109;
assign A185e1       = Ac0    && !A109;
assign A185df     = Ac2  && !A109;
assign A185db     = Ac6  && !A109;
assign Ad6    = A185cc && !A109;
assign A185cd       = Ad4
                                && !A109;
assign A185cf        = Ad2
                                && !A109;
assign Aca      = A185d8
                                && !A109;
assign Ac7      = 1'b0;
  assign Ac9     = A185d9 && !A109;
assign A185d4      = 1'b0;
assign A185d3      = 1'b0;
assign Ab8      = 1'b0;
assign Ab9      = 1'b0;
assign Aba      = 1'b0;
assign Abb      = 1'b0;
assign Abc      = 1'b0;
assign Abd      = 1'b0;
assign Abe      = 1'b0;
assign Aad      = A185f5 && !A109;
assign Ab6      = A185ec && !A109;
assign Aae      = A185f4 && !A109;
assign Ab7      = A185eb && !A109;
assign Aaf      = A185f3 && !A109;
assign Ab0      = A185f2 && !A109;
assign Ab1      = A185f1 && !A109;
assign Ab2      = A185f0 && !A109;
assign Ab3      = A185ef && !A109;
assign Ab4      = A185ee && !A109;
assign Ab5      = A185ed && !A109;
assign A185e0     = Ac1 && !A109;
assign A185dd      = Ac4  && !A109;
assign A185de     = Ac3 && !A109
                                 && A106;
assign A185d1      = Ad0;
assign A185d2      = Acf;
assign A185d0      = Ad1;
assign A185dc  = Ac5  && !A109;
assign A185ce  = Ad3  && !A109;
assign Ac8 = A185da && !A109;
assign A185f9[31:0]  = A109 ? Aa9[31:0] : Aaa[31:0];
assign A185fe[31:0] = {Aa4[31:11], A105, Aa4[9:0]};
always @( * )
begin
  case (1'b1)
    Abf :
      A8e[31:0] = {30'b0, A9c[1:0]};
    Acc :
      A8e[31:0] = A185ba[31:0];
    Ad7 :
      A8e[31:0] = 32'b0;
    A185d4 :
      A8e[31:0] = 32'b0;
    Aad :
      A8e[31:0] = A80[31:0];
    Ab6 :
      A8e[31:0] = {24'b0, A1861f[7:0]};
    Ac9 :
      A8e[31:0] = Ae5[31:0];
    Acb :
      A8e[31:0] = {16'b0, Ae7[15:0]};
    Aca :
      A8e[31:0] = Ae6[31:0];
    Ad8 :
      A8e[31:0] = A18612[31:0];
    A185cd :
      A8e[31:0] = {32{A18603}} & A185ad[31:0];
    A185cf :
      A8e[31:0] = A185b0[31:0];
    A185e1 :
      A8e[31:0] = {16'b0, A18602[15:0]};
    Ac7 :
      A8e[31:0] = A185f9[31:0];
    A185df :
      A8e[31:0] = A18612[31:0];
    A185db :
      A8e[31:0] = A18612[31:0];
    Ad6 :
      A8e[31:0] = A185ba[31:0];
    A185d3 :
      A8e[31:0] = 32'b0;
    Aae:
      A8e[31:0] = A18621[31:0];
    Ab7:
      A8e[31:0] = {24'b0, A83[7:0]};
    Aaf :
      A8e[31:0] = A81[31:0];
    Ab8 :
      A8e[31:0] = {24'b0, A1860c[7:0]};
    Ab0 :
      A8e[31:0] = A18620[31:0];
    Ab9 :
      A8e[31:0] = {24'b0, A96[7:0]};
    Ab1 :
      A8e[31:0] = A82[31:0];
    Aba :
      A8e[31:0] = {24'b0, A1860b[7:0]};
    Ab2 :
      A8e[31:0] = A1860f[31:0];
    Abb :
      A8e[31:0] = {24'b0, A97[7:0]};
    Ab3 :
      A8e[31:0] = A93[31:0];
    Abc :
      A8e[31:0] = {24'b0, A1860a[7:0]};
    Ab4 :
      A8e[31:0] = A1860e[31:0];
    Abd :
      A8e[31:0] = {24'b0, A98[7:0]};
    Ab5 :
      A8e[31:0] = A94[31:0];
    Abe :
      A8e[31:0] = {24'b0, A18609[7:0]};
    A185e0 :
      A8e[31:0] = A185fe[31:0];
    A185dd :
      A8e[31:0] = Aa5[31:0];
    A185de :
      A8e[31:0] = A185fd[31:0];
    A185d1 :
      A8e[31:0] = {28'b0, A185b1[3:0]};
    A185d2 :
      A8e[31:0] = Af0[31:0];
    A185d0 :
      A8e[31:0] = Af1[31:0];
    A185dc :
      A8e[31:0] = A185fc[31:0];
    A185ce :
      A8e[31:0] = Af4[31:0];
    Ac8 :
      A8e[31:0] = Aab[31:0];
    default :
      A8e[31:0] = 32'b0;
  endcase
end
assign had_ifu_ir[31:0] = A11c ? A11b[31:0]
                                             : A13e[31:0];
assign had_ifu_ir_vld   =
  ((A18563 && A185d5 && Aac && !A185f6) ||
  (A11c && A8b)) && iu_yy_xx_dbgon;
assign had_iu_pc[30:0] = A185b0[31:1];
assign had_iu_xx_fdb   = A1861d;
assign had_idu_wbbr_data[31:0] = A18612[31:0];
assign had_idu_wbbr_vld        = A85 && iu_yy_xx_dbgon;
assign had_tcipif_cmplt       = tcipif_had_sel;
assign had_tcipif_rdata[31:0] = 32'b0;
assign A150[31:0]  = A8e[31:0];
assign A18551     = A185c9;
assign A18550    = Acd ||
                               Ace ||
                               A185ec ||
                               A185eb ||
                               A185cb   ||
                               A185ea ||
                               A185e9 ||
                               A185e8 ||
                               A185e7 ||
                               A185e6 ||
                               A185e5 ||
                               A185e4;
assign A151   = A185d7 ||
                               Ac0;
assign A18554     = Aac;
assign A14d     = A185f6;
assign A14c          = A18616;
assign A18556         = A88;
assign A18555    = Ad2    ||
                               A185d5    ||
                               A185ca  ||
                               Ad4   ||
                               Ac0   ||
                               A185e2;
assign A14f    = Ac2;
assign A18552    = Ac6;
assign A153        = A8b;
assign A161         = A8c;
assign A152[1:0]      = A185af[1:0];
assign A145[31:0] = A80[31:0];
assign A1855b[7:0]  = A1861f[7:0];
assign A146[2:0]  = A18619[2:0];
assign A147[31:0] = A18621[31:0];
assign A148[7:0]  = A83[7:0];
assign A1855a[2:0]  = A89[2:0];
assign A18559[31:0] = A81[31:0];
assign A149         = A185c1[0];
assign A18558[31:0] = A18620[31:0];
assign A14a         = A185c1[1];
assign A18557[31:0] = A82[31:0];
assign A14b         = A185c1[2];
assign A18553[8:0]   = Af0[8:0];
endmodule
