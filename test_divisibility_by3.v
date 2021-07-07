`timescale 1ns / 1ps

module test_divisibility_by3();
    reg data, clk=0;
    wire out;
    wire [1:0] rem;
    always #5 clk=~clk;
    
    divisibility_by3 dut(out, rem, data, clk);
    integer seed=2968;
    reg [19:0] value=0;
    initial begin
        $dumpfile("test.vcd");
        $dumpfile(0);
//        $monitor("time=%g, data=%b, state=%d, value=%g out=%b, rem=%d",$time, data, dut.state,value, out, rem);
        
        repeat(20) begin
        @(negedge clk) data= {$random(seed)}%2;
            value= (value<<1) +data;
        end
        #10 $finish;
    end
    always @(posedge clk)
    $display("time=%g, data=%b, state=%d, value=%g out=%b, rem=%d",$time, data, dut.state,value, out, rem);
    

endmodule
