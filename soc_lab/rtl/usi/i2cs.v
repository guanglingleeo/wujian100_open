/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module i2cs(
  clk,
  f_scl,
  f_scl_d,
  i2c_addr,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_nack_clr,
  i2c_stop_clr,
  i2cs_amode,
  i2cs_en,
  i2cs_gcall,
  i2cs_gcall_clr,
  i2cs_gcall_intr,
  i2cs_hs,
  i2cs_nack_intr,
  i2cs_rx,
  i2cs_rx_wen,
  i2cs_sbyte,
  i2cs_stop_intr,
  i2cs_tx_data,
  i2cs_tx_ren,
  i2cs_work,
  i_sda_in,
  r_scl_d2,
  rst_n,
  rx_full,
  scl_out,
  sda_out,
  start_flag,
  stop_flag,
  tx_empty
);
input           clk;             
input           f_scl;           
input   [2 :1]  f_scl_d;         
input   [9 :0]  i2c_addr;        
input   [7 :0]  i2c_hold;        
input   [3 :0]  i2c_intr_en;     
input   [23:0]  i2c_lcnt;        
input           i2c_nack_clr;    
input           i2c_stop_clr;    
input           i2cs_amode;      
input           i2cs_en;         
input           i2cs_gcall;      
input           i2cs_gcall_clr;  
input           i2cs_hs;         
input           i2cs_sbyte;      
input   [7 :0]  i2cs_tx_data;    
input           i_sda_in;        
input           r_scl_d2;        
input           rst_n;           
input           rx_full;         
input           start_flag;      
input           stop_flag;       
input           tx_empty;        
output          i2cs_gcall_intr; 
output          i2cs_nack_intr;  
output  [7 :0]  i2cs_rx;         
output          i2cs_rx_wen;     
output          i2cs_stop_intr;  
output          i2cs_tx_ren;     
output          i2cs_work;       
output          scl_out;         
output          sda_out;         
reg             addr0_cmp;       
reg             addr1_cmp;       
reg             addr_10;         
reg             gcall_flag;      
reg             gcall_flag_d;    
reg             hs_flag;         
reg             i2cs_ack;        
reg     [23:0]  i2cs_bcnt;       
reg             i2cs_bus;        
reg     [3 :0]  i2cs_bycnt;      
reg     [1 :0]  i2cs_fsm;        
reg             i2cs_gcall_intr; 
reg             i2cs_nack;       
reg             i2cs_nack_intr;  
reg     [7 :0]  i2cs_rx;         
reg             i2cs_stop_intr;  
reg             i2cs_tx;         
reg     [1 :0]  nxt_i2cs_fsm;    
reg             r_scl_d3;        
reg     [7 :0]  s_hold_cnt;      
reg             s_rw_flag;       
reg             sbyte_flag;      
reg             scl_out;         
reg             sda_out;         
reg             start_hold;      
wire            clk;             
wire            f_scl;           
wire    [2 :1]  f_scl_d;         
wire    [9 :0]  i2c_addr;        
wire    [7 :0]  i2c_hold;        
wire    [3 :0]  i2c_intr_en;     
wire    [23:0]  i2c_lcnt;        
wire            i2c_nack_clr;    
wire            i2c_stop_clr;    
wire            i2cs_a0_ack;     
wire            i2cs_a0end;      
wire            i2cs_a1end;      
wire            i2cs_addr0;      
wire            i2cs_addr1;      
wire            i2cs_amode;      
wire            i2cs_bcnt_eql;   
wire            i2cs_bycnt_clr;  
wire            i2cs_bycnt_eq0;  
wire            i2cs_bycnt_eq8;  
wire            i2cs_data;       
wire            i2cs_en;         
wire            i2cs_gcall;      
wire            i2cs_gcall_clr;  
wire            i2cs_hs;         
wire            i2cs_idle;       
wire            i2cs_rx_wen;     
wire            i2cs_sbyte;      
wire            i2cs_send;       
wire    [7 :0]  i2cs_tx_data;    
wire            i2cs_tx_ren;     
wire            i2cs_work;       
wire            i_sda_in;        
wire            r_gcall;         
wire            r_scl_d2;        
wire            rst_n;           
wire            rx_full;         
wire            s_hold_eq;       
wire            s_hold_eq0;      
wire            start_flag;      
wire            stop_flag;       
wire            strech_scl;      
wire            tim_i2cs_fifo_op; 
wire            tx_empty;        
parameter   I2CS_IDLE   = 2'b00,
            I2CS_ADDR0  = 2'b01,
            I2CS_ADDR1  = 2'b11,
            I2CS_DATA   = 2'b10;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_fsm[1:0]   <= I2CS_IDLE;
    else if(~i2cs_en)
        i2cs_fsm[1:0]   <= I2CS_IDLE;
    else
        i2cs_fsm[1:0]   <= nxt_i2cs_fsm[1:0];
end
always @( start_flag
       or addr_10
       or hs_flag
       or i2cs_bus
       or i2cs_fsm[1:0]
       or addr1_cmp
       or f_scl
       or i2cs_a1end
       or stop_flag
       or s_rw_flag
       or gcall_flag
       or i2cs_a0end
       or addr0_cmp
       or start_hold
       or sbyte_flag)
begin
    case(i2cs_fsm[1:0])
        I2CS_IDLE:
        begin
            if(start_hold && f_scl && i2cs_bus)
                nxt_i2cs_fsm[1:0] = I2CS_ADDR0;
            else
                nxt_i2cs_fsm[1:0] = I2CS_IDLE;
        end
        I2CS_ADDR0:
        begin
            if(stop_flag || start_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else if(i2cs_a0end)
            begin
                if(hs_flag | sbyte_flag)
                    nxt_i2cs_fsm[1:0]   = I2CS_ADDR0;
                else if(addr_10 && addr0_cmp)
                    if(s_rw_flag)
                        if(addr1_cmp)
                            nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                        else 
                            nxt_i2cs_fsm[1:0] = I2CS_IDLE;
                    else
                        nxt_i2cs_fsm[1:0]   = I2CS_ADDR1;
                else if(addr0_cmp || gcall_flag) 
                    nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                else
                    nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            end
            else
            begin
                nxt_i2cs_fsm[1:0]   = i2cs_fsm[1:0];
            end
        end
        I2CS_ADDR1:
        begin
            if(start_flag || stop_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else if(i2cs_a1end)
                if(addr1_cmp)
                    nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                else
                    nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else
                nxt_i2cs_fsm[1:0]   = I2CS_ADDR1;
        end
        I2CS_DATA:
        begin
            if(stop_flag || start_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else
                nxt_i2cs_fsm[1:0]   = i2cs_fsm[1:0];
        end
        default:
        begin
            nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
        end
    endcase
end
assign  i2cs_idle   = (i2cs_fsm[1:0] == I2CS_IDLE);
assign  i2cs_addr0  = (i2cs_fsm[1:0] == I2CS_ADDR0);
assign  i2cs_addr1  = (i2cs_fsm[1:0] == I2CS_ADDR1);
assign  i2cs_data   = (i2cs_fsm[1:0] == I2CS_DATA);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sda_out     <= 1'b1;
    end
    else if(i2cs_addr0 && i2cs_bycnt_eq8)
    begin
        if(i2cs_a0_ack) 
            sda_out <= 1'b0;
        else
            sda_out <= 1'b1;
    end
    else if(i2cs_addr1 && addr1_cmp && i2cs_bycnt_eq8)
    begin
        if(addr1_cmp)
            sda_out <= 1'b0;
        else
            sda_out <= 1'b1;
    end
    else if(i2cs_data && i2cs_bycnt_eq8 && ~s_rw_flag)      
        sda_out     <= i2cs_ack;
    else if(i2cs_data && i2cs_bycnt_eq0 && tx_empty && s_rw_flag)
        sda_out     <= 1'b1;
    else if(i2cs_data && s_rw_flag)
    begin
        if(i2cs_nack && s_hold_eq)
            sda_out     <= 1'b1;
        else
            sda_out     <= i2cs_tx;
    end
    else
        sda_out <= 1'b1;
end
assign  i2cs_a0_ack = (s_rw_flag & addr_10) ? (addr0_cmp & addr1_cmp) : addr0_cmp;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        scl_out <= 1'b1;
    else if(i2cs_data & i2cs_bycnt_eq0 && i2cs_bcnt_eql && s_rw_flag)
        scl_out <= 1'b1;
    else if(strech_scl)
        scl_out <= 1'b0;
end
assign  strech_scl  = i2cs_data & i2cs_bycnt_eq8 & f_scl & ~i2cs_nack &
                      ((tx_empty & s_rw_flag) | (rx_full & ~s_rw_flag));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bcnt[23:0] <= 24'd0;
    else if(i2cs_bcnt[23:0] == i2c_lcnt[23:0])
        i2cs_bcnt[23:0] <= 24'd0;
    else if((i2cs_data && i2cs_bycnt_eq0 && s_rw_flag && ~scl_out && ~tx_empty) ||
            (i2cs_bcnt[23:0] != 24'd0))
        i2cs_bcnt[23:0] <= i2cs_bcnt[23:0] + 24'd1;
end
assign  i2cs_bcnt_eql = (i2cs_bcnt[23:0] == i2c_lcnt[23:0]);
always @( i2cs_tx_data[7:0]
       or i2cs_bycnt[3:0]
       or s_hold_eq
       or sda_out)
begin
    if(s_hold_eq)
    case(i2cs_bycnt[3:0])
        4'd0: i2cs_tx = i2cs_tx_data[7];
        4'd1: i2cs_tx = i2cs_tx_data[6];
        4'd2: i2cs_tx = i2cs_tx_data[5];
        4'd3: i2cs_tx = i2cs_tx_data[4];
        4'd4: i2cs_tx = i2cs_tx_data[3];
        4'd5: i2cs_tx = i2cs_tx_data[2];
        4'd6: i2cs_tx = i2cs_tx_data[1];
        4'd7: i2cs_tx = i2cs_tx_data[0];
        default: i2cs_tx = 1'b1;
    endcase
    else
        i2cs_tx = sda_out;
end
always @( s_hold_eq
       or sda_out)
begin
    if(s_hold_eq)
        i2cs_ack    = 1'b0;
    else
        i2cs_ack    = sda_out;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        s_hold_cnt[7:0]    <= 8'd0;
    else if(s_hold_eq)
        s_hold_cnt[7:0]    <= 8'd0;
    else if(f_scl_d[1] && (i2cs_addr0 || i2cs_data || i2cs_addr1))
        s_hold_cnt[7:0]    <= 8'd1;
    else if(|s_hold_cnt[7:0])
        s_hold_cnt[7:0]    <= s_hold_cnt[7:0] + 8'd1;
end
assign  s_hold_eq     = s_hold_eq0 ? f_scl_d[2] : (s_hold_cnt[7:0] == i2c_hold[7:0]);
assign  s_hold_eq0    = (i2c_hold[7:0] == 8'd0);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        i2cs_rx[7:0]  <= 8'd0;
    end
    else if((i2cs_addr0 | i2cs_addr1 | i2cs_data) && r_scl_d2)
    begin
        case(i2cs_bycnt)
            4'd0:   i2cs_rx[7] <= i_sda_in;
            4'd1:   i2cs_rx[6] <= i_sda_in;
            4'd2:   i2cs_rx[5] <= i_sda_in;
            4'd3:   i2cs_rx[4] <= i_sda_in;
            4'd4:   i2cs_rx[3] <= i_sda_in;
            4'd5:   i2cs_rx[2] <= i_sda_in;
            4'd6:   i2cs_rx[1] <= i_sda_in;
            4'd7:   i2cs_rx[0] <= i_sda_in;
            default: i2cs_rx[7:0] <= i2cs_rx[7:0];
        endcase
    end
end
assign  i2cs_rx_wen = i2cs_data & ~s_rw_flag & tim_i2cs_fifo_op;
assign  i2cs_tx_ren = i2cs_data & s_rw_flag & tim_i2cs_fifo_op;
assign  tim_i2cs_fifo_op = (i2cs_bycnt[3:0] == 4'd7) & f_scl;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        s_rw_flag <= 1'b0;
    else if(i2cs_send)
        s_rw_flag <= 1'b0;
    else if(i2cs_addr0 && i2cs_bycnt == 4'd7 && r_scl_d2)
        s_rw_flag <= i_sda_in;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        hs_flag <= 1'b0;
        gcall_flag  <= 1'b0;
        sbyte_flag     <= 1'b0;
    end        
    else if(i2cs_a0end)
    begin
        hs_flag <= 1'b0;
        gcall_flag  <= 1'b0;
        sbyte_flag     <= 1'b0;
    end
    else if(i2cs_addr0)
    begin
        if(~i2cs_hs && (i2cs_rx[7:3] == 5'b00001) && (i2cs_bycnt == 4'd4) && r_scl_d2)
            hs_flag <= 1'b1;
        if(~i2cs_gcall && (i2cs_rx[7:0] == 8'd0) && (i2cs_bycnt == 4'd7) && r_scl_d2)
            gcall_flag  <= 1'b1;
        if(~i2cs_sbyte && (i2cs_rx[7:0] == 8'd1) && (i2cs_bycnt == 4'd7) && r_scl_d2)
            sbyte_flag  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        addr0_cmp   <= 1'b0;
        addr_10     <= 1'b0;    
    end
    else if(stop_flag)               
    begin
        addr0_cmp   <= 1'b0;
        addr_10     <= 1'b0;
    end
    else if(i2cs_addr0)
    begin
        if((i2cs_bycnt == 4'd7) && r_scl_d3)
        begin
            if(addr_10)
                addr0_cmp   <= (i2cs_rx[2:1] == i2c_addr[9:8]);
            else
                addr0_cmp   <= (i2cs_rx[7:1] == i2c_addr[6:0]) | (~i2cs_gcall & (i2cs_rx[7:0] == 8'd0));
        end
        if((i2cs_rx[7:3] == 5'b11110) && (i2cs_bycnt == 4'd5) && r_scl_d3)
        begin
            if(~i2cs_amode)
                addr_10     <= 1'b1;
            else
                addr_10     <= 1'b0;
        end
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        addr1_cmp   <= 1'b0;
    else if(stop_flag)
        addr1_cmp   <= 1'b0;
    else if(i2cs_addr1 && (i2cs_bycnt == 4'd7) && f_scl)
        addr1_cmp   <= (i2cs_rx[7:0] == i2c_addr[7:0]);
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bus    <= 1'b1;
    else if(start_flag || stop_flag)
        i2cs_bus    <= 1'b1;
    else if((~addr0_cmp && i2cs_a0end) || (~addr1_cmp && i2cs_a1end))
        i2cs_bus    <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        start_hold  <= 1'b0;
    end
    else if(f_scl)
        start_hold  <= 1'b0;
    else if(start_flag)
    begin
        start_hold  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bycnt[3:0] <= 4'd0;
    else if(i2cs_bycnt_clr || start_flag || ~i2cs_en)
        i2cs_bycnt[3:0] <= 4'd0;
    else if((i2cs_fsm != I2CS_IDLE) && f_scl)
        i2cs_bycnt[3:0] <= i2cs_bycnt[3:0] + 4'd1;
end
assign  i2cs_bycnt_clr = i2cs_bycnt_eq8 & f_scl;
assign  i2cs_send   = i2cs_idle & f_scl & start_flag;
assign  i2cs_a0end  = (i2cs_addr0 & i2cs_bycnt_eq8 & f_scl);
assign  i2cs_a1end  = (i2cs_addr1 & i2cs_bycnt_eq8 & f_scl);
assign  i2cs_bycnt_eq8 = (i2cs_bycnt[3:0] == 4'd8);
assign  i2cs_bycnt_eq0 = (i2cs_bycnt[3:0] == 4'd0);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_nack   <= 1'b0;
    else if(i2cs_addr0 && i2cs_bycnt_eq8)
        i2cs_nack   <= 1'b0;
    else if(i2cs_data && i2cs_bycnt_eq8 && r_scl_d2 && s_rw_flag)
        i2cs_nack   <= i_sda_in;
end
assign  i2cs_work = ~(i2cs_fsm[1:0] == I2CS_IDLE);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_stop_intr  <= 1'b0;
    else if(i2c_stop_clr | ~i2c_intr_en[0])
        i2cs_stop_intr  <= 1'b0;
    else if(stop_flag && ~i2cs_en)
        i2cs_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_gcall_intr <= 1'b0;
    else if(i2cs_gcall_clr | ~i2c_intr_en[3])
        i2cs_gcall_intr <= 1'b0;
    else if(r_gcall)
        i2cs_gcall_intr <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        gcall_flag_d    <= 1'b0;
        r_scl_d3        <= 1'b0;
    end
    else
    begin
        gcall_flag_d    <= gcall_flag;
        r_scl_d3        <= r_scl_d2;
    end
end
assign  r_gcall = gcall_flag & ~gcall_flag_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_nack_intr <= 1'b0;
    else if(i2c_nack_clr | ~i2c_intr_en[1])
        i2cs_nack_intr <= 1'b0;
    else if(i2cs_data && i2cs_bycnt_eq8 && r_scl_d2 && s_rw_flag && i_sda_in)
        i2cs_nack_intr <= 1'b1;
end
endmodule
