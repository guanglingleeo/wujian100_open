/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module gpio_apbif 
(
    pclk                    ,
    presetn                 ,
    penable                 ,
    pwrite                  ,
    pwdata                  ,
    paddr                   ,
    psel                    ,                 
    gpio_ext_data           ,
    gpio_int_status         ,
    gpio_raw_int_status     ,
    gpio_sw_data            ,
    gpio_sw_dir             ,
    gpio_int_en             ,
    gpio_int_mask           ,
    gpio_int_type           ,
    gpio_int_pol            ,
    gpio_debounce           ,
    gpio_int_clr            ,
    gpio_int_level_sync     ,
    prdata                   
);
input                         pclk                    ;
input                         presetn                 ;
input                         penable                 ;
input                         pwrite                  ;
input             [31:0]      pwdata                  ;
input  [`GPIO_ADDR_LHS:0]      paddr                   ;
input                         psel                    ;                 
input  [`GPIO_PWIDTH-1:0]      gpio_ext_data           ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_status         ;
input  [`GPIO_PWIDTH-1:0]      gpio_raw_int_status     ;
wire                          pclk                    ;
wire                          presetn                 ;
wire                          penable                 ;
wire                          pwrite                  ;
wire              [31:0]      pwdata                  ;
wire   [`GPIO_ADDR_LHS:0]      paddr                   ;
wire                          psel                    ;                 
wire   [`GPIO_PWIDTH-1:0]      gpio_ext_data           ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_status         ;
wire   [`GPIO_PWIDTH-1:0]      gpio_raw_int_status     ;
output [`GPIO_PWIDTH-1:0]      gpio_sw_data            ;
output [`GPIO_PWIDTH-1:0]      gpio_sw_dir             ;
output [`GPIO_PWIDTH-1:0]      gpio_int_en             ;
output [`GPIO_PWIDTH-1:0]      gpio_int_mask           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_type           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_pol            ;
output [`GPIO_PWIDTH-1:0]      gpio_debounce           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_clr            ;
output                        gpio_int_level_sync     ;
output            [31:0]      prdata                  ;
reg    [`GPIO_PWIDTH-1:0]      gpio_sw_data            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_sw_dir             ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_en             ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_mask           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_type           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_pol            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_debounce           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_clr            ;
reg                           gpio_int_level_sync     ;
reg               [31:0]      prdata                  ;
localparam        GPIO_SW_DATA_OFFSET            = 5'b00000;
localparam        GPIO_SW_DIR_OFFSET             = 5'b00001;
localparam        GPIO_SW_HW_CTRL_OFFSET         = 5'b00010;
localparam        GPIO_INT_FUNC_EN_OFFSET        = 5'b01100;
localparam        GPIO_INT_MASK_OFFSET           = 5'b01101;
localparam        GPIO_INT_TYPE_OFFSET           = 5'b01110;
localparam        GPIO_INT_POL_SEL_OFFSET        = 5'b01111;
localparam        GPIO_INT_STATUS_OFFSET         = 5'b10000;
localparam        GPIO_RAW_INT_STATUS_OFFSET     = 5'b10001;
localparam        GPIO_DEBOUNCE_OFFSET           = 5'b10010;
localparam        GPIO_INT_CLR_OFFSET            = 5'b10011;
localparam        GPIO_EXT_DATA_OFFSET           = 5'b10100;
localparam        GPIO_INT_LEVEL_SYNC_OFFSET     = 5'b11000;
reg               gpio_sw_data_wen         ;
reg               gpio_sw_dir_wen          ;
reg               gpio_int_en_wen          ;
reg               gpio_int_mask_wen        ;
reg               gpio_int_type_wen        ;
reg               gpio_int_pol_wen         ;
reg               gpio_debounce_wen        ;
reg               gpio_int_level_sync_wen  ;
reg               gpio_int_clr_wen         ;
reg    [31:0]     ri_gpio_sw_data          ;
reg    [31:0]     ri_gpio_sw_dir           ;
reg    [31:0]     ri_gpio_int_en           ;
reg    [31:0]     ri_gpio_int_mask         ;
reg    [31:0]     ri_gpio_int_type         ;
reg    [31:0]     ri_gpio_int_pol          ;
reg    [31:0]     ri_gpio_debounce         ;
reg    [31:0]     ri_gpio_int_level_sync   ;
reg    [31:0]     ri_gpio_ext_data         ;
reg    [31:0]     ri_gpio_raw_int_status   ;
reg    [31:0]     ri_gpio_int_status       ;
wire              zero_value               ;
assign  zero_value = 1'b0;
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_SW_DATA_OFFSET)
            gpio_sw_data_wen = 1'b1;
        else
            gpio_sw_data_wen = 1'b0;
    end
    else
        gpio_sw_data_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_SW_DIR_OFFSET)
            gpio_sw_dir_wen = 1'b1;
        else
            gpio_sw_dir_wen = 1'b0;
    end
    else
        gpio_sw_dir_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_FUNC_EN_OFFSET)
            gpio_int_en_wen = 1'b1;
        else
            gpio_int_en_wen = 1'b0;
    end
    else
        gpio_int_en_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_MASK_OFFSET)
            gpio_int_mask_wen = 1'b1;
        else
            gpio_int_mask_wen = 1'b0;
    end
    else
        gpio_int_mask_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_TYPE_OFFSET)
            gpio_int_type_wen = 1'b1;
        else
            gpio_int_type_wen = 1'b0;
    end
    else
        gpio_int_type_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_POL_SEL_OFFSET)
            gpio_int_pol_wen = 1'b1;
        else
            gpio_int_pol_wen = 1'b0;
    end
    else
        gpio_int_pol_wen = 1'b0;
end   
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_LEVEL_SYNC_OFFSET)
            gpio_int_level_sync_wen = 1'b1;
        else
            gpio_int_level_sync_wen = 1'b0;
    end
    else
        gpio_int_level_sync_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_LEVEL_SYNC_OFFSET)
            gpio_int_clr_wen = 1'b1;
        else
            gpio_int_clr_wen = 1'b0;
    end
    else
        gpio_int_clr_wen = 1'b0;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_en <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_en_wen == 1'b1)
        gpio_int_en <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_en = {32{zero_value}};
    ri_gpio_int_en[`GPIO_PWIDTH-1:0] = gpio_int_en;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_mask <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_mask_wen == 1'b1)
        gpio_int_mask <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_mask = {32{zero_value}};
    ri_gpio_int_mask[`GPIO_PWIDTH-1:0] = gpio_int_mask;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_type <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_type_wen == 1'b1)
        gpio_int_type <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_type = {32{zero_value}};
    ri_gpio_int_type[`GPIO_PWIDTH-1:0] = gpio_int_type;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_pol <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_pol_wen == 1'b1)
        gpio_int_pol <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_pol = {32{zero_value}};
    ri_gpio_int_pol[`GPIO_PWIDTH-1:0] = gpio_int_pol;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_level_sync <= 1'b0;
    else if (gpio_int_level_sync_wen == 1'b1)
        gpio_int_level_sync <= pwdata[0];
    else ;
end
always@(*)
begin 
    if(gpio_int_clr_wen == 1'b1)
        gpio_int_clr = pwdata[`GPIO_PWIDTH-1:0];
    else 
        gpio_int_clr = {`GPIO_PWIDTH{1'b0}};
end
always @(*)
begin 
    ri_gpio_int_level_sync = {32{zero_value}};
    ri_gpio_int_level_sync[0] = gpio_int_level_sync;
end
always @(*)
begin 
    ri_gpio_int_status = {32{zero_value}};
    ri_gpio_int_status[`GPIO_PWIDTH-1:0] = gpio_int_status;
end
always @(*)
begin 
    ri_gpio_raw_int_status = {32{zero_value}};
    ri_gpio_raw_int_status[`GPIO_PWIDTH-1:0] = gpio_raw_int_status;
end
generate
    if(`GPIO_DEBOUNCE_EN == 1'b1) begin: SUPPORT_DEBOUNCE_PROC
        always @(*)
        begin
            if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
                if(paddr[`GPIO_ADDR_LHS:2] == GPIO_DEBOUNCE_OFFSET)
                    gpio_debounce_wen = 1'b1;
                else
                    gpio_debounce_wen = 1'b0;
            end
            else
                gpio_debounce_wen = 1'b0;
        end
        always@(posedge pclk or negedge presetn)
        begin 
            if(presetn == 1'b0)
                gpio_debounce <= {`GPIO_PWIDTH{1'b0}};
            else if (gpio_debounce_wen == 1'b1)
                gpio_debounce <= pwdata[`GPIO_PWIDTH-1:0];
            else ;
        end
        always @(*)
        begin 
            ri_gpio_debounce = {32{zero_value}};
            ri_gpio_debounce[`GPIO_PWIDTH-1:0] = gpio_debounce;
        end
    end
    else begin: NO_SUPPORT_DEBOUNCE_PROC
        always @(*)
        begin
            gpio_debounce_wen = zero_value;
            gpio_debounce     = {32{zero_value}};
            ri_gpio_debounce = {32{zero_value}};
        end
    end
endgenerate
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_sw_data <= ({`GPIO_PWIDTH{1'b0}} | `GPIO_SW_DATA_RESET);
    else if (gpio_sw_data_wen == 1'b1)
        gpio_sw_data <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_sw_data = 32'b0;
    ri_gpio_sw_data[`GPIO_PWIDTH-1:0] = gpio_sw_data;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_sw_dir <= ({`GPIO_PWIDTH{1'b0}} | `GPIO_SW_DIR_RESET);
    else if (gpio_sw_dir_wen == 1'b1)
        gpio_sw_dir <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_sw_dir = 32'b0;
    ri_gpio_sw_dir[`GPIO_PWIDTH-1:0] = gpio_sw_dir;
end
always @(*)
begin 
    ri_gpio_ext_data = 32'b0;
    ri_gpio_ext_data[`GPIO_PWIDTH-1:0] = gpio_ext_data;
end
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        prdata <= 32'b0;
    else if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0)) begin
        case (paddr[`GPIO_ADDR_LHS:2])
            `GPIO_SW_DATA_RESET         : prdata <= ri_gpio_sw_data;
            GPIO_SW_DIR_OFFSET         : prdata <= ri_gpio_sw_dir;
            GPIO_SW_HW_CTRL_OFFSET     : prdata <= 32'b0;
            GPIO_INT_FUNC_EN_OFFSET    : prdata <= ri_gpio_int_en;
            GPIO_INT_MASK_OFFSET       : prdata <= ri_gpio_int_mask;
            GPIO_INT_TYPE_OFFSET       : prdata <= ri_gpio_int_type;
            GPIO_INT_POL_SEL_OFFSET    : prdata <= ri_gpio_int_pol;
            GPIO_INT_STATUS_OFFSET     : prdata <= ri_gpio_int_status;
            GPIO_RAW_INT_STATUS_OFFSET : prdata <= ri_gpio_raw_int_status;
            GPIO_DEBOUNCE_OFFSET       : prdata <= ri_gpio_debounce;
            GPIO_INT_LEVEL_SYNC_OFFSET : prdata <= ri_gpio_int_level_sync;
            GPIO_EXT_DATA_OFFSET       : prdata <= ri_gpio_ext_data;              	 
            default                    : prdata <= 32'b0;
        endcase
    end
    else ;
end
endmodule
