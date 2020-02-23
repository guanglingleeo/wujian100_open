/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_special(
  ctrl_special_ex_sel,
  ctrl_special_expt_vec,
  ctrl_special_expt_vld,
  decd_special_fencei,
  special_pcgen_chgflw_vld,
  special_rbus_expt_vec,
  special_rbus_expt_vld,
  special_rbus_flush,
  special_rbus_req,
  special_retire_inst_wsc,
  wb_special_st_uncmplt,
  wb_special_store
);
input          ctrl_special_ex_sel;     
input   [4:0]  ctrl_special_expt_vec;   
input          ctrl_special_expt_vld;   
input          decd_special_fencei;     
input          wb_special_st_uncmplt;   
input          wb_special_store;        
output         special_pcgen_chgflw_vld; 
output  [4:0]  special_rbus_expt_vec;   
output         special_rbus_expt_vld;   
output         special_rbus_flush;      
output         special_rbus_req;        
output         special_retire_inst_wsc; 
wire           ctrl_special_ex_sel;     
wire    [4:0]  ctrl_special_expt_vec;   
wire           ctrl_special_expt_vld;   
wire           decd_special_fencei;     
wire           fencei_cmplt;            
wire           special_pcgen_chgflw_vld; 
wire    [4:0]  special_rbus_expt_vec;   
wire           special_rbus_expt_vld;   
wire           special_rbus_flush;      
wire           special_rbus_req;        
wire           special_retire_inst_wsc; 
wire           special_stall;           
wire           wb_special_st_uncmplt;   
wire           wb_special_store;        
assign special_stall = decd_special_fencei &&  wb_special_st_uncmplt;
assign fencei_cmplt  = decd_special_fencei && !wb_special_st_uncmplt;
assign special_rbus_req         = ctrl_special_ex_sel && !special_stall;
assign special_rbus_flush       = wb_special_store && fencei_cmplt;
assign special_pcgen_chgflw_vld = wb_special_store && fencei_cmplt;
assign special_rbus_expt_vld      = ctrl_special_expt_vld;
assign special_rbus_expt_vec[4:0] = ctrl_special_expt_vec[4:0];
assign special_retire_inst_wsc = 1'b0;
endmodule
