/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module usi_top(
  clk,
  dma_ack_rx,
  dma_ack_tx,
  dma_req_rx,
  dma_req_tx,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  paddr,
  penable,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  usi_etb_rx_trig,
  usi_etb_tx_trig,
  usi_intr
);
input           clk;                 
input           dma_ack_rx;          
input           dma_ack_tx;          
input           nss_in;              
input   [31:0]  paddr;               
input           penable;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           rst_n;               
input           sclk_in;             
input           sd0_in;              
input           sd1_in;              
output          dma_req_rx;          
output          dma_req_tx;          
output          nss_ie_n;            
output          nss_oe_n;            
output          nss_out;             
output  [31:0]  prdata;              
output          sclk_ie_n;           
output          sclk_oe_n;           
output          sclk_out;            
output          sd0_ie_n;            
output          sd0_oe_n;            
output          sd0_out;             
output          sd1_ie_n;            
output          sd1_oe_n;            
output          sd1_out;             
output          usi_etb_rx_trig;     
output          usi_etb_tx_trig;     
output          usi_intr;            
reg             dma_req_rx;          
reg             dma_req_tx;          
reg             set_rx_req_trig_dly; 
reg             set_tx_req_trig_dly; 
reg     [15:0]  tx_rd_data;          
reg             tx_ren_d;            
reg             tx_wen_d;            
reg             usi_etb_rx_trig;     
reg             usi_etb_tx_trig;     
wire            clk;                 
wire    [23:0]  clk_div0;            
wire            cpha;                
wire            cpol;                
wire            dma_ack_rx;          
wire            dma_ack_tx;          
wire            f_nss;               
wire            f_rxd;               
wire            f_scl;               
wire    [2 :0]  f_scl_d;             
wire            f_sda;               
wire    [9 :0]  fifo_intr_en;        
wire    [9 :0]  i2c_addr;            
wire            i2c_aerr_clr;        
wire            i2c_en;              
wire    [7 :0]  i2c_fs_div;          
wire    [23:0]  i2c_hcnt;            
wire    [7 :0]  i2c_hold;            
wire    [4 :0]  i2c_intr_en;         
wire    [23:0]  i2c_lcnt;            
wire            i2c_mode;            
wire            i2c_nack_clr;        
wire            i2c_nack_intr;       
wire    [7 :0]  i2c_rx;              
wire            i2c_rx_wen;          
wire            i2c_stop_clr;        
wire            i2c_stop_intr;       
wire            i2c_tx_ren;          
wire            i2cm_aerr_intr;      
wire            i2cm_amode;          
wire    [2 :0]  i2cm_code;           
wire            i2cm_data;           
wire            i2cm_en;             
wire            i2cm_gcall;          
wire            i2cm_hs;             
wire            i2cm_lose_arbi_clr;  
wire            i2cm_lose_arbi_intr; 
wire            i2cm_sbyte;          
wire            i2cm_stop;           
wire            i2cm_work;           
wire            i2cs_amode;          
wire            i2cs_en;             
wire            i2cs_gcall;          
wire            i2cs_gcall_clr;      
wire            i2cs_gcall_intr;     
wire            i2cs_hs;             
wire            i2cs_sbyte;          
wire            i2cs_work;           
wire            i_nss_in;            
wire            i_scl_in;            
wire            i_sd1_in;            
wire            i_sda_in;            
wire            intr_edge;           
wire            nss_ie_n;            
wire            nss_in;              
wire            nss_oe_n;            
wire            nss_out;             
wire            nss_toggle;          
wire    [31:0]  paddr;               
wire            penable;             
wire    [31:0]  prdata;              
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            r_scl;               
wire    [2 :0]  r_scl_d;             
wire            r_sda;               
wire            rst_n;               
wire    [4 :0]  rx_data_cnt;         
wire            rx_dma_en;           
wire    [4 :0]  rx_dma_th;           
wire            rx_empty;            
wire            rx_empty_clr;        
wire            rx_empty_d;          
wire            rx_empty_intr;       
wire            rx_fifo_en;          
wire    [1 :0]  rx_fifo_th;          
wire            rx_full;             
wire            rx_full_clr;         
wire            rx_full_intr;        
wire    [15:0]  rx_rd_data;          
wire            rx_read_err_clr;     
wire            rx_read_err_intr;    
wire            rx_ren;              
wire            rx_thold_clr;        
wire            rx_thold_intr;       
wire            rx_wen;              
wire    [15:0]  rx_wr_data;          
wire            rx_write_err_clr;    
wire            rx_write_err_intr;   
wire            rxd_work;            
wire            scl_out;             
wire            sclk_ie_n;           
wire            sclk_in;             
wire            sclk_oe_n;           
wire            sclk_out;            
wire            sd0_ie_n;            
wire            sd0_in;              
wire            sd0_oe_n;            
wire            sd0_out;             
wire            sd1_ie_n;            
wire            sd1_in;              
wire            sd1_oe_n;            
wire            sd1_out;             
wire            sda_out;             
wire            sdata_en;            
wire            set_rx_req_trig;     
wire            set_rx_req_trig_psdg; 
wire            set_tx_req_trig;     
wire            set_tx_req_trig_psdg; 
wire    [3 :0]  spi_data_size;       
wire            spi_en;              
wire            spi_intr_en;         
wire            spi_mo;              
wire    [15:0]  spi_rx;              
wire            spi_rx_en;           
wire            spi_rx_wen;          
wire            spi_so;              
wire            spi_stop_clr;        
wire            spi_stop_intr;       
wire            spi_tx_en;           
wire            spi_tx_ren;          
wire            spi_work;            
wire            spim_en;             
wire            spim_nss;            
wire            spim_sck;            
wire            spis_en;             
wire    [4 :0]  tx_data_cnt;         
wire            tx_dma_en;           
wire    [4 :0]  tx_dma_th;           
wire            tx_empty;            
wire            tx_empty_clr;        
wire            tx_empty_d;          
wire            tx_empty_intr;       
wire            tx_fifo_en;          
wire            tx_fifo_latch_en;    
wire    [1 :0]  tx_fifo_th;          
wire            tx_full;             
wire            tx_full_clr;         
wire            tx_full_intr;        
wire    [15:0]  tx_rd_data_tmp;      
wire            tx_read_err_clr;     
wire            tx_read_err_intr;    
wire            tx_ren;              
wire            tx_thold_clr;        
wire            tx_thold_intr;       
wire            tx_wen;              
wire            tx_write_err_clr;    
wire            tx_write_err_intr;   
wire            txd_out;             
wire            txd_work;            
wire    [1 :0]  uart_dbit;           
wire    [23:0]  uart_div;            
wire            uart_en;             
wire            uart_eps;            
wire    [1 :0]  uart_intr_en;        
wire    [1 :0]  uart_pbit;           
wire            uart_pen;            
wire            uart_perr_clr;       
wire            uart_perr_intr;      
wire    [7 :0]  uart_rx;             
wire            uart_rx_wen;         
wire            uart_stop_clr;       
wire            uart_stop_intr;      
wire            uart_tx_ren;         
wire    [3 :0]  usi_ctrl;            
wire            usi_intr;            
wire            wr_clk_div;          
uart  x_uart (
  .clk             (clk            ),
  .f_rxd           (f_rxd          ),
  .i_rxd_in        (i_scl_in       ),
  .rst_n           (rst_n          ),
  .rx_shift        (uart_rx[7:0]   ),
  .rxd_work        (rxd_work       ),
  .tx_empty        (tx_empty       ),
  .tx_rd_data      (tx_rd_data[7:0]),
  .txd_out         (txd_out        ),
  .txd_work        (txd_work       ),
  .uart_dbit       (uart_dbit      ),
  .uart_div        (uart_div       ),
  .uart_en         (uart_en        ),
  .uart_eps        (uart_eps       ),
  .uart_intr_en    (uart_intr_en   ),
  .uart_pbit       (uart_pbit      ),
  .uart_pen        (uart_pen       ),
  .uart_perr_clr   (uart_perr_clr  ),
  .uart_perr_intr  (uart_perr_intr ),
  .uart_rx_wen     (uart_rx_wen    ),
  .uart_rxd        (i_scl_in       ),
  .uart_stop_clr   (uart_stop_clr  ),
  .uart_stop_intr  (uart_stop_intr ),
  .uart_tx_ren     (uart_tx_ren    )
);
i2c_top  x_i2c_top (
  .clk                 (clk                ),
  .f_scl               (f_scl              ),
  .f_scl_d             (f_scl_d            ),
  .f_sda               (f_sda              ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_mode            (i2c_mode           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_nack_intr       (i2c_nack_intr      ),
  .i2c_rx              (i2c_rx             ),
  .i2c_rx_wen          (i2c_rx_wen         ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2c_stop_intr       (i2c_stop_intr      ),
  .i2c_tx_ren          (i2c_tx_ren         ),
  .i2cm_aerr_intr      (i2cm_aerr_intr     ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_work           (i2cm_work          ),
  .i2cs_amode          (i2cs_amode         ),
  .i2cs_en             (i2cs_en            ),
  .i2cs_gcall          (i2cs_gcall         ),
  .i2cs_gcall_clr      (i2cs_gcall_clr     ),
  .i2cs_gcall_intr     (i2cs_gcall_intr    ),
  .i2cs_hs             (i2cs_hs            ),
  .i2cs_sbyte          (i2cs_sbyte         ),
  .i2cs_tx_data        (tx_rd_data[7:0]    ),
  .i2cs_work           (i2cs_work          ),
  .i_scl_in            (i_scl_in           ),
  .i_sda_in            (i_sda_in           ),
  .r_scl               (r_scl              ),
  .r_scl_d             (r_scl_d[2:1]       ),
  .r_sda               (r_sda              ),
  .rst_n               (rst_n              ),
  .rx_full             (rx_full            ),
  .scl_out             (scl_out            ),
  .sda_out             (sda_out            ),
  .tx_empty            (tx_empty           ),
  .tx_empty_d          (tx_empty_d         ),
  .tx_rd_data          (tx_rd_data[9:0]    ),
  .wr_clk_div          (wr_clk_div         )
);
spi  x_spi (
  .clk            (clk           ),
  .clk_div0       (clk_div0[23:1]),
  .cpha           (cpha          ),
  .cpol           (cpol          ),
  .f_nss          (f_nss         ),
  .f_sclk         (f_scl         ),
  .i_nss_in       (i_nss_in      ),
  .nss_toggle     (nss_toggle    ),
  .r_sclk         (r_scl         ),
  .rst_n          (rst_n         ),
  .rx_full        (rx_full       ),
  .rx_wr_data     (spi_rx[15:0]  ),
  .spi_data_size  (spi_data_size ),
  .spi_intr_en    (spi_intr_en   ),
  .spi_mi         (i_sd1_in      ),
  .spi_mo         (spi_mo        ),
  .spi_rx_en      (spi_rx_en     ),
  .spi_rx_wen     (spi_rx_wen    ),
  .spi_si         (i_sda_in      ),
  .spi_so         (spi_so        ),
  .spi_stop_clr   (spi_stop_clr  ),
  .spi_stop_intr  (spi_stop_intr ),
  .spi_tx_en      (spi_tx_en     ),
  .spi_tx_ren     (spi_tx_ren    ),
  .spi_work       (spi_work      ),
  .spim_en        (spim_en       ),
  .spim_nss       (spim_nss      ),
  .spim_sck       (spim_sck      ),
  .spis_en        (spis_en       ),
  .tx_empty       (tx_empty      ),
  .tx_rd_data     (tx_rd_data    )
);
sdata_if  x_sdata_if (
  .clk       (clk      ),
  .f_nss     (f_nss    ),
  .f_rxd     (f_rxd    ),
  .f_scl     (f_scl    ),
  .f_scl_d   (f_scl_d  ),
  .f_sda     (f_sda    ),
  .i2c_en    (i2c_en   ),
  .i2c_mode  (i2c_mode ),
  .i2cm_en   (i2cm_en  ),
  .i2cs_en   (i2cs_en  ),
  .i_nss_in  (i_nss_in ),
  .i_scl_in  (i_scl_in ),
  .i_sd1_in  (i_sd1_in ),
  .i_sda_in  (i_sda_in ),
  .nss_ie_n  (nss_ie_n ),
  .nss_in    (nss_in   ),
  .nss_oe_n  (nss_oe_n ),
  .nss_out   (nss_out  ),
  .r_scl     (r_scl    ),
  .r_scl_d   (r_scl_d  ),
  .r_sda     (r_sda    ),
  .rst_n     (rst_n    ),
  .scl_out   (scl_out  ),
  .sclk_ie_n (sclk_ie_n),
  .sclk_in   (sclk_in  ),
  .sclk_oe_n (sclk_oe_n),
  .sclk_out  (sclk_out ),
  .sd0_ie_n  (sd0_ie_n ),
  .sd0_in    (sd0_in   ),
  .sd0_oe_n  (sd0_oe_n ),
  .sd0_out   (sd0_out  ),
  .sd1_ie_n  (sd1_ie_n ),
  .sd1_in    (sd1_in   ),
  .sd1_oe_n  (sd1_oe_n ),
  .sd1_out   (sd1_out  ),
  .sda_out   (sda_out  ),
  .sdata_en  (sdata_en ),
  .spi_mo    (spi_mo   ),
  .spi_rx_en (spi_rx_en),
  .spi_so    (spi_so   ),
  .spim_en   (spim_en  ),
  .spim_nss  (spim_nss ),
  .spim_sck  (spim_sck ),
  .spis_en   (spis_en  ),
  .txd_out   (txd_out  ),
  .uart_en   (uart_en  )
);
apb_if  x_apb_if (
  .clk                 (clk                ),
  .clk_div0            (clk_div0           ),
  .cpha                (cpha               ),
  .cpol                (cpol               ),
  .fifo_intr_en        (fifo_intr_en       ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_aerr_intr       (i2cm_aerr_intr     ),
  .i2c_en              (i2c_en             ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_mode            (i2c_mode           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_nack_intr       (i2c_nack_intr      ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2c_stop_intr       (i2c_stop_intr      ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_work           (i2cm_work          ),
  .i2cs_amode          (i2cs_amode         ),
  .i2cs_en             (i2cs_en            ),
  .i2cs_gcall          (i2cs_gcall         ),
  .i2cs_gcall_clr      (i2cs_gcall_clr     ),
  .i2cs_gcall_intr     (i2cs_gcall_intr    ),
  .i2cs_hs             (i2cs_hs            ),
  .i2cs_sbyte          (i2cs_sbyte         ),
  .i2cs_work           (i2cs_work          ),
  .intr_edge           (intr_edge          ),
  .nss_toggle          (nss_toggle         ),
  .paddr               (paddr              ),
  .penable             (penable            ),
  .prdata              (prdata             ),
  .psel                (psel               ),
  .pwdata              (pwdata             ),
  .pwrite              (pwrite             ),
  .rst_n               (rst_n              ),
  .rx_data_cnt         (rx_data_cnt        ),
  .rx_dma_en           (rx_dma_en          ),
  .rx_dma_th           (rx_dma_th          ),
  .rx_empty            (rx_empty           ),
  .rx_empty_clr        (rx_empty_clr       ),
  .rx_empty_intr       (rx_empty_intr      ),
  .rx_fifo_en          (rx_fifo_en         ),
  .rx_fifo_th          (rx_fifo_th         ),
  .rx_full             (rx_full            ),
  .rx_full_clr         (rx_full_clr        ),
  .rx_full_intr        (rx_full_intr       ),
  .rx_rd_data          (rx_rd_data         ),
  .rx_read_err_clr     (rx_read_err_clr    ),
  .rx_read_err_intr    (rx_read_err_intr   ),
  .rx_ren              (rx_ren             ),
  .rx_thold_clr        (rx_thold_clr       ),
  .rx_thold_intr       (rx_thold_intr      ),
  .rx_write_err_clr    (rx_write_err_clr   ),
  .rx_write_err_intr   (rx_write_err_intr  ),
  .rxd_work            (rxd_work           ),
  .sdata_en            (sdata_en           ),
  .spi_data_size       (spi_data_size      ),
  .spi_en              (spi_en             ),
  .spi_intr_en         (spi_intr_en        ),
  .spi_rx_en           (spi_rx_en          ),
  .spi_stop_clr        (spi_stop_clr       ),
  .spi_stop_intr       (spi_stop_intr      ),
  .spi_tx_en           (spi_tx_en          ),
  .spi_work            (spi_work           ),
  .spim_en             (spim_en            ),
  .spis_en             (spis_en            ),
  .tx_data_cnt         (tx_data_cnt        ),
  .tx_dma_en           (tx_dma_en          ),
  .tx_dma_th           (tx_dma_th          ),
  .tx_empty            (tx_empty           ),
  .tx_empty_clr        (tx_empty_clr       ),
  .tx_empty_intr       (tx_empty_intr      ),
  .tx_fifo_en          (tx_fifo_en         ),
  .tx_fifo_th          (tx_fifo_th         ),
  .tx_full             (tx_full            ),
  .tx_full_clr         (tx_full_clr        ),
  .tx_full_intr        (tx_full_intr       ),
  .tx_read_err_clr     (tx_read_err_clr    ),
  .tx_read_err_intr    (tx_read_err_intr   ),
  .tx_thold_clr        (tx_thold_clr       ),
  .tx_thold_intr       (tx_thold_intr      ),
  .tx_wen              (tx_wen             ),
  .tx_write_err_clr    (tx_write_err_clr   ),
  .tx_write_err_intr   (tx_write_err_intr  ),
  .txd_work            (txd_work           ),
  .uart_dbit           (uart_dbit          ),
  .uart_div            (uart_div           ),
  .uart_en             (uart_en            ),
  .uart_eps            (uart_eps           ),
  .uart_intr_en        (uart_intr_en       ),
  .uart_pbit           (uart_pbit          ),
  .uart_pen            (uart_pen           ),
  .uart_perr_clr       (uart_perr_clr      ),
  .uart_perr_intr      (uart_perr_intr     ),
  .uart_stop_clr       (uart_stop_clr      ),
  .uart_stop_intr      (uart_stop_intr     ),
  .usi_ctrl            (usi_ctrl           ),
  .usi_intr            (usi_intr           ),
  .wr_clk_div          (wr_clk_div         )
);
sync_fifo_16x16  x_tx_sync_fifo_16x16 (
  .clk                  (clk                 ),
  .empty                (tx_empty            ),
  .empty_clr            (tx_empty_clr        ),
  .empty_d              (tx_empty_d          ),
  .empty_intr           (tx_empty_intr       ),
  .fifo_en              (tx_fifo_en          ),
  .fifo_intr_en         (fifo_intr_en[4:0]   ),
  .fifo_thold           (tx_fifo_th          ),
  .flag_counter         (tx_data_cnt[4:0]    ),
  .full                 (tx_full             ),
  .full_clr             (tx_full_clr         ),
  .full_intr            (tx_full_intr        ),
  .intr_edge            (intr_edge           ),
  .rd_data              (tx_rd_data_tmp[15:0]),
  .rd_en                (tx_ren              ),
  .read_err_clr         (tx_read_err_clr     ),
  .read_err_intr        (tx_read_err_intr    ),
  .rst_n                (rst_n               ),
  .thold_clr            (tx_thold_clr        ),
  .thold_intr           (tx_thold_intr       ),
  .wr_data              (pwdata[15:0]        ),
  .wr_en                (tx_wen              ),
  .write_err_clr        (tx_write_err_clr    ),
  .write_err_intr       (tx_write_err_intr   )
);
sync_fifo_16x16  x_rx_sync_fifo_16x16 (
  .clk               (clk              ),
  .empty             (rx_empty         ),
  .empty_clr         (rx_empty_clr     ),
  .empty_d           (rx_empty_d       ),
  .empty_intr        (rx_empty_intr    ),
  .fifo_en           (rx_fifo_en       ),
  .fifo_intr_en      (fifo_intr_en[9:5]),
  .fifo_thold        (rx_fifo_th       ),
  .flag_counter      (rx_data_cnt[4:0] ),
  .full              (rx_full          ),
  .full_clr          (rx_full_clr      ),
  .full_intr         (rx_full_intr     ),
  .intr_edge         (intr_edge        ),
  .rd_data           (rx_rd_data[15:0] ),
  .rd_en             (rx_ren           ),
  .read_err_clr      (rx_read_err_clr  ),
  .read_err_intr     (rx_read_err_intr ),
  .rst_n             (rst_n            ),
  .thold_clr         (rx_thold_clr     ),
  .thold_intr        (rx_thold_intr    ),
  .wr_data           (rx_wr_data[15:0] ),
  .wr_en             (rx_wen           ),
  .write_err_clr     (rx_write_err_clr ),
  .write_err_intr    (rx_write_err_intr)
);
assign  rx_wr_data[15:0] = ({8'd0, ({8{uart_en}} & uart_rx[7:0])}) |
                           ({8'd0, ({8{i2c_en}} & i2c_rx[7:0])}) |
                           ({16{spi_en}} & spi_rx[15:0]);
assign  rx_wen  = (uart_en & uart_rx_wen) | (i2c_en & i2c_rx_wen) | 
                  (spi_en & spi_rx_wen); 
assign  tx_ren  = (uart_en & uart_tx_ren) | (i2c_en & i2c_tx_ren) | (spi_en & spi_tx_ren);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        tx_wen_d <= 1'b0;
        tx_ren_d <= 1'b0;
    end
    else if(~tx_fifo_en)
    begin
        tx_wen_d <= 1'b0;
        tx_ren_d <= 1'b0;
    end
    else
    begin
        tx_wen_d <= tx_wen;
        tx_ren_d <= tx_ren;
    end
end
always@(posedge clk)
begin
    if(tx_fifo_latch_en)
        tx_rd_data[15:0]    <= tx_rd_data_tmp[15:0];
end
assign  tx_fifo_latch_en = tx_wen_d | tx_ren_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        dma_req_rx  <= 1'b0;
        dma_req_tx  <= 1'b0;
    end
    else
    begin
        if(~rx_dma_en || dma_ack_rx)
            dma_req_rx  <= 1'b0;
        else if(rx_dma_th[4:0] <= rx_data_cnt[4:0])
            dma_req_rx  <= 1'b1;
        if(~tx_dma_en || dma_ack_tx)
            dma_req_tx  <= 1'b0;
        else if(tx_dma_th[4:0] >= tx_data_cnt[4:0])
            dma_req_tx  <= 1'b1;
    end
end
assign set_rx_req_trig = ((rx_dma_th[4:0] + 1'b1) <= rx_data_cnt[4:0]) && usi_ctrl[0];
assign set_tx_req_trig = (0 == tx_data_cnt[4:0]) && usi_ctrl[0];
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        set_rx_req_trig_dly <= 1'b0;
    end
    else  begin
       set_rx_req_trig_dly  <= set_rx_req_trig;
    end
end
assign set_rx_req_trig_psdg = set_rx_req_trig & (!set_rx_req_trig_dly);
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        set_tx_req_trig_dly <= 1'b0;
    end
    else  begin
       set_tx_req_trig_dly  <= set_tx_req_trig;
    end
end
assign set_tx_req_trig_psdg = set_tx_req_trig & (!set_tx_req_trig_dly);
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) 
        usi_etb_rx_trig <= 1'b0;
    else if(!usi_ctrl[0])
        usi_etb_rx_trig <= 1'b0;
    else if(usi_etb_rx_trig)
        usi_etb_rx_trig <= 1'b0;
    else if(set_rx_req_trig_psdg)
        usi_etb_rx_trig <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        usi_etb_tx_trig <= 1'b0;
    else if(!usi_ctrl[0])
        usi_etb_tx_trig <= 1'b0;
    else if(usi_etb_tx_trig)
        usi_etb_tx_trig <= 1'b0;
    else if(set_tx_req_trig_psdg)
        usi_etb_tx_trig <= 1'b1;
end
endmodule
