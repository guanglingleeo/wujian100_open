/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module reg_ctrl(
  ch0_prot_out,
  ch0c_gbc_chbsy,
  ch0c_gbc_chnen,
  ch0c_gbc_sfwtrg,
  ch10_prot_out,
  ch10c_gbc_chbsy,
  ch10c_gbc_chnen,
  ch10c_gbc_sfwtrg,
  ch11_prot_out,
  ch11c_gbc_chbsy,
  ch11c_gbc_chnen,
  ch11c_gbc_sfwtrg,
  ch12_prot_out,
  ch12c_gbc_chbsy,
  ch12c_gbc_chnen,
  ch12c_gbc_sfwtrg,
  ch13_prot_out,
  ch13c_gbc_chbsy,
  ch13c_gbc_chnen,
  ch13c_gbc_sfwtrg,
  ch14_prot_out,
  ch14c_gbc_chbsy,
  ch14c_gbc_chnen,
  ch14c_gbc_sfwtrg,
  ch15_prot_out,
  ch15c_gbc_chbsy,
  ch15c_gbc_chnen,
  ch15c_gbc_sfwtrg,
  ch1_prot_out,
  ch1c_gbc_chbsy,
  ch1c_gbc_chnen,
  ch1c_gbc_sfwtrg,
  ch2_prot_out,
  ch2c_gbc_chbsy,
  ch2c_gbc_chnen,
  ch2c_gbc_sfwtrg,
  ch3_prot_out,
  ch3c_gbc_chbsy,
  ch3c_gbc_chnen,
  ch3c_gbc_sfwtrg,
  ch4_prot_out,
  ch4c_gbc_chbsy,
  ch4c_gbc_chnen,
  ch4c_gbc_sfwtrg,
  ch5_prot_out,
  ch5c_gbc_chbsy,
  ch5c_gbc_chnen,
  ch5c_gbc_sfwtrg,
  ch6_prot_out,
  ch6c_gbc_chbsy,
  ch6c_gbc_chnen,
  ch6c_gbc_sfwtrg,
  ch7_prot_out,
  ch7c_gbc_chbsy,
  ch7c_gbc_chnen,
  ch7c_gbc_sfwtrg,
  ch8_prot_out,
  ch8c_gbc_chbsy,
  ch8c_gbc_chnen,
  ch8c_gbc_sfwtrg,
  ch9_prot_out,
  ch9c_gbc_chbsy,
  ch9c_gbc_chnen,
  ch9c_gbc_sfwtrg,
  chregc0_fsmc_block_tl,
  chregc0_fsmc_chintmdc,
  chregc0_fsmc_darn,
  chregc0_fsmc_dgrpaddrc,
  chregc0_fsmc_dinc,
  chregc0_fsmc_dst_tr_width,
  chregc0_fsmc_endlan,
  chregc0_fsmc_group_len,
  chregc0_fsmc_grpmc,
  chregc0_fsmc_protctl,
  chregc0_fsmc_sarn,
  chregc0_fsmc_sgrpaddrc,
  chregc0_fsmc_sinc,
  chregc0_fsmc_src_tr_width,
  chregc0_fsmc_trgtmdc,
  chregc10_fsmc_block_tl,
  chregc10_fsmc_chintmdc,
  chregc10_fsmc_darn,
  chregc10_fsmc_dgrpaddrc,
  chregc10_fsmc_dinc,
  chregc10_fsmc_dst_tr_width,
  chregc10_fsmc_endlan,
  chregc10_fsmc_group_len,
  chregc10_fsmc_grpmc,
  chregc10_fsmc_protctl,
  chregc10_fsmc_sarn,
  chregc10_fsmc_sgrpaddrc,
  chregc10_fsmc_sinc,
  chregc10_fsmc_src_tr_width,
  chregc10_fsmc_trgtmdc,
  chregc11_fsmc_block_tl,
  chregc11_fsmc_chintmdc,
  chregc11_fsmc_darn,
  chregc11_fsmc_dgrpaddrc,
  chregc11_fsmc_dinc,
  chregc11_fsmc_dst_tr_width,
  chregc11_fsmc_endlan,
  chregc11_fsmc_group_len,
  chregc11_fsmc_grpmc,
  chregc11_fsmc_protctl,
  chregc11_fsmc_sarn,
  chregc11_fsmc_sgrpaddrc,
  chregc11_fsmc_sinc,
  chregc11_fsmc_src_tr_width,
  chregc11_fsmc_trgtmdc,
  chregc12_fsmc_block_tl,
  chregc12_fsmc_chintmdc,
  chregc12_fsmc_darn,
  chregc12_fsmc_dgrpaddrc,
  chregc12_fsmc_dinc,
  chregc12_fsmc_dst_tr_width,
  chregc12_fsmc_endlan,
  chregc12_fsmc_group_len,
  chregc12_fsmc_grpmc,
  chregc12_fsmc_protctl,
  chregc12_fsmc_sarn,
  chregc12_fsmc_sgrpaddrc,
  chregc12_fsmc_sinc,
  chregc12_fsmc_src_tr_width,
  chregc12_fsmc_trgtmdc,
  chregc13_fsmc_block_tl,
  chregc13_fsmc_chintmdc,
  chregc13_fsmc_darn,
  chregc13_fsmc_dgrpaddrc,
  chregc13_fsmc_dinc,
  chregc13_fsmc_dst_tr_width,
  chregc13_fsmc_endlan,
  chregc13_fsmc_group_len,
  chregc13_fsmc_grpmc,
  chregc13_fsmc_protctl,
  chregc13_fsmc_sarn,
  chregc13_fsmc_sgrpaddrc,
  chregc13_fsmc_sinc,
  chregc13_fsmc_src_tr_width,
  chregc13_fsmc_trgtmdc,
  chregc14_fsmc_block_tl,
  chregc14_fsmc_chintmdc,
  chregc14_fsmc_darn,
  chregc14_fsmc_dgrpaddrc,
  chregc14_fsmc_dinc,
  chregc14_fsmc_dst_tr_width,
  chregc14_fsmc_endlan,
  chregc14_fsmc_group_len,
  chregc14_fsmc_grpmc,
  chregc14_fsmc_protctl,
  chregc14_fsmc_sarn,
  chregc14_fsmc_sgrpaddrc,
  chregc14_fsmc_sinc,
  chregc14_fsmc_src_tr_width,
  chregc14_fsmc_trgtmdc,
  chregc15_fsmc_block_tl,
  chregc15_fsmc_chintmdc,
  chregc15_fsmc_darn,
  chregc15_fsmc_dgrpaddrc,
  chregc15_fsmc_dinc,
  chregc15_fsmc_dst_tr_width,
  chregc15_fsmc_endlan,
  chregc15_fsmc_group_len,
  chregc15_fsmc_grpmc,
  chregc15_fsmc_protctl,
  chregc15_fsmc_sarn,
  chregc15_fsmc_sgrpaddrc,
  chregc15_fsmc_sinc,
  chregc15_fsmc_src_tr_width,
  chregc15_fsmc_trgtmdc,
  chregc1_fsmc_block_tl,
  chregc1_fsmc_chintmdc,
  chregc1_fsmc_darn,
  chregc1_fsmc_dgrpaddrc,
  chregc1_fsmc_dinc,
  chregc1_fsmc_dst_tr_width,
  chregc1_fsmc_endlan,
  chregc1_fsmc_group_len,
  chregc1_fsmc_grpmc,
  chregc1_fsmc_protctl,
  chregc1_fsmc_sarn,
  chregc1_fsmc_sgrpaddrc,
  chregc1_fsmc_sinc,
  chregc1_fsmc_src_tr_width,
  chregc1_fsmc_trgtmdc,
  chregc2_fsmc_block_tl,
  chregc2_fsmc_chintmdc,
  chregc2_fsmc_darn,
  chregc2_fsmc_dgrpaddrc,
  chregc2_fsmc_dinc,
  chregc2_fsmc_dst_tr_width,
  chregc2_fsmc_endlan,
  chregc2_fsmc_group_len,
  chregc2_fsmc_grpmc,
  chregc2_fsmc_protctl,
  chregc2_fsmc_sarn,
  chregc2_fsmc_sgrpaddrc,
  chregc2_fsmc_sinc,
  chregc2_fsmc_src_tr_width,
  chregc2_fsmc_trgtmdc,
  chregc3_fsmc_block_tl,
  chregc3_fsmc_chintmdc,
  chregc3_fsmc_darn,
  chregc3_fsmc_dgrpaddrc,
  chregc3_fsmc_dinc,
  chregc3_fsmc_dst_tr_width,
  chregc3_fsmc_endlan,
  chregc3_fsmc_group_len,
  chregc3_fsmc_grpmc,
  chregc3_fsmc_protctl,
  chregc3_fsmc_sarn,
  chregc3_fsmc_sgrpaddrc,
  chregc3_fsmc_sinc,
  chregc3_fsmc_src_tr_width,
  chregc3_fsmc_trgtmdc,
  chregc4_fsmc_block_tl,
  chregc4_fsmc_chintmdc,
  chregc4_fsmc_darn,
  chregc4_fsmc_dgrpaddrc,
  chregc4_fsmc_dinc,
  chregc4_fsmc_dst_tr_width,
  chregc4_fsmc_endlan,
  chregc4_fsmc_group_len,
  chregc4_fsmc_grpmc,
  chregc4_fsmc_protctl,
  chregc4_fsmc_sarn,
  chregc4_fsmc_sgrpaddrc,
  chregc4_fsmc_sinc,
  chregc4_fsmc_src_tr_width,
  chregc4_fsmc_trgtmdc,
  chregc5_fsmc_block_tl,
  chregc5_fsmc_chintmdc,
  chregc5_fsmc_darn,
  chregc5_fsmc_dgrpaddrc,
  chregc5_fsmc_dinc,
  chregc5_fsmc_dst_tr_width,
  chregc5_fsmc_endlan,
  chregc5_fsmc_group_len,
  chregc5_fsmc_grpmc,
  chregc5_fsmc_protctl,
  chregc5_fsmc_sarn,
  chregc5_fsmc_sgrpaddrc,
  chregc5_fsmc_sinc,
  chregc5_fsmc_src_tr_width,
  chregc5_fsmc_trgtmdc,
  chregc6_fsmc_block_tl,
  chregc6_fsmc_chintmdc,
  chregc6_fsmc_darn,
  chregc6_fsmc_dgrpaddrc,
  chregc6_fsmc_dinc,
  chregc6_fsmc_dst_tr_width,
  chregc6_fsmc_endlan,
  chregc6_fsmc_group_len,
  chregc6_fsmc_grpmc,
  chregc6_fsmc_protctl,
  chregc6_fsmc_sarn,
  chregc6_fsmc_sgrpaddrc,
  chregc6_fsmc_sinc,
  chregc6_fsmc_src_tr_width,
  chregc6_fsmc_trgtmdc,
  chregc7_fsmc_block_tl,
  chregc7_fsmc_chintmdc,
  chregc7_fsmc_darn,
  chregc7_fsmc_dgrpaddrc,
  chregc7_fsmc_dinc,
  chregc7_fsmc_dst_tr_width,
  chregc7_fsmc_endlan,
  chregc7_fsmc_group_len,
  chregc7_fsmc_grpmc,
  chregc7_fsmc_protctl,
  chregc7_fsmc_sarn,
  chregc7_fsmc_sgrpaddrc,
  chregc7_fsmc_sinc,
  chregc7_fsmc_src_tr_width,
  chregc7_fsmc_trgtmdc,
  chregc8_fsmc_block_tl,
  chregc8_fsmc_chintmdc,
  chregc8_fsmc_darn,
  chregc8_fsmc_dgrpaddrc,
  chregc8_fsmc_dinc,
  chregc8_fsmc_dst_tr_width,
  chregc8_fsmc_endlan,
  chregc8_fsmc_group_len,
  chregc8_fsmc_grpmc,
  chregc8_fsmc_protctl,
  chregc8_fsmc_sarn,
  chregc8_fsmc_sgrpaddrc,
  chregc8_fsmc_sinc,
  chregc8_fsmc_src_tr_width,
  chregc8_fsmc_trgtmdc,
  chregc9_fsmc_block_tl,
  chregc9_fsmc_chintmdc,
  chregc9_fsmc_darn,
  chregc9_fsmc_dgrpaddrc,
  chregc9_fsmc_dinc,
  chregc9_fsmc_dst_tr_width,
  chregc9_fsmc_endlan,
  chregc9_fsmc_group_len,
  chregc9_fsmc_grpmc,
  chregc9_fsmc_protctl,
  chregc9_fsmc_sarn,
  chregc9_fsmc_sgrpaddrc,
  chregc9_fsmc_sinc,
  chregc9_fsmc_src_tr_width,
  chregc9_fsmc_trgtmdc,
  dmac_vic_if,
  fsmc_chregc0_err_vld,
  fsmc_chregc0_htfr_vld,
  fsmc_chregc0_tfr_vld,
  fsmc_chregc0_trgetcmp_vld,
  fsmc_chregc10_err_vld,
  fsmc_chregc10_htfr_vld,
  fsmc_chregc10_tfr_vld,
  fsmc_chregc10_trgetcmp_vld,
  fsmc_chregc11_err_vld,
  fsmc_chregc11_htfr_vld,
  fsmc_chregc11_tfr_vld,
  fsmc_chregc11_trgetcmp_vld,
  fsmc_chregc12_err_vld,
  fsmc_chregc12_htfr_vld,
  fsmc_chregc12_tfr_vld,
  fsmc_chregc12_trgetcmp_vld,
  fsmc_chregc13_err_vld,
  fsmc_chregc13_htfr_vld,
  fsmc_chregc13_tfr_vld,
  fsmc_chregc13_trgetcmp_vld,
  fsmc_chregc14_err_vld,
  fsmc_chregc14_htfr_vld,
  fsmc_chregc14_tfr_vld,
  fsmc_chregc14_trgetcmp_vld,
  fsmc_chregc15_err_vld,
  fsmc_chregc15_htfr_vld,
  fsmc_chregc15_tfr_vld,
  fsmc_chregc15_trgetcmp_vld,
  fsmc_chregc1_err_vld,
  fsmc_chregc1_htfr_vld,
  fsmc_chregc1_tfr_vld,
  fsmc_chregc1_trgetcmp_vld,
  fsmc_chregc2_err_vld,
  fsmc_chregc2_htfr_vld,
  fsmc_chregc2_tfr_vld,
  fsmc_chregc2_trgetcmp_vld,
  fsmc_chregc3_err_vld,
  fsmc_chregc3_htfr_vld,
  fsmc_chregc3_tfr_vld,
  fsmc_chregc3_trgetcmp_vld,
  fsmc_chregc4_err_vld,
  fsmc_chregc4_htfr_vld,
  fsmc_chregc4_tfr_vld,
  fsmc_chregc4_trgetcmp_vld,
  fsmc_chregc5_err_vld,
  fsmc_chregc5_htfr_vld,
  fsmc_chregc5_tfr_vld,
  fsmc_chregc5_trgetcmp_vld,
  fsmc_chregc6_err_vld,
  fsmc_chregc6_htfr_vld,
  fsmc_chregc6_tfr_vld,
  fsmc_chregc6_trgetcmp_vld,
  fsmc_chregc7_err_vld,
  fsmc_chregc7_htfr_vld,
  fsmc_chregc7_tfr_vld,
  fsmc_chregc7_trgetcmp_vld,
  fsmc_chregc8_err_vld,
  fsmc_chregc8_htfr_vld,
  fsmc_chregc8_tfr_vld,
  fsmc_chregc8_trgetcmp_vld,
  fsmc_chregc9_err_vld,
  fsmc_chregc9_htfr_vld,
  fsmc_chregc9_tfr_vld,
  fsmc_chregc9_trgetcmp_vld,
  fsmc_chregc_pdvld_ch0,
  fsmc_chregc_pdvld_ch1,
  fsmc_chregc_pdvld_ch10,
  fsmc_chregc_pdvld_ch11,
  fsmc_chregc_pdvld_ch12,
  fsmc_chregc_pdvld_ch13,
  fsmc_chregc_pdvld_ch14,
  fsmc_chregc_pdvld_ch15,
  fsmc_chregc_pdvld_ch2,
  fsmc_chregc_pdvld_ch3,
  fsmc_chregc_pdvld_ch4,
  fsmc_chregc_pdvld_ch5,
  fsmc_chregc_pdvld_ch6,
  fsmc_chregc_pdvld_ch7,
  fsmc_chregc_pdvld_ch8,
  fsmc_chregc_pdvld_ch9,
  fsmc_regc_ch0en_clr,
  fsmc_regc_ch10en_clr,
  fsmc_regc_ch11en_clr,
  fsmc_regc_ch12en_clr,
  fsmc_regc_ch13en_clr,
  fsmc_regc_ch14en_clr,
  fsmc_regc_ch15en_clr,
  fsmc_regc_ch1en_clr,
  fsmc_regc_ch2en_clr,
  fsmc_regc_ch3en_clr,
  fsmc_regc_ch4en_clr,
  fsmc_regc_ch5en_clr,
  fsmc_regc_ch6en_clr,
  fsmc_regc_ch7en_clr,
  fsmc_regc_ch8en_clr,
  fsmc_regc_ch9en_clr,
  gbc_chnc_dmacen,
  hclk,
  hrst_n,
  regc_fsmc_ch0_srcdtlgc,
  regc_fsmc_ch10_srcdtlgc,
  regc_fsmc_ch11_srcdtlgc,
  regc_fsmc_ch12_srcdtlgc,
  regc_fsmc_ch13_srcdtlgc,
  regc_fsmc_ch14_srcdtlgc,
  regc_fsmc_ch15_srcdtlgc,
  regc_fsmc_ch1_srcdtlgc,
  regc_fsmc_ch2_srcdtlgc,
  regc_fsmc_ch3_srcdtlgc,
  regc_fsmc_ch4_srcdtlgc,
  regc_fsmc_ch5_srcdtlgc,
  regc_fsmc_ch6_srcdtlgc,
  regc_fsmc_ch7_srcdtlgc,
  regc_fsmc_ch8_srcdtlgc,
  regc_fsmc_ch9_srcdtlgc,
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
input           ch0c_gbc_chbsy;            
input           ch10c_gbc_chbsy;           
input           ch11c_gbc_chbsy;           
input           ch12c_gbc_chbsy;           
input           ch13c_gbc_chbsy;           
input           ch14c_gbc_chbsy;           
input           ch15c_gbc_chbsy;           
input           ch1c_gbc_chbsy;            
input           ch2c_gbc_chbsy;            
input           ch3c_gbc_chbsy;            
input           ch4c_gbc_chbsy;            
input           ch5c_gbc_chbsy;            
input           ch6c_gbc_chbsy;            
input           ch7c_gbc_chbsy;            
input           ch8c_gbc_chbsy;            
input           ch9c_gbc_chbsy;            
input           fsmc_chregc0_err_vld;      
input           fsmc_chregc0_htfr_vld;     
input           fsmc_chregc0_tfr_vld;      
input           fsmc_chregc0_trgetcmp_vld; 
input           fsmc_chregc10_err_vld;     
input           fsmc_chregc10_htfr_vld;    
input           fsmc_chregc10_tfr_vld;     
input           fsmc_chregc10_trgetcmp_vld; 
input           fsmc_chregc11_err_vld;     
input           fsmc_chregc11_htfr_vld;    
input           fsmc_chregc11_tfr_vld;     
input           fsmc_chregc11_trgetcmp_vld; 
input           fsmc_chregc12_err_vld;     
input           fsmc_chregc12_htfr_vld;    
input           fsmc_chregc12_tfr_vld;     
input           fsmc_chregc12_trgetcmp_vld; 
input           fsmc_chregc13_err_vld;     
input           fsmc_chregc13_htfr_vld;    
input           fsmc_chregc13_tfr_vld;     
input           fsmc_chregc13_trgetcmp_vld; 
input           fsmc_chregc14_err_vld;     
input           fsmc_chregc14_htfr_vld;    
input           fsmc_chregc14_tfr_vld;     
input           fsmc_chregc14_trgetcmp_vld; 
input           fsmc_chregc15_err_vld;     
input           fsmc_chregc15_htfr_vld;    
input           fsmc_chregc15_tfr_vld;     
input           fsmc_chregc15_trgetcmp_vld; 
input           fsmc_chregc1_err_vld;      
input           fsmc_chregc1_htfr_vld;     
input           fsmc_chregc1_tfr_vld;      
input           fsmc_chregc1_trgetcmp_vld; 
input           fsmc_chregc2_err_vld;      
input           fsmc_chregc2_htfr_vld;     
input           fsmc_chregc2_tfr_vld;      
input           fsmc_chregc2_trgetcmp_vld; 
input           fsmc_chregc3_err_vld;      
input           fsmc_chregc3_htfr_vld;     
input           fsmc_chregc3_tfr_vld;      
input           fsmc_chregc3_trgetcmp_vld; 
input           fsmc_chregc4_err_vld;      
input           fsmc_chregc4_htfr_vld;     
input           fsmc_chregc4_tfr_vld;      
input           fsmc_chregc4_trgetcmp_vld; 
input           fsmc_chregc5_err_vld;      
input           fsmc_chregc5_htfr_vld;     
input           fsmc_chregc5_tfr_vld;      
input           fsmc_chregc5_trgetcmp_vld; 
input           fsmc_chregc6_err_vld;      
input           fsmc_chregc6_htfr_vld;     
input           fsmc_chregc6_tfr_vld;      
input           fsmc_chregc6_trgetcmp_vld; 
input           fsmc_chregc7_err_vld;      
input           fsmc_chregc7_htfr_vld;     
input           fsmc_chregc7_tfr_vld;      
input           fsmc_chregc7_trgetcmp_vld; 
input           fsmc_chregc8_err_vld;      
input           fsmc_chregc8_htfr_vld;     
input           fsmc_chregc8_tfr_vld;      
input           fsmc_chregc8_trgetcmp_vld; 
input           fsmc_chregc9_err_vld;      
input           fsmc_chregc9_htfr_vld;     
input           fsmc_chregc9_tfr_vld;      
input           fsmc_chregc9_trgetcmp_vld; 
input           fsmc_chregc_pdvld_ch0;     
input           fsmc_chregc_pdvld_ch1;     
input           fsmc_chregc_pdvld_ch10;    
input           fsmc_chregc_pdvld_ch11;    
input           fsmc_chregc_pdvld_ch12;    
input           fsmc_chregc_pdvld_ch13;    
input           fsmc_chregc_pdvld_ch14;    
input           fsmc_chregc_pdvld_ch15;    
input           fsmc_chregc_pdvld_ch2;     
input           fsmc_chregc_pdvld_ch3;     
input           fsmc_chregc_pdvld_ch4;     
input           fsmc_chregc_pdvld_ch5;     
input           fsmc_chregc_pdvld_ch6;     
input           fsmc_chregc_pdvld_ch7;     
input           fsmc_chregc_pdvld_ch8;     
input           fsmc_chregc_pdvld_ch9;     
input           fsmc_regc_ch0en_clr;       
input           fsmc_regc_ch10en_clr;      
input           fsmc_regc_ch11en_clr;      
input           fsmc_regc_ch12en_clr;      
input           fsmc_regc_ch13en_clr;      
input           fsmc_regc_ch14en_clr;      
input           fsmc_regc_ch15en_clr;      
input           fsmc_regc_ch1en_clr;       
input           fsmc_regc_ch2en_clr;       
input           fsmc_regc_ch3en_clr;       
input           fsmc_regc_ch4en_clr;       
input           fsmc_regc_ch5en_clr;       
input           fsmc_regc_ch6en_clr;       
input           fsmc_regc_ch7en_clr;       
input           fsmc_regc_ch8en_clr;       
input           fsmc_regc_ch9en_clr;       
input           hclk;                      
input           hrst_n;                    
input   [31:0]  s_haddr;                   
input   [3 :0]  s_hprot;                   
input           s_hsel;                    
input   [1 :0]  s_htrans;                  
input   [31:0]  s_hwdata;                  
input           s_hwrite;                  
output          ch0_prot_out;              
output          ch0c_gbc_chnen;            
output          ch0c_gbc_sfwtrg;           
output          ch10_prot_out;             
output          ch10c_gbc_chnen;           
output          ch10c_gbc_sfwtrg;          
output          ch11_prot_out;             
output          ch11c_gbc_chnen;           
output          ch11c_gbc_sfwtrg;          
output          ch12_prot_out;             
output          ch12c_gbc_chnen;           
output          ch12c_gbc_sfwtrg;          
output          ch13_prot_out;             
output          ch13c_gbc_chnen;           
output          ch13c_gbc_sfwtrg;          
output          ch14_prot_out;             
output          ch14c_gbc_chnen;           
output          ch14c_gbc_sfwtrg;          
output          ch15_prot_out;             
output          ch15c_gbc_chnen;           
output          ch15c_gbc_sfwtrg;          
output          ch1_prot_out;              
output          ch1c_gbc_chnen;            
output          ch1c_gbc_sfwtrg;           
output          ch2_prot_out;              
output          ch2c_gbc_chnen;            
output          ch2c_gbc_sfwtrg;           
output          ch3_prot_out;              
output          ch3c_gbc_chnen;            
output          ch3c_gbc_sfwtrg;           
output          ch4_prot_out;              
output          ch4c_gbc_chnen;            
output          ch4c_gbc_sfwtrg;           
output          ch5_prot_out;              
output          ch5c_gbc_chnen;            
output          ch5c_gbc_sfwtrg;           
output          ch6_prot_out;              
output          ch6c_gbc_chnen;            
output          ch6c_gbc_sfwtrg;           
output          ch7_prot_out;              
output          ch7c_gbc_chnen;            
output          ch7c_gbc_sfwtrg;           
output          ch8_prot_out;              
output          ch8c_gbc_chnen;            
output          ch8c_gbc_sfwtrg;           
output          ch9_prot_out;              
output          ch9c_gbc_chnen;            
output          ch9c_gbc_sfwtrg;           
output  [11:0]  chregc0_fsmc_block_tl;     
output  [2 :0]  chregc0_fsmc_chintmdc;     
output  [31:0]  chregc0_fsmc_darn;         
output          chregc0_fsmc_dgrpaddrc;    
output  [1 :0]  chregc0_fsmc_dinc;         
output  [1 :0]  chregc0_fsmc_dst_tr_width; 
output          chregc0_fsmc_endlan;       
output  [5 :0]  chregc0_fsmc_group_len;    
output          chregc0_fsmc_grpmc;        
output  [3 :0]  chregc0_fsmc_protctl;      
output  [31:0]  chregc0_fsmc_sarn;         
output          chregc0_fsmc_sgrpaddrc;    
output  [1 :0]  chregc0_fsmc_sinc;         
output  [1 :0]  chregc0_fsmc_src_tr_width; 
output  [1 :0]  chregc0_fsmc_trgtmdc;      
output  [11:0]  chregc10_fsmc_block_tl;    
output  [2 :0]  chregc10_fsmc_chintmdc;    
output  [31:0]  chregc10_fsmc_darn;        
output          chregc10_fsmc_dgrpaddrc;   
output  [1 :0]  chregc10_fsmc_dinc;        
output  [1 :0]  chregc10_fsmc_dst_tr_width; 
output          chregc10_fsmc_endlan;      
output  [5 :0]  chregc10_fsmc_group_len;   
output          chregc10_fsmc_grpmc;       
output  [3 :0]  chregc10_fsmc_protctl;     
output  [31:0]  chregc10_fsmc_sarn;        
output          chregc10_fsmc_sgrpaddrc;   
output  [1 :0]  chregc10_fsmc_sinc;        
output  [1 :0]  chregc10_fsmc_src_tr_width; 
output  [1 :0]  chregc10_fsmc_trgtmdc;     
output  [11:0]  chregc11_fsmc_block_tl;    
output  [2 :0]  chregc11_fsmc_chintmdc;    
output  [31:0]  chregc11_fsmc_darn;        
output          chregc11_fsmc_dgrpaddrc;   
output  [1 :0]  chregc11_fsmc_dinc;        
output  [1 :0]  chregc11_fsmc_dst_tr_width; 
output          chregc11_fsmc_endlan;      
output  [5 :0]  chregc11_fsmc_group_len;   
output          chregc11_fsmc_grpmc;       
output  [3 :0]  chregc11_fsmc_protctl;     
output  [31:0]  chregc11_fsmc_sarn;        
output          chregc11_fsmc_sgrpaddrc;   
output  [1 :0]  chregc11_fsmc_sinc;        
output  [1 :0]  chregc11_fsmc_src_tr_width; 
output  [1 :0]  chregc11_fsmc_trgtmdc;     
output  [11:0]  chregc12_fsmc_block_tl;    
output  [2 :0]  chregc12_fsmc_chintmdc;    
output  [31:0]  chregc12_fsmc_darn;        
output          chregc12_fsmc_dgrpaddrc;   
output  [1 :0]  chregc12_fsmc_dinc;        
output  [1 :0]  chregc12_fsmc_dst_tr_width; 
output          chregc12_fsmc_endlan;      
output  [5 :0]  chregc12_fsmc_group_len;   
output          chregc12_fsmc_grpmc;       
output  [3 :0]  chregc12_fsmc_protctl;     
output  [31:0]  chregc12_fsmc_sarn;        
output          chregc12_fsmc_sgrpaddrc;   
output  [1 :0]  chregc12_fsmc_sinc;        
output  [1 :0]  chregc12_fsmc_src_tr_width; 
output  [1 :0]  chregc12_fsmc_trgtmdc;     
output  [11:0]  chregc13_fsmc_block_tl;    
output  [2 :0]  chregc13_fsmc_chintmdc;    
output  [31:0]  chregc13_fsmc_darn;        
output          chregc13_fsmc_dgrpaddrc;   
output  [1 :0]  chregc13_fsmc_dinc;        
output  [1 :0]  chregc13_fsmc_dst_tr_width; 
output          chregc13_fsmc_endlan;      
output  [5 :0]  chregc13_fsmc_group_len;   
output          chregc13_fsmc_grpmc;       
output  [3 :0]  chregc13_fsmc_protctl;     
output  [31:0]  chregc13_fsmc_sarn;        
output          chregc13_fsmc_sgrpaddrc;   
output  [1 :0]  chregc13_fsmc_sinc;        
output  [1 :0]  chregc13_fsmc_src_tr_width; 
output  [1 :0]  chregc13_fsmc_trgtmdc;     
output  [11:0]  chregc14_fsmc_block_tl;    
output  [2 :0]  chregc14_fsmc_chintmdc;    
output  [31:0]  chregc14_fsmc_darn;        
output          chregc14_fsmc_dgrpaddrc;   
output  [1 :0]  chregc14_fsmc_dinc;        
output  [1 :0]  chregc14_fsmc_dst_tr_width; 
output          chregc14_fsmc_endlan;      
output  [5 :0]  chregc14_fsmc_group_len;   
output          chregc14_fsmc_grpmc;       
output  [3 :0]  chregc14_fsmc_protctl;     
output  [31:0]  chregc14_fsmc_sarn;        
output          chregc14_fsmc_sgrpaddrc;   
output  [1 :0]  chregc14_fsmc_sinc;        
output  [1 :0]  chregc14_fsmc_src_tr_width; 
output  [1 :0]  chregc14_fsmc_trgtmdc;     
output  [11:0]  chregc15_fsmc_block_tl;    
output  [2 :0]  chregc15_fsmc_chintmdc;    
output  [31:0]  chregc15_fsmc_darn;        
output          chregc15_fsmc_dgrpaddrc;   
output  [1 :0]  chregc15_fsmc_dinc;        
output  [1 :0]  chregc15_fsmc_dst_tr_width; 
output          chregc15_fsmc_endlan;      
output  [5 :0]  chregc15_fsmc_group_len;   
output          chregc15_fsmc_grpmc;       
output  [3 :0]  chregc15_fsmc_protctl;     
output  [31:0]  chregc15_fsmc_sarn;        
output          chregc15_fsmc_sgrpaddrc;   
output  [1 :0]  chregc15_fsmc_sinc;        
output  [1 :0]  chregc15_fsmc_src_tr_width; 
output  [1 :0]  chregc15_fsmc_trgtmdc;     
output  [11:0]  chregc1_fsmc_block_tl;     
output  [2 :0]  chregc1_fsmc_chintmdc;     
output  [31:0]  chregc1_fsmc_darn;         
output          chregc1_fsmc_dgrpaddrc;    
output  [1 :0]  chregc1_fsmc_dinc;         
output  [1 :0]  chregc1_fsmc_dst_tr_width; 
output          chregc1_fsmc_endlan;       
output  [5 :0]  chregc1_fsmc_group_len;    
output          chregc1_fsmc_grpmc;        
output  [3 :0]  chregc1_fsmc_protctl;      
output  [31:0]  chregc1_fsmc_sarn;         
output          chregc1_fsmc_sgrpaddrc;    
output  [1 :0]  chregc1_fsmc_sinc;         
output  [1 :0]  chregc1_fsmc_src_tr_width; 
output  [1 :0]  chregc1_fsmc_trgtmdc;      
output  [11:0]  chregc2_fsmc_block_tl;     
output  [2 :0]  chregc2_fsmc_chintmdc;     
output  [31:0]  chregc2_fsmc_darn;         
output          chregc2_fsmc_dgrpaddrc;    
output  [1 :0]  chregc2_fsmc_dinc;         
output  [1 :0]  chregc2_fsmc_dst_tr_width; 
output          chregc2_fsmc_endlan;       
output  [5 :0]  chregc2_fsmc_group_len;    
output          chregc2_fsmc_grpmc;        
output  [3 :0]  chregc2_fsmc_protctl;      
output  [31:0]  chregc2_fsmc_sarn;         
output          chregc2_fsmc_sgrpaddrc;    
output  [1 :0]  chregc2_fsmc_sinc;         
output  [1 :0]  chregc2_fsmc_src_tr_width; 
output  [1 :0]  chregc2_fsmc_trgtmdc;      
output  [11:0]  chregc3_fsmc_block_tl;     
output  [2 :0]  chregc3_fsmc_chintmdc;     
output  [31:0]  chregc3_fsmc_darn;         
output          chregc3_fsmc_dgrpaddrc;    
output  [1 :0]  chregc3_fsmc_dinc;         
output  [1 :0]  chregc3_fsmc_dst_tr_width; 
output          chregc3_fsmc_endlan;       
output  [5 :0]  chregc3_fsmc_group_len;    
output          chregc3_fsmc_grpmc;        
output  [3 :0]  chregc3_fsmc_protctl;      
output  [31:0]  chregc3_fsmc_sarn;         
output          chregc3_fsmc_sgrpaddrc;    
output  [1 :0]  chregc3_fsmc_sinc;         
output  [1 :0]  chregc3_fsmc_src_tr_width; 
output  [1 :0]  chregc3_fsmc_trgtmdc;      
output  [11:0]  chregc4_fsmc_block_tl;     
output  [2 :0]  chregc4_fsmc_chintmdc;     
output  [31:0]  chregc4_fsmc_darn;         
output          chregc4_fsmc_dgrpaddrc;    
output  [1 :0]  chregc4_fsmc_dinc;         
output  [1 :0]  chregc4_fsmc_dst_tr_width; 
output          chregc4_fsmc_endlan;       
output  [5 :0]  chregc4_fsmc_group_len;    
output          chregc4_fsmc_grpmc;        
output  [3 :0]  chregc4_fsmc_protctl;      
output  [31:0]  chregc4_fsmc_sarn;         
output          chregc4_fsmc_sgrpaddrc;    
output  [1 :0]  chregc4_fsmc_sinc;         
output  [1 :0]  chregc4_fsmc_src_tr_width; 
output  [1 :0]  chregc4_fsmc_trgtmdc;      
output  [11:0]  chregc5_fsmc_block_tl;     
output  [2 :0]  chregc5_fsmc_chintmdc;     
output  [31:0]  chregc5_fsmc_darn;         
output          chregc5_fsmc_dgrpaddrc;    
output  [1 :0]  chregc5_fsmc_dinc;         
output  [1 :0]  chregc5_fsmc_dst_tr_width; 
output          chregc5_fsmc_endlan;       
output  [5 :0]  chregc5_fsmc_group_len;    
output          chregc5_fsmc_grpmc;        
output  [3 :0]  chregc5_fsmc_protctl;      
output  [31:0]  chregc5_fsmc_sarn;         
output          chregc5_fsmc_sgrpaddrc;    
output  [1 :0]  chregc5_fsmc_sinc;         
output  [1 :0]  chregc5_fsmc_src_tr_width; 
output  [1 :0]  chregc5_fsmc_trgtmdc;      
output  [11:0]  chregc6_fsmc_block_tl;     
output  [2 :0]  chregc6_fsmc_chintmdc;     
output  [31:0]  chregc6_fsmc_darn;         
output          chregc6_fsmc_dgrpaddrc;    
output  [1 :0]  chregc6_fsmc_dinc;         
output  [1 :0]  chregc6_fsmc_dst_tr_width; 
output          chregc6_fsmc_endlan;       
output  [5 :0]  chregc6_fsmc_group_len;    
output          chregc6_fsmc_grpmc;        
output  [3 :0]  chregc6_fsmc_protctl;      
output  [31:0]  chregc6_fsmc_sarn;         
output          chregc6_fsmc_sgrpaddrc;    
output  [1 :0]  chregc6_fsmc_sinc;         
output  [1 :0]  chregc6_fsmc_src_tr_width; 
output  [1 :0]  chregc6_fsmc_trgtmdc;      
output  [11:0]  chregc7_fsmc_block_tl;     
output  [2 :0]  chregc7_fsmc_chintmdc;     
output  [31:0]  chregc7_fsmc_darn;         
output          chregc7_fsmc_dgrpaddrc;    
output  [1 :0]  chregc7_fsmc_dinc;         
output  [1 :0]  chregc7_fsmc_dst_tr_width; 
output          chregc7_fsmc_endlan;       
output  [5 :0]  chregc7_fsmc_group_len;    
output          chregc7_fsmc_grpmc;        
output  [3 :0]  chregc7_fsmc_protctl;      
output  [31:0]  chregc7_fsmc_sarn;         
output          chregc7_fsmc_sgrpaddrc;    
output  [1 :0]  chregc7_fsmc_sinc;         
output  [1 :0]  chregc7_fsmc_src_tr_width; 
output  [1 :0]  chregc7_fsmc_trgtmdc;      
output  [11:0]  chregc8_fsmc_block_tl;     
output  [2 :0]  chregc8_fsmc_chintmdc;     
output  [31:0]  chregc8_fsmc_darn;         
output          chregc8_fsmc_dgrpaddrc;    
output  [1 :0]  chregc8_fsmc_dinc;         
output  [1 :0]  chregc8_fsmc_dst_tr_width; 
output          chregc8_fsmc_endlan;       
output  [5 :0]  chregc8_fsmc_group_len;    
output          chregc8_fsmc_grpmc;        
output  [3 :0]  chregc8_fsmc_protctl;      
output  [31:0]  chregc8_fsmc_sarn;         
output          chregc8_fsmc_sgrpaddrc;    
output  [1 :0]  chregc8_fsmc_sinc;         
output  [1 :0]  chregc8_fsmc_src_tr_width; 
output  [1 :0]  chregc8_fsmc_trgtmdc;      
output  [11:0]  chregc9_fsmc_block_tl;     
output  [2 :0]  chregc9_fsmc_chintmdc;     
output  [31:0]  chregc9_fsmc_darn;         
output          chregc9_fsmc_dgrpaddrc;    
output  [1 :0]  chregc9_fsmc_dinc;         
output  [1 :0]  chregc9_fsmc_dst_tr_width; 
output          chregc9_fsmc_endlan;       
output  [5 :0]  chregc9_fsmc_group_len;    
output          chregc9_fsmc_grpmc;        
output  [3 :0]  chregc9_fsmc_protctl;      
output  [31:0]  chregc9_fsmc_sarn;         
output          chregc9_fsmc_sgrpaddrc;    
output  [1 :0]  chregc9_fsmc_sinc;         
output  [1 :0]  chregc9_fsmc_src_tr_width; 
output  [1 :0]  chregc9_fsmc_trgtmdc;      
output          dmac_vic_if;               
output          gbc_chnc_dmacen;           
output          regc_fsmc_ch0_srcdtlgc;    
output          regc_fsmc_ch10_srcdtlgc;   
output          regc_fsmc_ch11_srcdtlgc;   
output          regc_fsmc_ch12_srcdtlgc;   
output          regc_fsmc_ch13_srcdtlgc;   
output          regc_fsmc_ch14_srcdtlgc;   
output          regc_fsmc_ch15_srcdtlgc;   
output          regc_fsmc_ch1_srcdtlgc;    
output          regc_fsmc_ch2_srcdtlgc;    
output          regc_fsmc_ch3_srcdtlgc;    
output          regc_fsmc_ch4_srcdtlgc;    
output          regc_fsmc_ch5_srcdtlgc;    
output          regc_fsmc_ch6_srcdtlgc;    
output          regc_fsmc_ch7_srcdtlgc;    
output          regc_fsmc_ch8_srcdtlgc;    
output          regc_fsmc_ch9_srcdtlgc;    
output  [31:0]  s_hrdata;                  
output          s_hready;                  
output  [1 :0]  s_hresp;                   
reg             ch0_spacesel;              
reg             ch10_spacesel;             
reg             ch11_spacesel;             
reg             ch12_spacesel;             
reg             ch13_spacesel;             
reg             ch14_spacesel;             
reg             ch15_spacesel;             
reg             ch1_spacesel;              
reg             ch2_spacesel;              
reg             ch3_spacesel;              
reg             ch4_spacesel;              
reg             ch5_spacesel;              
reg             ch6_spacesel;              
reg             ch7_spacesel;              
reg             ch8_spacesel;              
reg             ch9_spacesel;              
wire            a_nonseq;                  
wire            a_seq;                     
wire            ch0_prot_out;              
wire            ch0_spacesel_nxt;          
wire            ch0c_gbc_chbsy;            
wire            ch0c_gbc_chnen;            
wire            ch0c_gbc_pdvld;            
wire            ch0c_gbc_sfwtrg;           
wire            ch0regc_gbc_chiif;         
wire            ch10_prot_out;             
wire            ch10_spacesel_nxt;         
wire            ch10c_gbc_chbsy;           
wire            ch10c_gbc_chnen;           
wire            ch10c_gbc_pdvld;           
wire            ch10c_gbc_sfwtrg;          
wire            ch10regc_gbc_chiif;        
wire            ch11_prot_out;             
wire            ch11_spacesel_nxt;         
wire            ch11c_gbc_chbsy;           
wire            ch11c_gbc_chnen;           
wire            ch11c_gbc_pdvld;           
wire            ch11c_gbc_sfwtrg;          
wire            ch11regc_gbc_chiif;        
wire            ch12_prot_out;             
wire            ch12_spacesel_nxt;         
wire            ch12c_gbc_chbsy;           
wire            ch12c_gbc_chnen;           
wire            ch12c_gbc_pdvld;           
wire            ch12c_gbc_sfwtrg;          
wire            ch12regc_gbc_chiif;        
wire            ch13_prot_out;             
wire            ch13_spacesel_nxt;         
wire            ch13c_gbc_chbsy;           
wire            ch13c_gbc_chnen;           
wire            ch13c_gbc_pdvld;           
wire            ch13c_gbc_sfwtrg;          
wire            ch13regc_gbc_chiif;        
wire            ch14_prot_out;             
wire            ch14_spacesel_nxt;         
wire            ch14c_gbc_chbsy;           
wire            ch14c_gbc_chnen;           
wire            ch14c_gbc_pdvld;           
wire            ch14c_gbc_sfwtrg;          
wire            ch14regc_gbc_chiif;        
wire            ch15_prot_out;             
wire            ch15_spacesel_nxt;         
wire            ch15c_gbc_chbsy;           
wire            ch15c_gbc_chnen;           
wire            ch15c_gbc_pdvld;           
wire            ch15c_gbc_sfwtrg;          
wire            ch15regc_gbc_chiif;        
wire            ch1_prot_out;              
wire            ch1_spacesel_nxt;          
wire            ch1c_gbc_chbsy;            
wire            ch1c_gbc_chnen;            
wire            ch1c_gbc_pdvld;            
wire            ch1c_gbc_sfwtrg;           
wire            ch1regc_gbc_chiif;         
wire            ch2_prot_out;              
wire            ch2_spacesel_nxt;          
wire            ch2c_gbc_chbsy;            
wire            ch2c_gbc_chnen;            
wire            ch2c_gbc_pdvld;            
wire            ch2c_gbc_sfwtrg;           
wire            ch2regc_gbc_chiif;         
wire            ch3_prot_out;              
wire            ch3_spacesel_nxt;          
wire            ch3c_gbc_chbsy;            
wire            ch3c_gbc_chnen;            
wire            ch3c_gbc_pdvld;            
wire            ch3c_gbc_sfwtrg;           
wire            ch3regc_gbc_chiif;         
wire            ch4_prot_out;              
wire            ch4_spacesel_nxt;          
wire            ch4c_gbc_chbsy;            
wire            ch4c_gbc_chnen;            
wire            ch4c_gbc_pdvld;            
wire            ch4c_gbc_sfwtrg;           
wire            ch4regc_gbc_chiif;         
wire            ch5_prot_out;              
wire            ch5_spacesel_nxt;          
wire            ch5c_gbc_chbsy;            
wire            ch5c_gbc_chnen;            
wire            ch5c_gbc_pdvld;            
wire            ch5c_gbc_sfwtrg;           
wire            ch5regc_gbc_chiif;         
wire            ch6_prot_out;              
wire            ch6_spacesel_nxt;          
wire            ch6c_gbc_chbsy;            
wire            ch6c_gbc_chnen;            
wire            ch6c_gbc_pdvld;            
wire            ch6c_gbc_sfwtrg;           
wire            ch6regc_gbc_chiif;         
wire            ch7_prot_out;              
wire            ch7_spacesel_nxt;          
wire            ch7c_gbc_chbsy;            
wire            ch7c_gbc_chnen;            
wire            ch7c_gbc_pdvld;            
wire            ch7c_gbc_sfwtrg;           
wire            ch7regc_gbc_chiif;         
wire            ch8_prot_out;              
wire            ch8_spacesel_nxt;          
wire            ch8c_gbc_chbsy;            
wire            ch8c_gbc_chnen;            
wire            ch8c_gbc_pdvld;            
wire            ch8c_gbc_sfwtrg;           
wire            ch8regc_gbc_chiif;         
wire            ch9_prot_out;              
wire            ch9_spacesel_nxt;          
wire            ch9c_gbc_chbsy;            
wire            ch9c_gbc_chnen;            
wire            ch9c_gbc_pdvld;            
wire            ch9c_gbc_sfwtrg;           
wire            ch9regc_gbc_chiif;         
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
wire            gbc_chnc_dmacen;           
wire            hclk;                      
wire            hrst_n;                    
wire            reg_burst;                 
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
wire    [31:0]  s_hrdata_ch0;              
wire    [31:0]  s_hrdata_ch1;              
wire    [31:0]  s_hrdata_ch10;             
wire    [31:0]  s_hrdata_ch11;             
wire    [31:0]  s_hrdata_ch12;             
wire    [31:0]  s_hrdata_ch13;             
wire    [31:0]  s_hrdata_ch14;             
wire    [31:0]  s_hrdata_ch15;             
wire    [31:0]  s_hrdata_ch2;              
wire    [31:0]  s_hrdata_ch3;              
wire    [31:0]  s_hrdata_ch4;              
wire    [31:0]  s_hrdata_ch5;              
wire    [31:0]  s_hrdata_ch6;              
wire    [31:0]  s_hrdata_ch7;              
wire    [31:0]  s_hrdata_ch8;              
wire    [31:0]  s_hrdata_ch9;              
wire    [31:0]  s_hrdata_gbc;              
wire            s_hready;                  
wire    [1 :0]  s_hresp;                   
wire            s_hsel;                    
wire    [1 :0]  s_htrans;                  
wire    [31:0]  s_hwdata;                  
wire            s_hwrite;                  
gbregc  x_gbregc (
  .ch0c_gbc_chbsy     (ch0c_gbc_chbsy    ),
  .ch0c_gbc_pdvld     (ch0c_gbc_pdvld    ),
  .ch0regc_gbc_chiif  (ch0regc_gbc_chiif ),
  .ch10c_gbc_chbsy    (ch10c_gbc_chbsy   ),
  .ch10c_gbc_pdvld    (ch10c_gbc_pdvld   ),
  .ch10regc_gbc_chiif (ch10regc_gbc_chiif),
  .ch11c_gbc_chbsy    (ch11c_gbc_chbsy   ),
  .ch11c_gbc_pdvld    (ch11c_gbc_pdvld   ),
  .ch11regc_gbc_chiif (ch11regc_gbc_chiif),
  .ch12c_gbc_chbsy    (ch12c_gbc_chbsy   ),
  .ch12c_gbc_pdvld    (ch12c_gbc_pdvld   ),
  .ch12regc_gbc_chiif (ch12regc_gbc_chiif),
  .ch13c_gbc_chbsy    (ch13c_gbc_chbsy   ),
  .ch13c_gbc_pdvld    (ch13c_gbc_pdvld   ),
  .ch13regc_gbc_chiif (ch13regc_gbc_chiif),
  .ch14c_gbc_chbsy    (ch14c_gbc_chbsy   ),
  .ch14c_gbc_pdvld    (ch14c_gbc_pdvld   ),
  .ch14regc_gbc_chiif (ch14regc_gbc_chiif),
  .ch15c_gbc_chbsy    (ch15c_gbc_chbsy   ),
  .ch15c_gbc_pdvld    (ch15c_gbc_pdvld   ),
  .ch15regc_gbc_chiif (ch15regc_gbc_chiif),
  .ch1c_gbc_chbsy     (ch1c_gbc_chbsy    ),
  .ch1c_gbc_pdvld     (ch1c_gbc_pdvld    ),
  .ch1regc_gbc_chiif  (ch1regc_gbc_chiif ),
  .ch2c_gbc_chbsy     (ch2c_gbc_chbsy    ),
  .ch2c_gbc_pdvld     (ch2c_gbc_pdvld    ),
  .ch2regc_gbc_chiif  (ch2regc_gbc_chiif ),
  .ch3c_gbc_chbsy     (ch3c_gbc_chbsy    ),
  .ch3c_gbc_pdvld     (ch3c_gbc_pdvld    ),
  .ch3regc_gbc_chiif  (ch3regc_gbc_chiif ),
  .ch4c_gbc_chbsy     (ch4c_gbc_chbsy    ),
  .ch4c_gbc_pdvld     (ch4c_gbc_pdvld    ),
  .ch4regc_gbc_chiif  (ch4regc_gbc_chiif ),
  .ch5c_gbc_chbsy     (ch5c_gbc_chbsy    ),
  .ch5c_gbc_pdvld     (ch5c_gbc_pdvld    ),
  .ch5regc_gbc_chiif  (ch5regc_gbc_chiif ),
  .ch6c_gbc_chbsy     (ch6c_gbc_chbsy    ),
  .ch6c_gbc_pdvld     (ch6c_gbc_pdvld    ),
  .ch6regc_gbc_chiif  (ch6regc_gbc_chiif ),
  .ch7c_gbc_chbsy     (ch7c_gbc_chbsy    ),
  .ch7c_gbc_pdvld     (ch7c_gbc_pdvld    ),
  .ch7regc_gbc_chiif  (ch7regc_gbc_chiif ),
  .ch8c_gbc_chbsy     (ch8c_gbc_chbsy    ),
  .ch8c_gbc_pdvld     (ch8c_gbc_pdvld    ),
  .ch8regc_gbc_chiif  (ch8regc_gbc_chiif ),
  .ch9c_gbc_chbsy     (ch9c_gbc_chbsy    ),
  .ch9c_gbc_pdvld     (ch9c_gbc_pdvld    ),
  .ch9regc_gbc_chiif  (ch9regc_gbc_chiif ),
  .dmac_vic_if        (dmac_vic_if       ),
  .gbc_chnc_dmacen    (gbc_chnc_dmacen   ),
  .hclk               (hclk              ),
  .hrst_n             (hrst_n            ),
  .s_haddr            (s_haddr           ),
  .s_hprot            (s_hprot           ),
  .s_hrdata_chn       (s_hrdata_gbc      ),
  .s_hready           (s_hready          ),
  .s_hsel             (s_hsel            ),
  .s_htrans           (s_htrans          ),
  .s_hwdata           (s_hwdata          ),
  .s_hwrite           (s_hwrite          )
);
chregc0  x_chregc0 (
  .chn_prot_out              (ch0_prot_out             ),
  .chnc_gbc_chnen            (ch0c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch0c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch0c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch0regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc0_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc0_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc0_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc0_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc0_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc0_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc0_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc0_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc0_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc0_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc0_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc0_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch0    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc0_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch0en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch0_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch0             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
chregc1  x_chregc1 (
  .chn_prot_out              (ch1_prot_out             ),
  .chnc_gbc_chnen            (ch1c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch1c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch1c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch1regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc1_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc1_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc1_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc1_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc1_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc1_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc1_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc1_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc1_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc1_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc1_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc1_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch1    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc1_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch1en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch1_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch1             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`ifndef    CH2_OFF    
chregc2  x_chregc2 (
  .chn_prot_out              (ch2_prot_out             ),
  .chnc_gbc_chnen            (ch2c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch2c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch2c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch2regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc2_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc2_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc2_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc2_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc2_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc2_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc2_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc2_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc2_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc2_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc2_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc2_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch2    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc2_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch2en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch2_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch2             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH3_OFF    
chregc3  x_chregc3 (
  .chn_prot_out              (ch3_prot_out             ),
  .chnc_gbc_chnen            (ch3c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch3c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch3c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch3regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc3_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc3_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc3_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc3_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc3_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc3_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc3_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc3_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc3_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc3_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc3_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc3_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch3    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc3_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch3en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch3_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch3             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH4_OFF    
chregc4  x_chregc4 (
  .chn_prot_out              (ch4_prot_out             ),
  .chnc_gbc_chnen            (ch4c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch4c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch4c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch4regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc4_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc4_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc4_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc4_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc4_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc4_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc4_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc4_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc4_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc4_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc4_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc4_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch4    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc4_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch4en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch4_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch4             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH5_OFF    
chregc5  x_chregc5 (
  .chn_prot_out              (ch5_prot_out             ),
  .chnc_gbc_chnen            (ch5c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch5c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch5c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch5regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc5_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc5_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc5_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc5_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc5_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc5_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc5_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc5_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc5_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc5_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc5_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc5_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch5    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc5_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch5en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch5_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch5             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH6_OFF    
chregc6  x_chregc6 (
  .chn_prot_out              (ch6_prot_out             ),
  .chnc_gbc_chnen            (ch6c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch6c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch6c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch6regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc6_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc6_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc6_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc6_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc6_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc6_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc6_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc6_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc6_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc6_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc6_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc6_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch6    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc6_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch6en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch6_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch6             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH7_OFF    
chregc7  x_chregc7 (
  .chn_prot_out              (ch7_prot_out             ),
  .chnc_gbc_chnen            (ch7c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch7c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch7c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch7regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc7_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc7_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc7_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc7_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc7_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc7_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc7_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc7_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc7_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc7_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc7_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc7_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch7    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc7_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch7en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch7_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch7             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH8_OFF    
chregc8  x_chregc8 (
  .chn_prot_out              (ch8_prot_out             ),
  .chnc_gbc_chnen            (ch8c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch8c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch8c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch8regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc8_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc8_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc8_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc8_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc8_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc8_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc8_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc8_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc8_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc8_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc8_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc8_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch8    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc8_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch8en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch8_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch8             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH9_OFF    
chregc9  x_chregc9 (
  .chn_prot_out              (ch9_prot_out             ),
  .chnc_gbc_chnen            (ch9c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch9c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch9c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch9regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc9_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc9_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc9_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc9_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc9_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc9_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc9_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc9_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc9_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc9_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc9_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc9_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch9    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc9_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch9en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch9_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch9             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH10_OFF    
chregc10  x_chregc10 (
  .chn_prot_out               (ch10_prot_out             ),
  .chnc_gbc_chnen             (ch10c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch10c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch10c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch10regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc10_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc10_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc10_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc10_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc10_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc10_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc10_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc10_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc10_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc10_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc10_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc10_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc10_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc10_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc10_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc10_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc10_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch10en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch10_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch10             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH11_OFF    
chregc11  x_chregc11 (
  .chn_prot_out               (ch11_prot_out             ),
  .chnc_gbc_chnen             (ch11c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch11c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch11c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch11regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc11_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc11_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc11_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc11_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc11_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc11_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc11_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc11_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc11_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc11_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc11_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc11_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc11_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc11_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc11_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc11_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc11_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch11en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch11_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch11             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH12_OFF    
chregc12  x_chregc12 (
  .chn_prot_out               (ch12_prot_out             ),
  .chnc_gbc_chnen             (ch12c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch12c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch12c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch12regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc12_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc12_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc12_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc12_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc12_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc12_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc12_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc12_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc12_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc12_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc12_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc12_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc12_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc12_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc12_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc12_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc12_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch12en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch12_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch12             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH13_OFF    
chregc13  x_chregc13 (
  .chn_prot_out               (ch13_prot_out             ),
  .chnc_gbc_chnen             (ch13c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch13c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch13c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch13regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc13_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc13_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc13_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc13_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc13_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc13_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc13_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc13_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc13_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc13_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc13_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc13_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc13_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc13_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc13_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc13_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc13_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch13en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch13_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch13             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH14_OFF    
chregc14  x_chregc14 (
  .chn_prot_out               (ch14_prot_out             ),
  .chnc_gbc_chnen             (ch14c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch14c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch14c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch14regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc14_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc14_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc14_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc14_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc14_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc14_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc14_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc14_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc14_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc14_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc14_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc14_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc14_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc14_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc14_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc14_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc14_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch14en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch14_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch14             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH15_OFF    
chregc15  x_chregc15 (
  .chn_prot_out               (ch15_prot_out             ),
  .chnc_gbc_chnen             (ch15c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch15c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch15c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch15regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc15_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc15_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc15_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc15_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc15_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc15_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc15_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc15_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc15_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc15_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc15_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc15_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc15_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc15_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc15_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc15_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc15_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch15en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch15_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch15             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CH0_BAS_ADR    = 10'h000       ;   
parameter     CH1_BAS_ADR    = 10'h030       ;
parameter     CH2_BAS_ADR    = 10'h060       ;
parameter     CH3_BAS_ADR    = 10'h090       ; 
parameter     CH4_BAS_ADR    = 10'h0C0       ;
parameter     CH5_BAS_ADR    = 10'h0F0       ;
parameter     CH6_BAS_ADR    = 10'h120       ;  
parameter     CH7_BAS_ADR    = 10'h150       ;
parameter     CH8_BAS_ADR    = 10'h180       ; 
parameter     CH9_BAS_ADR    = 10'h1B0       ;  
parameter     CH10_BAS_ADR   = 10'h1E0       ;  
parameter     CH11_BAS_ADR   = 10'h210       ;     
parameter     CH12_BAS_ADR   = 10'h240       ;     
parameter     CH13_BAS_ADR   = 10'h270       ;   
parameter     CH14_BAS_ADR   = 10'h2A0       ;  
parameter     CH15_BAS_ADR   = 10'h2D0       ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ)   ;
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign   ch0_spacesel_nxt  = (   (s_haddr[9:0] < (CH0_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch1_spacesel_nxt  = (   (s_haddr[9:0] < (CH1_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch2_spacesel_nxt  = (   (s_haddr[9:0] < (CH2_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch3_spacesel_nxt  = (   (s_haddr[9:0] < (CH3_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch4_spacesel_nxt  = (   (s_haddr[9:0] < (CH4_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch5_spacesel_nxt  = (   (s_haddr[9:0] < (CH5_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch6_spacesel_nxt  = (   (s_haddr[9:0] < (CH6_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch7_spacesel_nxt  = (   (s_haddr[9:0] < (CH7_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch8_spacesel_nxt  = (   (s_haddr[9:0] < (CH8_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch9_spacesel_nxt  = (   (s_haddr[9:0] < (CH9_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch10_spacesel_nxt = (   (s_haddr[9:0] < (CH10_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch11_spacesel_nxt = (   (s_haddr[9:0] < (CH11_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch12_spacesel_nxt = (   (s_haddr[9:0] < (CH12_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch13_spacesel_nxt = (   (s_haddr[9:0] < (CH13_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch14_spacesel_nxt = (   (s_haddr[9:0] < (CH14_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch15_spacesel_nxt = (   (s_haddr[9:0] < (CH15_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin   
        ch0_spacesel  <= 1'b0 ; 
        ch1_spacesel  <= 1'b0 ; 
        ch2_spacesel  <= 1'b0 ; 
        ch3_spacesel  <= 1'b0 ; 
        ch4_spacesel  <= 1'b0 ; 
        ch5_spacesel  <= 1'b0 ; 
        ch6_spacesel  <= 1'b0 ; 
        ch7_spacesel  <= 1'b0 ; 
        ch8_spacesel  <= 1'b0 ; 
        ch9_spacesel  <= 1'b0 ; 
        ch10_spacesel <= 1'b0 ; 
        ch11_spacesel <= 1'b0 ; 
        ch12_spacesel <= 1'b0 ; 
        ch13_spacesel <= 1'b0 ; 
        ch14_spacesel <= 1'b0 ; 
        ch15_spacesel <= 1'b0 ; 
    end
    else    begin
        ch0_spacesel  <=  ch0_spacesel_nxt  ;
        ch1_spacesel  <=  ch1_spacesel_nxt  ;
        ch2_spacesel  <=  ch2_spacesel_nxt  ;
        ch3_spacesel  <=  ch3_spacesel_nxt  ;
        ch4_spacesel  <=  ch4_spacesel_nxt  ;
        ch5_spacesel  <=  ch5_spacesel_nxt  ;
        ch6_spacesel  <=  ch6_spacesel_nxt  ;
        ch7_spacesel  <=  ch7_spacesel_nxt  ;
        ch8_spacesel  <=  ch8_spacesel_nxt  ;
        ch9_spacesel  <=  ch9_spacesel_nxt  ;
        ch10_spacesel <= ch10_spacesel_nxt  ;
        ch11_spacesel <= ch11_spacesel_nxt  ;
        ch12_spacesel <= ch12_spacesel_nxt  ;
        ch13_spacesel <= ch13_spacesel_nxt  ;
        ch14_spacesel <= ch14_spacesel_nxt  ;
        ch15_spacesel <= ch15_spacesel_nxt  ;
     end
end 
assign s_hresp[1:0] = 2'b00;
assign   s_hrdata[31:0] =      ch0_spacesel   ?  s_hrdata_ch0[31:0] :
                               ch1_spacesel   ?  s_hrdata_ch1[31:0] :
                               ch2_spacesel   ?  s_hrdata_ch2[31:0] :
                               ch3_spacesel   ?  s_hrdata_ch3[31:0] :
                               ch4_spacesel   ?  s_hrdata_ch4[31:0] :
                               ch5_spacesel   ?  s_hrdata_ch5[31:0] :
                               ch6_spacesel   ?  s_hrdata_ch6[31:0] :
                               ch7_spacesel   ?  s_hrdata_ch7[31:0] :
                               ch8_spacesel   ?  s_hrdata_ch8[31:0] :
                               ch9_spacesel   ?  s_hrdata_ch9[31:0] :
                               ch10_spacesel  ?  s_hrdata_ch10[31:0] :
                               ch11_spacesel  ?  s_hrdata_ch11[31:0] :
                               ch12_spacesel  ?  s_hrdata_ch12[31:0] :
                               ch13_spacesel  ?  s_hrdata_ch13[31:0] :
                               ch14_spacesel  ?  s_hrdata_ch14[31:0] :
                               ch15_spacesel  ?  s_hrdata_ch15[31:0] : s_hrdata_gbc[31:0];
endmodule
