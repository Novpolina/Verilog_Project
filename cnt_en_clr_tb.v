// File: cnt_en_clr_tb.v
`timescale 1ns/1ps

module cnt_en_clr_tb();

localparam CNT_WIDTH = 4;

reg clk_i;
reg arstn_i;
reg cnt_en_i;
reg cnt_clr_i;
wire [CNT_WIDTH-1:0] cnt_o;
wire ovf_o;


cnt_en_clr #(
    .CNT_WIDTH(CNT_WIDTH)
) dut (
    .clk_i(clk_i),
    .arstn_i(arstn_i),
    .cnt_en_i(cnt_en_i),
    .cnt_clr_i(cnt_clr_i),
    .cnt_o(cnt_o),
    .ovf_o(ovf_o)
);


initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
end


initial begin

    $dumpvars;
    arstn_i = 1;
    cnt_en_i = 0;
    cnt_clr_i = 0;
    

    #10 arstn_i = 0;
    #10 arstn_i = 1;

    cnt_en_i = 1;
    #100;

    cnt_clr_i = 0;

    cnt_en_i = 1;
    #100;
    
    cnt_en_i = 0;
    #20;
    cnt_en_i = 1;
    #30;
    cnt_clr_i = 1;
    #10
    cnt_clr_i = 0;
    #35
    arstn_i = 0;
    #20
    arstn_i = 1;
    #30

     $finish;
end

endmodule