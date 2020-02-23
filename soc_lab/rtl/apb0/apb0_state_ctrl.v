/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module apb0_state_ctrl 
(
    input   wire                          i_hclk                    ,
    input   wire                          i_hrst_n                  ,
    input   wire                          i_pclk_en                 ,
    input   wire                          i_slave_hsel              ,
    input   wire                          i_slave_hreadyin          ,
    input   wire             [31:0]       i_slave_haddr             ,
    input   wire                          i_slave_hwrite            ,
    input   wire             [ 1:0]       i_slave_htrans            ,
    input   wire             [ 2:0]       i_slave_hsize             ,
    input   wire             [ 3:0]       i_slave_hburst            ,
    input   wire             [ 3:0]       i_slave_hprot             ,
    input   wire                          i_slave_hsec              ,
    input   wire             [31:0]       i_slave_hwdata            ,
    input   wire                          i_root_pready             ,
    input   wire                          i_root_pslverr            ,
    input   wire             [31:0]       i_root_prdata             ,
    output  reg                           o_slave_hreadyout         ,
    output  wire             [ 1:0]       o_slave_hresp             ,
    output  reg              [31:0]       o_slave_hrdata            ,
    output  reg                           o_root_psel               ,
    output  reg              [31:0]       o_root_paddr              ,
    output  reg                           o_root_penable            ,
    output  reg              [31:0]       o_root_pwdata             ,
    output  reg              [ 3:0]       o_root_pstrb              ,
    output  reg                           o_root_pwrite             ,
    output  reg              [ 2:0]       o_root_pprot              
);
parameter                                 IDLE          = 7'b0000001;
parameter                                 WTW           = 7'b0000010;
parameter                                 SPW           = 7'b0000100;
parameter                                 ASW           = 7'b0001000;
parameter                                 WTR           = 7'b0010000;
parameter                                 SPR           = 7'b0100000;
parameter                                 ASR           = 7'b1000000;
reg                                       pslverr_ff                ;
reg                          [ 6:0]       cstate                    ;
reg                          [ 6:0]       nstate                    ;
reg                                       hwdata_vld                ;
reg                                       nstate_spw                ;
reg                                       nstate_spr                ;
reg                                       nstate_asw                ;
reg                                       nstate_asr                ;
reg                          [ 3:0]       byte_en                   ;
wire                                      ahb_req                   ;
assign  ahb_req = i_slave_hsel & i_slave_htrans[1] & i_slave_hreadyin;
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_slave_hreadyout <= 1'b1;
    else if(o_slave_hreadyout == 1'b1)
        o_slave_hreadyout <= ~ahb_req;
    else if(o_root_penable == 1'b1 && i_pclk_en == 1'b1)
        o_slave_hreadyout <= i_root_pready;
    else ;
end
assign  pslverr = o_root_psel & o_root_penable & i_root_pready & i_root_pslverr;
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        pslverr_ff <= 1'b0;
    else if(i_pclk_en == 1'b1)
        pslverr_ff <= pslverr;
    else if(o_slave_hreadyout == 1'b1)
        pslverr_ff <= 1'b0;
    else ;
end
assign  o_slave_hresp = {1'b0, (pslverr & i_pclk_en) | pslverr_ff};
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_slave_hrdata <= 32'b0;
    else if(i_root_pready == 1'b1 && cstate == ASR)
        o_slave_hrdata <= i_root_prdata;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_psel <= 1'b0;
    else if(nstate_spw == 1'b1 || nstate_spr == 1'b1)
        o_root_psel <= 1'b1;
    else if(o_root_penable == 1'b1 && i_root_pready == 1'b1 && i_pclk_en == 1'b1)
        o_root_psel <= 1'b0;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_paddr <= 32'b0;
    else if(o_slave_hreadyout == 1'b1)
        o_root_paddr <= i_slave_haddr;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_penable <= 1'b0;
    else if(nstate_asw == 1'b1 || nstate_asr == 1'b1)
        o_root_penable <= 1'b1;
    else if(i_root_pready == 1'b1 && i_pclk_en == 1'b1)
        o_root_penable <= 1'b0;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        hwdata_vld <= 1'b0;
    else if(o_slave_hreadyout == 1'b1 && ahb_req == 1'b1 && i_slave_hwrite == 1'b1)
        hwdata_vld <= 1'b1;
    else
        hwdata_vld <= 1'b0;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_pwdata <= 32'b0;
    else if(hwdata_vld == 1'b1)
        o_root_pwdata <= i_slave_hwdata;
    else ;
end
always @(*)
begin
    case(i_slave_haddr[1:0])
        2'b00: begin
            if(i_slave_hsize == 3'b0)
                byte_en = 4'b0001;
            else if(i_slave_hsize == 3'b001)
                byte_en = 4'b0011;
            else if(i_slave_hsize == 3'b010)
                byte_en = 4'b1111;
            else
                byte_en = 4'b0;
        end
        2'b01: begin
            if(i_slave_hsize == 3'b0)
                byte_en = 4'b0010;
            else
                byte_en = 4'b0;
        end
        2'b10: begin
            if(i_slave_hsize == 3'b0)
                byte_en = 4'b0100;
            else if(i_slave_hsize == 3'b001)
                byte_en = 4'b1100;
            else
                byte_en = 4'b0;
        end
        default: begin
            if(i_slave_hsize == 3'b0)
                byte_en = 4'b1000;
            else
                byte_en = 4'b0;
        end
    endcase
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_pstrb <= 4'b0;
    else if(o_slave_hreadyout == 1'b1)
        o_root_pstrb <= byte_en;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_pwrite <= 1'b0;
    else if(o_slave_hreadyout == 1'b1)
        o_root_pwrite <= i_slave_hwrite;
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        o_root_pprot <= 3'b0;
    else if(o_slave_hreadyout == 1'b1)
        o_root_pprot <= {~i_slave_hprot[0], ~i_slave_hsec, i_slave_hprot[1]};
    else ;
end
always @(posedge i_hclk or negedge i_hrst_n)
begin
    if(i_hrst_n == 1'b0)
        cstate <= IDLE;
    else
        cstate <= nstate;
end
always @(*)
begin
    case(cstate)
        IDLE: begin
            if(ahb_req == 1'b1 && i_slave_hwrite == 1'b1)
                nstate = WTW;
            else if(ahb_req == 1'b1 && i_slave_hwrite == 1'b0 && i_pclk_en == 1'b1)
                nstate = SPR;
            else if(ahb_req == 1'b1 && i_slave_hwrite == 1'b0 && i_pclk_en == 1'b0)
                nstate = WTR;
            else
                nstate = IDLE;
        end
        WTW: begin
            if(i_pclk_en == 1'b1)
                nstate = SPW;
            else
                nstate = WTW;
        end
        SPW: begin
            if(i_pclk_en == 1'b1)
                nstate = ASW;
            else
                nstate = SPW;
        end
        ASW,
        ASR: begin
            if(i_root_pready == 1'b1 && i_pclk_en == 1'b1)
                nstate = IDLE;
            else
                nstate = cstate;
        end
        WTR: begin
            if(i_pclk_en == 1'b1)
                nstate = SPR;
            else
                nstate = WTR;
        end
        SPR: begin
            if(i_pclk_en == 1'b1)
                nstate = ASR;
            else
                nstate = SPR;
        end
        default: nstate = IDLE;
    endcase
end
always @(*)
begin
    if(cstate == WTW && i_pclk_en == 1'b1)
        nstate_spw = 1'b1;
    else if(cstate == SPW && i_pclk_en == 1'b0)
        nstate_spw = 1'b1;
    else
        nstate_spw = 1'b0;
end
always @(*)
begin
    if(cstate == IDLE && (ahb_req == 1'b1 && i_slave_hwrite == 1'b0 && i_pclk_en == 1'b1))
        nstate_spr = 1'b1;
    else if(cstate == WTR && i_pclk_en == 1'b1)
        nstate_spr = 1'b1;
    else if(cstate == SPR && i_pclk_en == 1'b0)
        nstate_spr = 1'b1;
    else
        nstate_spr = 1'b0;
end
always @(*)
begin
    if(cstate == SPW && i_pclk_en == 1'b1)
        nstate_asw = 1'b1;
    else if(cstate == ASW && (i_root_pready == 1'b0 || i_pclk_en == 1'b0))
        nstate_asw = 1'b1;
    else
        nstate_asw = 1'b0;
end
always @(*)
begin
    if(cstate == SPR && i_pclk_en == 1'b1)
        nstate_asr = 1'b1;
    else if(cstate == ASR && (i_root_pready == 1'b0 || i_pclk_en == 1'b0))
        nstate_asr = 1'b1;
    else
        nstate_asr = 1'b0;
end
endmodule
