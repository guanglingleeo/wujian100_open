/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module timers_frc #
(
    parameter TIMER_WIDTH      = 8,
    parameter TIMER_PULSE_EXTD = 0
)
(
    input  wire                                      timer_clk      ,
    input  wire                                      timer_resetn   ,
    input  wire                                      timer_en       ,
    input  wire                                      timer_mode     ,
    input  wire                                      timerhwen      ,
    input  wire                [TIMER_WIDTH-1:0]     load_value     ,
    output reg                            [31:0]     current_value  ,
    output reg                                       toggle         ,
    output wire                                      interrupt      ,
    output wire                                      timertrig
);
reg                      rising_edge       ;
reg                      atzero            ;
reg [TIMER_WIDTH-1:0]    timer             ;
reg                      extend1           ;
reg                      extend2           ;
reg                      extend3           ;
wire                     load              ;
wire                     raw_interrupt     ;
wire                     interrupt_extd1   ;
wire                     interrupt_extd2   ;
wire                     interrupt_extd3   ;
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        rising_edge <= 1'b0;
    else
        rising_edge <= timer_en;
end
assign load = ((timer_en == 1'b1) & (rising_edge == 1'b0));
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        timer <= {TIMER_WIDTH{1'b1}};
    else begin
        if(timer_en == 1'b1) begin
            if(load == 1'b1)
                timer <= load_value;
            else begin
                if(timer == {TIMER_WIDTH{1'b0}}) begin
                    if(timer_mode == 1'b0)
                        timer <= {TIMER_WIDTH{1'b1}};
                    else
                        timer <= load_value;
                end
                else
                    timer <= timer - {{(TIMER_WIDTH-1){1'b0}},{1'b1}};
            end
        end
        else 
            timer <= {TIMER_WIDTH{1'b1}};
    end
end
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        atzero <= 1'b0;
    else
        atzero <= (timer=={TIMER_WIDTH{1'b0}});
end
assign raw_interrupt = atzero;
assign timertrig     = atzero & timerhwen;
always @ (posedge timer_clk or negedge timer_resetn)
begin
    if(timer_resetn == 1'b0)
        toggle <= 1'b0;
    else if(timer=={TIMER_WIDTH{1'b0}})
        toggle <= ~toggle;
    else ;
end
always @(posedge timer_clk or negedge timer_resetn) 
begin
  if(timer_resetn == 1'b0) begin
      extend1 <= 1'b0;
      extend2 <= 1'b0;
      extend3 <= 1'b0;
  end 
  else begin
      extend1 <= raw_interrupt;
      extend2 <= extend1;
      extend3 <= extend2;
  end
end           
assign interrupt_extd1 = raw_interrupt | extend1;
assign interrupt_extd2 = interrupt_extd1 | extend2;
assign interrupt_extd3 = interrupt_extd2 | extend3;
always @(*) 
begin  
    current_value = 32'b0;
    if(timer_en == 1'b1)
      current_value[TIMER_WIDTH-1:0] = timer;  
end
assign interrupt = ((TIMER_PULSE_EXTD == 0) ? raw_interrupt :
                   ((TIMER_PULSE_EXTD == 1) ? interrupt_extd1 :
                   ((TIMER_PULSE_EXTD == 2) ? interrupt_extd2 : 
                                              interrupt_extd3)));
endmodule
