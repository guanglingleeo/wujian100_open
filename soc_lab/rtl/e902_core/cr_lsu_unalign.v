/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_lsu_unalign(
  unalign_ctrl_not_last_beat,
  unalign_ctrl_stall,
  unalign_dp_first_req,
  unalign_dp_load_data_byte1_to_byte1,
  unalign_dp_load_data_byte1_to_byte2,
  unalign_dp_load_data_byte1_to_byte3,
  unalign_dp_load_data_byte1_to_byte4,
  unalign_dp_load_data_byte2_to_byte1,
  unalign_dp_load_data_byte2_to_byte2,
  unalign_dp_load_data_byte2_to_byte3,
  unalign_dp_load_data_byte2_to_byte4,
  unalign_dp_load_data_byte3_to_byte1,
  unalign_dp_load_data_byte3_to_byte2,
  unalign_dp_load_data_byte3_to_byte3,
  unalign_dp_load_data_byte3_to_byte4,
  unalign_dp_load_data_byte4_to_byte1,
  unalign_dp_load_data_byte4_to_byte2,
  unalign_dp_load_data_byte4_to_byte3,
  unalign_dp_load_data_byte4_to_byte4,
  unalign_dp_store_data_byte1_to_byte1,
  unalign_dp_store_data_byte1_to_byte2,
  unalign_dp_store_data_byte1_to_byte3,
  unalign_dp_store_data_byte1_to_byte4,
  unalign_dp_store_data_byte2_to_byte1,
  unalign_dp_store_data_byte2_to_byte2,
  unalign_dp_store_data_byte2_to_byte3,
  unalign_dp_store_data_byte2_to_byte4,
  unalign_dp_store_data_byte3_to_byte1,
  unalign_dp_store_data_byte3_to_byte2,
  unalign_dp_store_data_byte3_to_byte3,
  unalign_dp_store_data_byte3_to_byte4,
  unalign_dp_store_data_byte4_to_byte1,
  unalign_dp_store_data_byte4_to_byte2,
  unalign_dp_store_data_byte4_to_byte3,
  unalign_dp_store_data_byte4_to_byte4,
  unalign_top_clk_en,
  unalign_xx_split_on
);
output       unalign_ctrl_not_last_beat;          
output       unalign_ctrl_stall;                  
output       unalign_dp_first_req;                
output       unalign_dp_load_data_byte1_to_byte1; 
output       unalign_dp_load_data_byte1_to_byte2; 
output       unalign_dp_load_data_byte1_to_byte3; 
output       unalign_dp_load_data_byte1_to_byte4; 
output       unalign_dp_load_data_byte2_to_byte1; 
output       unalign_dp_load_data_byte2_to_byte2; 
output       unalign_dp_load_data_byte2_to_byte3; 
output       unalign_dp_load_data_byte2_to_byte4; 
output       unalign_dp_load_data_byte3_to_byte1; 
output       unalign_dp_load_data_byte3_to_byte2; 
output       unalign_dp_load_data_byte3_to_byte3; 
output       unalign_dp_load_data_byte3_to_byte4; 
output       unalign_dp_load_data_byte4_to_byte1; 
output       unalign_dp_load_data_byte4_to_byte2; 
output       unalign_dp_load_data_byte4_to_byte3; 
output       unalign_dp_load_data_byte4_to_byte4; 
output       unalign_dp_store_data_byte1_to_byte1; 
output       unalign_dp_store_data_byte1_to_byte2; 
output       unalign_dp_store_data_byte1_to_byte3; 
output       unalign_dp_store_data_byte1_to_byte4; 
output       unalign_dp_store_data_byte2_to_byte1; 
output       unalign_dp_store_data_byte2_to_byte2; 
output       unalign_dp_store_data_byte2_to_byte3; 
output       unalign_dp_store_data_byte2_to_byte4; 
output       unalign_dp_store_data_byte3_to_byte1; 
output       unalign_dp_store_data_byte3_to_byte2; 
output       unalign_dp_store_data_byte3_to_byte3; 
output       unalign_dp_store_data_byte3_to_byte4; 
output       unalign_dp_store_data_byte4_to_byte1; 
output       unalign_dp_store_data_byte4_to_byte2; 
output       unalign_dp_store_data_byte4_to_byte3; 
output       unalign_dp_store_data_byte4_to_byte4; 
output       unalign_top_clk_en;                  
output       unalign_xx_split_on;                 
wire         unalign_ctrl_not_last_beat;          
wire         unalign_ctrl_stall;                  
wire         unalign_dp_first_req;                
wire         unalign_dp_load_data_byte1_to_byte1; 
wire         unalign_dp_load_data_byte1_to_byte2; 
wire         unalign_dp_load_data_byte1_to_byte3; 
wire         unalign_dp_load_data_byte1_to_byte4; 
wire         unalign_dp_load_data_byte2_to_byte1; 
wire         unalign_dp_load_data_byte2_to_byte2; 
wire         unalign_dp_load_data_byte2_to_byte3; 
wire         unalign_dp_load_data_byte2_to_byte4; 
wire         unalign_dp_load_data_byte3_to_byte1; 
wire         unalign_dp_load_data_byte3_to_byte2; 
wire         unalign_dp_load_data_byte3_to_byte3; 
wire         unalign_dp_load_data_byte3_to_byte4; 
wire         unalign_dp_load_data_byte4_to_byte1; 
wire         unalign_dp_load_data_byte4_to_byte2; 
wire         unalign_dp_load_data_byte4_to_byte3; 
wire         unalign_dp_load_data_byte4_to_byte4; 
wire         unalign_dp_store_data_byte1_to_byte1; 
wire         unalign_dp_store_data_byte1_to_byte2; 
wire         unalign_dp_store_data_byte1_to_byte3; 
wire         unalign_dp_store_data_byte1_to_byte4; 
wire         unalign_dp_store_data_byte2_to_byte1; 
wire         unalign_dp_store_data_byte2_to_byte2; 
wire         unalign_dp_store_data_byte2_to_byte3; 
wire         unalign_dp_store_data_byte2_to_byte4; 
wire         unalign_dp_store_data_byte3_to_byte1; 
wire         unalign_dp_store_data_byte3_to_byte2; 
wire         unalign_dp_store_data_byte3_to_byte3; 
wire         unalign_dp_store_data_byte3_to_byte4; 
wire         unalign_dp_store_data_byte4_to_byte1; 
wire         unalign_dp_store_data_byte4_to_byte2; 
wire         unalign_dp_store_data_byte4_to_byte3; 
wire         unalign_dp_store_data_byte4_to_byte4; 
wire         unalign_top_clk_en;                  
wire         unalign_xx_split_on;                 
assign unalign_top_clk_en = 1'b0;
assign unalign_ctrl_not_last_beat = 1'b0;
assign unalign_ctrl_stall = 1'b0;
assign unalign_dp_first_req = 1'b1;
assign unalign_xx_split_on = 1'b0;
assign unalign_dp_load_data_byte1_to_byte1 = 1'b0;
assign unalign_dp_load_data_byte1_to_byte2 = 1'b0;
assign unalign_dp_load_data_byte1_to_byte3 = 1'b0;
assign unalign_dp_load_data_byte1_to_byte4 = 1'b0;
assign unalign_dp_load_data_byte2_to_byte1 = 1'b0;
assign unalign_dp_load_data_byte2_to_byte2 = 1'b0;
assign unalign_dp_load_data_byte2_to_byte3 = 1'b0;
assign unalign_dp_load_data_byte2_to_byte4 = 1'b0;
assign unalign_dp_load_data_byte3_to_byte1 = 1'b0;
assign unalign_dp_load_data_byte3_to_byte2 = 1'b0;
assign unalign_dp_load_data_byte3_to_byte3 = 1'b0;
assign unalign_dp_load_data_byte3_to_byte4 = 1'b0;
assign unalign_dp_load_data_byte4_to_byte1 = 1'b0;
assign unalign_dp_load_data_byte4_to_byte2 = 1'b0;
assign unalign_dp_load_data_byte4_to_byte3 = 1'b0;
assign unalign_dp_load_data_byte4_to_byte4 = 1'b0;
assign unalign_dp_store_data_byte1_to_byte1 = 1'b0;
assign unalign_dp_store_data_byte1_to_byte2 = 1'b0;
assign unalign_dp_store_data_byte1_to_byte3 = 1'b0;
assign unalign_dp_store_data_byte1_to_byte4 = 1'b0;
assign unalign_dp_store_data_byte2_to_byte1 = 1'b0;
assign unalign_dp_store_data_byte2_to_byte2 = 1'b0;
assign unalign_dp_store_data_byte2_to_byte3 = 1'b0;
assign unalign_dp_store_data_byte2_to_byte4 = 1'b0;
assign unalign_dp_store_data_byte3_to_byte1 = 1'b0;
assign unalign_dp_store_data_byte3_to_byte2 = 1'b0;
assign unalign_dp_store_data_byte3_to_byte3 = 1'b0;
assign unalign_dp_store_data_byte3_to_byte4 = 1'b0;
assign unalign_dp_store_data_byte4_to_byte1 = 1'b0;
assign unalign_dp_store_data_byte4_to_byte2 = 1'b0;
assign unalign_dp_store_data_byte4_to_byte3 = 1'b0;
assign unalign_dp_store_data_byte4_to_byte4 = 1'b0;
endmodule
