/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module uart(
  clk,
  f_rxd,
  i_rxd_in,
  rst_n,
  rx_shift,
  rxd_work,
  tx_empty,
  tx_rd_data,
  txd_out,
  txd_work,
  uart_dbit,
  uart_div,
  uart_en,
  uart_eps,
  uart_intr_en,
  uart_pbit,
  uart_pen,
  uart_perr_clr,
  uart_perr_intr,
  uart_rx_wen,
  uart_rxd,
  uart_stop_clr,
  uart_stop_intr,
  uart_tx_ren
);
input           clk;            
input           f_rxd;          
input           i_rxd_in;       
input           rst_n;          
input           tx_empty;       
input   [7 :0]  tx_rd_data;     
input   [1 :0]  uart_dbit;      
input   [23:0]  uart_div;       
input           uart_en;        
input           uart_eps;       
input   [1 :0]  uart_intr_en;   
input   [1 :0]  uart_pbit;      
input           uart_pen;       
input           uart_perr_clr;  
input           uart_rxd;       
input           uart_stop_clr;  
output  [7 :0]  rx_shift;       
output          rxd_work;       
output          txd_out;        
output          txd_work;       
output          uart_perr_intr; 
output          uart_rx_wen;    
output          uart_stop_intr; 
output          uart_tx_ren;    
reg             data_parity;    
reg             dbit_en;        
reg     [2 :0]  nxt_uart_fsm;   
reg             parity_check;   
reg             rx_en;          
reg     [7 :0]  rx_shift;       
reg     [3 :0]  rxcnt_1bit;     
reg     [3 :0]  rxcnt_bits;     
reg     [23:0]  rxcnt_div16;    
reg     [3 :0]  txcnt_1bit;     
reg     [2 :0]  txcnt_bits;     
reg     [23:0]  txcnt_div16;    
reg             txd_out;        
reg             uart_bit0_en;   
reg             uart_data_end;  
reg     [2 :0]  uart_fsm;       
reg             uart_perr_intr; 
reg             uart_stop_end;  
reg             uart_stop_intr; 
wire            clk;            
wire            f_rxd;          
wire            i_rxd_in;       
wire            parity_comp;    
wire            rst_n;          
wire            rxcnt_1bit_eq;  
wire            rxcnt_div16_eq; 
wire            rxcnt_plus;     
wire            rxd_work;       
wire            tx_empty;       
wire    [7 :0]  tx_rd_data;     
wire            txcnt_1bit_eq;  
wire            txcnt_bits_eq1; 
wire            txcnt_div16_eq; 
wire            txd_work;       
wire            uart_all_end;   
wire            uart_data;      
wire    [1 :0]  uart_dbit;      
wire    [23:0]  uart_div;       
wire            uart_en;        
wire            uart_eps;       
wire            uart_idle;      
wire            uart_idle_end;  
wire    [1 :0]  uart_intr_en;   
wire            uart_parity;    
wire            uart_parity_end; 
wire    [1 :0]  uart_pbit;      
wire            uart_pen;       
wire            uart_perr_clr;  
wire            uart_rx_end;    
wire            uart_rx_wen;    
wire            uart_rxd;       
wire            uart_start;     
wire            uart_start_end; 
wire            uart_stop;      
wire            uart_stop_clr;  
wire            uart_tx_ren;    
parameter UART_IDLE   = 3'b000,
          UART_STOP   = 3'b001,
          UART_START  = 3'b011,
          UART_DATA   = 3'b010,
          UART_PARITY = 3'b110;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_fsm[2:0]   <= UART_IDLE;
    else if(uart_en)
        uart_fsm[2:0]   <= nxt_uart_fsm[2:0];
    else
        uart_fsm[2:0]   <= UART_IDLE;
end
always @( uart_stop_end
       or uart_data_end
       or uart_idle_end
       or uart_pen
       or tx_empty
       or uart_parity_end
       or uart_fsm[2:0]
       or uart_start_end)
begin
    case(uart_fsm[2:0])  
        UART_IDLE :
            if(uart_idle_end)
                nxt_uart_fsm[2:0]   = UART_START;
            else
                nxt_uart_fsm[2:0]   = UART_IDLE;
        UART_START:
            if(uart_start_end)
                nxt_uart_fsm[2:0]   = UART_DATA;
            else
                nxt_uart_fsm[2:0]   = UART_START;
        UART_DATA:
            if(uart_data_end)
            begin
                if(uart_pen)
                    nxt_uart_fsm[2:0]   = UART_PARITY;
                else
                    nxt_uart_fsm[2:0]   = UART_STOP;
            end
            else
                nxt_uart_fsm[2:0]   = UART_DATA;
        UART_PARITY:
            if(uart_parity_end)
                nxt_uart_fsm[2:0]   = UART_STOP;
            else
                nxt_uart_fsm[2:0]   = UART_PARITY;
        UART_STOP:
            if(uart_stop_end)
                if(tx_empty)
                    nxt_uart_fsm[2:0] = UART_IDLE;
                else
                    nxt_uart_fsm[2:0] = UART_START;
            else
                nxt_uart_fsm[2:0]   = UART_STOP;
        default:
            nxt_uart_fsm[2:0]   = UART_IDLE;
    endcase
end
assign  uart_idle  = (uart_fsm[2:0] == UART_IDLE);
assign  uart_start = (uart_fsm[2:0] == UART_START);
assign  uart_data  = (uart_fsm[2:0] == UART_DATA);
assign  uart_parity = (uart_fsm[2:0] == UART_PARITY);
assign  uart_stop   = (uart_fsm[2:0] == UART_STOP);
assign  txcnt_bits_eq1  = (txcnt_bits[2:0] == 3'd1);
assign  txcnt_1bit_eq   = (txcnt_1bit[3:0] == 4'd15);
assign  txcnt_div16_eq  = (txcnt_div16[23:0] == uart_div[23:0]);
assign  uart_idle_end   = uart_idle & (~tx_empty);
assign  uart_start_end  = uart_start & txcnt_div16_eq & txcnt_1bit_eq;
assign  uart_parity_end = uart_parity & txcnt_div16_eq & txcnt_1bit_eq;
assign  uart_all_end = uart_idle_end | uart_start_end | uart_data_end | 
                       uart_parity_end | uart_stop_end;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_bits[2:0] <= 3'b000;
    else if(uart_all_end || ~uart_en || uart_idle)
        txcnt_bits[2:0] <= 3'b000;
    else if(txcnt_div16_eq && txcnt_1bit_eq)
        txcnt_bits[2:0] <= txcnt_bits[2:0] + 3'b001;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_div16[23:0] <= 24'd0;
    else if(uart_stop && txcnt_bits_eq1 && (txcnt_1bit[3:0] == 4'd7) && txcnt_div16_eq)
        txcnt_div16[23:0] <= 24'd0;
    else if(txcnt_div16_eq | uart_idle)
        txcnt_div16[23:0] <= 24'd0;
    else
        txcnt_div16[23:0] <= txcnt_div16[23:0] + 24'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_1bit[3:0] <= 4'd0;
    else if(~uart_en || uart_idle || uart_stop_end)
        txcnt_1bit[3:0] <= 4'd0;
    else if(txcnt_div16_eq)
        txcnt_1bit[3:0] <= txcnt_1bit[3:0] + 4'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txd_out <= 1'b1;
    else
    begin
        case(uart_fsm[2:0])
            UART_IDLE:  txd_out <= 1'b1;
            UART_START: txd_out <= 1'b0;
            UART_DATA: 
            begin
                case(txcnt_bits[2:0]) // synopsys parallel_case
                    3'd0: txd_out <= tx_rd_data[0];
                    3'd1: txd_out <= tx_rd_data[1];
                    3'd2: txd_out <= tx_rd_data[2];
                    3'd3: txd_out <= tx_rd_data[3];
                    3'd4: txd_out <= tx_rd_data[4];
                    3'd5: txd_out <= tx_rd_data[5];
                    3'd6: txd_out <= tx_rd_data[6];
                    3'd7: txd_out <= tx_rd_data[7];
                endcase
            end
            UART_PARITY: txd_out <= uart_eps ? data_parity : ~data_parity;
            UART_STOP:   txd_out <= 1'b1;
            default: txd_out <= txd_out;
        endcase
    end
end
always @( tx_rd_data[7:0]
       or txcnt_1bit_eq
       or txcnt_div16_eq
       or uart_dbit[1:0]
       or txcnt_bits
       or rx_shift[7:0]
       or uart_data
       or i_rxd_in)
begin
    case(uart_dbit[1:0])  // synopsys parallel_case
        2'b00: 
        begin
            data_parity  = (^tx_rd_data[4:0]);
            parity_check = (^rx_shift[4:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd4) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b01: 
        begin
            data_parity = (^tx_rd_data[5:0]);
            parity_check = (^rx_shift[5:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd5) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b10: 
        begin
            data_parity = (^tx_rd_data[6:0]);
            parity_check = (^rx_shift[6:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd6) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b11: 
        begin
            data_parity = (^tx_rd_data[7:0]);
            parity_check = (^rx_shift[7:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd7) & txcnt_div16_eq & txcnt_1bit_eq;
        end
    endcase
end
always @( uart_stop
       or txcnt_1bit_eq
       or uart_pbit[1:0]
       or txcnt_div16_eq
       or txcnt_bits_eq1
       or txcnt_1bit)
begin
    if(uart_stop && txcnt_div16_eq)
        case(uart_pbit[1:0]) // synopsys parallel_case
            2'b00:  uart_stop_end = txcnt_1bit_eq;
            2'b01:  uart_stop_end = (txcnt_1bit == 4'd7) & txcnt_bits_eq1;
            2'b10:  uart_stop_end = txcnt_1bit_eq & txcnt_bits_eq1;
            2'b11:  uart_stop_end = txcnt_1bit_eq;  
        endcase
    else
        uart_stop_end = 1'b0;
end
assign  uart_tx_ren = uart_stop & ((~|txcnt_bits[2:0])) & (txcnt_1bit[3:0] == 4'd1) 
                     & txcnt_div16_eq;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_div16[23:0]   <= 24'd0;
    else if(~uart_en || (rxcnt_div16[23:0] == uart_div[23:0]) || uart_rx_end)
        rxcnt_div16[23:0]   <= 24'd0;
    else if(rxcnt_plus)
        rxcnt_div16[23:0] <= rxcnt_div16[23:0] + 24'd1;
end
assign  rxcnt_plus = ((rxcnt_bits[3:0] == 4'd0) & (f_rxd | uart_bit0_en)) 
                     | (rxcnt_bits[3:0] != 4'd0);
assign  uart_rx_end = (rxcnt_bits[3:0] == 4'ha) & rxcnt_div16_eq &
                      (rxcnt_1bit[3:0] == 4'd7);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_bit0_en    <= 1'b0;
    else if(uart_rx_end || (rxcnt_bits[3:0] != 4'd0))
        uart_bit0_en    <= 1'b0;
    else if(f_rxd && (rxcnt_bits[3:0] == 4'd0))
        uart_bit0_en    <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_bits[3:0] <= 4'd0;
    else if(~rx_en || ~uart_en || uart_rx_end)
        rxcnt_bits[3:0] <= 4'd0;
    else if(rxcnt_div16_eq && rxcnt_1bit_eq)
        case(rxcnt_bits[3:0])
            4'd5,4'd6,4'd7,4'd8:
                if(dbit_en)
                    rxcnt_bits[3:0] <= 4'd9 + (uart_pen ? 4'd0 : 4'd1);
                else
                    rxcnt_bits[3:0] <= rxcnt_bits[3:0] + 4'd1;
            4'd10: rxcnt_bits[3:0] <= 4'd0;
            default:rxcnt_bits[3:0] <= rxcnt_bits[3:0] + 4'd1; 
        endcase
end
always @( uart_dbit[1:0]
       or rxcnt_bits[3:0])
begin
    case(uart_dbit[1:0]) // synopsys parallel_case
        2'b00: 
        begin
            if(rxcnt_bits[3:0] == 4'd5)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b01:
        begin
            if(rxcnt_bits[3:0] == 4'd6)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b10:
        begin
            if(rxcnt_bits[3:0] == 4'd7)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b11:
        begin
            if(rxcnt_bits[3:0] == 4'd8)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rx_en   <= 1'b0;
    else if(~uart_en)
        rx_en   <= 1'b0;
    else if((rxcnt_bits[3:0] == 4'd10) && (rxcnt_1bit[3:0] == 4'd7) && rxcnt_div16_eq)
        rx_en   <= 1'b0;
    else if((rxcnt_bits[3:0] == 4'd0) && (rxcnt_1bit[3:0] < 4'd7)  && rxcnt_div16_eq)
        rx_en   <= ~uart_rxd; 
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_1bit[3:0] <= 4'd0;
    else if(~uart_en || uart_rx_end)
        rxcnt_1bit[3:0] <= 4'd0;
    else if(rxcnt_div16_eq)
        rxcnt_1bit[3:0]     <= rxcnt_1bit[3:0] + 4'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rx_shift[7:0]   <= 8'd0;
    else if((rxcnt_1bit[3:0] == 4'd7) && rxcnt_div16_eq)
        case(rxcnt_bits[3:0])
            4'd1: rx_shift[0] <= i_rxd_in;
            4'd2: rx_shift[1] <= i_rxd_in;
            4'd3: rx_shift[2] <= i_rxd_in;
            4'd4: rx_shift[3] <= i_rxd_in;
            4'd5: rx_shift[4] <= i_rxd_in;
            4'd6: rx_shift[5] <= i_rxd_in;
            4'd7: rx_shift[6] <= i_rxd_in;
            4'd8: rx_shift[7] <= i_rxd_in;
            default: rx_shift[7:0] <= rx_shift[7:0];
        endcase
end
assign  uart_rx_wen = (rxcnt_bits[3:0] == 4'd10) & (rxcnt_1bit[3:0] == 4'd1) & rxcnt_div16_eq;
assign  rxcnt_1bit_eq   = (rxcnt_1bit[3:0] == 4'hf);
assign  rxcnt_div16_eq  = (rxcnt_div16[23:0] == uart_div[23:0]);
assign  rxd_work  = rx_en;
assign  txd_work  = ~uart_idle;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_stop_intr  <= 1'b0;
    else if(uart_stop_clr || (~uart_intr_en[0]))
        uart_stop_intr  <= 1'b0;
    else if((tx_empty && uart_stop_end) || uart_rx_wen)
        uart_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_perr_intr  <= 1'b0;
    else if(uart_perr_clr || (~uart_intr_en[1]))
        uart_perr_intr  <= 1'b0;
    else if(parity_comp)
        uart_perr_intr  <= 1'b1;
end
assign  parity_comp = (rxcnt_bits[3:0] == 4'd9) &
                      (rxcnt_1bit[3:0] == 4'd7) &
                      (rxcnt_div16[23:0] == uart_div[23:0]) &
                      (uart_eps ? parity_check : (~parity_check)); 
endmodule
