`timescale 1ns / 1ps
module top_module_tb;
    reg clk;
    reg reset;
    reg [3:0] d1;           
    reg [3:0] d2;            
    reg Cin;                 
    wire [3:0] sum;          
    wire Cout;               

    top_module uut (
        .clk(clk),
        .reset(reset),
        .d1(d1),
        .d2(d2),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    
    initial begin
        $dumpfile("top_module_tb.vcd");
        $dumpvars(0,uut); 
        $display("Time Clk Reset Cin D1    D2    Sum   Cout");
        $monitor("%4d %4b %5b %3b %4b %4b %5b %4b", 
                 $time, clk, reset, Cin, d1, d2, sum, Cout);


       

        reset = 1; Cin = 0; d1 = 4'b0000; d2 = 4'b0000;
        #10 reset = 0;   

    
        #10 d1 = 4'b0101; d2 = 4'b0011; Cin = 0;   

        
        #10 d1 = 4'b1010; d2 = 4'b0101; Cin = 0;   

       
        #10 d1 = 4'b1111; d2 = 4'b1111; Cin = 0;   
        
        #10 d1 = 4'b0010; d2 = 4'b0110; Cin = 0;  

        
        // #10 reset = 1;                             
        // #10 reset = 0;                              
        
        #10 d1 = 4'b1100; d2 = 4'b0011; Cin = 0;   
        #10 d1 = 4'b0001; d2 = 4'b0001; Cin = 0;  

        
        #10 $finish;
    end

endmodule
