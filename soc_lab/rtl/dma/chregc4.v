/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module chregc4(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'hC0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
