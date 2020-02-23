/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module csky_apb0_top # 
 ( 
     `include    "apb0_params.v" 
 ) 
 ( 
     hclk              , 
     hrst_n            , 
     pclk_en           , 
     hsel              , 
     hreadyin          , 
     haddr             , 
     hwrite            , 
     htrans            , 
     hsize             , 
     hburst            , 
     hprot             , 
     hsec              , 
     hwdata            , 
     psel_s0           ,    
     pready_s0         ,    
     pselverr_s0       ,    
     prdata_s0         ,    
     psel_s1           ,    
     pready_s1         ,    
     pselverr_s1       ,    
     prdata_s1         ,    
     psel_s2           ,    
     pready_s2         ,    
     pselverr_s2       ,    
     prdata_s2         ,    
     psel_s3           ,    
     pready_s3         ,    
     pselverr_s3       ,    
     prdata_s3         ,    
     psel_s4           ,    
     pready_s4         ,    
     pselverr_s4       ,    
     prdata_s4         ,    
     psel_s5           ,    
     pready_s5         ,    
     pselverr_s5       ,    
     prdata_s5         ,    
     psel_s6           ,    
     pready_s6         ,    
     pselverr_s6       ,    
     prdata_s6         ,    
     psel_s7           ,    
     pready_s7         ,    
     pselverr_s7       ,    
     prdata_s7         ,    
     psel_s8           ,    
     pready_s8         ,    
     pselverr_s8       ,    
     prdata_s8         ,    
     psel_s9           ,    
     pready_s9         ,    
     pselverr_s9       ,    
     prdata_s9         ,    
     psel_s10           ,    
     pready_s10         ,    
     pselverr_s10       ,    
     prdata_s10         ,    
     psel_s11           ,    
     pready_s11         ,    
     pselverr_s11       ,    
     prdata_s11         ,    
     psel_s12           ,    
     pready_s12         ,    
     pselverr_s12       ,    
     prdata_s12         ,    
     psel_s13           ,    
     pready_s13         ,    
     pselverr_s13       ,    
     prdata_s13         ,    
     psel_s14           ,    
     pready_s14         ,    
     pselverr_s14       ,    
     prdata_s14         ,    
     psel_s15           ,    
     pready_s15         ,    
     pselverr_s15       ,    
     prdata_s15         ,    
     hreadyout         , 
     hresp             , 
     hrdata            , 
     paddr_s           , 
     penable_s         , 
     pwdata_s          , 
     pstrb_s           , 
     pwrite_s          , 
     pprot_s        
 ); 
 input                                                        hclk              ; 
 input                                                        hrst_n            ; 
 input                                                        pclk_en           ; 
 input                                                        hsel              ; 
 input                                                        hreadyin          ; 
 input                    [31:0]                              haddr             ; 
 input                                                        hwrite            ; 
 input                    [ 1:0]                              htrans            ; 
 input                    [ 2:0]                              hsize             ; 
 input                    [ 3:0]                              hburst            ; 
 input                    [ 3:0]                              hprot             ; 
 input                                                        hsec              ; 
 input                    [31:0]                              hwdata            ; 
 output                     psel_s0        ;     
 input                      pready_s0      ;     
 input                      pselverr_s0    ;     
 input       [31:0]         prdata_s0      ;     
 output                     psel_s1        ;     
 input                      pready_s1      ;     
 input                      pselverr_s1    ;     
 input       [31:0]         prdata_s1      ;     
 output                     psel_s2        ;     
 input                      pready_s2      ;     
 input                      pselverr_s2    ;     
 input       [31:0]         prdata_s2      ;     
 output                     psel_s3        ;     
 input                      pready_s3      ;     
 input                      pselverr_s3    ;     
 input       [31:0]         prdata_s3      ;     
 output                     psel_s4        ;     
 input                      pready_s4      ;     
 input                      pselverr_s4    ;     
 input       [31:0]         prdata_s4      ;     
 output                     psel_s5        ;     
 input                      pready_s5      ;     
 input                      pselverr_s5    ;     
 input       [31:0]         prdata_s5      ;     
 output                     psel_s6        ;     
 input                      pready_s6      ;     
 input                      pselverr_s6    ;     
 input       [31:0]         prdata_s6      ;     
 output                     psel_s7        ;     
 input                      pready_s7      ;     
 input                      pselverr_s7    ;     
 input       [31:0]         prdata_s7      ;     
 output                     psel_s8        ;     
 input                      pready_s8      ;     
 input                      pselverr_s8    ;     
 input       [31:0]         prdata_s8      ;     
 output                     psel_s9        ;     
 input                      pready_s9      ;     
 input                      pselverr_s9    ;     
 input       [31:0]         prdata_s9      ;     
 output                     psel_s10        ;     
 input                      pready_s10      ;     
 input                      pselverr_s10    ;     
 input       [31:0]         prdata_s10      ;     
 output                     psel_s11        ;     
 input                      pready_s11      ;     
 input                      pselverr_s11    ;     
 input       [31:0]         prdata_s11      ;     
 output                     psel_s12        ;     
 input                      pready_s12      ;     
 input                      pselverr_s12    ;     
 input       [31:0]         prdata_s12      ;     
 output                     psel_s13        ;     
 input                      pready_s13      ;     
 input                      pselverr_s13    ;     
 input       [31:0]         prdata_s13      ;     
 output                     psel_s14        ;     
 input                      pready_s14      ;     
 input                      pselverr_s14    ;     
 input       [31:0]         prdata_s14      ;     
 output                     psel_s15        ;     
 input                      pready_s15      ;     
 input                      pselverr_s15    ;     
 input       [31:0]         prdata_s15      ;     
 output                                                       hreadyout      ; 
 output                   [ 1:0]                              hresp          ; 
 output                   [31:0]                              hrdata         ; 
 output                   [31:0]                              paddr_s        ; 
 output                                                       penable_s      ; 
 output                   [31:0]                              pwdata_s       ; 
 output                   [ 3:0]                              pstrb_s        ; 
 output                                                       pwrite_s       ; 
 output                   [ 2:0]                              pprot_s        ; 
 wire                      psel_s0        ;     
 wire                      pready_s0      ;     
 wire                      pselverr_s0    ;     
 wire       [31:0]         prdata_s0      ;     
 wire                      psel_s1        ;     
 wire                      pready_s1      ;     
 wire                      pselverr_s1    ;     
 wire       [31:0]         prdata_s1      ;     
 wire                      psel_s2        ;     
 wire                      pready_s2      ;     
 wire                      pselverr_s2    ;     
 wire       [31:0]         prdata_s2      ;     
 wire                      psel_s3        ;     
 wire                      pready_s3      ;     
 wire                      pselverr_s3    ;     
 wire       [31:0]         prdata_s3      ;     
 wire                      psel_s4        ;     
 wire                      pready_s4      ;     
 wire                      pselverr_s4    ;     
 wire       [31:0]         prdata_s4      ;     
 wire                      psel_s5        ;     
 wire                      pready_s5      ;     
 wire                      pselverr_s5    ;     
 wire       [31:0]         prdata_s5      ;     
 wire                      psel_s6        ;     
 wire                      pready_s6      ;     
 wire                      pselverr_s6    ;     
 wire       [31:0]         prdata_s6      ;     
 wire                      psel_s7        ;     
 wire                      pready_s7      ;     
 wire                      pselverr_s7    ;     
 wire       [31:0]         prdata_s7      ;     
 wire                      psel_s8        ;     
 wire                      pready_s8      ;     
 wire                      pselverr_s8    ;     
 wire       [31:0]         prdata_s8      ;     
 wire                      psel_s9        ;     
 wire                      pready_s9      ;     
 wire                      pselverr_s9    ;     
 wire       [31:0]         prdata_s9      ;     
 wire                      psel_s10        ;     
 wire                      pready_s10      ;     
 wire                      pselverr_s10    ;     
 wire       [31:0]         prdata_s10      ;     
 wire                      psel_s11        ;     
 wire                      pready_s11      ;     
 wire                      pselverr_s11    ;     
 wire       [31:0]         prdata_s11      ;     
 wire                      psel_s12        ;     
 wire                      pready_s12      ;     
 wire                      pselverr_s12    ;     
 wire       [31:0]         prdata_s12      ;     
 wire                      psel_s13        ;     
 wire                      pready_s13      ;     
 wire                      pselverr_s13    ;     
 wire       [31:0]         prdata_s13      ;     
 wire                      psel_s14        ;     
 wire                      pready_s14      ;     
 wire                      pselverr_s14    ;     
 wire       [31:0]         prdata_s14      ;     
 wire                      psel_s15        ;     
 wire                      pready_s15      ;     
 wire                      pselverr_s15    ;     
 wire       [31:0]         prdata_s15      ;     
 wire                                                         hreadyout      ; 
 wire                     [ 1:0]                              hresp          ; 
 wire                     [31:0]                              hrdata         ; 
 wire                     [31:0]                              paddr_s        ; 
 wire                                                         penable_s      ; 
 wire                     [31:0]                              pwdata_s       ; 
 wire                     [ 3:0]                              pstrb_s        ; 
 wire                                                         pwrite_s       ; 
 wire                     [ 2:0]                              pprot_s        ;  
 wire                                                         root_psel      ; 
 wire                     [31:0]                              root_paddr     ; 
 wire                                                         root_penable   ; 
 wire                     [31:0]                              root_pwdata    ; 
 wire                     [ 3:0]                              root_pstrb     ; 
 wire                                                         root_pwrite    ; 
 wire                     [ 2:0]                              root_pprot     ; 
 wire                                                         root_pready    ; 
 wire                                                         root_pslverr   ; 
 wire                     [31:0]                              root_prdata    ; 
  apb0_state_ctrl U_APB0_STATE_CTRL 
         ( 
             .i_hclk                    (hclk              ), 
             .i_hrst_n                  (hrst_n            ), 
             .i_pclk_en                 (pclk_en           ), 
             .i_slave_hsel              (hsel              ), 
             .i_slave_hreadyin          (hreadyin          ), 
             .i_slave_haddr             (haddr             ), 
             .i_slave_hwrite            (hwrite            ), 
             .i_slave_htrans            (htrans            ), 
             .i_slave_hsize             (hsize             ), 
             .i_slave_hburst            (hburst            ), 
             .i_slave_hprot             (hprot             ), 
             .i_slave_hsec              (hsec              ), 
             .i_slave_hwdata            (hwdata            ), 
             .i_root_pready             (root_pready       ), 
             .i_root_pslverr            (root_pslverr      ), 
             .i_root_prdata             (root_prdata       ), 
             .o_slave_hreadyout         (hreadyout         ), 
             .o_slave_hresp             (hresp             ), 
             .o_slave_hrdata            (hrdata            ), 
             .o_root_psel               (root_psel         ), 
             .o_root_paddr              (root_paddr        ), 
             .o_root_penable            (root_penable      ), 
             .o_root_pwdata             (root_pwdata       ), 
             .o_root_pstrb              (root_pstrb        ), 
             .o_root_pwrite             (root_pwrite       ), 
             .o_root_pprot              (root_pprot        ) 
         ); 
     wire  [   APB_LEAF_SLV_NUM-1:0]           i_leaf_slave_pready       ; 
     wire  [   APB_LEAF_SLV_NUM-1:0]           i_leaf_slave_pslverr      ; 
     wire [32*APB_LEAF_SLV_NUM-1:0]           i_leaf_slave_prdata        ; 
     wire [   APB_LEAF_SLV_NUM-1:0]           o_leaf_slave_psel          ; 
     assign i_leaf_slave_pready[0] = pready_s0      ; 
     assign i_leaf_slave_pslverr[0]= pselverr_s0    ;
     assign psel_s0 = o_leaf_slave_psel[0]          ;
     assign i_leaf_slave_prdata[31:0] =  prdata_s0  ;
     assign i_leaf_slave_pready[1] = pready_s1      ; 
     assign i_leaf_slave_pslverr[1]= pselverr_s1    ;
     assign psel_s1 = o_leaf_slave_psel[1]          ;
     assign i_leaf_slave_prdata[63:32] =  prdata_s1  ;
     assign i_leaf_slave_pready[2] = pready_s2      ; 
     assign i_leaf_slave_pslverr[2]= pselverr_s2    ;
     assign psel_s2 = o_leaf_slave_psel[2]          ;
     assign i_leaf_slave_prdata[95:64] =  prdata_s2  ;
     assign i_leaf_slave_pready[3] = pready_s3      ; 
     assign i_leaf_slave_pslverr[3]= pselverr_s3    ;
     assign psel_s3 = o_leaf_slave_psel[3]          ;
     assign i_leaf_slave_prdata[127:96] =  prdata_s3  ;
     assign i_leaf_slave_pready[4] = pready_s4      ; 
     assign i_leaf_slave_pslverr[4]= pselverr_s4    ;
     assign psel_s4 = o_leaf_slave_psel[4]          ;
     assign i_leaf_slave_prdata[159:128] =  prdata_s4  ;
     assign i_leaf_slave_pready[5] = pready_s5      ; 
     assign i_leaf_slave_pslverr[5]= pselverr_s5    ;
     assign psel_s5 = o_leaf_slave_psel[5]          ;
     assign i_leaf_slave_prdata[191:160] =  prdata_s5  ;
     assign i_leaf_slave_pready[6] = pready_s6      ; 
     assign i_leaf_slave_pslverr[6]= pselverr_s6    ;
     assign psel_s6 = o_leaf_slave_psel[6]          ;
     assign i_leaf_slave_prdata[223:192] =  prdata_s6  ;
     assign i_leaf_slave_pready[7] = pready_s7      ; 
     assign i_leaf_slave_pslverr[7]= pselverr_s7    ;
     assign psel_s7 = o_leaf_slave_psel[7]          ;
     assign i_leaf_slave_prdata[255:224] =  prdata_s7  ;
     assign i_leaf_slave_pready[8] = pready_s8      ; 
     assign i_leaf_slave_pslverr[8]= pselverr_s8    ;
     assign psel_s8 = o_leaf_slave_psel[8]          ;
     assign i_leaf_slave_prdata[287:256] =  prdata_s8  ;
     assign i_leaf_slave_pready[9] = pready_s9      ; 
     assign i_leaf_slave_pslverr[9]= pselverr_s9    ;
     assign psel_s9 = o_leaf_slave_psel[9]          ;
     assign i_leaf_slave_prdata[319:288] =  prdata_s9  ;
     assign i_leaf_slave_pready[10] = pready_s10      ; 
     assign i_leaf_slave_pslverr[10]= pselverr_s10    ;
     assign psel_s10 = o_leaf_slave_psel[10]          ;
     assign i_leaf_slave_prdata[351:320] =  prdata_s10  ;
     assign i_leaf_slave_pready[11] = pready_s11      ; 
     assign i_leaf_slave_pslverr[11]= pselverr_s11    ;
     assign psel_s11 = o_leaf_slave_psel[11]          ;
     assign i_leaf_slave_prdata[383:352] =  prdata_s11  ;
     assign i_leaf_slave_pready[12] = pready_s12      ; 
     assign i_leaf_slave_pslverr[12]= pselverr_s12    ;
     assign psel_s12 = o_leaf_slave_psel[12]          ;
     assign i_leaf_slave_prdata[415:384] =  prdata_s12  ;
     assign i_leaf_slave_pready[13] = pready_s13      ; 
     assign i_leaf_slave_pslverr[13]= pselverr_s13    ;
     assign psel_s13 = o_leaf_slave_psel[13]          ;
     assign i_leaf_slave_prdata[447:416] =  prdata_s13  ;
     assign i_leaf_slave_pready[14] = pready_s14      ; 
     assign i_leaf_slave_pslverr[14]= pselverr_s14    ;
     assign psel_s14 = o_leaf_slave_psel[14]          ;
     assign i_leaf_slave_prdata[479:448] =  prdata_s14  ;
     assign i_leaf_slave_pready[15] = pready_s15      ; 
     assign i_leaf_slave_pslverr[15]= pselverr_s15    ;
     assign psel_s15 = o_leaf_slave_psel[15]          ;
     assign i_leaf_slave_prdata[511:480] =  prdata_s15  ;
   apb0_leaf_mux U_APB0_LEAF_MUX 
 ( 
     .i_root_psel               (root_psel                 ), 
     .i_root_paddr              (root_paddr                ), 
     .i_root_penable            (root_penable              ), 
     .i_root_pwdata             (root_pwdata               ), 
     .i_root_pstrb              (root_pstrb                ), 
     .i_root_pwrite             (root_pwrite               ), 
     .i_root_pprot              (root_pprot                ), 
     .i_leaf_slave_pready       (i_leaf_slave_pready       ), 
     .i_leaf_slave_pslverr      (i_leaf_slave_pslverr      ), 
     .i_leaf_slave_prdata       (i_leaf_slave_prdata       ), 
     .o_root_pready             (root_pready               ), 
     .o_root_pslverr            (root_pslverr              ), 
     .o_root_prdata             (root_prdata               ), 
     .o_leaf_slave_psel         (o_leaf_slave_psel         ), 
     .o_leaf_slave_paddr        (paddr_s                   ), 
     .o_leaf_slave_penable      (penable_s                 ), 
     .o_leaf_slave_pwdata       (pwdata_s                  ), 
     .o_leaf_slave_pstrb        (pstrb_s                   ), 
     .o_leaf_slave_pwrite       (pwrite_s                  ), 
     .o_leaf_slave_pprot        (pprot_s                   )  
 ); 
 endmodule
