/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pwm_gen(
  cap_cnt,
  cap_en,
  cap_load_value,
  cap_mode,
  cap_select,
  clk,
  compa_val,
  compb_val,
  deadband_delay_cnt,
  deadband_en,
  i_capture,
  int_cap_cnt_add,
  int_cap_cnt_match,
  int_clr_cap_cnt_add,
  int_clr_cap_cnt_match,
  int_clr_pwm_cnt_load,
  int_clr_pwm_cnt_zero,
  int_clr_pwm_compa_down,
  int_clr_pwm_compa_up,
  int_clr_pwm_compb_down,
  int_clr_pwm_compb_up,
  int_clr_tim_cnt_match,
  int_en_cap_cnt_add,
  int_en_cap_cnt_match,
  int_en_pwm_cnt_load,
  int_en_pwm_cnt_zero,
  int_en_pwm_compa_down,
  int_en_pwm_compa_up,
  int_en_pwm_compb_down,
  int_en_pwm_compb_up,
  int_en_tim_cnt_match,
  int_pwm_cnt_load,
  int_pwm_cnt_zero,
  int_pwm_compa_down,
  int_pwm_compa_up,
  int_pwm_compb_down,
  int_pwm_compb_up,
  int_tim_cnt_match,
  pclk,
  pwm0_en,
  pwm0_inv,
  pwm1_en,
  pwm1_inv,
  pwm_0_oe,
  pwm_0_out,
  pwm_1_oe,
  pwm_1_out,
  pwm_cnt,
  pwm_load_value,
  pwm_mode,
  pwm_tim_etb_trig,
  rstn,
  sync_mode,
  tim_en,
  tim_load_value,
  trend,
  trenu,
  trig_val,
  trigger
);
input           cap_en;                    
input   [31:0]  cap_load_value;            
input           cap_mode;                  
input   [1 :0]  cap_select;                
input           clk;                       
input   [31:0]  compa_val;                 
input   [31:0]  compb_val;                 
input   [11:0]  deadband_delay_cnt;        
input           deadband_en;               
input           i_capture;                 
input           int_clr_cap_cnt_add;       
input           int_clr_cap_cnt_match;     
input           int_clr_pwm_cnt_load;      
input           int_clr_pwm_cnt_zero;      
input           int_clr_pwm_compa_down;    
input           int_clr_pwm_compa_up;      
input           int_clr_pwm_compb_down;    
input           int_clr_pwm_compb_up;      
input           int_clr_tim_cnt_match;     
input           int_en_cap_cnt_add;        
input           int_en_cap_cnt_match;      
input           int_en_pwm_cnt_load;       
input           int_en_pwm_cnt_zero;       
input           int_en_pwm_compa_down;     
input           int_en_pwm_compa_up;       
input           int_en_pwm_compb_down;     
input           int_en_pwm_compb_up;       
input           int_en_tim_cnt_match;      
input           pclk;                      
input           pwm0_en;                   
input           pwm0_inv;                  
input           pwm1_en;                   
input           pwm1_inv;                  
input   [31:0]  pwm_load_value;            
input           pwm_mode;                  
input           rstn;                      
input   [1 :0]  sync_mode;                 
input           tim_en;                    
input   [31:0]  tim_load_value;            
input           trend;                     
input           trenu;                     
input   [31:0]  trig_val;                  
output  [31:0]  cap_cnt;                   
output          int_cap_cnt_add;           
output          int_cap_cnt_match;         
output          int_pwm_cnt_load;          
output          int_pwm_cnt_zero;          
output          int_pwm_compa_down;        
output          int_pwm_compa_up;          
output          int_pwm_compb_down;        
output          int_pwm_compb_up;          
output          int_tim_cnt_match;         
output          pwm_0_oe;                  
output          pwm_0_out;                 
output          pwm_1_oe;                  
output          pwm_1_out;                 
output  [31:0]  pwm_cnt;                   
output          pwm_tim_etb_trig;          
output          trigger;                   
reg     [31:0]  cap_cnt;                   
reg             cap_cnt_add_flag_d;        
reg             cap_cnt_match_flag_d;      
reg             cap_edge;                  
reg     [31:0]  compa;                     
reg             compa_down_flag_d;         
reg             compa_up_flag_d;           
reg     [31:0]  compb;                     
reg             compb_down_flag_d;         
reg             compb_up_flag_d;           
reg     [11:0]  deadband_cnt_0;            
reg     [11:0]  deadband_cnt_1;            
reg             i_capture_d;               
reg             i_capture_d2;              
reg             i_capture_d3;              
reg             inc_flag;                  
reg             int_cap_cnt_add;           
reg             int_cap_cnt_match;         
reg             int_pwm_cnt_load;          
reg             int_pwm_cnt_zero;          
reg             int_pwm_compa_down;        
reg             int_pwm_compa_up;          
reg             int_pwm_compb_down;        
reg             int_pwm_compb_up;          
reg             int_tim_cnt_match;         
reg     [31:0]  load_cnt;                  
reg             pwm_0_d;                   
reg             pwm_0_db;                  
reg             pwm_1_d;                   
reg             pwm_1_db;                  
reg     [31:0]  pwm_cnt;                   
reg             pwm_cnt_load_d;            
reg             pwm_cnt_zero_d;            
reg             tim_cnt_match_flag_d;      
reg             trigger_down_d;            
reg             trigger_up_d;              
reg     [31:0]  trigval;                   
reg             updatereg;                 
wire            cap_cnt_add_flag;          
wire            cap_cnt_add_flag_divedge;  
wire            cap_cnt_match_flag;        
wire            cap_cnt_match_flag_divedge; 
wire            cap_en;                    
wire    [31:0]  cap_load_value;            
wire            cap_mode;                  
wire    [1 :0]  cap_select;                
wire            clk;                       
wire            compa_down_flag;           
wire            compa_down_flag_divedge;   
wire            compa_up_flag;             
wire            compa_up_flag_divedge;     
wire    [31:0]  compa_val;                 
wire            compb_down_flag;           
wire            compb_down_flag_divedge;   
wire            compb_up_flag;             
wire            compb_up_flag_divedge;     
wire    [31:0]  compb_val;                 
wire    [11:0]  deadband_delay_cnt;        
wire            deadband_en;               
wire            end_flag;                  
wire            flag;                      
wire            i_capture;                 
wire            i_capture_fall_edge;       
wire            i_capture_rise_edge;       
wire            int_clr_cap_cnt_add;       
wire            int_clr_cap_cnt_match;     
wire            int_clr_pwm_cnt_load;      
wire            int_clr_pwm_cnt_zero;      
wire            int_clr_pwm_compa_down;    
wire            int_clr_pwm_compa_up;      
wire            int_clr_pwm_compb_down;    
wire            int_clr_pwm_compb_up;      
wire            int_clr_tim_cnt_match;     
wire            int_en_cap_cnt_add;        
wire            int_en_cap_cnt_match;      
wire            int_en_pwm_cnt_load;       
wire            int_en_pwm_cnt_zero;       
wire            int_en_pwm_compa_down;     
wire            int_en_pwm_compa_up;       
wire            int_en_pwm_compb_down;     
wire            int_en_pwm_compb_up;       
wire            int_en_tim_cnt_match;      
wire            load_flag;                 
wire            pclk;                      
wire            pwm0_en;                   
wire            pwm0_inv;                  
wire            pwm1_en;                   
wire            pwm1_inv;                  
wire            pwm_0;                     
wire            pwm_0_oe;                  
wire            pwm_0_out;                 
wire            pwm_0_out_pre;             
wire            pwm_1;                     
wire            pwm_1_oe;                  
wire            pwm_1_out;                 
wire            pwm_1_out_pre;             
wire            pwm_cnt_load;              
wire            pwm_cnt_load_divedge;      
wire            pwm_cnt_zero;              
wire            pwm_cnt_zero_divedge;      
wire            pwm_en;                    
wire    [31:0]  pwm_load_value;            
wire            pwm_mode;                  
wire            pwm_tim_etb_trig;          
wire            rstn;                      
wire    [1 :0]  sync_mode;                 
wire            tim_cnt_match_flag;        
wire            tim_cnt_match_flag_divedge; 
wire            tim_en;                    
wire    [31:0]  tim_load_value;            
wire            trend;                     
wire            trenu;                     
wire    [31:0]  trig_val;                  
wire            trigger;                   
wire            trigger_down;              
wire            trigger_up;                
wire            zero_flag;                 
assign    pwm_en = pwm1_en | pwm0_en;
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_cnt[31:0] <= 0;
    else if(pwm_en)begin
        if(!pwm_mode)begin
	   if(pwm_cnt[31:0] == load_cnt[31:0])
              pwm_cnt[31:0] <= 0;
           else
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
         end
         else begin
           if(load_cnt[31:0] == 0)
              pwm_cnt[31:0] <= 0;
           else if(inc_flag)
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
           else 
              pwm_cnt[31:0] <= pwm_cnt[31:0] - 1; 
         end
     end
     else if(cap_en)begin
         if(cap_mode)begin
             if(pwm_cnt[31:0] == cap_load_value[31:0] && cap_edge)
                 pwm_cnt[31:0] <= 0;
             else if(cap_edge)
                 pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
         end
         else 
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
     end
     else if(tim_en)begin
          if((pwm_cnt[31:0] == tim_load_value[31:0]))
            pwm_cnt[31:0] <= 0;
          else
            pwm_cnt[31:0] <= pwm_cnt[31:0] + 1; 
     end
     else
         pwm_cnt[31:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        cap_cnt[31:0] <= 0;
    else if(cap_edge)
        cap_cnt[31:0] <= pwm_cnt[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
        i_capture_d  <= 0;
        i_capture_d2 <= 0;
        i_capture_d3 <= 0;
    end
    else begin
        i_capture_d  <= i_capture;
        i_capture_d2 <= i_capture_d;
        i_capture_d3 <= i_capture_d2;
    end
end
assign i_capture_rise_edge = i_capture_d2 & ~i_capture_d3;
assign i_capture_fall_edge = ~i_capture_d2 & i_capture_d3;
always@(*)begin
case(cap_select[1:0])
2'b00: cap_edge = i_capture_rise_edge;
2'b01: cap_edge = i_capture_fall_edge;
2'b11: cap_edge = i_capture_rise_edge | i_capture_fall_edge;
default: cap_edge = 0;
endcase
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        inc_flag <= 1;
    else if(~pwm_en)
        inc_flag <= 1;
    else if(pwm_mode && (pwm_cnt[31:0] == load_cnt[31:0] - 1))
        inc_flag <= 0;
    else if(pwm_mode && ~inc_flag && (pwm_cnt[31:0] == 1))
        inc_flag <= 1;
end
always@(*)begin
case(sync_mode[1:0])
2'b00: updatereg = zero_flag;
2'b01: updatereg = load_flag;
2'b10: updatereg = zero_flag | load_flag;
2'b11: updatereg = end_flag;
default: updatereg = 0;
endcase
end
assign flag = (pwm_en | tim_en)? 1'b1 : (cap_en)? cap_edge : 1'b0;
assign zero_flag = flag && (pwm_cnt[31:0] == 0);
assign load_flag = flag && (pwm_cnt[31:0] == load_cnt[31:0]);
assign end_flag = (pwm_en && pwm_mode)? (~inc_flag && pwm_cnt[31:0] == 32'd1) : load_flag;
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      load_cnt[31:0] <= 32'hffffffff;
    else if(updatereg | ~pwm_en)
      load_cnt[31:0] <= pwm_load_value[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      compa[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      compa[31:0]  <= compa_val[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      compb[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      compb[31:0]  <= compb_val[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      trigval[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      trigval[31:0]  <= trig_val[31:0];
end
assign pwm_0 = pwm0_en && ((inc_flag && (pwm_cnt[31:0] >= compa[31:0])) | (~inc_flag && (pwm_cnt[31:0] > compa[31:0])));
assign pwm_1 = pwm1_en && ((inc_flag && (pwm_cnt[31:0] >= compb[31:0])) | (~inc_flag && (pwm_cnt[31:0] > compb[31:0])));
always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
       pwm_0_d <= 0;
       pwm_1_d <= 0;
    end
    else begin
       pwm_0_d <= pwm_0;
       pwm_1_d <= pwm_1;
    end
end        
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        deadband_cnt_0[11:0] <= 0;
    else if(~pwm_en)
        deadband_cnt_0[11:0] <= 0;
    else if(pwm_0 && deadband_cnt_0[11:0] == deadband_delay_cnt[11:0])
        deadband_cnt_0[11:0] <= 0;
    else if(pwm_0)
        deadband_cnt_0[11:0] <= deadband_cnt_0[11:0] + 1;
    else 
        deadband_cnt_0[11:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_0_db <= 0;
    else if(~pwm_en)
        pwm_0_db <= 0;
    else if(~pwm_0 & pwm_0_d)
        pwm_0_db <= 0;
    else if(pwm_0 && deadband_cnt_0[11:0] == deadband_delay_cnt[11:0])
        pwm_0_db <= 1;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_en)
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_0 && deadband_cnt_1[11:0] == deadband_delay_cnt[11:0])
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_0)
        deadband_cnt_1[11:0] <= deadband_cnt_1[11:0] + 1;
    else 
        deadband_cnt_1[11:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_1_db <= 1;
    else if(~pwm_en)
        pwm_1_db <= 1;
   else if(pwm_0 & ~pwm_0_d)
        pwm_1_db <= 0;
    else if(~pwm_0 && deadband_cnt_1[11:0] == deadband_delay_cnt[11:0])
        pwm_1_db <= 1;
end
assign pwm_0_out_pre = deadband_en ? pwm_0_db : pwm_0_d;
assign pwm_1_out_pre = deadband_en ? pwm_1_db : pwm_1_d;
assign pwm_0_out = pwm0_inv ? ~pwm_0_out_pre : pwm_0_out_pre;
assign pwm_1_out = pwm1_inv ? ~pwm_1_out_pre : pwm_1_out_pre;
assign pwm_0_oe  = pwm0_en;
assign pwm_1_oe  = pwm1_en;
assign pwm_cnt_zero 	= pwm_en && zero_flag;
assign pwm_cnt_load 	= pwm_en && load_flag;
assign compa_up_flag   	= pwm_en && (pwm_cnt[31:0] == compa[31:0]) && inc_flag;
assign compa_down_flag 	= pwm_en && (pwm_cnt[31:0] == compa[31:0]) && ~inc_flag;
assign compb_up_flag   	= pwm_en && (pwm_cnt[31:0] == compb[31:0]) && inc_flag;
assign compb_down_flag 	= pwm_en && (pwm_cnt[31:0] == compb[31:0]) && ~inc_flag;
assign cap_cnt_match_flag = cap_en && cap_edge && (pwm_cnt[31:0] == cap_load_value[31:0]);
assign cap_cnt_add_flag = cap_en && cap_edge;
assign tim_cnt_match_flag = tim_en && (pwm_cnt[31:0] == tim_load_value[31:0]);
always@(posedge pclk or negedge rstn)begin
    if(!rstn)begin
       pwm_cnt_zero_d       <= 0;
       pwm_cnt_load_d       <= 0;
       compa_up_flag_d      <= 0;
       compa_down_flag_d    <= 0;
       compb_up_flag_d      <= 0;
       compb_down_flag_d    <= 0;
       cap_cnt_match_flag_d <= 0;
       cap_cnt_add_flag_d   <= 0;
       tim_cnt_match_flag_d <= 0;
    end
    else begin
       pwm_cnt_zero_d       <= pwm_cnt_zero       ;
       pwm_cnt_load_d       <= pwm_cnt_load       ;
       compa_up_flag_d      <= compa_up_flag      ;
       compa_down_flag_d    <= compa_down_flag    ;
       compb_up_flag_d      <= compb_up_flag      ;
       compb_down_flag_d    <= compb_down_flag    ;
       cap_cnt_match_flag_d <= cap_cnt_match_flag ;
       cap_cnt_add_flag_d   <= cap_cnt_add_flag   ;
       tim_cnt_match_flag_d <= tim_cnt_match_flag ;
     end
end
assign pwm_cnt_zero_divedge       = ~pwm_cnt_zero       & pwm_cnt_zero_d;
assign pwm_cnt_load_divedge       = ~pwm_cnt_load       & pwm_cnt_load_d;
assign compa_up_flag_divedge      = ~compa_up_flag      & compa_up_flag_d;
assign compa_down_flag_divedge    = ~compa_down_flag    & compa_down_flag_d;
assign compb_up_flag_divedge      = ~compb_up_flag      & compb_up_flag_d;
assign compb_down_flag_divedge    = ~compb_down_flag    & compb_down_flag_d;
assign cap_cnt_match_flag_divedge = cap_cnt_match_flag & ~cap_cnt_match_flag_d;
assign cap_cnt_add_flag_divedge   = ~cap_cnt_add_flag   & cap_cnt_add_flag_d;
assign tim_cnt_match_flag_divedge = ~tim_cnt_match_flag & tim_cnt_match_flag_d;
assign pwm_tim_etb_trig = tim_cnt_match_flag_divedge;
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_cnt_zero  <= 0;
    else if(int_clr_pwm_cnt_zero)
	int_pwm_cnt_zero  <= 0;
    else if(pwm_cnt_zero_divedge && int_en_pwm_cnt_zero)
	int_pwm_cnt_zero  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_cnt_load  <= 0;
    else if(int_clr_pwm_cnt_load)
	int_pwm_cnt_load  <= 0;
    else if(pwm_cnt_load_divedge && int_en_pwm_cnt_load)
	int_pwm_cnt_load  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compa_up  <= 0;
    else if(int_clr_pwm_compa_up)
	int_pwm_compa_up  <= 0;
    else if(compa_up_flag_divedge && int_en_pwm_compa_up)
	int_pwm_compa_up  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compa_down  <= 0;
    else if(int_clr_pwm_compa_down)
	int_pwm_compa_down  <= 0;
    else if(compa_down_flag_divedge && int_en_pwm_compa_down)
	int_pwm_compa_down  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compb_up  <= 0;
    else if(int_clr_pwm_compb_up)
	int_pwm_compb_up  <= 0;
    else if(compb_up_flag_divedge && int_en_pwm_compb_up)
	int_pwm_compb_up  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compb_down  <= 0;
    else if(int_clr_pwm_compb_down)
	int_pwm_compb_down  <= 0;
    else if(compb_down_flag_divedge && int_en_pwm_compb_down)
	int_pwm_compb_down  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_cap_cnt_match  <= 0;
    else if(int_clr_cap_cnt_match)
	int_cap_cnt_match  <= 0;
    else if(cap_cnt_match_flag_divedge && int_en_cap_cnt_match)
	int_cap_cnt_match  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_cap_cnt_add  <= 0;
    else if(int_clr_cap_cnt_add)
	int_cap_cnt_add  <= 0;
    else if(cap_cnt_add_flag_divedge && int_en_cap_cnt_add)
	int_cap_cnt_add  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_tim_cnt_match  <= 0;
    else if(int_clr_tim_cnt_match)
	int_tim_cnt_match  <= 0;
    else if(tim_cnt_match_flag_divedge && int_en_tim_cnt_match)
	int_tim_cnt_match  <= 1;
end
assign trigger_up = inc_flag && (pwm_cnt[31:0] == trigval[31:0]) && flag;
assign trigger_down = ~inc_flag && (pwm_cnt[31:0] == trigval[31:0]) && flag;
always@(posedge pclk or negedge rstn)begin
    if(!rstn)begin
        trigger_up_d   <= 0;
        trigger_down_d <= 0;
    end
    else begin
	trigger_up_d   <= trigger_up;
        trigger_down_d <= trigger_down;
    end
end
assign trigger = (~trigger_up & trigger_up_d & trenu) | (~trigger_down & trigger_down_d && trend);
endmodule
