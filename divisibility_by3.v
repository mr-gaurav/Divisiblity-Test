`timescale 1ns / 1ps

module divisibility_by3(out, rem, data, clk);
    output reg out;
    output reg [1:0] rem;
    input data, clk;
    parameter s0=2'b00, s1=2'b01, s2=2'b10;
    reg [1:0] state, next_state=s0;
    always @(posedge clk) begin
        state<= next_state;
    end
    
    always @(state or data) begin
        case (state)
            s0: begin 
                    out=1; rem=0; 
                    next_state= data ? s1 : s0;
                end
            s1: begin
                    out=0; rem=1;
                    next_state= data ? s0 : s2;
                end
            s2: begin
                    out=0; rem=2;
                    next_state= data ? s2 : s1;
                end
            default : begin
                        out=1'bx; rem=2'bx;
                        next_state= s0;
                      end
     endcase
                    
    end
endmodule
