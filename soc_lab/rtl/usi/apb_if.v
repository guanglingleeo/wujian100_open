/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

`define ADDR_USI_EN         12'h000 
`define ADDR_MODE_SEL       12'h004
`define ADDR_TX_FIFO        12'h008
`define ADDR_RX_FIFO        12'h008
`define ADDR_FIFO_STA       12'h00C
`define ADDR_CLK_DIV0       12'h010
`define ADDR_CLK_DIV1       12'h014
`define ADDR_UART_CTRL      12'h018
`define ADDR_UART_STA       12'h01C
`define ADDR_I2C_MODE       12'h020
`define ADDR_I2C_ADDR       12'h024
`define ADDR_I2CM_CTRL      12'h028
`define ADDR_I2CM_CODE      12'h02C
`define ADDR_I2CS_CTRL      12'h030
`define ADDR_I2C_FS_DIV     12'h034
`define ADDR_I2C_HOLD       12'h038
`define ADDR_I2C_STA        12'h03C
`define ADDR_SPI_MODE       12'h040
`define ADDR_SPI_CTRL       12'h044
`define ADDR_SPI_STA        12'h048
`define ADDR_INTR_CTRL      12'h04C
`define ADDR_INTR_EN        12'h050
`define ADDR_INTR_STA       12'h054
`define ADDR_RAW_INTR_STA   12'h058
`define ADDR_INTR_MASK      12'h05C
`define ADDR_INTR_CLR       12'h060
`define ADDR_DMA_CTRL       12'h064
`define ADDR_DMA_TH         12'h068
module apb_if(
  clk,
  clk_div0,
  cpha,
  cpol,
  fifo_intr_en,
  i2c_addr,
  i2c_aerr_clr,
  i2c_aerr_intr,
  i2c_en,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_mode,
  i2c_nack_clr,
  i2c_nack_intr,
  i2c_stop_clr,
  i2c_stop_intr,
  i2cm_amode,
  i2cm_code,
  i2cm_data,
  i2cm_en,
  i2cm_gcall,
  i2cm_hs,
  i2cm_lose_arbi_clr,
  i2cm_lose_arbi_intr,
  i2cm_sbyte,
  i2cm_stop,
  i2cm_work,
  i2cs_amode,
  i2cs_en,
  i2cs_gcall,
  i2cs_gcall_clr,
  i2cs_gcall_intr,
  i2cs_hs,
  i2cs_sbyte,
  i2cs_work,
  intr_edge,
  nss_toggle,
  paddr,
  penable,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  rx_data_cnt,
  rx_dma_en,
  rx_dma_th,
  rx_empty,
  rx_empty_clr,
  rx_empty_intr,
  rx_fifo_en,
  rx_fifo_th,
  rx_full,
  rx_full_clr,
  rx_full_intr,
  rx_rd_data,
  rx_read_err_clr,
  rx_read_err_intr,
  rx_ren,
  rx_thold_clr,
  rx_thold_intr,
  rx_write_err_clr,
  rx_write_err_intr,
  rxd_work,
  sdata_en,
  spi_data_size,
  spi_en,
  spi_intr_en,
  spi_rx_en,
  spi_stop_clr,
  spi_stop_intr,
  spi_tx_en,
  spi_work,
  spim_en,
  spis_en,
  tx_data_cnt,
  tx_dma_en,
  tx_dma_th,
  tx_empty,
  tx_empty_clr,
  tx_empty_intr,
  tx_fifo_en,
  tx_fifo_th,
  tx_full,
  tx_full_clr,
  tx_full_intr,
  tx_read_err_clr,
  tx_read_err_intr,
  tx_thold_clr,
  tx_thold_intr,
  tx_wen,
  tx_write_err_clr,
  tx_write_err_intr,
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
  uart_stop_clr,
  uart_stop_intr,
  usi_ctrl,
  usi_intr,
  wr_clk_div
);
input           clk;                
input           i2c_aerr_intr;      
input           i2c_nack_intr;      
input           i2c_stop_intr;      
input           i2cm_data;          
input           i2cm_lose_arbi_intr; 
input           i2cm_work;          
input           i2cs_gcall_intr;    
input           i2cs_work;          
input   [31:0]  paddr;              
input           penable;            
input           psel;               
input   [31:0]  pwdata;             
input           pwrite;             
input           rst_n;              
input   [4 :0]  rx_data_cnt;        
input           rx_empty;           
input           rx_empty_intr;      
input           rx_full;            
input           rx_full_intr;       
input   [15:0]  rx_rd_data;         
input           rx_read_err_intr;   
input           rx_thold_intr;      
input           rx_write_err_intr;  
input           rxd_work;           
input           spi_stop_intr;      
input           spi_work;           
input   [4 :0]  tx_data_cnt;        
input           tx_empty;           
input           tx_empty_intr;      
input           tx_full;            
input           tx_full_intr;       
input           tx_read_err_intr;   
input           tx_thold_intr;      
input           tx_write_err_intr;  
input           txd_work;           
input           uart_perr_intr;     
input           uart_stop_intr;     
output  [23:0]  clk_div0;           
output          cpha;               
output          cpol;               
output  [9 :0]  fifo_intr_en;       
output  [9 :0]  i2c_addr;           
output          i2c_aerr_clr;       
output          i2c_en;             
output  [7 :0]  i2c_fs_div;         
output  [23:0]  i2c_hcnt;           
output  [7 :0]  i2c_hold;           
output  [4 :0]  i2c_intr_en;        
output  [23:0]  i2c_lcnt;           
output          i2c_mode;           
output          i2c_nack_clr;       
output          i2c_stop_clr;       
output          i2cm_amode;         
output  [2 :0]  i2cm_code;          
output          i2cm_en;            
output          i2cm_gcall;         
output          i2cm_hs;            
output          i2cm_lose_arbi_clr; 
output          i2cm_sbyte;         
output          i2cm_stop;          
output          i2cs_amode;         
output          i2cs_en;            
output          i2cs_gcall;         
output          i2cs_gcall_clr;     
output          i2cs_hs;            
output          i2cs_sbyte;         
output          intr_edge;          
output          nss_toggle;         
output  [31:0]  prdata;             
output          rx_dma_en;          
output  [4 :0]  rx_dma_th;          
output          rx_empty_clr;       
output          rx_fifo_en;         
output  [1 :0]  rx_fifo_th;         
output          rx_full_clr;        
output          rx_read_err_clr;    
output          rx_ren;             
output          rx_thold_clr;       
output          rx_write_err_clr;   
output          sdata_en;           
output  [3 :0]  spi_data_size;      
output          spi_en;             
output          spi_intr_en;        
output          spi_rx_en;          
output          spi_stop_clr;       
output          spi_tx_en;          
output          spim_en;            
output          spis_en;            
output          tx_dma_en;          
output  [4 :0]  tx_dma_th;          
output          tx_empty_clr;       
output          tx_fifo_en;         
output  [1 :0]  tx_fifo_th;         
output          tx_full_clr;        
output          tx_read_err_clr;    
output          tx_thold_clr;       
output          tx_wen;             
output          tx_write_err_clr;   
output  [1 :0]  uart_dbit;          
output  [23:0]  uart_div;           
output          uart_en;            
output          uart_eps;           
output  [1 :0]  uart_intr_en;       
output  [1 :0]  uart_pbit;          
output          uart_pen;           
output          uart_perr_clr;      
output          uart_stop_clr;      
output  [3 :0]  usi_ctrl;           
output          usi_intr;           
output          wr_clk_div;         
reg     [23:0]  clk_div0;           
reg     [23:0]  clk_div1;           
reg     [1 :0]  dma_ctrl;           
reg     [9 :0]  i2c_addr;           
reg             i2c_en;             
reg     [7 :0]  i2c_fs_div;         
reg     [7 :0]  i2c_hold;           
reg             i2c_mode;           
reg     [2 :0]  i2cm_code;          
reg     [4 :0]  i2cm_ctrl;          
reg             i2cm_en;            
reg             i2cs_ctrl;          
reg             i2cs_en;            
reg             intr_edge;          
reg     [17:0]  intr_en;            
reg     [17:0]  intr_mask;          
reg     [1 :0]  mode_sel;           
reg     [31:0]  prdata;             
reg     [4 :0]  rx_dma_th;          
reg     [1 :0]  rx_fifo_th;         
reg     [8 :0]  spi_ctrl;           
reg             spi_en;             
reg             spi_mode;           
reg             spim_en;            
reg             spis_en;            
reg     [4 :0]  tx_dma_th;          
reg     [1 :0]  tx_fifo_th;         
reg     [5 :0]  uart_ctrl;          
reg             uart_en;            
reg     [3 :0]  usi_ctrl;           
wire            apb_ren;            
wire            apb_wen;            
wire            clk;                
wire            cpha;               
wire            cpol;               
wire    [9 :0]  fifo_intr_en;       
wire            i2c_aerr_clr;       
wire            i2c_aerr_intr;      
wire    [23:0]  i2c_hcnt;           
wire    [4 :0]  i2c_intr_en;        
wire    [23:0]  i2c_lcnt;           
wire            i2c_nack_clr;       
wire            i2c_nack_intr;      
wire            i2c_stop_clr;       
wire            i2c_stop_intr;      
wire            i2cm_amode;         
wire            i2cm_data;          
wire            i2cm_gcall;         
wire            i2cm_hs;            
wire            i2cm_lose_arbi_clr; 
wire            i2cm_lose_arbi_intr; 
wire            i2cm_sbyte;         
wire            i2cm_stop;          
wire            i2cm_work;          
wire            i2cs_amode;         
wire            i2cs_gcall;         
wire            i2cs_gcall_clr;     
wire            i2cs_gcall_intr;    
wire            i2cs_hs;            
wire            i2cs_sbyte;         
wire            i2cs_work;          
wire            intr_clr;           
wire    [17:0]  intr_sta;           
wire            nss_toggle;         
wire    [31:0]  paddr;              
wire            penable;            
wire            psel;               
wire    [31:0]  pwdata;             
wire            pwrite;             
wire    [17:0]  raw_intr_sta;       
wire            rst_n;              
wire    [4 :0]  rx_data_cnt;        
wire            rx_dma_en;          
wire            rx_empty;           
wire            rx_empty_clr;       
wire            rx_empty_intr;      
wire            rx_fifo_en;         
wire            rx_full;            
wire            rx_full_clr;        
wire            rx_full_intr;       
wire    [15:0]  rx_rd_data;         
wire            rx_read_err_clr;    
wire            rx_read_err_intr;   
wire            rx_ren;             
wire            rx_thold_clr;       
wire            rx_thold_intr;      
wire            rx_write_err_clr;   
wire            rx_write_err_intr;  
wire            rxd_work;           
wire            sdata_en;           
wire    [3 :0]  spi_data_size;      
wire            spi_intr_en;        
wire            spi_rx_en;          
wire            spi_stop_clr;       
wire            spi_stop_intr;      
wire            spi_tx_en;          
wire            spi_work;           
wire    [4 :0]  tx_data_cnt;        
wire            tx_dma_en;          
wire            tx_empty;           
wire            tx_empty_clr;       
wire            tx_empty_intr;      
wire            tx_fifo_en;         
wire            tx_full;            
wire            tx_full_clr;        
wire            tx_full_intr;       
wire            tx_read_err_clr;    
wire            tx_read_err_intr;   
wire            tx_thold_clr;       
wire            tx_thold_intr;      
wire            tx_wen;             
wire            tx_write_err_clr;   
wire            tx_write_err_intr;  
wire            txd_work;           
wire    [1 :0]  uart_dbit;          
wire    [23:0]  uart_div;           
wire            uart_eps;           
wire    [1 :0]  uart_intr_en;       
wire    [1 :0]  uart_pbit;          
wire            uart_pen;           
wire            uart_perr_clr;      
wire            uart_perr_intr;     
wire            uart_stop_clr;      
wire            uart_stop_intr;     
wire            usi_intr;           
wire            wr_clk_div;         
parameter TP = 0;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        prdata[31:0]    <= 32'd0;
    else if(apb_ren)
    case(paddr[11:0])
        `ADDR_USI_EN        : prdata[31:0] <= {28'd0, usi_ctrl[3:0]};
        `ADDR_MODE_SEL      : prdata[31:0] <= {30'd0, mode_sel[1:0]};
        `ADDR_RX_FIFO       : prdata[31:0] <= {16'd0, rx_rd_data[15:0]};
        `ADDR_FIFO_STA      : prdata[31:0] <= {11'd0, rx_data_cnt[4:0], 3'd0, tx_data_cnt[4:0], 4'd0, 
                                              rx_full, rx_empty, tx_full, tx_empty};
        `ADDR_CLK_DIV0      : prdata[31:0] <= {8'd0, clk_div0[23:0]};
        `ADDR_CLK_DIV1      : prdata[31:0] <= {8'd0, clk_div1[23:0]};
        `ADDR_UART_CTRL     : prdata[31:0] <= {26'd0, uart_ctrl[5:0]};
        `ADDR_UART_STA      : prdata[31:0] <= {30'd0, rxd_work, txd_work};
        `ADDR_I2C_MODE      : prdata[31:0] <= {31'd0, i2c_mode};
        `ADDR_I2C_ADDR      : prdata[31:0] <= {22'd0, i2c_addr[9:0]};
        `ADDR_I2CM_CTRL     : prdata[31:0] <= {27'd0, i2cm_ctrl[4:0]};
        `ADDR_I2CM_CODE     : prdata[31:0] <= {29'd0, i2cm_code[2:0]};
        `ADDR_I2CS_CTRL     : prdata[31:0] <= {31'd0, i2cs_ctrl};
        `ADDR_I2C_FS_DIV    : prdata[31:0] <= {24'd0, i2c_fs_div[7:0]};
        `ADDR_I2C_HOLD      : prdata[31:0] <= {24'd0, i2c_hold[7:0]};
        `ADDR_I2C_STA       : prdata[31:0] <= {23'd0, i2cs_work, 6'd0, i2cm_data, i2cm_work};
        `ADDR_SPI_MODE      : prdata[31:0] <= {31'd0, spi_mode};
        `ADDR_SPI_CTRL      : prdata[31:0] <= {23'd0, spi_ctrl[8:0]};
        `ADDR_SPI_STA       : prdata[31:0] <= {31'd0, spi_work};
        `ADDR_INTR_CTRL     : prdata[31:0] <= {15'd0, intr_edge, 6'd0, rx_fifo_th[1:0], 6'd0, tx_fifo_th[1:0]};
        `ADDR_INTR_EN       : prdata[31:0] <= {14'd0, intr_en[17:0]};
        `ADDR_INTR_STA      : prdata[31:0] <= {14'd0, intr_sta};
        `ADDR_RAW_INTR_STA  : prdata[31:0] <= {14'd0, raw_intr_sta};
        `ADDR_INTR_MASK     : prdata[31:0] <= {14'd0, intr_mask};
        `ADDR_DMA_CTRL      : prdata[31:0] <= {30'd0, dma_ctrl[1:0]};
        `ADDR_DMA_TH        : prdata[31:0] <= {19'd0, rx_dma_th[4:0], 3'd0, tx_dma_th[4:0]};
        default             : prdata[31:0] <= 32'd0;
    endcase
end
assign  raw_intr_sta[17:0] =   {spi_stop_intr,          
                                i2c_aerr_intr,
                                i2cs_gcall_intr, 
                                i2cm_lose_arbi_intr,
                                i2c_nack_intr,
                                i2c_stop_intr,          
                                uart_perr_intr,
                                uart_stop_intr,         
                                rx_write_err_intr,
                                rx_read_err_intr,
                                rx_full_intr,
                                rx_empty_intr,
                                rx_thold_intr,          
                                tx_write_err_intr,
                                tx_read_err_intr,
                                tx_full_intr, 
                                tx_empty_intr,
                                tx_thold_intr           
                                };
assign  intr_sta[17:0]  = raw_intr_sta[17:0] & intr_mask[17:0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        usi_ctrl[3:0]   <= 4'b0;
        mode_sel[1:0]   <= 2'b00;
        clk_div0[23:0]  <= 24'h20;
        clk_div1[23:0]  <= 24'h30;
        uart_ctrl[5:0]  <= 6'b000011;
        i2c_mode        <= 1'b1;
        i2c_addr[9:0]   <= 10'h133;
        i2cm_ctrl[4:0]  <= 5'd0;
        i2cm_code[2:0]  <= 3'b001;
        i2cs_ctrl       <= 1'd0;
        i2c_fs_div[7:0] <= 8'd5;
        i2c_hold[7:0]   <= 8'd5;
        spi_mode        <= 1'b1;
        spi_ctrl[8:0]   <= 9'd7;
        intr_edge       <= 1'b0;
        tx_fifo_th[1:0]  <= 2'b01;
        rx_fifo_th[1:0]  <= 2'b01;
        intr_en[17:0]   <= 18'd0;
        intr_mask[17:0] <= 18'd0;
        dma_ctrl[1:0]   <= 2'b00;
        rx_dma_th[4:0]  <= 5'd8;
        tx_dma_th[4:0]  <= 5'd8;
    end
    else
    begin
        if(apb_wen && (paddr[11:0] == `ADDR_USI_EN)) 
            usi_ctrl       <= pwdata[3:0];
        if(apb_wen && (paddr[11:0] == `ADDR_MODE_SEL)) 
            mode_sel[1:0] <= pwdata[1:0];
        if(apb_wen && (paddr[11:0] == `ADDR_CLK_DIV0)) 
            clk_div0[23:0] <= pwdata[23:0];
        if(apb_wen && (paddr[11:0] == `ADDR_CLK_DIV1)) 
            clk_div1[23:0] <= pwdata[23:0]; 
        if(apb_wen && (paddr[11:0] == `ADDR_UART_CTRL)) 
            uart_ctrl[5:0]   <= pwdata[5:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_MODE)) 
            i2c_mode         <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_ADDR)) 
            i2c_addr[9:0]    <= pwdata[9:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CM_CTRL)) 
            i2cm_ctrl[4:0]   <= pwdata[4:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CM_CODE)) 
            i2cm_code[2:0]   <= pwdata[2:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CS_CTRL)) 
            i2cs_ctrl     <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_HOLD)) 
            i2c_hold[7:0]   <= pwdata[7:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_FS_DIV)) 
            i2c_fs_div[7:0]   <= pwdata[7:0];
        if(apb_wen && (paddr[11:0] == `ADDR_SPI_MODE)) 
            spi_mode        <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_SPI_CTRL)) 
            spi_ctrl[8:0]    <= pwdata[8:0];
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_CTRL))
        begin
            intr_edge        <= pwdata[16];
            rx_fifo_th[1:0]  <= pwdata[9:8];
            tx_fifo_th[1:0]  <= pwdata[1:0];
        end
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_EN))
            intr_en[17:0]   <= pwdata[17:0];
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_MASK))
            intr_mask[17:0] <= pwdata[17:0];
        if(apb_wen && (paddr[11:0] == `ADDR_DMA_CTRL))
            dma_ctrl[1:0]   <= pwdata[1:0];
        if(apb_wen && (paddr[11:0] == `ADDR_DMA_TH))
        begin
            rx_dma_th[4:0]  <= pwdata[12:8];
            tx_dma_th[4:0]  <= pwdata[4:0];
        end
    end
end
assign  # TP apb_wen = psel & pwrite & (~penable);
assign  #TP  apb_ren = psel & (~pwrite) & (~penable);
assign  intr_clr = apb_wen & (paddr[11:0] == `ADDR_INTR_CLR);
assign  spi_stop_clr        = intr_clr & pwdata[17];
assign  i2c_aerr_clr        = intr_clr & pwdata[16];
assign  i2cs_gcall_clr      = intr_clr & pwdata[15];
assign  i2cm_lose_arbi_clr  = intr_clr & pwdata[14];
assign  i2c_nack_clr        = intr_clr & pwdata[13];
assign  i2c_stop_clr        = intr_clr & pwdata[12];
assign  uart_perr_clr       = intr_clr & pwdata[11];
assign  uart_stop_clr       = intr_clr & pwdata[10];
assign  rx_write_err_clr    = intr_clr & pwdata[9];
assign  rx_read_err_clr     = intr_clr & pwdata[8];
assign  rx_full_clr         = intr_clr & pwdata[7];
assign  rx_empty_clr        = intr_clr & pwdata[6];
assign  rx_thold_clr        = intr_clr & pwdata[5];
assign  tx_write_err_clr    = intr_clr & pwdata[4];
assign  tx_read_err_clr     = intr_clr & pwdata[3];
assign  tx_full_clr         = intr_clr & pwdata[2];
assign  tx_empty_clr        = intr_clr & pwdata[1];
assign  tx_thold_clr        = intr_clr & pwdata[0];
assign  wr_clk_div = apb_wen & ((paddr[11:0] == `ADDR_CLK_DIV0) | (paddr[11:0] == `ADDR_CLK_DIV1));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        uart_en <= 1'b0;
        i2c_en  <= 1'b0;
        spi_en  <= 1'b0;
        i2cm_en <= 1'b0;
        i2cs_en <= 1'b0;
        spim_en <= 1'b0;
        spis_en <= 1'b0;
    end
    else
    begin
        uart_en <= usi_ctrl[0] & usi_ctrl[1] & (mode_sel == 2'b00);
        i2c_en  <= usi_ctrl[1] & usi_ctrl[0] & (mode_sel == 2'b01);
        spi_en  <= usi_ctrl[1] & usi_ctrl[0] & (mode_sel == 2'b10);
        i2cm_en <= i2c_en & i2c_mode;
        i2cs_en <= i2c_en & ~i2c_mode;
        spim_en <= spi_en & spi_mode;
        spis_en <= spi_en & ~spi_mode;
    end
end
assign  sdata_en   = usi_ctrl[1] & usi_ctrl[0];
assign  rx_fifo_en = usi_ctrl[0] & usi_ctrl[3];
assign  tx_fifo_en = usi_ctrl[0] & usi_ctrl[2];
assign  uart_dbit[1:0]  = uart_ctrl[1:0];
assign  uart_pbit[1:0]  = uart_ctrl[3:2];
assign  uart_pen        = uart_ctrl[4];
assign  uart_eps        = uart_ctrl[5];
assign  uart_div[23:0]  = clk_div0[23:0];
assign  i2cm_gcall   = i2cm_ctrl[4];
assign  i2cm_sbyte   = i2cm_ctrl[3];
assign  i2cm_hs      = i2cm_ctrl[2];
assign  i2cm_stop    = i2cm_ctrl[1];
assign  i2cm_amode   = i2cm_ctrl[0];
assign  i2cs_sbyte  = 1'b0;
assign  i2cs_hs     = 1'b0;
assign  i2cs_gcall  = i2cs_ctrl;
assign  i2cs_amode  = 1'b0;
assign  i2c_hcnt[23:0] = clk_div0[23:0];
assign  i2c_lcnt[23:0] = clk_div1[23:0];
assign  spi_data_size[3:0] = (spi_ctrl[3:0] < 4'd3) ? 4'd7 : spi_ctrl[3:0];
assign  cpol    = spi_ctrl[7];
assign  cpha    = spi_ctrl[6];
assign  spi_tx_en = ~spi_ctrl[5] & usi_ctrl[0];
assign  spi_rx_en = ~spi_ctrl[4] & usi_ctrl[0];
assign  nss_toggle = spi_ctrl[8];
assign  tx_wen  = (apb_wen & (paddr[11:0] == `ADDR_TX_FIFO));
assign  rx_ren  = (apb_ren & (paddr[11:0] == `ADDR_RX_FIFO));
assign  usi_intr = |intr_sta[17:0];
assign  spi_intr_en = intr_en[17];
assign  i2c_intr_en[4:0] = intr_en[16:12];
assign  uart_intr_en[1:0] = intr_en[11:10];
assign  fifo_intr_en[9:0] = intr_en[9:0];
assign  rx_dma_en = dma_ctrl[1];
assign  tx_dma_en = dma_ctrl[0];
endmodule
