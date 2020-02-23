/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module sms_sram_bk2(
  hrst_b,
  ram_addr,
  ram_clk,
  ram_rdata,
  ram_sel,
  ram_size,
  ram_wdata,
  ram_write
);
input           hrst_b;     
input   [15:0]  ram_addr;   
input           ram_clk;    
input           ram_sel;    
input   [2 :0]  ram_size;   
input   [31:0]  ram_wdata;  
input           ram_write;  
output  [31:0]  ram_rdata;  
reg     [3 :0]  byte_sel_b; 
reg             mbk_cen_f_b; 
reg     [31:0]  ram_rdata;  
wire    [3 :0]  byte_wen_b; 
wire            hrst_b;     
wire            mbk_cen_b;  
wire            mbk_wen_b;  
wire    [31:0]  ram0_rdata; 
wire    [15:0]  ram_addr;   
wire            ram_clk;    
wire            ram_sel;    
wire    [2 :0]  ram_size;   
wire    [31:0]  ram_wdata;  
wire            ram_write;  
parameter[2:0]   BYTE      = 3'b000, 
                 HALFWORD  = 3'b001, 
                 WORD      = 3'b010; 
assign mbk_cen_b = ~ram_sel;
always @( ram_addr[1:0]
       or ram_size[2:0])
begin
  case (ram_size[2:0])   // synopsys parallel_case
    BYTE:
      case (ram_addr[1:0])   // synopsys parallel_case
        2'b00:
          byte_sel_b[3:0] = 4'b1110;    
        2'b01:
          byte_sel_b[3:0] = 4'b1101;
        2'b10:
          byte_sel_b[3:0] = 4'b1011;
        2'b11:
          byte_sel_b[3:0] = 4'b0111;
      endcase
    HALFWORD:
      case (ram_addr[1])     // synopsys parallel_case
        1'b0:
          byte_sel_b[3:0] = 4'b1100;    
        1'b1:
          byte_sel_b[3:0] = 4'b0011;
      endcase
    WORD:
      byte_sel_b[3:0] = 4'b0000;
    default:
      byte_sel_b[3:0] = 4'b1111;
  endcase
end
assign mbk_wen_b = ~ram_write; 
always @( posedge ram_clk or negedge hrst_b)
begin
  if (!hrst_b)
  mbk_cen_f_b <= 1'b0;
  else
  mbk_cen_f_b <= mbk_cen_b;
end
always @( mbk_cen_f_b
       or ram0_rdata[31:0])
begin
  case (mbk_cen_f_b)
    1'b0:
      ram_rdata[31:0] = ram0_rdata[31:0];
    1'b1:
      ram_rdata[31:0] = 32'b0;
  endcase
end
parameter  DATAWIDTH = 32;
parameter  ADDRWIDTH = 14;
parameter  MEMDEPTH  = 2**(ADDRWIDTH);
assign byte_wen_b[3:0] =  byte_sel_b[3:0] | {4{mbk_wen_b}};
fpga_spram #(DATAWIDTH,ADDRWIDTH,MEMDEPTH) x_fpga_spram (
  .A                (ram_addr[15:2]  ),
  .BWEN             (byte_wen_b[3:0] ),
  .CEN              (mbk_cen_b       ),
  .CLK              (ram_clk         ),
  .D                (ram_wdata[31:0] ),
  .Q                (ram0_rdata[31:0])
);
endmodule
