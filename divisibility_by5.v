`timescale 1ns / 1ps

module divisibility_by5(out, rem , data, clk);
    output reg out;
    output reg [2:0] rem;
    input data, clk;
    parameter s0=3'd0, s1=3'd1, s2=3'd2, s3=3'd3, s4=3'd4;
    reg [2:0] state;
    
    always @(posedge clk) begin
        case (state)
            s0: state<= data ? s1:s0;
            s1: state<= data ? s3:s2;
            s2: state<= data ? s0:s4;
            s3: state<= data ? s2:s1;
            s4: state<= data ? s4:s3;
            default: state<=s0;
        endcase
    end
    
    always @(state) begin
        case(state)
            s0: begin out=1; rem=0; end
            s1: begin out=0; rem=1; end
            s2: begin out=0; rem=2; end
            s3: begin out=0; rem=3; end
            s4: begin out=0; rem=4; end
            default: begin out=1'bx; rem=3'bx; end
        endcase
    end
endmodule
