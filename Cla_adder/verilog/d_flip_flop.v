module d_flip_flop (
    input wire clk,               
    input wire reset,            
    input wire [3:0] d1,         
    input wire [3:0] d2,
    input Cin,    
    output reg [3:0] q1,   
    output reg [3:0] q2,
    output reg Cin_Dff     
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin        
            q1 <= 4'b0000;
            q2 <= 4'b0000;
            Cin_Dff <= 1'b0;
        end else begin   
            q1 <= d1;
            q2 <= d2;
            Cin_Dff <= Cin;
        end
    end
endmodule
