module top_module (
    input wire clk,                
    input wire reset,              
    input wire [3:0] d1,           
    input wire [3:0] d2,           
    input wire Cin,                
    output wire [3:0] sum,         
    output wire Cout              
);

    wire [3:0] q1;
    wire [3:0] q2;
    wire [3:0] q3;
    wire q4;

    
    d_flip_flop dff (
        .clk(clk),
        .reset(reset),
        .d1(d1),
        .d2(d2),
        .Cin(Cin),
        .q1(q1),
        .q2(q2),
        .Cin_Dff(Cin_Dff)
    );

    
    cla_adder cla (
        .q1(q1),
        .q2(q2),
        .Cin(Cin_Dff),
        .q3(q3),
        .q4(q4)
    );

    
    d_flip_flop2 dff2 (
        .clk(clk),
        .reset(reset),
        .d3(q3),
        .d4(q4),
        .sum(sum),
        .Cout(Cout)
    );

endmodule
