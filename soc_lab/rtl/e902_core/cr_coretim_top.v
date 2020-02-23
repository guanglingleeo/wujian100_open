/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_coretim_top(
  core_dbgon,
  coretim_tcipif_cmplt,
  coretim_tcipif_rdata,
  cpurst_b,
  ctim_pad_int_vld,
  forever_cpuclk,
  forever_cpuclk_nogated,
  pad_ctim_calib,
  pad_ctim_refclk,
  pad_yy_gate_clk_en_b,
  pad_yy_test_mode,
  tcipif_coretim_addr,
  tcipif_coretim_sel,
  tcipif_coretim_wdata,
  tcipif_coretim_write
);
input           core_dbgon;            
input           cpurst_b;              
input           forever_cpuclk;        
input           forever_cpuclk_nogated; 
input   [25:0]  pad_ctim_calib;        
input           pad_ctim_refclk;       
input           pad_yy_gate_clk_en_b;  
input           pad_yy_test_mode;      
input   [15:0]  tcipif_coretim_addr;   
input           tcipif_coretim_sel;    
input   [31:0]  tcipif_coretim_wdata;  
input           tcipif_coretim_write;  
output          coretim_tcipif_cmplt;  
output  [31:0]  coretim_tcipif_rdata;  
output          ctim_pad_int_vld;      
reg     [23:0]  cnt;                   
reg     [31:0]  coretim_tcipif_rdata;  
reg             csr_clksrc;            
reg             csr_cntflg;            
reg             csr_en;                
reg             csr_tickint;           
reg             is_counting;           
reg             refclk_ff1;            
reg             refclk_ff2;            
reg             refclk_ff3;            
reg     [23:0]  rvr;                   
wire            calib_noref;           
wire            calib_skew;            
wire    [23:0]  calib_tecrs;           
wire            cnt_23_1_is_zero;      
wire            cnt_clk;               
wire            cnt_clk_en;            
wire            cnt_en;                
wire            cnt_en_cpuclk;         
wire            cnt_en_pre;            
wire            cnt_en_refclk;         
wire            cnt_is_one;            
wire            cnt_is_zero;           
wire    [23:0]  cnt_value;             
wire            core_dbgon;            
wire            coretim_reg_ren;       
wire            coretim_reg_sel;       
wire            coretim_reg_wen;       
wire            coretim_rst_b;         
wire            coretim_tcipif_cmplt;  
wire            cpuclk;                
wire            cpuclk_nogated;        
wire            cpurst_b;              
wire            csr_cntflg_clk_en;     
wire            csr_ren;               
wire            csr_wen;               
wire            ct_reg_cpuclk;         
wire            ct_reg_en;             
wire            ctim_pad_int_vld;      
wire    [23:0]  cvr;                   
wire            cvr_wen;               
wire            dbgon;                 
wire            forever_cpuclk;        
wire            forever_cpuclk_nogated; 
wire    [25:0]  pad_ctim_calib;        
wire            pad_ctim_refclk;       
wire            pad_yy_gate_clk_en_b;  
wire            pad_yy_test_mode;      
wire            reach_zero;            
wire            refclk;                
wire            refclk_ff2_ff3_pulse;  
wire            rvr_wen;               
wire            syn_clk;               
wire            syn_ff_clk_en;         
wire    [15:0]  tcipif_coretim_addr;   
wire            tcipif_coretim_sel;    
wire    [31:0]  tcipif_coretim_wdata;  
wire            tcipif_coretim_write;  
assign dbgon          = core_dbgon;
assign coretim_rst_b  = cpurst_b;
assign refclk         = pad_ctim_refclk;
assign cpuclk_nogated = forever_cpuclk_nogated;
assign cpuclk         = forever_cpuclk;
assign coretim_reg_sel = tcipif_coretim_sel && (tcipif_coretim_addr[7:4]==4'h1);
assign coretim_reg_wen = coretim_reg_sel && tcipif_coretim_write;
assign coretim_reg_ren = coretim_reg_sel && !tcipif_coretim_write;
assign csr_wen = coretim_reg_wen && (tcipif_coretim_addr[3:2]==2'b00);
assign rvr_wen = coretim_reg_wen && (tcipif_coretim_addr[3:2]==2'b01);
assign cvr_wen = coretim_reg_wen && (tcipif_coretim_addr[3:2]==2'b10);
assign csr_ren = coretim_reg_ren && (tcipif_coretim_addr[3:2]==2'b00);
always @( rvr[23:0]
       or calib_skew
       or cvr[23:0]
       or tcipif_coretim_addr[3:2]
       or csr_clksrc
       or coretim_reg_ren
       or csr_en
       or calib_noref
       or csr_cntflg
       or csr_tickint
       or calib_tecrs[23:0])
begin
  case({coretim_reg_ren, tcipif_coretim_addr[3:2]})
  3'b100:
    coretim_tcipif_rdata[31:0] = {15'b0, csr_cntflg, 13'b0, csr_clksrc,
                               csr_tickint, csr_en};
  3'b101:
    coretim_tcipif_rdata[31:0] = {8'b0, rvr[23:0]};
  3'b110:
    coretim_tcipif_rdata[31:0] = {8'b0, cvr[23:0]};
  3'b111:
    coretim_tcipif_rdata[31:0] = {calib_noref, calib_skew, 6'b0,
                                  calib_tecrs[23:0]};
  default:
    coretim_tcipif_rdata[31:0] = 32'b0;
  endcase
end
assign coretim_tcipif_cmplt = tcipif_coretim_sel;
assign ct_reg_en = csr_wen|rvr_wen;
gated_clk_cell  x_ct_reg_gated (
  .clk_in               (cpuclk              ),
  .clk_out              (ct_reg_cpuclk       ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ct_reg_en           ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge ct_reg_cpuclk or negedge coretim_rst_b)
begin
  if(!coretim_rst_b) begin
    csr_en <= 1'b0;
    csr_tickint <= 1'b0;
  end
  else if(csr_wen) begin
    csr_en <= tcipif_coretim_wdata[0];
    csr_tickint <= tcipif_coretim_wdata[1];
  end
  else begin
    csr_en <= csr_en;
    csr_tickint <= csr_tickint;
  end
end
always @(posedge ct_reg_cpuclk or negedge coretim_rst_b)
begin
  if(!coretim_rst_b)
    csr_clksrc <= 1'b1;
  else if(csr_wen && ~calib_noref)
    csr_clksrc <= tcipif_coretim_wdata[2];
  else
    csr_clksrc <= csr_clksrc;
end
assign csr_cntflg_clk_en = cvr_wen || reach_zero || csr_ren;
always @(posedge cnt_clk or negedge coretim_rst_b)
begin
  if(!coretim_rst_b)
    csr_cntflg <= 1'b0;
  else if(cvr_wen)
    csr_cntflg <= 1'b0;
  else if (reach_zero)
    csr_cntflg <= 1'b1;
  else if (csr_ren)
    csr_cntflg <= 1'b0;
  else
    csr_cntflg <= csr_cntflg;
end
always @(posedge ct_reg_cpuclk)
begin
  if(rvr_wen)
    rvr[23:0] <= tcipif_coretim_wdata[23:0];
  else
    rvr[23:0] <= rvr[23:0];
end
assign cvr[23:0] = cnt_value[23:0] ;
assign calib_noref       = pad_ctim_calib[25];
assign calib_skew        = pad_ctim_calib[24];
assign calib_tecrs[23:0] = pad_ctim_calib[23:0];
assign ctim_pad_int_vld = csr_tickint ? csr_cntflg : 1'b0;
assign cnt_en_pre    = csr_en && !((rvr[23:0] == 24'b0) && cnt_is_zero);
assign cnt_en_cpuclk = cnt_en_pre;
assign cnt_en_refclk = cnt_en_pre && refclk_ff2_ff3_pulse;
assign cnt_en        = csr_clksrc ? cnt_en_cpuclk : cnt_en_refclk;
assign syn_ff_clk_en = csr_en && !csr_clksrc;
gated_clk_cell  x_syn_gated (
  .clk_in               (cpuclk_nogated      ),
  .clk_out              (syn_clk             ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (syn_ff_clk_en       ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge syn_clk or negedge coretim_rst_b)
begin
  if(!coretim_rst_b) begin
    refclk_ff1 <= 1'b0;
    refclk_ff2 <= 1'b0;
    refclk_ff3 <= 1'b0;
  end
  else begin
    refclk_ff1 <= refclk;
    refclk_ff2 <= refclk_ff1;
    refclk_ff3 <= refclk_ff2;
  end
end
assign refclk_ff2_ff3_pulse = refclk_ff2 && !refclk_ff3;
assign cnt_clk_en = cvr_wen || cnt_en || is_counting || csr_cntflg_clk_en;
gated_clk_cell  x_cnt_gated (
  .clk_in               (cpuclk_nogated      ),
  .clk_out              (cnt_clk             ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (cnt_clk_en          ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    )
);
always @(posedge cnt_clk)
begin
  if(cvr_wen)
    cnt[23:0] <= 24'b0;
  else if(dbgon)
    cnt[23:0] <= cnt[23:0];
  else if(cnt_en)
  begin
    if(cnt_is_zero)
      cnt[23:0] <= rvr[23:0];
    else
      cnt[23:0] <= cnt[23:0] - 24'b1;
  end
  else
    cnt[23:0] <= cnt[23:0];
end
always @(posedge cnt_clk or negedge coretim_rst_b)
begin
  if(!coretim_rst_b)
    is_counting <= 1'b0;
  else if(cvr_wen)
    is_counting <= 1'b0;
  else if(dbgon)
    is_counting <= is_counting;
  else if(cnt_is_one && cnt_en)
    is_counting <= 1'b1;
  else if(is_counting)
    is_counting <= 1'b0;
  else
    is_counting <= is_counting;
end
assign cnt_23_1_is_zero = (cnt[23:1] == 23'b0);
assign cnt_is_zero = (cnt_23_1_is_zero && (cnt[0]==1'b0));
assign cnt_is_one  = (cnt_23_1_is_zero && (cnt[0]==1'b1));
assign reach_zero = cnt_is_zero && is_counting;
assign cnt_value[23:0] = cnt[23:0];
endmodule
