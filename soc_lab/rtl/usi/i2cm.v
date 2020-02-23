/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module i2cm(
  clk,
  f_scl,
  f_scl_d,
  i2c_addr,
  i2c_aerr_clr,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_nack_clr,
  i2c_stop_clr,
  i2cm_aerr_intr,
  i2cm_amode,
  i2cm_code,
  i2cm_data,
  i2cm_en,
  i2cm_gcall,
  i2cm_hs,
  i2cm_lose_arbi_clr,
  i2cm_lose_arbi_intr,
  i2cm_nack_intr,
  i2cm_rx,
  i2cm_rx_wen,
  i2cm_sbyte,
  i2cm_stop,
  i2cm_stop_intr,
  i2cm_tx_ren,
  i2cm_work,
  i_scl_in,
  i_sda_in,
  r_scl,
  r_scl_d,
  rst_n,
  scl_out,
  sda_out,
  start_flag,
  stop_flag,
  tx_empty,
  tx_empty_d,
  tx_rd_data,
  wr_clk_div
);
input           clk;                
input           f_scl;              
input   [0 :0]  f_scl_d;            
input   [9 :0]  i2c_addr;           
input           i2c_aerr_clr;       
input   [7 :0]  i2c_fs_div;         
input   [23:0]  i2c_hcnt;           
input   [7 :0]  i2c_hold;           
input   [4 :0]  i2c_intr_en;        
input   [23:0]  i2c_lcnt;           
input           i2c_nack_clr;       
input           i2c_stop_clr;       
input           i2cm_amode;         
input   [2 :0]  i2cm_code;          
input           i2cm_en;            
input           i2cm_gcall;         
input           i2cm_hs;            
input           i2cm_lose_arbi_clr; 
input           i2cm_sbyte;         
input           i2cm_stop;          
input           i_scl_in;           
input           i_sda_in;           
input           r_scl;              
input   [1 :1]  r_scl_d;            
input           rst_n;              
input           start_flag;         
input           stop_flag;          
input           tx_empty;           
input           tx_empty_d;         
input   [9 :0]  tx_rd_data;         
input           wr_clk_div;         
output          i2cm_aerr_intr;     
output          i2cm_data;          
output          i2cm_lose_arbi_intr; 
output          i2cm_nack_intr;     
output  [7 :0]  i2cm_rx;            
output          i2cm_rx_wen;        
output          i2cm_stop_intr;     
output          i2cm_tx_ren;        
output          i2cm_work;          
output          scl_out;            
output          sda_out;            
reg             addr0_sda;          
reg             addr1_sda;          
reg     [23:0]  bit_cnt;            
reg     [3 :0]  byte_cnt;           
reg             data_sda;           
reg     [7 :0]  hold_cnt;           
reg             hsm_flag;           
reg             i2c_busy;           
reg     [7 :0]  i2c_fscnt;          
reg             i2c_sflag;          
reg             i2cm_aerr_intr;     
reg     [2 :0]  i2cm_fsm;           
reg             i2cm_lose_arbi_intr; 
reg             i2cm_nack_intr;     
reg     [7 :0]  i2cm_rx;            
reg             i2cm_rx_wen;        
reg             i2cm_sflag;         
reg             i2cm_stop_d;        
reg             i2cm_stop_intr;     
reg             lose_arbi;          
reg             nack;               
reg             nack_d;             
reg     [23:0]  nxt_bcnt;           
reg     [3 :0]  nxt_bycnt;          
reg     [2 :0]  nxt_i2cm_fsm;       
reg             nxt_scl;            
reg             nxt_sda;            
reg             rw_flag;            
reg             sbyte_flag;         
reg             scl_out;            
reg             sda_out;            
reg             spec_hsmc;          
reg             spec_sbyte;         
reg             sr_flag;            
wire            a0_hs_byeq0;        
wire            a0_scl_clr;         
wire            addr0_end;          
wire            addr1_end;          
wire            addr1_to_sr;        
wire            addr_arbi;          
wire            addr_bcnt_plus;     
wire            arbi_en;            
wire            bcnt_clr;           
wire            bcnt_eq0;           
wire            bcnt_eq4;           
wire            bcnt_eqh;           
wire            bcnt_eql;           
wire            bcnt_plus_hs;       
wire            bycnt_eq0;          
wire            bycnt_eq1;          
wire            bycnt_eq2;          
wire            bycnt_eq3;          
wire            bycnt_eq7;          
wire            bycnt_eq8;          
wire            bycnt_plus;         
wire            clk;                
wire            data_arbi;          
wire            data_bcnt_plus;     
wire            data_by_eq0;        
wire            data_bycnt_clr;     
wire            data_end;           
wire            data_end_1;         
wire            data_end_2;         
wire            data_end_3;         
wire            f_empty;            
wire            f_scl;              
wire    [0 :0]  f_scl_d;            
wire            fscnt_clr;          
wire            fscnt_clr1;         
wire            fscnt_clr2;         
wire            fscnt_plus;         
wire            fscnt_plus_spec;    
wire            fscnt_plus_star;    
wire            hold_clr;           
wire            hold_eq;            
wire            hold_eq0;           
wire            hold_plus;          
wire            hold_plus_0;        
wire            hold_plus_1;        
wire            hs_mode;            
wire    [9 :0]  i2c_addr;           
wire            i2c_aerr_clr;       
wire    [7 :0]  i2c_fs_div;         
wire            i2c_fscnt_eq;       
wire    [23:0]  i2c_hcnt;           
wire    [7 :0]  i2c_hold;           
wire    [4 :0]  i2c_intr_en;        
wire    [23:0]  i2c_lcnt;           
wire            i2c_nack_clr;       
wire            i2c_stop_clr;       
wire            i2cm_aerr;          
wire            i2cm_amode;         
wire    [2 :0]  i2cm_code;          
wire            i2cm_data;          
wire            i2cm_en;            
wire            i2cm_gcall;         
wire            i2cm_hs;            
wire            i2cm_lose_arbi_clr; 
wire            i2cm_sbyte;         
wire            i2cm_stop;          
wire            i2cm_tx_ren;        
wire            i2cm_work;          
wire            i_scl_in;           
wire            i_sda_in;           
wire            idle_end;           
wire            r_nack;             
wire            r_scl;              
wire    [1 :1]  r_scl_d;            
wire            re_nack;            
wire            restart_end;        
wire            rst_n;              
wire            set_sr_flag;        
wire            special_end;        
wire            sta_addr0;          
wire            sta_addr1;          
wire            sta_data;           
wire            sta_idle;           
wire            sta_restart;        
wire            sta_special;        
wire            sta_start;          
wire            sta_stop;           
wire            start_end;          
wire            start_flag;         
wire            stop_end;           
wire            stop_flag;          
wire            to_restart;         
wire            tx_empty;           
wire            tx_empty_d;         
wire            tx_empty_stop;      
wire            tx_juedge;          
wire    [9 :0]  tx_rd_data;         
wire            wr_clk_div;         
parameter   I2CM_IDLE    = 3'b000,
            I2CM_START   = 3'b001,
            I2CM_SPECIAL = 3'b011,
            I2CM_RESTART = 3'b010,
            I2CM_ADDR0   = 3'b110,
            I2CM_ADDR1   = 3'b111,
            I2CM_DATA    = 3'b101,
            I2CM_STOP    = 3'b100;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_fsm[2:0] <= I2CM_IDLE;
    else if(~i2cm_en || i2cm_aerr)
        i2cm_fsm[2:0] <= I2CM_IDLE;
    else
        i2cm_fsm[2:0] <= nxt_i2cm_fsm[2:0];
end
always @( nack
       or hsm_flag
       or data_end
       or i2cm_amode
       or stop_flag
       or stop_end
       or i2cm_hs
       or sbyte_flag
       or start_end
       or special_end
       or start_flag
       or idle_end
       or i2cm_sflag
       or to_restart
       or sr_flag
       or addr1_to_sr
       or restart_end
       or addr1_end
       or addr0_end
       or i2cm_sbyte
       or i2cm_fsm[2:0]
       or lose_arbi)
begin
    case(i2cm_fsm[2:0])
        I2CM_IDLE    :
        begin
            if(idle_end)
                nxt_i2cm_fsm[2:0] = I2CM_START;
            else
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
        end        
        I2CM_START   :
        begin
            if(start_end && ~i2cm_sflag)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else if(start_end)
                if(i2cm_sbyte || i2cm_hs)
                    nxt_i2cm_fsm[2:0] = I2CM_SPECIAL;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
            else
                nxt_i2cm_fsm[2:0] = I2CM_START;
        end
        I2CM_SPECIAL :
        begin
            if(special_end)
                if(lose_arbi)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(i2cm_hs && i2cm_sbyte && sbyte_flag && ~hsm_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_START;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
            else
                nxt_i2cm_fsm[2:0] = I2CM_SPECIAL;
        end
        I2CM_RESTART:
        begin
            if((restart_end && ~i2cm_sflag) || stop_flag)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else if(restart_end)
                nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
            else
                nxt_i2cm_fsm[2:0] = I2CM_RESTART;
        end
        I2CM_ADDR0   :
        begin
            if(addr0_end)
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(nack)
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
                else if(sr_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
                else if(i2cm_amode)
                    nxt_i2cm_fsm[2:0] = I2CM_ADDR1;
                else 
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
            else
                nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
        end
        I2CM_ADDR1   :
        begin
            if(addr1_end)
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(nack)
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
                else if(addr1_to_sr)
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
            else
                nxt_i2cm_fsm[2:0] = I2CM_ADDR1;
        end
        I2CM_DATA    :
        begin
            if(data_end)
            begin
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(to_restart)
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
            end
            else
                nxt_i2cm_fsm[2:0] = I2CM_DATA;
        end
        I2CM_STOP    :
        begin
            if(stop_end)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else
                nxt_i2cm_fsm[2:0] = I2CM_STOP;
        end
        default:
        begin
            nxt_i2cm_fsm[2:0] = I2CM_IDLE;
        end
    endcase
end
assign  sta_idle    = (i2cm_fsm[2:0] == I2CM_IDLE);
assign  sta_start   = (i2cm_fsm[2:0] == I2CM_START);
assign  sta_restart = (i2cm_fsm[2:0] == I2CM_RESTART);
assign  sta_stop    = (i2cm_fsm[2:0] == I2CM_STOP);
assign  sta_special = (i2cm_fsm[2:0] == I2CM_SPECIAL);
assign  sta_addr0   = (i2cm_fsm[2:0] == I2CM_ADDR0);
assign  sta_addr1   = (i2cm_fsm[2:0] == I2CM_ADDR1);
assign  sta_data    = (i2cm_fsm[2:0] == I2CM_DATA);
always @( spec_hsmc
       or bycnt_eq0
       or hsm_flag
       or data_by_eq0
       or f_empty
       or bycnt_eq1
       or f_scl
       or bycnt_plus
       or tx_empty
       or stop_end
       or start_end
       or i_scl_in
       or i2c_fs_div[7:0]
       or bycnt_eq2
       or addr_bcnt_plus
       or restart_end
       or addr1_end
       or data_sda
       or bcnt_eqh
       or bcnt_clr
       or scl_out
       or tx_juedge
       or data_end
       or spec_sbyte
       or byte_cnt[3:0]
       or a0_scl_clr
       or data_bycnt_clr
       or addr1_sda
       or hold_eq
       or bit_cnt[23:0]
       or data_bcnt_plus
       or bcnt_eq0
       or addr0_sda
       or bcnt_eql
       or i2cm_hs
       or bycnt_eq3
       or i2c_hcnt[23:0]
       or sbyte_flag
       or i2c_fscnt[7:0]
       or special_end
       or idle_end
       or bycnt_eq8
       or f_scl_d[0]
       or i2c_fscnt_eq
       or r_scl
       or sda_out
       or i2cm_sbyte
       or addr0_end
       or bcnt_eq4
       or i_sda_in
       or i2cm_fsm[2:0])
begin
    case(i2cm_fsm[2:0])
        I2CM_IDLE:
        begin
            nxt_scl = 1'b1;
            nxt_sda = 1'b1;
            if(bcnt_eqh || idle_end || (~i_scl_in || ~i_sda_in))
                nxt_bcnt[23:0] = 24'd0;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            if(idle_end || (~i_scl_in || ~i_sda_in))
                nxt_bycnt[3:0]  = 4'd0;
            else if(bcnt_eqh)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_START:
        begin
            if(bycnt_eq3 | start_end) 
                nxt_scl = 1'b0;
            else if(bycnt_eq1) 
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq2)
                nxt_sda = 1'b0;
            else if(bycnt_eq0)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || start_end)
                nxt_bcnt[23:0]  = 24'd0;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            if(start_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if((i2cm_hs || i2cm_sbyte) ? 
                    ((bit_cnt[23:0] == i2c_hcnt[23:0]) && i2c_fscnt_eq) : 
                    bcnt_eqh)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[2:0];
        end
        I2CM_SPECIAL:
        begin
            if(hold_eq)
                case({i2cm_hs, i2cm_sbyte}) // synopsys parallel_case
                    2'b00,2'b01: nxt_sda = spec_sbyte;
                    2'b10:  nxt_sda = spec_hsmc;
                    2'b11:
                        if(sbyte_flag == 1'b0)
                            nxt_sda = spec_sbyte;
                        else if(hsm_flag == 1'b0)
                            nxt_sda = spec_hsmc;
                        else
                            nxt_sda = spec_sbyte;
                endcase
            else
                nxt_sda = sda_out;
            if(((i2c_fscnt[7:0] == i2c_fs_div[7:0]) && bcnt_eqh) || f_scl)
                nxt_scl = 1'b0;
            else if((i2c_fscnt[7:0] == i2c_fs_div[7:0]) && (bcnt_eql && ~scl_out))
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bcnt_eqh || bcnt_eql || f_scl || special_end)
                nxt_bcnt[23:0] = 24'd0;
            else if(r_scl || f_scl_d[0] || (i2c_fscnt[7:0] != 8'd0) || ~bcnt_eq0)
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0];
            if(special_end || (bycnt_eq8 && f_scl))
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(f_scl)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end 
        I2CM_RESTART:
        begin
            if(bycnt_eq3 || bycnt_eq0 || restart_end) 
                nxt_scl = 1'b0;
            else if(bycnt_eq1 || bycnt_eq2)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq0)
                nxt_sda = 1'b1;
            else if(bycnt_eq2)
                nxt_sda = 1'b0;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || restart_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(bycnt_eq0 || r_scl || bycnt_eq2 || ~bcnt_eq0)
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0];
            if(restart_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bit_cnt[23:0] == i2c_hcnt[23:0])
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_ADDR0:
        begin
            if(a0_scl_clr)      
                nxt_scl = 1'b0;
            else if(bcnt_eql)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq)
                nxt_sda = addr0_sda;
            else
                nxt_sda = sda_out;
            if(addr0_end || bcnt_clr)
                nxt_bcnt[23:0]  = 24'd0;
            else if(addr_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(addr0_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_ADDR1:
        begin
            if(bcnt_eqh || f_scl)
                nxt_scl = 1'b0;
            else if(bcnt_eql && ~scl_out)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq)
                nxt_sda = addr1_sda;
            else
                nxt_sda = sda_out;
            if(bcnt_clr || addr1_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(addr_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(addr1_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_DATA:
        begin
            if(bcnt_eqh || f_scl)
                nxt_scl = 1'b0;
            else if(bcnt_eql && ~scl_out)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq || (data_by_eq0 && f_empty))
                if(tx_empty)
                    nxt_sda = sda_out;
                else
                    nxt_sda = data_sda;
            else if(tx_juedge)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if(bcnt_clr || data_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(data_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(data_end || data_bycnt_clr)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_STOP:    
        begin
            if(bycnt_eq1)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq0 && bcnt_eq4)
                nxt_sda = 1'b0;
            else if(bycnt_eq2)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || stop_end)
                nxt_bcnt[23:0]  = 24'd0;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            if(stop_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bit_cnt[23:0] == i2c_hcnt[23:0])
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        default:
        begin
            nxt_scl = 1'b1;
            nxt_sda = 1'b1;
            nxt_bcnt = 24'd0;
            nxt_bycnt = 4'd0;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        scl_out     <= 1'b1;
        sda_out     <= 1'b1;
        bit_cnt[23:0]   <= 24'd0;
        byte_cnt[3:0]   <= 4'd0;
    end
    else
    begin
        scl_out     <= nxt_scl;
        if(lose_arbi && hold_eq)
            sda_out <= 1'b1;
        else
            sda_out <= nxt_sda;
        if(wr_clk_div)
            bit_cnt[23:0]   <= 24'd0;
        else
            bit_cnt[23:0]   <= nxt_bcnt[23:0];
        byte_cnt[3:0]   <= nxt_bycnt[3:0];
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_stop_d <= 1'b0;
    else
        i2cm_stop_d <= i2cm_stop;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sr_flag         <= 1'b0;
        rw_flag         <= 1'b0;
    end
    else if(sta_idle)
    begin
        sr_flag <= 1'b0;
        rw_flag <= 1'b0;
    end
    else
    begin
        if((addr0_end && sr_flag) || stop_end)
            sr_flag <= 1'b0;
        else if(set_sr_flag)
            sr_flag <= 1'b1;
        if(sta_addr0 && bycnt_eq7 && r_scl_d[1])
            rw_flag <= sda_out;
    end
end
assign  set_sr_flag = tx_rd_data[8] & ~rw_flag & (data_end | addr1_end);
assign  special_end = sta_special && bycnt_eq8 && f_scl;
assign  idle_end    = sta_idle & ~tx_empty & ~i2c_busy;
assign  start_end   = sta_start & i2cm_sflag & f_scl;
assign  restart_end = sta_restart & i2cm_sflag& f_scl;
assign  addr0_end   = sta_addr0 & bycnt_eq8 & (i2cm_hs ? bcnt_eqh : f_scl);
assign  addr1_end   = sta_addr1 & bycnt_eq8 & (i2cm_hs ? bcnt_eqh : f_scl);
assign  data_end_1 = sta_data & bycnt_eq8 & bycnt_plus &
            ((re_nack & rw_flag) |  
             (nack & ~rw_flag) |    
             to_restart |           
             lose_arbi |            
             tx_empty_stop);        
assign  data_end_2 = sta_data & bycnt_eq0 & (i2cm_stop & ~i2cm_stop_d) & tx_empty;
assign  data_end_3 = sta_data & bycnt_eq0 & (tx_empty_d & ~tx_empty) & rw_flag;
assign  data_end   = data_end_3 | data_end_2 | data_end_1;
assign  stop_end    = sta_stop & bycnt_eq3;
assign  to_restart  = (i2cm_gcall & ~i2cm_amode) ? 1'b0 :       
                      ((~tx_empty & (tx_rd_data[9] | (tx_rd_data[8] & ~rw_flag) |
                      (~tx_rd_data[8] & rw_flag & re_nack))) | data_end_3);
assign  tx_empty_stop = tx_empty & i2cm_stop & ~rw_flag;
assign  addr1_to_sr = ~tx_empty & ((tx_rd_data[8] & ~rw_flag) |
                      (~tx_rd_data[8] & rw_flag & re_nack));
assign  bcnt_eql    = (bit_cnt == i2c_lcnt[23:0]) & ~scl_out;
assign  bcnt_eqh    = (bit_cnt == i2c_hcnt[23:0]) & scl_out; 
assign  bcnt_eq0    = (bit_cnt == 24'd0);
assign  bcnt_eq4    = (bit_cnt == 24'd4);
assign  bcnt_clr    = bcnt_eql | bcnt_eqh | (~i2cm_hs & f_scl);
assign  data_by_eq0 = bycnt_eq0 & sta_data;
assign  tx_juedge   = (data_by_eq0 & tx_empty);
assign  addr_bcnt_plus  = i2cm_hs ? bcnt_plus_hs : (r_scl | f_scl_d[0]);
assign  a0_scl_clr  = i2cm_hs ? bcnt_eqh : (bcnt_eqh | f_scl);
assign  data_bcnt_plus  = 
            (bycnt_eq0 & ~i2cm_stop & tx_empty) ? 1'b0 :  
            (bycnt_eq0 & f_empty) ? 1'b1 :                
            i2cm_hs ? bcnt_plus_hs :                      
            (r_scl | f_scl_d[0]);                         
assign  bcnt_plus_hs = (bycnt_eq0 & scl_out) ? r_scl : 1'b1;
assign  data_bycnt_clr = i2cm_hs ? (bycnt_eq8 & bcnt_eqh) : (bycnt_eq8 & f_scl);
assign  bycnt_plus  = i2cm_hs ? bcnt_eqh : f_scl;
assign  bycnt_eq0   = (byte_cnt == 4'd0);
assign  bycnt_eq1   = (byte_cnt == 4'd1);
assign  bycnt_eq2   = (byte_cnt == 4'd2);
assign  bycnt_eq3   = (byte_cnt == 4'd3);
assign  bycnt_eq7   = (byte_cnt == 4'd7);
assign  bycnt_eq8   = (byte_cnt == 4'd8);
always @( i2cm_amode
       or re_nack
       or tx_rd_data[8:0]
       or i2cm_code[2:0]
       or byte_cnt[3:0]
       or rw_flag
       or i2c_addr[9:0]
       or i2cm_gcall
       or sr_flag)
begin
    case(byte_cnt[3:0])
        4'd0:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[6]);
            addr1_sda    = i2c_addr[7];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[7];
        end
        4'd1:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[5]);
            addr1_sda    = i2c_addr[6];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[6];
        end
        4'd2:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[4]);
            addr1_sda    = i2c_addr[5];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[5];
        end
        4'd3:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[3]);
            addr1_sda    = i2c_addr[4];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[4];
        end
        4'd4:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b1;
            addr0_sda    = i2cm_amode ? 1'b0 : (i2cm_gcall ? 1'b0 : i2c_addr[2]);
            addr1_sda    = i2c_addr[3];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[3];
        end
        4'd5:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = i2cm_code[2];
            addr0_sda    = i2cm_amode ? i2c_addr[9] : (i2cm_gcall ? 1'b0 : i2c_addr[1]);
            addr1_sda    = i2c_addr[2];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[2];
        end
        4'd6:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = i2cm_code[1];
            addr0_sda    = i2cm_amode ? i2c_addr[8] : (i2cm_gcall ? 1'b0 : i2c_addr[0]);
            addr1_sda    = i2c_addr[1];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[1];
        end
        4'd7:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = i2cm_code[0];
            addr0_sda    = sr_flag ? tx_rd_data[8] : 
                           i2cm_amode ? 1'b0 : (i2cm_gcall ? 1'b0 : tx_rd_data[8]);   
            addr1_sda    = i2c_addr[0];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[0];
        end
        4'd8:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = 1'b1;
            addr0_sda    = 1'b1;
            addr1_sda    = 1'b1;
            data_sda     = rw_flag   ? (re_nack ? 1'b1 : 1'b0) : 1'b1;
        end
        default:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = 1'b0;
            addr0_sda    = 1'b1;
            addr1_sda    = 1'b1;
            data_sda     = 1'b1;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_rx[7:0]    <= 8'd0;
    else if(sta_data && rw_flag && r_scl_d[1])
        case(byte_cnt[3:0])
            4'd0:   i2cm_rx[7] <= i_sda_in;
            4'd1:   i2cm_rx[6] <= i_sda_in;
            4'd2:   i2cm_rx[5] <= i_sda_in;
            4'd3:   i2cm_rx[4] <= i_sda_in;
            4'd4:   i2cm_rx[3] <= i_sda_in;
            4'd5:   i2cm_rx[2] <= i_sda_in;
            4'd6:   i2cm_rx[1] <= i_sda_in;
            4'd7:   i2cm_rx[0] <= i_sda_in;
            default: i2cm_rx[7:0] <= i2cm_rx[7:0];
        endcase
end
assign  f_empty = ~tx_empty & tx_empty_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nack    <= 1'b0;
    else if(stop_end)
        nack    <= 1'b0;
    else if((bycnt_eq8 && r_scl_d[1]) && ~sta_special)
        nack    <= i_sda_in;
end
assign  re_nack = ((tx_empty & i2cm_stop) | ~tx_rd_data[8]) & rw_flag & sta_data & bycnt_eq8;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        hold_cnt[7:0]    <= 8'd0;
    else if(hold_clr)
        hold_cnt[7:0]    <= 8'd0;
    else if(hold_plus)
        hold_cnt[7:0]   <= hold_cnt[7:0] + 8'd1;
end
assign  hold_clr    = hold_eq | (i2c_hold[7:0] == 8'd0);
assign  hold_eq     = (i2c_hold[7:0] == 8'd0)? f_scl_d[0] :
                      (hold_cnt[7:0] == i2c_hold[7:0]);
assign  hold_eq0    = (hold_cnt[7:0] == 8'd0);
assign  hold_plus   = hold_plus_1 | hold_plus_0 | ~hold_eq0;
assign  hold_plus_1 = sta_special & f_scl_d[0];
assign  hold_plus_0 = (sta_addr0 | sta_data | sta_addr1) & hs_mode; 
assign  hs_mode     = i2cm_hs ? (bcnt_eqh | a0_hs_byeq0) : f_scl_d[0];
assign  a0_hs_byeq0 = sta_addr0 & bycnt_eq0 & f_scl_d[0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_fscnt[7:0]  <= 8'd0;
    else if(fscnt_clr)
        i2c_fscnt[7:0]  <= 8'd0;
    else if(fscnt_plus)
        i2c_fscnt[7:0]  <= i2c_fscnt[7:0] + 8'd1;
end
assign  fscnt_clr   = fscnt_clr1 | fscnt_clr2;
assign  fscnt_clr1  = sta_special & (bcnt_eqh | bcnt_eql) & i2c_fscnt_eq;
assign  fscnt_clr2  = sta_start & (bit_cnt[23:0] == i2c_hcnt[23:0]) &
                      i2c_fscnt_eq;
assign  fscnt_plus      = fscnt_plus_spec | fscnt_plus_star;
assign  fscnt_plus_spec = sta_special & (bcnt_eqh | bcnt_eql);
assign  fscnt_plus_star = sta_start & (bit_cnt[23:0] == i2c_hcnt[23:0]) &
                          (i2cm_hs | i2cm_sbyte);
assign  i2c_fscnt_eq = (i2c_fscnt[7:0] == i2c_fs_div[7:0]);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sbyte_flag  <= 1'b0;
    else if(sta_restart)
        sbyte_flag  <= 1'b0;
    else if(sta_special && i2cm_sbyte && bycnt_eq8 && r_scl)
        sbyte_flag  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        hsm_flag <= 1'b0;
    else if(sta_restart)
        hsm_flag <= 1'b0;
    else if(sta_special && i2cm_hs && bycnt_eq8 && r_scl &&
        (i2cm_sbyte ? sbyte_flag : 1'b1))
        hsm_flag <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        i2cm_sflag  <= 1'b0;
    end
    else
    begin
        if(start_end | restart_end)
            i2cm_sflag  <= 1'b0;
        else if((sta_start | sta_restart) & start_flag)
            i2cm_sflag  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_busy <= 1'b1;
    else if((start_flag && sta_idle) || lose_arbi)
        i2c_busy    <= 1'b1;
    else
        if((bycnt_eq2 && i2c_sflag) || stop_flag)
            i2c_busy <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_sflag  <= 1'b1;
    else if(stop_flag)
        i2c_sflag  <= 1'b1;
    else if(sta_idle && start_flag)
        i2c_sflag  <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        lose_arbi   <= 1'b0;
    else if(special_end || addr0_end || addr1_end || data_end)
        lose_arbi   <= 1'b0;
    else if(arbi_en && ~lose_arbi)
        lose_arbi   <= sda_out ^ i_sda_in;
end
assign  arbi_en   = r_scl_d[1] & (data_arbi | addr_arbi);
assign  data_arbi = sta_data & (rw_flag ? bycnt_eq8 : 
                    ((byte_cnt[3:0] >= 4'd0) & (byte_cnt[3:0] <= 4'd7)));
assign  addr_arbi = (sta_special | sta_addr0 | sta_addr1) & 
                    (byte_cnt[3:0] >= 4'd0) & (byte_cnt[3:0] <= 4'd7);
assign  i2cm_tx_ren  = sta_data & bycnt_eq7 & r_scl_d[1];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_rx_wen <= 1'b0;
    else if(rw_flag && sta_data)
        i2cm_rx_wen <= r_scl_d[1] & (byte_cnt[3:0] == 4'd7);
end
assign  i2cm_work   = ~sta_idle;
assign  i2cm_data   = sta_data;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_aerr_intr  <= 1'b0;
    else if(i2c_aerr_clr || ~i2c_intr_en[4])
        i2cm_aerr_intr  <= 1'b0;
    else if(i2cm_aerr && i2cm_en)
        i2cm_aerr_intr  <= 1'b1;
end
assign  i2cm_aerr = (i2cm_amode == 1'b0) & ((i2c_addr[6:3] == 4'b0000) | (i2c_addr[6:3] == 4'b1111));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_stop_intr  <= 1'b0;
    else if(i2c_stop_clr | ~i2c_intr_en[0])
        i2cm_stop_intr  <= 1'b0;
    else if(stop_end && i2cm_en)
        i2cm_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_lose_arbi_intr  <= 1'b0;
    else if(i2cm_lose_arbi_clr | ~i2c_intr_en[2])
        i2cm_lose_arbi_intr  <= 1'b0;
    else if(arbi_en && (sda_out ^ i_sda_in) && i2cm_en)
        i2cm_lose_arbi_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_nack_intr  <= 1'b0;
    else if(i2c_nack_clr | ~i2c_intr_en[1])
        i2cm_nack_intr  <= 1'b0;
    else if((r_nack && ~rw_flag) && i2cm_en)
        i2cm_nack_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nack_d  <= 1'b0;
    else
        nack_d  <= nack;
end
assign  r_nack = nack & ~nack_d;
endmodule
