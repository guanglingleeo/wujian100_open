/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module apb0_leaf_mux #
(
    `include    "apb0_params.v"
)
(
    input   wire                                             i_root_psel               ,
    input   wire             [31:0]                          i_root_paddr              ,
    input   wire                                             i_root_penable            ,
    input   wire             [31:0]                          i_root_pwdata             ,
    input   wire             [ 3:0]                          i_root_pstrb              ,
    input   wire                                             i_root_pwrite             ,
    input   wire             [ 2:0]                          i_root_pprot              ,
    input   wire             [   APB_LEAF_SLV_NUM-1:0]       i_leaf_slave_pready       ,
    input   wire             [   APB_LEAF_SLV_NUM-1:0]       i_leaf_slave_pslverr      ,
    input   wire             [32*APB_LEAF_SLV_NUM-1:0]       i_leaf_slave_prdata       ,
    output  wire                                             o_root_pready             ,
    output  wire                                             o_root_pslverr            ,
    output  reg              [31:0]                          o_root_prdata             ,
    output  wire             [   APB_LEAF_SLV_NUM-1:0]       o_leaf_slave_psel         ,
    output  wire             [31:0]                          o_leaf_slave_paddr        ,
    output  wire                                             o_leaf_slave_penable      ,
    output  wire             [31:0]                          o_leaf_slave_pwdata       ,
    output  wire             [ 3:0]                          o_leaf_slave_pstrb        ,
    output  wire                                             o_leaf_slave_pwrite       ,
    output  wire             [ 2:0]                          o_leaf_slave_pprot        
);
wire                         [15:0]                          leaf_psel                 ;
wire                                                         root_pready_normal        ;
wire                                                         root_pready_abnormal      ;
wire                                                         root_pslverr_normal       ;
wire                                                         root_pslverr_abnormal     ;
integer                                                      i                         ;
assign  leaf_psel[ 0] = (i_root_paddr >= APB_LEAF_SLV0_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV0_END_ADDR);
assign  leaf_psel[ 1] = (i_root_paddr >= APB_LEAF_SLV1_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV1_END_ADDR);
assign  leaf_psel[ 2] = (i_root_paddr >= APB_LEAF_SLV2_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV2_END_ADDR);
assign  leaf_psel[ 3] = (i_root_paddr >= APB_LEAF_SLV3_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV3_END_ADDR);
assign  leaf_psel[ 4] = (i_root_paddr >= APB_LEAF_SLV4_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV4_END_ADDR);
assign  leaf_psel[ 5] = (i_root_paddr >= APB_LEAF_SLV5_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV5_END_ADDR);
assign  leaf_psel[ 6] = (i_root_paddr >= APB_LEAF_SLV6_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV6_END_ADDR);
assign  leaf_psel[ 7] = (i_root_paddr >= APB_LEAF_SLV7_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV7_END_ADDR);
assign  leaf_psel[ 8] = (i_root_paddr >= APB_LEAF_SLV8_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV8_END_ADDR);
assign  leaf_psel[ 9] = (i_root_paddr >= APB_LEAF_SLV9_START_ADDR)  & (i_root_paddr <= APB_LEAF_SLV9_END_ADDR);
assign  leaf_psel[10] = (i_root_paddr >= APB_LEAF_SLV10_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV10_END_ADDR);
assign  leaf_psel[11] = (i_root_paddr >= APB_LEAF_SLV11_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV11_END_ADDR);
assign  leaf_psel[12] = (i_root_paddr >= APB_LEAF_SLV12_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV12_END_ADDR);
assign  leaf_psel[13] = (i_root_paddr >= APB_LEAF_SLV13_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV13_END_ADDR);
assign  leaf_psel[14] = (i_root_paddr >= APB_LEAF_SLV14_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV14_END_ADDR);
assign  leaf_psel[15] = (i_root_paddr >= APB_LEAF_SLV15_START_ADDR) & (i_root_paddr <= APB_LEAF_SLV15_END_ADDR);
assign  o_leaf_slave_psel     = (i_root_psel == 1'b1) ? leaf_psel[APB_LEAF_SLV_NUM-1:0] :
                                                        {APB_LEAF_SLV_NUM{1'b0}};
assign  root_pready_normal    = |(leaf_psel[APB_LEAF_SLV_NUM-1:0] & i_leaf_slave_pready);
assign  root_pslverr_normal   = |(leaf_psel[APB_LEAF_SLV_NUM-1:0] & i_leaf_slave_pslverr);
assign  root_pready_abnormal  = i_root_psel & (~(|leaf_psel));
assign  root_pslverr_abnormal = root_pready_abnormal;
assign  o_root_pready         = root_pready_normal | root_pready_abnormal;
assign  o_root_pslverr        = root_pslverr_normal | root_pslverr_abnormal;
always @(*)
begin: PRDATA_MUX_PROC
    o_root_prdata = i_leaf_slave_prdata[31:0];
    for(i=1;i<APB_LEAF_SLV_NUM;i=i+1) begin
        if(leaf_psel[i]==1'b1) begin
            o_root_prdata = i_leaf_slave_prdata >> (i*32);
        end
    end
end    
assign  o_leaf_slave_paddr    = i_root_paddr;
assign  o_leaf_slave_penable  = i_root_penable;
assign  o_leaf_slave_pwdata   = i_root_pwdata;
assign  o_leaf_slave_pstrb    = i_root_pstrb;
assign  o_leaf_slave_pwrite   = i_root_pwrite;
assign  o_leaf_slave_pprot    = i_root_pprot;
endmodule
