/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module i2c_top(
  clk,
  f_scl,
  f_scl_d,
  f_sda,
  i2c_addr,
  i2c_aerr_clr,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_mode,
  i2c_nack_clr,
  i2c_nack_intr,
  i2c_rx,
  i2c_rx_wen,
  i2c_stop_clr,
  i2c_stop_intr,
  i2c_tx_ren,
  i2cm_aerr_intr,
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
  i2cs_tx_data,
  i2cs_work,
  i_scl_in,
  i_sda_in,
  r_scl,
  r_scl_d,
  r_sda,
  rst_n,
  rx_full,
  scl_out,
  sda_out,
  tx_empty,
  tx_empty_d,
  tx_rd_data,
  wr_clk_div
);
input           clk;                
input           f_scl;              
input   [2 :0]  f_scl_d;            
input           f_sda;              
input   [9 :0]  i2c_addr;           
input           i2c_aerr_clr;       
input   [7 :0]  i2c_fs_div;         
input   [23:0]  i2c_hcnt;           
input   [7 :0]  i2c_hold;           
input   [4 :0]  i2c_intr_en;        
input   [23:0]  i2c_lcnt;           
input           i2c_mode;           
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
input           i2cs_amode;         
input           i2cs_en;            
input           i2cs_gcall;         
input           i2cs_gcall_clr;     
input           i2cs_hs;            
input           i2cs_sbyte;         
input   [7 :0]  i2cs_tx_data;       
input           i_scl_in;           
input           i_sda_in;           
input           r_scl;              
input   [2 :1]  r_scl_d;            
input           r_sda;              
input           rst_n;              
input           rx_full;            
input           tx_empty;           
input           tx_empty_d;         
input   [9 :0]  tx_rd_data;         
input           wr_clk_div;         
output          i2c_nack_intr;      
output  [7 :0]  i2c_rx;             
output          i2c_rx_wen;         
output          i2c_stop_intr;      
output          i2c_tx_ren;         
output          i2cm_aerr_intr;     
output          i2cm_data;          
output          i2cm_lose_arbi_intr; 
output          i2cm_work;          
output          i2cs_gcall_intr;    
output          i2cs_work;          
output          scl_out;            
output          sda_out;            
wire            clk;                
wire            f_scl;              
wire    [2 :0]  f_scl_d;            
wire            f_sda;              
wire    [9 :0]  i2c_addr;           
wire            i2c_aerr_clr;       
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
wire            i2cm_nack_intr;     
wire    [7 :0]  i2cm_rx;            
wire            i2cm_rx_wen;        
wire            i2cm_sbyte;         
wire            i2cm_scl_out;       
wire            i2cm_sda_out;       
wire            i2cm_stop;          
wire            i2cm_stop_intr;     
wire            i2cm_tx_ren;        
wire            i2cm_work;          
wire            i2cs_amode;         
wire            i2cs_en;            
wire            i2cs_gcall;         
wire            i2cs_gcall_clr;     
wire            i2cs_gcall_intr;    
wire            i2cs_hs;            
wire            i2cs_nack_intr;     
wire    [7 :0]  i2cs_rx;            
wire            i2cs_rx_wen;        
wire            i2cs_sbyte;         
wire            i2cs_scl_out;       
wire            i2cs_sda_out;       
wire            i2cs_stop_intr;     
wire    [7 :0]  i2cs_tx_data;       
wire            i2cs_tx_ren;        
wire            i2cs_work;          
wire            i_scl_in;           
wire            i_sda_in;           
wire            r_scl;              
wire    [2 :1]  r_scl_d;            
wire            r_sda;              
wire            rst_n;              
wire            rx_full;            
wire            scl_out;            
wire            sda_out;            
wire            start_flag;         
wire            stop_flag;          
wire            tx_empty;           
wire            tx_empty_d;         
wire    [9 :0]  tx_rd_data;         
wire            wr_clk_div;         
i2cm  x_i2cm (
  .clk                 (clk                ),
  .f_scl               (f_scl              ),
  .f_scl_d             (f_scl_d[0]         ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2cm_aerr_intr      (i2cm_aerr_intr     ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_nack_intr      (i2cm_nack_intr     ),
  .i2cm_rx             (i2cm_rx            ),
  .i2cm_rx_wen         (i2cm_rx_wen        ),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_stop_intr      (i2cm_stop_intr     ),
  .i2cm_tx_ren         (i2cm_tx_ren        ),
  .i2cm_work           (i2cm_work          ),
  .i_scl_in            (i_scl_in           ),
  .i_sda_in            (i_sda_in           ),
  .r_scl               (r_scl              ),
  .r_scl_d             (r_scl_d[1]         ),
  .rst_n               (rst_n              ),
  .scl_out             (i2cm_scl_out       ),
  .sda_out             (i2cm_sda_out       ),
  .start_flag          (start_flag         ),
  .stop_flag           (stop_flag          ),
  .tx_empty            (tx_empty           ),
  .tx_empty_d          (tx_empty_d         ),
  .tx_rd_data          (tx_rd_data         ),
  .wr_clk_div          (wr_clk_div         )
);
i2cs  x_i2cs (
  .clk              (clk             ),
  .f_scl            (f_scl           ),
  .f_scl_d          (f_scl_d[2:1]    ),
  .i2c_addr         (i2c_addr        ),
  .i2c_hold         (i2c_hold        ),
  .i2c_intr_en      (i2c_intr_en[3:0]),
  .i2c_lcnt         (i2c_lcnt        ),
  .i2c_nack_clr     (i2c_nack_clr    ),
  .i2c_stop_clr     (i2c_stop_clr    ),
  .i2cs_amode       (i2cs_amode      ),
  .i2cs_en          (i2cs_en         ),
  .i2cs_gcall       (i2cs_gcall      ),
  .i2cs_gcall_clr   (i2cs_gcall_clr  ),
  .i2cs_gcall_intr  (i2cs_gcall_intr ),
  .i2cs_hs          (i2cs_hs         ),
  .i2cs_nack_intr   (i2cs_nack_intr  ),
  .i2cs_rx          (i2cs_rx         ),
  .i2cs_rx_wen      (i2cs_rx_wen     ),
  .i2cs_sbyte       (i2cs_sbyte      ),
  .i2cs_stop_intr   (i2cs_stop_intr  ),
  .i2cs_tx_data     (i2cs_tx_data    ),
  .i2cs_tx_ren      (i2cs_tx_ren     ),
  .i2cs_work        (i2cs_work       ),
  .i_sda_in         (i_sda_in        ),
  .r_scl_d2         (r_scl_d[2]      ),
  .rst_n            (rst_n           ),
  .rx_full          (rx_full         ),
  .scl_out          (i2cs_scl_out    ),
  .sda_out          (i2cs_sda_out    ),
  .start_flag       (start_flag      ),
  .stop_flag        (stop_flag       ),
  .tx_empty         (tx_empty        )
);
assign  sda_out = i2c_mode ? i2cm_sda_out : i2cs_sda_out;
assign  i2c_rx[7:0] = ({8{i2cm_en}} & i2cm_rx[7:0]) | ({8{i2cs_en}} & i2cs_rx[7:0]);
assign  i2c_rx_wen  = (i2cm_en & i2cm_rx_wen) | (i2cs_en & i2cs_rx_wen);
assign  i2c_tx_ren  = (i2cm_en & i2cm_tx_ren) | (i2cs_en & i2cs_tx_ren);
assign  scl_out = i2c_mode ? i2cm_scl_out : i2cs_scl_out;
assign  i2c_stop_intr = (i2cm_en & i2cm_stop_intr) | (i2cs_en & i2cs_stop_intr);
assign  i2c_nack_intr = (i2cm_en & i2cm_nack_intr) | (i2cs_en & i2cs_nack_intr);
assign  start_flag  = i_scl_in & f_sda;
assign  stop_flag   = i_scl_in & r_sda;
endmodule
