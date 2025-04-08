// File: cnt_en_clr.v
module cnt_en_clr #(
    parameter CNT_WIDTH = 8
)(
    input clk_i,
    input arstn_i,
    input cnt_en_i,
    input cnt_clr_i,
    output reg [CNT_WIDTH-1:0] cnt_o,
    output reg ovf_o
);

always @(posedge clk_i or negedge arstn_i) begin
    if (!arstn_i) begin
        cnt_o <= {CNT_WIDTH{1'b0}};
        ovf_o <= 1'b0;
    end
    else if (cnt_clr_i) begin
        cnt_o <= {CNT_WIDTH{1'b0}};
        ovf_o <= 1'b0;
    end
    else if (cnt_en_i) begin
        if (cnt_o == {CNT_WIDTH{1'b1}}) begin
            cnt_o <= {CNT_WIDTH{1'b0}};
            ovf_o <= 1'b1;
        end
        else begin
            cnt_o <= cnt_o + 1;
        end
    end
    else begin
        ovf_o <= ovf_o;
    end
end

endmodule