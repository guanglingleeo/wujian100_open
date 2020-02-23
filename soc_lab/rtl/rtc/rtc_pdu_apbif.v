/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

`define RTC_CDR_OFFSET     0
`define RTC_MR_OFFSET      1
`define RTC_CLR_OFFSET     2
`define RTC_CR_OFFSET      3
`define RTC_STAT_OFFSET    4
`define RTC_RSTAT_OFFSET   5
`define RTC_EOI_OFFSET     6
`define RTC_VID_OFFSET     7
`define RTC_CLK_DIV        8
`define RTC_VERSION_ID     32'h3230312a
module rtc_pdu_apbif(
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  cnt_sync,
  int_flag,
  paddr,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  test_mode,
  wen_clr
);
input   [3 :0]  aou_pdu_cr_reg;   
input   [19:0]  aou_pdu_div_reg;  
input           aou_pdu_intr_mask; 
input   [31:0]  aou_pdu_mr_reg;   
input   [31:0]  cnt_sync;         
input           int_flag;         
input   [31:0]  paddr;            
input           pclk;             
input           penable;          
input           presetn;          
input           psel;             
input   [31:0]  pwdata;           
input           pwrite;           
input           test_mode;        
output  [31:0]  pdu_aou_clr_reg;  
output          pdu_aou_int_clr;  
output          pdu_aou_wen_cr;   
output          pdu_aou_wen_div;  
output          pdu_aou_wen_mr;   
output  [31:0]  prdata;           
output          wen_clr;          
reg     [31:0]  clr_reg;          
reg             int_clr;          
reg             int_state;        
reg     [31:0]  prdata;           
reg             ren_cdr;          
reg             ren_clr;          
reg             ren_cr;           
reg             ren_div;          
reg             ren_eoi;          
reg             ren_mr;           
reg             ren_rstat;        
reg             ren_stat;         
reg             ren_vid;          
reg             wen_clr;          
reg             wen_cr;           
reg             wen_div;          
reg             wen_mr;           
wire    [3 :0]  aou_pdu_cr_reg;   
wire    [19:0]  aou_pdu_div_reg;  
wire            aou_pdu_intr_mask; 
wire    [31:0]  aou_pdu_mr_reg;   
wire            aou_pdu_rstat;    
wire            aou_pdu_stat;     
wire    [31:0]  cdr_reg;          
wire    [31:0]  cnt_sync;         
wire    [3 :0]  cr_reg;           
wire    [19:0]  div_reg;          
wire            int_flag;         
wire    [31:0]  mr_reg;           
wire    [31:0]  paddr;            
wire            pclk;             
wire            pclk_clr;         
wire    [31:0]  pdu_aou_clr_reg;  
wire            pdu_aou_int_clr;  
wire            pdu_aou_ren_eoi;  
wire            pdu_aou_wen_cr;   
wire            pdu_aou_wen_div;  
wire            pdu_aou_wen_mr;   
wire            penable;          
wire            presetn;          
wire            psel;             
wire    [31:0]  pwdata;           
wire            pwrite;           
wire            test_mode;        
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_MR_OFFSET))
       wen_mr = 1'b1;
   else
       wen_mr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CLR_OFFSET))
       wen_clr = 1'b1;
   else
       wen_clr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CR_OFFSET))
       wen_cr = 1'b1;
   else
       wen_cr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CLK_DIV))
       wen_div = 1'b1;
   else
       wen_div = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CDR_OFFSET))
      ren_cdr = 1'b1;
   else
      ren_cdr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_MR_OFFSET))
      ren_mr = 1'b1;
   else
      ren_mr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CLR_OFFSET))
      ren_clr = 1'b1;
   else
      ren_clr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CR_OFFSET))
      ren_cr = 1'b1;
   else
      ren_cr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_STAT_OFFSET))
      ren_stat = 1'b1;
   else
      ren_stat = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_RSTAT_OFFSET))
      ren_rstat = 1'b1;
   else
      ren_rstat = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_EOI_OFFSET))
      ren_eoi = 1'b1;
   else
      ren_eoi = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_VID_OFFSET))
      ren_vid = 1'b1;
   else
      ren_vid = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CLK_DIV))
      ren_div = 1'b1;
   else
      ren_div = 1'b0;
 end
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_clr            ),
  .external_en          (wen_clr             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @ (posedge pclk_clr or negedge presetn)
 begin
   if(~presetn)
     clr_reg[31:0] <= 32'b0;
   else
     clr_reg[31:0] <= pwdata[31:0];
 end
always @( mr_reg[31:0]
       or ren_cr
       or ren_eoi
       or cr_reg[3:0]
       or aou_pdu_rstat
       or cdr_reg[31:0]
       or ren_cdr
       or ren_rstat
       or ren_div
       or div_reg[19:0]
       or ren_mr
       or clr_reg[31:0]
       or ren_vid
       or ren_clr
       or ren_stat
       or aou_pdu_stat)
begin
 begin
   if(ren_cdr)
     begin
       prdata[31:0] = cdr_reg[31:0];
     end
   else if(ren_mr)
     begin
       prdata[31:0] = mr_reg[31:0];
     end
   else if(ren_clr)
     begin
       prdata[31:0] = clr_reg[31:0];
     end
   else if(ren_cr)
     begin
       prdata[31:0] = {28'b0,cr_reg[3:0]};
     end
   else if(ren_stat)
     begin
       prdata[31:0] = {31'b0,aou_pdu_stat};
     end
   else if(ren_rstat)
     begin
       prdata[31:0] = {31'b0,aou_pdu_rstat};
     end
   else if(ren_eoi)
     begin
       prdata[31:0] = 32'b0;
     end
   else if(ren_vid)
     begin
       prdata[31:0] = `RTC_VERSION_ID;
     end
   else if(ren_div)
     begin
       prdata[31:0] = {12'b0,div_reg[19:0]};
     end
   else
       prdata[31:0] = 32'b0;
 end
end
always @(posedge pclk or negedge presetn)
begin
  if(~presetn)
    begin
      int_clr <= 1'b0;
    end
  else if (int_flag && pdu_aou_ren_eoi)
    begin
      int_clr <= 1'b1;
    end
  else if (int_flag)
    begin
      int_clr <= int_clr;
    end
  else 
    begin
      int_clr <= 1'b0;
    end
end
assign pdu_aou_int_clr = int_clr;
always @(posedge pclk or negedge presetn)
begin
  if(~presetn)
    begin
      int_state <= 1'b0;
    end
  else if (int_clr)
    begin
      int_state <= 1'b0;
    end
  else if (int_flag)
    begin
      int_state <= 1'b1;
    end
end
assign aou_pdu_rstat = int_state;
assign aou_pdu_stat = aou_pdu_intr_mask ? 1'b0 : int_state;
 assign mr_reg[31:0] = aou_pdu_mr_reg[31:0];
 assign cr_reg[ 3:0] = aou_pdu_cr_reg[ 3:0];
 assign div_reg[19:0] = aou_pdu_div_reg[19:0];
 assign cdr_reg[31:0] = cnt_sync[31:0];
 assign pdu_aou_clr_reg[31:0] = clr_reg[31:0];
 assign pdu_aou_ren_eoi = ren_eoi;
 assign pdu_aou_wen_mr = wen_mr;
 assign pdu_aou_wen_cr = wen_cr;
 assign pdu_aou_wen_div = wen_div;
endmodule
