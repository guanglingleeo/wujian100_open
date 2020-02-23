/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module fsmc(
  busy_chn_code_x,
  chn_etb_htfr_done,
  chn_etb_tfr_done,
  chn_etb_trgevt_done,
  chnc_gbc_chbsy,
  chnc_gbc_chnchgen,
  chnc_gbc_chnen,
  chnc_gbc_trgclr,
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
  gbc_chnc_dmacen,
  gbc_chnc_hpreqvld,
  gbc_chnc_reqvld,
  hclk,
  hrst_n,
  m_addr_chn,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hsize_chn,
  m_hwdata_chn,
  m_hwrite_chn,
  m_prot_chn,
  regc_fsmc_chn_srcdtlgc
);
input           busy_chn_code_x;          
input           chnc_gbc_chnen;           
input   [11:0]  chregc_fsmc_block_tl;     
input   [2 :0]  chregc_fsmc_chintmdc;     
input   [31:0]  chregc_fsmc_darn;         
input           chregc_fsmc_dgrpaddrc;    
input   [1 :0]  chregc_fsmc_dinc;         
input   [1 :0]  chregc_fsmc_dst_tr_width; 
input           chregc_fsmc_endlan;       
input   [5 :0]  chregc_fsmc_group_len;    
input           chregc_fsmc_grpmc;        
input   [3 :0]  chregc_fsmc_protctl;      
input   [31:0]  chregc_fsmc_sarn;         
input           chregc_fsmc_sgrpaddrc;    
input   [1 :0]  chregc_fsmc_sinc;         
input   [1 :0]  chregc_fsmc_src_tr_width; 
input   [1 :0]  chregc_fsmc_trgtmdc;      
input           gbc_chnc_dmacen;          
input           gbc_chnc_hpreqvld;        
input           gbc_chnc_reqvld;          
input           hclk;                     
input           hrst_n;                   
input   [31:0]  m_hrdata;                 
input           m_hready;                 
input   [1 :0]  m_hresp;                  
input           regc_fsmc_chn_srcdtlgc;   
output          chn_etb_htfr_done;        
output          chn_etb_tfr_done;         
output          chn_etb_trgevt_done;      
output          chnc_gbc_chbsy;           
output          chnc_gbc_chnchgen;        
output          chnc_gbc_trgclr;          
output          fsmc_chregc_err_vld;      
output          fsmc_chregc_htfr_vld;     
output          fsmc_chregc_pdvld;        
output          fsmc_chregc_tfr_vld;      
output          fsmc_chregc_trgetcmp_vld; 
output          fsmc_regc_chnen_clr;      
output  [31:0]  m_addr_chn;               
output  [2 :0]  m_hsize_chn;              
output  [31:0]  m_hwdata_chn;             
output          m_hwrite_chn;             
output  [3 :0]  m_prot_chn;               
reg     [31:0]  buffrdata;                
reg     [31:0]  buffrdata_nxt;            
reg             channl_end_st;            
reg             chnc_gbc_pdvld_d0;        
reg     [12:0]  cntr_blk;                 
reg     [5 :0]  cntr_grup;                
reg     [2 :0]  cntr_rdsrc;               
reg     [2 :0]  cntr_rdsrcctrl;           
reg     [2 :0]  cntr_wrdst;               
reg     [2 :0]  cntr_wrdstctrl;           
reg     [31:0]  dst_waddr;                
reg     [31:0]  dst_waddr_nxt;            
reg             fsmc_chregc_htfr_vld_i_d0; 
reg     [4 :0]  hbus_stt;                 
reg     [4 :0]  hbus_stt_nxt;             
reg             latch_rddata;             
reg             latch_wrdata;             
reg     [31:0]  m_hwdata;                 
reg     [7 :0]  rdata_byte;               
reg     [15:0]  rdata_halfw;              
reg     [31:0]  rdata_word;               
reg     [1 :0]  s_data_sel;               
reg     [31:0]  src_raddr;                
reg     [31:0]  src_raddr_nxt;            
reg             trgevent_end_st;          
reg     [7 :0]  wdata_byte;               
reg     [15:0]  wdata_hword;              
wire            blk_evtend;               
wire            blk_nu_eql0;              
wire            blk_nu_last1;             
wire    [12:0]  block_transfer_length;    
wire            busy_chn_code_x;          
wire            cfg_en;                   
wire            channl_end;               
wire    [31:0]  chi_m_addr;               
wire    [2 :0]  chi_m_hsize;              
wire    [31:0]  chi_m_hwdata;             
wire    [3 :0]  chi_m_prot;               
wire            chn_etb_htfr_done;        
wire            chn_etb_tfr_done;         
wire            chn_etb_trgevt_done;      
wire            chnc_gbc_chbsy;           
wire            chnc_gbc_chnchgen;        
wire            chnc_gbc_chnen;           
wire            chnc_gbc_pdvld_nxt;       
wire            chnc_gbc_trgclr;          
wire    [11:0]  chregc_fsmc_block_tl;     
wire    [12:0]  chregc_fsmc_block_tl_plus; 
wire    [2 :0]  chregc_fsmc_chintmdc;     
wire    [31:0]  chregc_fsmc_darn;         
wire    [31:0]  chregc_fsmc_darn_i;       
wire            chregc_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc_fsmc_dinc;         
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;       
wire    [5 :0]  chregc_fsmc_group_len;    
wire            chregc_fsmc_grpmc;        
wire    [3 :0]  chregc_fsmc_protctl;      
wire    [31:0]  chregc_fsmc_sarn;         
wire    [31:0]  chregc_fsmc_sarn_i;       
wire            chregc_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc_fsmc_sinc;         
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;      
wire            cntr_blk_decen;           
wire            cntr_blk_rlden;           
wire            cntr_grup_decen;          
wire            cntr_grup_rlden;          
wire            current_rcvvld;           
wire            dec_dst_cntr;             
wire            dec_src_cntr;             
wire            dst_sgl_end;              
wire            dst_single_inten;         
wire    [2 :0]  dst_trbyt;                
wire            dst_wr_1;                 
wire            dst_wr_end;               
wire            dst_wrctrl_cmplt;         
wire            fsmc_chregc_err_vld;      
wire            fsmc_chregc_htfr_vld;     
wire            fsmc_chregc_htfr_vld_i;   
wire            fsmc_chregc_pdvld;        
wire            fsmc_chregc_tfr_vld;      
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;      
wire            gbc_chnc_dmacen;          
wire            gbc_chnc_hpreqvld;        
wire            gbc_chnc_reqvld;          
wire            group_evtend;             
wire            group_inten;              
wire            grp_nu_eql0;              
wire            grp_nu_last1;             
wire            hclk;                     
wire            hrst_n;                   
wire            is_grpevt;                
wire            is_rd_ctrlstt;            
wire            is_sgl_dst;               
wire            is_sgl_src;               
wire            is_sglevt;                
wire            is_wr_ctrlstt;            
wire            last_wr_transf;           
wire            latch_rddata_en;          
wire            latch_wrdata_en;          
wire    [31:0]  m_addr_chn;               
wire    [31:0]  m_hrdata;                 
wire            m_hready;                 
wire    [1 :0]  m_hresp;                  
wire    [2 :0]  m_hsize_chn;              
wire    [31:0]  m_hwdata_chn;             
wire            m_hwrite_chn;             
wire    [3 :0]  m_prot_chn;               
wire            rd1_sgl_end;              
wire            rd_addr_upen;             
wire            rdmrth1_sgl_end;          
wire            regc_fsmc_chn_srcdtlgc;   
wire            rladen_dst_cntr;          
wire            rladen_dstwctrl_cntr;     
wire            rladen_src_cntr;          
wire            rladen_srcrctrl_cntr;     
wire            sgl_evtend;               
wire            src_rd_1;                 
wire            src_rd_end;               
wire            src_rdctrl_cmplt;         
wire            src_sgl_end;              
wire            src_single_inten;         
wire    [2 :0]  src_trbyt;                
wire            tg_dst_sglevt;            
wire            tg_src_sglevt;            
wire            trgevent_end;             
wire            wr_addr_upen;             
parameter        IDLE_BUS                           =   5'h1  ; 
parameter        WAIT_RRDY_DRADR_BUS                =   5'h2  ; 
parameter        WAIT_RRDY_DWADR_BUS                =   5'h10 ; 
parameter        WAIT_WRDY_DWADR_BUS                =   5'h18 ; 
parameter        WAIT_WRDY_DRADR_BUS                =   5'h4  ; 
assign     src_trbyt[2:0] = (chregc_fsmc_src_tr_width[1:0]==2'b00) ? 3'b001 : 
                            (chregc_fsmc_src_tr_width[1:0]==2'b01) ? 3'b010 : 
                            3'b100 ; 
assign     dst_trbyt[2:0] = (chregc_fsmc_dst_tr_width[1:0]==2'b00) ? 3'b001 : 
                            (chregc_fsmc_dst_tr_width[1:0]==2'b01) ? 3'b010 : 
                            3'b100 ;  
assign     src_rd_1 = ~( src_trbyt[2:0] < dst_trbyt[2:0] ) ;
assign     src_rdctrl_cmplt = ( ~(|cntr_rdsrcctrl[2:0]) );
assign     dst_wr_1         = ~( src_trbyt[2:0] > dst_trbyt[2:0] ) ;
assign     dst_wrctrl_cmplt = ( ~(|cntr_wrdstctrl[2:0]) )  ;    
assign     src_single_inten = (chregc_fsmc_chintmdc[2]) ;
assign     dst_single_inten = (chregc_fsmc_chintmdc[1]) ;
assign     group_inten      = (chregc_fsmc_chintmdc[0]) | dst_single_inten | src_single_inten ;
assign     chi_m_prot[3:0]    =  chregc_fsmc_protctl[3:0] ;
assign     chi_m_hsize[2:0]   =  (is_rd_ctrlstt ) ? {1'b0,chregc_fsmc_src_tr_width[1:0]} : {1'b0,chregc_fsmc_dst_tr_width[1:0]} ; 
assign     chi_m_addr[31:0]   =  is_wr_ctrlstt ? dst_waddr[31:0] : src_raddr[31:0] ;
assign     m_prot_chn[3:0]    =  chi_m_prot[3:0]    ;        
assign     m_hwrite_chn       =  is_wr_ctrlstt      ;     
assign     m_addr_chn[31:0]   =  chi_m_addr[31:0]   ; 
assign     m_hsize_chn[2:0]   =  chi_m_hsize[2:0]   ;      
assign     m_hwdata_chn[31:0] =  chi_m_hwdata[31:0] ;
always @(posedge hclk or negedge hrst_n)
begin
   if(!hrst_n)
      s_data_sel[1:0] <= 2'b0;
   else if(m_hready)
      s_data_sel[1:0] <= chi_m_addr[1:0] ;
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[7:0]   : m_hrdata[31:24] ;
         2'b01  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[15:8]  : m_hrdata[23:16] ;
         2'b10  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[23:16] : m_hrdata[15:8]  ;
         2'b11  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:24] : m_hrdata[7:0]   ;
         default: rdata_byte[7:0] = 8'h0;
     endcase
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00: rdata_halfw[15:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[15:0]  : {m_hrdata[23:16],m_hrdata[31:24]};
         2'b10: rdata_halfw[15:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:16] : {m_hrdata[7:0],m_hrdata[15:8]};
         default: rdata_halfw[15:0] = 16'h0;
     endcase
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00: rdata_word[31:0] =  (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:0] : {m_hrdata[7:0],m_hrdata[15:8],m_hrdata[23:16],m_hrdata[31:24]};
         default: rdata_word[31:0] = 32'h0;
     endcase
end
always @( src_trbyt[2:0]
       or rdata_word[31:0]
       or latch_rddata_en
       or cntr_rdsrc[2:0]
       or rdata_halfw[15:0]
       or buffrdata[31:0]
       or rdata_byte[7:0])
begin
    case(src_trbyt[2:0])
        3'b001 : begin 
             if( (cntr_rdsrc[2:0] ==3'b011) & (latch_rddata_en) )      
                 buffrdata_nxt[31:0] = {24'h0,rdata_byte[7:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b010) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {16'h0,rdata_byte[7:0],buffrdata[7:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b001) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {8'h0,rdata_byte[7:0],buffrdata[15:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b000) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {rdata_byte[7:0],buffrdata[23:0]} ;
             else 
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        3'b010 : begin 
             if( (| cntr_rdsrc[2:1]) & (latch_rddata_en) )      
                 buffrdata_nxt[31:0] = {16'h0,rdata_halfw[15:0]} ;
             else if( latch_rddata_en )      
                 buffrdata_nxt[31:0] = {rdata_halfw[15:0],buffrdata[15:0]} ;
             else 
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        3'b100 : begin 
             if(latch_rddata_en)
                 buffrdata_nxt[31:0] = rdata_word[31:0] ;
             else
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        default : begin 
             buffrdata_nxt[31:0] = rdata_word[31:0] ;
        end
    endcase
end
always@(posedge  hclk or negedge hrst_n) 
begin
    if(~hrst_n)     begin
        buffrdata[31:0] <= 32'b0 ;
    end
    else    begin
        buffrdata[31:0] <= buffrdata_nxt[31:0] ;
    end
end
always @( buffrdata[15:0]
       or buffrdata[31:16]
       or cntr_wrdst[2:0])
begin
             if( (cntr_wrdst[2:0] ==3'b000)  )      
                 wdata_byte[7:0] = buffrdata[7:0] ;
             else if( (cntr_wrdst[2:0] ==3'b001)  )      
                 wdata_byte[7:0] = buffrdata[15:8] ;
             else if( (cntr_wrdst[2:0] ==3'b010)  )      
                 wdata_byte[7:0] = buffrdata[23:16] ;
             else
                 wdata_byte[7:0] = buffrdata[31:24] ;
end
always @( cntr_wrdst[2:0]
       or buffrdata[31:0])
begin
             if (cntr_wrdst[2:0] ==3'b000)       
                 wdata_hword[15:0] = buffrdata[15:0] ;
             else
                 wdata_hword[15:0] = buffrdata[31:16] ;
end
always @( wdata_hword[15:0]
       or chregc_fsmc_endlan
       or wdata_byte[7:0]
       or buffrdata[31:0]
       or s_data_sel[1:0]
       or dst_trbyt[2:0])
begin
    case(dst_trbyt[2:0])
        3'b001 : begin 
             if(  ( s_data_sel[1:0]==2'b00) & (~chregc_fsmc_endlan) )      
                 m_hwdata[31:0] = {24'h0,wdata_byte[7:0]} ;
             else if(  ( s_data_sel[1:0]==2'b00) & (chregc_fsmc_endlan) )      
                 m_hwdata[31:0] = {wdata_byte[7:0],24'h0} ;
             else if(  ( s_data_sel[1:0]==2'b01) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_byte[7:0],8'h0} ;
             else if(  ( s_data_sel[1:0]==2'b01) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {8'h0,wdata_byte[7:0],16'h0} ;
             else if(  ( s_data_sel[1:0]==2'b10) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {8'h0,wdata_byte[7:0],16'h0} ;
             else if(  ( s_data_sel[1:0]==2'b10) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_byte[7:0],8'h0} ;
             else if(~chregc_fsmc_endlan)
                 m_hwdata[31:0] = {wdata_byte[7:0],24'h0} ;
              else
                 m_hwdata[31:0] = {24'h0,wdata_byte[7:0]} ;
        end
        3'b010 : begin 
             if(  ( s_data_sel[1:0]==2'b00) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_hword[15:0]} ;
             else if(  ( s_data_sel[1:0]==2'b00) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {wdata_hword[7:0],wdata_hword[15:8],16'h0} ;
             else if (~chregc_fsmc_endlan) 
                 m_hwdata[31:0] = {wdata_hword[15:0],16'h0} ;
             else
                 m_hwdata[31:0] = {16'h0,wdata_hword[7:0],wdata_hword[15:8]} ;
        end
        3'b100 : begin 
             if  (~chregc_fsmc_endlan)
                 m_hwdata[31:0] = buffrdata[31:0] ;
             else
                 m_hwdata[31:0] = { buffrdata[7:0],buffrdata[15:8],buffrdata[23:16],buffrdata[31:24]} ;
        end
        default : begin 
             m_hwdata[31:0] = buffrdata[31:0] ;
        end
    endcase
end
assign    chi_m_hwdata[31:0] = m_hwdata[31:0] ;
assign   chregc_fsmc_darn_i[31:0] = (dst_trbyt[2:0]==3'h2) ? {chregc_fsmc_darn[31:1],1'b0} :
                                    (dst_trbyt[2:0]==3'h4) ? {chregc_fsmc_darn[31:2],2'b0} : chregc_fsmc_darn[31:0] ;
assign   wr_addr_upen = is_wr_ctrlstt & current_rcvvld ;
always @( hbus_stt[4:0]
       or dst_waddr[31:0]
       or chregc_fsmc_darn_i[31:0]
       or group_evtend
       or chregc_fsmc_dgrpaddrc
       or chregc_fsmc_dinc[1:0]
       or dst_trbyt[2:0]
       or wr_addr_upen)
begin
    dst_waddr_nxt[31:0] = (hbus_stt[4:0]==IDLE_BUS)                         ? chregc_fsmc_darn_i[31:0]         :
                          group_evtend  & chregc_fsmc_dgrpaddrc             ? chregc_fsmc_darn_i[31:0]         :    
                          chregc_fsmc_dinc[1]                               ? chregc_fsmc_darn_i[31:0]         :    
                          wr_addr_upen  & (chregc_fsmc_dinc[1:0]==2'b00)    ? (dst_waddr[31:0]+dst_trbyt[2:0]) :   
                          wr_addr_upen  & (chregc_fsmc_dinc[1:0]==2'b01)    ? (dst_waddr[31:0]-dst_trbyt[2:0]) :   
                          dst_waddr[31:0] ; 
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        dst_waddr[31:0] <= 32'b0 ;
    end
    else    begin
        dst_waddr[31:0] <= dst_waddr_nxt[31:0] ;
    end
end
assign   chregc_fsmc_sarn_i[31:0] = (src_trbyt[2:0]==3'h2) ? {chregc_fsmc_sarn[31:1],1'b0} :
                                    (src_trbyt[2:0]==3'h4) ? {chregc_fsmc_sarn[31:2],2'b0} : chregc_fsmc_sarn[31:0] ;
assign   rd_addr_upen = is_rd_ctrlstt & current_rcvvld ;
always @( hbus_stt[4:0]
       or chregc_fsmc_sgrpaddrc
       or rd_addr_upen
       or src_trbyt[2:0]
       or group_evtend
       or src_raddr[31:0]
       or current_rcvvld
       or chregc_fsmc_sarn_i[31:0]
       or chregc_fsmc_sinc[1:0])
begin
    src_raddr_nxt[31:0] = (hbus_stt[4:0]==IDLE_BUS) &(~current_rcvvld)        ? chregc_fsmc_sarn_i[31:0]         :
                          group_evtend  & chregc_fsmc_sgrpaddrc               ? chregc_fsmc_sarn_i[31:0]         :    
                          chregc_fsmc_sinc[1]                                 ? chregc_fsmc_sarn_i[31:0]         :    
                          rd_addr_upen  & (chregc_fsmc_sinc[1:0]==2'b00)      ? (src_raddr[31:0]+src_trbyt[2:0]) :
                          rd_addr_upen  & (chregc_fsmc_sinc[1:0]==2'b01)      ? (src_raddr[31:0]-src_trbyt[2:0]) :
                          src_raddr[31:0] ;
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        src_raddr[31:0] <= 32'b0 ;
    end
    else    begin
        src_raddr[31:0] <= src_raddr_nxt[31:0] ;
    end
end
assign   is_sglevt = ( chregc_fsmc_trgtmdc[1:0] == 2'b00 ) ;
assign   is_grpevt = ( chregc_fsmc_trgtmdc[1:0] == 2'b01 ) ;
assign   tg_src_sglevt = is_sglevt &  is_sgl_src ;
assign   tg_dst_sglevt = is_sglevt &  is_sgl_dst ;
assign   is_sgl_src =  chregc_fsmc_grpmc ;
assign   is_sgl_dst = ~chregc_fsmc_grpmc ;
assign   cntr_grup_decen =  ( is_wr_ctrlstt ) & current_rcvvld & ( is_grpevt | group_inten ) ;                     
assign   cntr_grup_rlden =  (hbus_stt[4:0]==IDLE_BUS) | ( ~(|cntr_grup[5:0]) ) & current_rcvvld & (is_wr_ctrlstt) ;  
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_grup[5:0] <= 6'b0 ;
    end
    else  if( cntr_grup_rlden )
        cntr_grup[5:0] <= #1 (chregc_fsmc_group_len[5:0]+1'b1) - dst_trbyt[2:0]  ;
    else if( cntr_grup_decen )
        cntr_grup[5:0] <= #1 cntr_grup[5:0] - dst_trbyt[2:0] ;
end
assign   grp_nu_eql0 = ( ~ (|cntr_grup[5:0]) ) ; 
assign   group_evtend = is_grpevt & grp_nu_eql0 & current_rcvvld & is_wr_ctrlstt ;
assign   rd1_sgl_end     = ( dst_wrctrl_cmplt | dst_wr_1 ) & is_wr_ctrlstt ;
assign   rdmrth1_sgl_end = (~src_rdctrl_cmplt) & is_rd_ctrlstt & (~src_rd_1) ;
assign   src_rd_end      = rd1_sgl_end | rdmrth1_sgl_end ;
assign   src_sgl_end = src_rd_end & current_rcvvld ;
assign   dst_wr_end  = is_wr_ctrlstt ;
assign   dst_sgl_end = dst_wr_end & current_rcvvld ; 
assign   sgl_evtend  =  is_sglevt & (
                        tg_src_sglevt & src_sgl_end  |
                        tg_dst_sglevt & dst_sgl_end    ) ;
assign   cntr_blk_decen = ( is_wr_ctrlstt ) & current_rcvvld & (~blk_nu_eql0) ; //& is_blk_src |  
assign   cntr_blk_rlden = (hbus_stt[4:0]==IDLE_BUS) ;
assign chregc_fsmc_block_tl_plus[12:0] = chregc_fsmc_block_tl[11:0] + 12'b1;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_blk[12:0] <= 13'h1FFF ;
    end
    else  if( cntr_blk_decen  )
        cntr_blk[12:0] <=  cntr_blk[12:0] - dst_trbyt[2:0] ;
    else if( cntr_blk_rlden )
        cntr_blk[12:0] <= chregc_fsmc_block_tl_plus[12:0] - {10'b0,dst_trbyt[2:0]} ;
end
assign   blk_nu_eql0 = ( ~ (|cntr_blk[12:0]) ) ;
assign   blk_nu_last1 =  ( ~ (| (cntr_blk[12:0])) ) & is_wr_ctrlstt;
assign   grp_nu_last1 =  ( ~ (| (cntr_grup[5:0])) ) & is_wr_ctrlstt ; 
assign   blk_evtend = blk_nu_eql0 & current_rcvvld  & is_wr_ctrlstt ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin
         channl_end_st <= 1'b0 ;
    end
    else if(channl_end) begin
         channl_end_st <= 1'b1 ;
    end
    else if(m_hready) begin
         channl_end_st <= 1'b0 ;
    end
end
assign   chn_etb_tfr_done = channl_end_st & m_hready ;
assign   trgevent_end = ( sgl_evtend | group_evtend | blk_evtend )  ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin
         trgevent_end_st <= 1'b0 ;
    end
    else if(trgevent_end) begin
         trgevent_end_st <= 1'b1 ;
    end
    else if(m_hready) begin
         trgevent_end_st <= 1'b0 ;
    end
end
assign   chn_etb_trgevt_done = trgevent_end_st & m_hready ;
assign   channl_end =  blk_evtend  ;
assign   fsmc_regc_chnen_clr = blk_evtend ;
assign   fsmc_chregc_trgetcmp_vld = trgevent_end ;
assign   fsmc_chregc_tfr_vld  = channl_end ;
assign   chnc_gbc_trgclr =  current_rcvvld & ( sgl_evtend | (grp_nu_last1 & is_grpevt)  | blk_nu_last1 ) ;
assign   fsmc_chregc_err_vld  = m_hready & (m_hresp[1:0]==2'b01) ;
assign   block_transfer_length[12:0] = chregc_fsmc_block_tl[11:0] + 1'b1 ;
assign   fsmc_chregc_htfr_vld_i = ( cntr_blk[12:0] < ({block_transfer_length[12:1]}) ) & (~(hbus_stt[4:0]==IDLE_BUS))   ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        fsmc_chregc_htfr_vld_i_d0 <= 1'b0 ;
    end
    else    begin
        fsmc_chregc_htfr_vld_i_d0 <= fsmc_chregc_htfr_vld_i ;
    end
end
assign    fsmc_chregc_htfr_vld = (~fsmc_chregc_htfr_vld_i_d0) & fsmc_chregc_htfr_vld_i ;
assign   chn_etb_htfr_done = fsmc_chregc_htfr_vld ;
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_rdsrc[2:0] <= 3'b0 ;
    end
    else  if( rladen_src_cntr )  
        cntr_rdsrc[2:0] <= 3'h3; 
    else if( latch_rddata_en )
        cntr_rdsrc[2:0] <= cntr_rdsrc[2:0] - src_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_rdsrcctrl[2:0] <= 3'b0 ;
    end
    else  if( rladen_srcrctrl_cntr )  
        cntr_rdsrcctrl[2:0] <= dst_trbyt[2:0] - src_trbyt[2:0] ;
    else if( dec_src_cntr )
        cntr_rdsrcctrl[2:0] <= cntr_rdsrcctrl[2:0] - src_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_wrdstctrl[2:0] <= 3'b0 ;
    end
    else  if( rladen_dstwctrl_cntr )  
        cntr_wrdstctrl[2:0] <= src_trbyt[2:0] - dst_trbyt[2:0] ;
    else if( dec_dst_cntr )
        cntr_wrdstctrl[2:0] <= cntr_wrdstctrl[2:0] - dst_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_wrdst[2:0] <= 3'b0 ;
    end
    else  if( rladen_dst_cntr )   
        cntr_wrdst[2:0] <= 3'h0 ; 
    else if( latch_wrdata_en )
        cntr_wrdst[2:0] <= cntr_wrdst[2:0] + dst_trbyt[2:0] ;
end
assign     chnc_gbc_chnchgen =  m_hready & busy_chn_code_x & (
                               //src_single_inten & is_rd_ctrlstt & current_rcvvld   |     
                               //dst_single_inten & is_wr_ctrlstt & current_rcvvld         
                               (tg_src_sglevt|src_single_inten) & is_rd_ctrlstt   |        
   ((tg_src_sglevt&last_wr_transf)|tg_dst_sglevt|dst_single_inten) & is_wr_ctrlstt         
                                ) | 
                            ( is_grpevt | group_inten )  & grp_nu_last1 & current_rcvvld & last_wr_transf |            
                               blk_nu_last1 & m_hready & current_rcvvld & last_wr_transf       ;                                
assign   last_wr_transf  = ( (dst_wrctrl_cmplt) | dst_wr_1 )  & is_wr_ctrlstt ;
assign     chnc_gbc_pdvld_nxt = ( ~(hbus_stt[4:0] == IDLE_BUS) ) & ( ~gbc_chnc_reqvld ) & ( ~channl_end ); 
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        chnc_gbc_pdvld_d0 <= 1'b0 ;
    end
    else     
        chnc_gbc_pdvld_d0 <= chnc_gbc_pdvld_nxt ;        
end
assign     fsmc_chregc_pdvld = (~chnc_gbc_pdvld_d0) & (chnc_gbc_pdvld_nxt) & gbc_chnc_hpreqvld ;
assign     chnc_gbc_chbsy = ( ~(hbus_stt[4:0] == IDLE_BUS) ) & (  gbc_chnc_reqvld ) ; 
assign     is_wr_ctrlstt = hbus_stt[4];
assign     is_rd_ctrlstt = ~is_wr_ctrlstt ;
assign     rladen_dstwctrl_cntr = is_rd_ctrlstt ;
assign     rladen_srcrctrl_cntr = is_wr_ctrlstt |  (hbus_stt[4:0] == IDLE_BUS) & (~gbc_chnc_reqvld) ;
assign     dec_src_cntr  = is_rd_ctrlstt & current_rcvvld ;                     
assign     dec_dst_cntr  = is_wr_ctrlstt & current_rcvvld ;
assign     rladen_src_cntr =  dec_dst_cntr | (hbus_stt[4:0] == IDLE_BUS)  ;
assign     rladen_dst_cntr =  dec_src_cntr ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        latch_rddata <= 1'b0 ;
    end
    else if(dec_src_cntr)    
        latch_rddata <= 1'b1 ;        
    else if(m_hready)
        latch_rddata <= 1'b0 ;        
end
assign  latch_rddata_en = latch_rddata & m_hready ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        latch_wrdata <= 1'b0 ;
    end
    else if(dec_dst_cntr)    
        latch_wrdata <= 1'b1 ;        
    else if(m_hready)
        latch_wrdata <= 1'b0 ;        
end
assign  latch_wrdata_en = latch_wrdata & m_hready ;
assign    current_rcvvld = gbc_chnc_reqvld & m_hready  ;
assign    cfg_en         = chnc_gbc_chnen&gbc_chnc_dmacen ;
always @( dst_wr_1
       or hbus_stt[4:0]
       or src_rdctrl_cmplt
       or channl_end
       or current_rcvvld
       or src_rd_1
       or dst_wrctrl_cmplt
       or cfg_en)
begin
    hbus_stt_nxt[4:0] = hbus_stt[4:0] ;
    case(hbus_stt[4:0])
        IDLE_BUS          :   begin
            if( (current_rcvvld&cfg_en) & src_rd_1  )     
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;  
            else if( current_rcvvld & cfg_en )            
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;  
            else                                          
                hbus_stt_nxt[4:0] = IDLE_BUS ;  
        end    
        WAIT_RRDY_DRADR_BUS :   begin
            if( src_rdctrl_cmplt & current_rcvvld ) 
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;
        end    
        WAIT_RRDY_DWADR_BUS :   begin
            if(channl_end)
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else if( dst_wr_1 & current_rcvvld )          
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
            else if( current_rcvvld )                     
                hbus_stt_nxt[4:0] = WAIT_WRDY_DWADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;
        end    
        WAIT_WRDY_DWADR_BUS :   begin
            if(channl_end)
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else if( dst_wrctrl_cmplt & current_rcvvld  ) 
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_WRDY_DWADR_BUS ;
        end    
        WAIT_WRDY_DRADR_BUS :   begin
            if( current_rcvvld & src_rd_1  )          
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;  
            else if( current_rcvvld )                      
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
        end    
        default :   begin
            hbus_stt_nxt[4:0] = IDLE_BUS ;
        end    
    endcase
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        hbus_stt[4:0] <= 5'h1 ;
    end
    else    begin
        hbus_stt[4:0] <= hbus_stt_nxt[4:0] ;
    end
end
endmodule
