/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module spi(
  clk,
  clk_div0,
  cpha,
  cpol,
  f_nss,
  f_sclk,
  i_nss_in,
  nss_toggle,
  r_sclk,
  rst_n,
  rx_full,
  rx_wr_data,
  spi_data_size,
  spi_intr_en,
  spi_mi,
  spi_mo,
  spi_rx_en,
  spi_rx_wen,
  spi_si,
  spi_so,
  spi_stop_clr,
  spi_stop_intr,
  spi_tx_en,
  spi_tx_ren,
  spi_work,
  spim_en,
  spim_nss,
  spim_sck,
  spis_en,
  tx_empty,
  tx_rd_data
);
input           clk;           
input   [23:1]  clk_div0;      
input           cpha;          
input           cpol;          
input           f_nss;         
input           f_sclk;        
input           i_nss_in;      
input           nss_toggle;    
input           r_sclk;        
input           rst_n;         
input           rx_full;       
input   [3 :0]  spi_data_size; 
input           spi_intr_en;   
input           spi_mi;        
input           spi_rx_en;     
input           spi_si;        
input           spi_stop_clr;  
input           spi_tx_en;     
input           spim_en;       
input           spis_en;       
input           tx_empty;      
input   [15:0]  tx_rd_data;    
output  [15:0]  rx_wr_data;    
output          spi_mo;        
output          spi_rx_wen;    
output          spi_so;        
output          spi_stop_intr; 
output          spi_tx_ren;    
output          spi_work;      
output          spim_nss;      
output          spim_sck;      
reg     [3 :0]  cnt_bits;      
reg             cnt_bits0_d;   
reg             data_chg;      
reg             data_smp;      
reg             f_nss_d;       
reg     [1 :0]  nxt_spim_fsm;  
reg             spi_mo;        
reg             spi_so;        
reg             spi_stop_intr; 
reg             spim_1st_bit;  
reg     [1 :0]  spim_fsm;      
reg             spim_nss;      
reg     [15:0]  spim_rx;       
reg             spim_sck;      
reg             spis_1st_bit;  
reg     [15:0]  spis_rx;       
reg             spis_rx_en;    
reg             spis_rx_wen;   
reg     [1 :0]  stop_cnt;      
reg     [4 :0]  txcnt_bits;    
reg     [22:0]  txcnt_div;     
wire            clk;           
wire    [23:1]  clk_div0;      
wire            cpha;          
wire            cpol;          
wire            f_nss;         
wire            f_sclk;        
wire            i_nss_in;      
wire            nss_toggle;    
wire            r_sclk;        
wire            rst_n;         
wire            rx_full;       
wire    [15:0]  rx_wr_data;    
wire    [3 :0]  spi_data_size; 
wire            spi_intr_en;   
wire            spi_mi;        
wire            spi_rx_en;     
wire            spi_rx_wen;    
wire            spi_si;        
wire            spi_stop_clr;  
wire            spi_tx_en;     
wire            spi_tx_ren;    
wire            spi_work;      
wire            spim_all_end;  
wire            spim_data;     
wire            spim_data_end; 
wire            spim_en;       
wire            spim_idle;     
wire            spim_idle_end; 
wire            spim_nss_clr;  
wire            spim_nss_set;  
wire            spim_rx_wen;   
wire            spim_start;    
wire            spim_start_end; 
wire            spim_stop;     
wire            spim_stop_end; 
wire            spim_stop_intr; 
wire            spim_tx_ren;   
wire            spis_cnt_load; 
wire            spis_en;       
wire            spis_stop_intr; 
wire            spis_tx_ren;   
wire            stop_judge;    
wire            tx_empty;      
wire    [15:0]  tx_rd_data;    
wire            txcnt_div_eq;  
parameter   SPIM_IDLE  = 2'b00,
            SPIM_START = 2'b01,
            SPIM_DATA  = 2'b11,
            SPIM_STOP  = 2'b10;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_fsm[1:0]   <= SPIM_IDLE;
    else
        spim_fsm[1:0]   <= nxt_spim_fsm[1:0];
end
always @( stop_judge
       or spim_data_end
       or spim_fsm[1:0]
       or spim_idle_end
       or spim_start_end
       or spim_stop_end)
begin
    case(spim_fsm[1:0])
        SPIM_IDLE:
            if(spim_idle_end)
                nxt_spim_fsm[1:0] = SPIM_START;
            else
                nxt_spim_fsm[1:0] = SPIM_IDLE;
        SPIM_START:
            if(spim_start_end)
                nxt_spim_fsm[1:0] = SPIM_DATA;
            else
                nxt_spim_fsm[1:0] = SPIM_START;
        SPIM_DATA:
            if(spim_data_end)
                nxt_spim_fsm[1:0] = SPIM_STOP;
            else
                nxt_spim_fsm[1:0] = SPIM_DATA;
        SPIM_STOP:
            if(spim_stop_end)
                if(stop_judge)
                    nxt_spim_fsm[1:0] = SPIM_IDLE;
                else
                    nxt_spim_fsm[1:0] = SPIM_START;
            else
                nxt_spim_fsm[1:0] = SPIM_STOP;
    endcase
end
assign  spim_idle_end = spim_idle & ((spi_tx_en & (~spi_rx_en) & (~tx_empty)) 
                        | ((~spi_tx_en) & spi_rx_en & (~rx_full)) 
                        | (spi_tx_en & spi_rx_en & (~tx_empty) & (~rx_full)));
assign  spim_start_end = spim_start & txcnt_div_eq;
assign  spim_data_end = spim_data & (~|txcnt_bits[4:0]) & txcnt_div_eq;
assign  spim_stop_end = spim_stop & txcnt_div_eq & (nss_toggle ? (stop_cnt[1:0] == 2'b10) : 1'b1);
assign  spim_all_end = spim_idle_end | spim_start_end | spim_data_end | spim_stop_end;
assign  stop_judge = (spi_tx_en & tx_empty) | (spi_rx_en & rx_full);
assign  spim_idle = (spim_fsm[1:0] == SPIM_IDLE);
assign  spim_start = (spim_fsm[1:0] == SPIM_START);
assign  spim_data = (spim_fsm[1:0] == SPIM_DATA);
assign  spim_stop = (spim_fsm[1:0] == SPIM_STOP);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_bits[4:0] <= 5'd0;
    else if(spim_start_end || ((~tx_empty) && spim_stop_end))
        txcnt_bits[4:0] <= {spi_data_size[3:0], 1'b1};
    else if(spim_idle || spim_start || spim_stop || spim_data_end)
        txcnt_bits[4:0] <= 5'd0;
    else if(txcnt_div_eq)
        txcnt_bits[4:0] <= txcnt_bits[4:0] - 5'd1;
end
assign  txcnt_div_eq  = (txcnt_div[22:0] == clk_div0[23:1]);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_div[22:0] <= 23'd0;
    else if(txcnt_div_eq || spim_all_end)
        txcnt_div[22:0] <= 23'd0;
    else
        txcnt_div[22:0] <= txcnt_div[22:0] + 23'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_mo  <= 1'b0;
    else if(~spim_en)
        spi_mo  <= 1'b0;
    else if((~txcnt_bits[0]) && txcnt_div_eq && spi_tx_en && (~tx_empty))
        case(txcnt_bits[4:1]) // synopsys parallel_case
            4'd0:  spi_mo <= spim_1st_bit;
            4'd1:  spi_mo <= tx_rd_data[0];
            4'd2:  spi_mo <= tx_rd_data[1];
            4'd3:  spi_mo <= tx_rd_data[2];
            4'd4:  spi_mo <= tx_rd_data[3];
            4'd5:  spi_mo <= tx_rd_data[4];
            4'd6:  spi_mo <= tx_rd_data[5];
            4'd7:  spi_mo <= tx_rd_data[6];
            4'd8:  spi_mo <= tx_rd_data[7];
            4'd9:  spi_mo <= tx_rd_data[8];
            4'd10: spi_mo <= tx_rd_data[9];
            4'd11: spi_mo <= tx_rd_data[10];
            4'd12: spi_mo <= tx_rd_data[11];
            4'd13: spi_mo <= tx_rd_data[12];
            4'd14: spi_mo <= tx_rd_data[13];
            4'd15: spi_mo <= tx_rd_data[14];
        endcase
end
always @( tx_rd_data[15:3]
       or spim_start_end
       or spi_mo
       or spi_data_size[3:0]
       or tx_rd_data[4:3]
       or spim_stop_end)
begin
    if(spim_stop_end || spim_start_end)
    case(spi_data_size[3:0]) // synopsys parallel_case
        4'd0, 4'h1, 4'h2: spim_1st_bit = tx_rd_data[7];
        4'd3:  spim_1st_bit = tx_rd_data[3];
        4'd4:  spim_1st_bit = tx_rd_data[4];
        4'd5:  spim_1st_bit = tx_rd_data[5];
        4'd6:  spim_1st_bit = tx_rd_data[6];
        4'd7:  spim_1st_bit = tx_rd_data[7];
        4'd8:  spim_1st_bit = tx_rd_data[8];
        4'd9:  spim_1st_bit = tx_rd_data[9];
        4'd10: spim_1st_bit = tx_rd_data[10];
        4'd11: spim_1st_bit = tx_rd_data[11];
        4'd12: spim_1st_bit = tx_rd_data[12];
        4'd13: spim_1st_bit = tx_rd_data[13];
        4'd14: spim_1st_bit = tx_rd_data[14];
        4'd15: spim_1st_bit = tx_rd_data[15];
    endcase
    else
        spim_1st_bit = spi_mo;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_sck <= 1'b0;
    else if(~spim_en)
        spim_sck <= cpol;
    else
        if(~cpha) 
        begin
            if(spim_idle || spim_start || spim_stop)
                spim_sck <= cpol;
            else if(spim_data && txcnt_div_eq)
                spim_sck <= ~spim_sck;
        end
        else
        begin
            if(spim_idle || spim_stop)
                spim_sck <= cpol;
            else if(spim_start_end)
                spim_sck <= ~spim_sck;
            else if(spim_data_end || spim_start)
                spim_sck <= cpol;
            else if(spim_data && txcnt_div_eq)
                spim_sck <= ~spim_sck;
        end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_rx <= 16'd0;
    else if(spi_rx_en && spim_data && data_smp)
        case(txcnt_bits[4:1]) // synopsys parallel_case
            4'd0: spim_rx[0] <= spi_mi;
            4'd1: spim_rx[1] <= spi_mi;
            4'd2: spim_rx[2] <= spi_mi;
            4'd3: spim_rx[3] <= spi_mi;
            4'd4: spim_rx[4] <= spi_mi;
            4'd5: spim_rx[5] <= spi_mi;
            4'd6: spim_rx[6] <= spi_mi;
            4'd7: spim_rx[7] <= spi_mi;
            4'd8: spim_rx[8] <= spi_mi;
            4'd9: spim_rx[9] <= spi_mi;
            4'd10: spim_rx[10] <= spi_mi;
            4'd11: spim_rx[11] <= spi_mi;
            4'd12: spim_rx[12] <= spi_mi;
            4'd13: spim_rx[13] <= spi_mi;
            4'd14: spim_rx[14] <= spi_mi;
            4'd15: spim_rx[15] <= spi_mi;
        endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        stop_cnt[1:0]   <= 2'b00;
    else if(spim_stop_end)
        stop_cnt[1:0]   <= 2'b00;
    else if(txcnt_div_eq && spim_stop)
        stop_cnt[1:0]   <= stop_cnt[1:0] + 2'b01;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_nss <= 1'b1;
    else if(spim_nss_clr)
        spim_nss <= 1'b0;
    else if(spim_nss_set)
        spim_nss <= 1'b1;
end
assign  spim_nss_clr = spim_idle_end | (nss_toggle ? (spim_stop_end & (~stop_judge)) : 1'b0);
assign  spim_nss_set = spim_idle | (nss_toggle ? (spim_stop & txcnt_div_eq) : (spim_stop_end & stop_judge));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        cnt_bits[3:0] <= 4'd0;
    else if(~spis_en | i_nss_in)
        cnt_bits[3:0] <= 4'd0;
    else if(spis_cnt_load)
        cnt_bits[3:0] <= spi_data_size[3:0];
    else if(data_chg && ~i_nss_in)
        cnt_bits[3:0] <= cnt_bits[3:0] - 4'd1;
end
assign  spis_cnt_load = cpha ? ((~|cnt_bits) & data_chg & ~i_nss_in) : (((~|cnt_bits) & data_chg & (~i_nss_in)) | f_nss_d);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        f_nss_d <= 1'b0;
    else
        f_nss_d <= f_nss;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx[15:0] <= 16'd0;
    else if(~spis_en)
        spis_rx[15:0] <= 16'd0;
    else if(data_smp && spi_rx_en)
        case(cnt_bits[3:0]) // synopsys parallel_case
            4'd0:  spis_rx[0] <= spi_si;
            4'd1:  spis_rx[1] <= spi_si;
            4'd2:  spis_rx[2] <= spi_si;
            4'd3:  spis_rx[3] <= spi_si;
            4'd4:  spis_rx[4] <= spi_si;
            4'd5:  spis_rx[5] <= spi_si;
            4'd6:  spis_rx[6] <= spi_si;
            4'd7:  spis_rx[7] <= spi_si;
            4'd8:  spis_rx[8] <= spi_si;
            4'd9:  spis_rx[9] <= spi_si;
            4'd10: spis_rx[10] <= spi_si;
            4'd11: spis_rx[11] <= spi_si;
            4'd12: spis_rx[12] <= spi_si;
            4'd13: spis_rx[13] <= spi_si;
            4'd14: spis_rx[14] <= spi_si;
            4'd15: spis_rx[15] <= spi_si;
        endcase
end
always @( cpha
       or f_sclk
       or r_sclk
       or cpol)
begin
    if(cpha)
    begin
        data_smp = cpol ? r_sclk : f_sclk;
        data_chg = cpol ? f_sclk : r_sclk;
    end
    else
    begin
        data_smp = cpol ? f_sclk : r_sclk;
        data_chg = (cpol ? r_sclk : f_sclk);
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        cnt_bits0_d <= 1'b0;
    else 
        cnt_bits0_d <= (cnt_bits[3:0] == 4'd1);
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx_en  <= 1'b0;
    else if(spis_rx_wen)
        spis_rx_en  <= 1'b0;
    else if(~|cnt_bits[3:0] && cnt_bits0_d)
        spis_rx_en  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx_wen <= 1'b0;
    else if(spis_rx_en && data_smp && spi_rx_en && spis_en)
        spis_rx_wen <= 1'b1;
    else
        spis_rx_wen <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_so  <= 1'b0;
    else if(f_nss_d)
        spi_so <= spis_1st_bit;
    else if((spis_cnt_load | ((~i_nss_in) && data_chg)) && spi_tx_en && (~tx_empty))
        case(cnt_bits[3:0])
            4'd0:  spi_so <= spis_1st_bit;
            4'd1:  spi_so <= tx_rd_data[0];
            4'd2:  spi_so <= tx_rd_data[1];
            4'd3:  spi_so <= tx_rd_data[2];
            4'd4:  spi_so <= tx_rd_data[3];
            4'd5:  spi_so <= tx_rd_data[4];
            4'd6:  spi_so <= tx_rd_data[5];
            4'd7:  spi_so <= tx_rd_data[6];
            4'd8:  spi_so <= tx_rd_data[7];
            4'd9:  spi_so <= tx_rd_data[8];
            4'd10: spi_so <= tx_rd_data[9];
            4'd11: spi_so <= tx_rd_data[10];
            4'd12: spi_so <= tx_rd_data[11];
            4'd13: spi_so <= tx_rd_data[12];
            4'd14: spi_so <= tx_rd_data[13];
            4'd15: spi_so <= tx_rd_data[14];
        endcase
end
always @( tx_rd_data[15:3]
       or spi_data_size[3:0]
       or tx_rd_data[4:3])
begin
    case(spi_data_size[3:0]) // synopsys parallel_case
        4'd0, 4'h1, 4'h2: spis_1st_bit = tx_rd_data[7];
        4'd3:  spis_1st_bit = tx_rd_data[3];
        4'd4:  spis_1st_bit = tx_rd_data[4];
        4'd5:  spis_1st_bit = tx_rd_data[5];
        4'd6:  spis_1st_bit = tx_rd_data[6];
        4'd7:  spis_1st_bit = tx_rd_data[7];
        4'd8:  spis_1st_bit = tx_rd_data[8];
        4'd9:  spis_1st_bit = tx_rd_data[9];
        4'd10: spis_1st_bit = tx_rd_data[10];
        4'd11: spis_1st_bit = tx_rd_data[11];
        4'd12: spis_1st_bit = tx_rd_data[12];
        4'd13: spis_1st_bit = tx_rd_data[13];
        4'd14: spis_1st_bit = tx_rd_data[14];
        4'd15: spis_1st_bit = tx_rd_data[15];
    endcase
end
assign  rx_wr_data[15:0]  = ({16{spis_en}} & spis_rx) | ({16{spim_en}} & spim_rx);
assign  spis_tx_ren = spis_en & spi_tx_en & (~i_nss_in) & (~|cnt_bits[3:0]) & data_smp;
assign  spim_tx_ren = spim_data & (txcnt_bits[4:0] == 5'd0) & txcnt_div_eq & spi_tx_en;
assign  spim_rx_wen = spim_data & (~|txcnt_bits[4:0]) & txcnt_div_eq;
assign  spi_tx_ren  = (spis_en & spis_tx_ren) | (spim_en & spim_tx_ren);
assign  spi_rx_wen  = (spis_en & spis_rx_wen) | (spim_en & spim_rx_wen);
assign  spi_work  = (spim_en & (~spim_idle)) | (spis_en & (~i_nss_in));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_stop_intr   <= 1'b0;
    else if(spi_stop_clr || (~spi_intr_en))
        spi_stop_intr   <= 1'b0;
    else if((spim_en && spim_stop_intr) | (spis_en && spis_stop_intr))
        spi_stop_intr   <= 1'b1;
end
assign  spim_stop_intr  = (spim_stop_end & stop_judge);
assign  spis_stop_intr  = (cnt_bits[3:0] == 4'd0) & data_smp & spis_rx_en;
endmodule
