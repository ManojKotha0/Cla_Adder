module d_flip_flop2 (
    input wire clk,              
    input wire reset,            
    input wire [3:0] d3,         
    input wire d4,     
    output reg [3:0] sum,   
    output reg Cout       
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin        
            sum <= 4'b0000;
            Cout <= 0;
        end else begin   
            sum <= d3;
            Cout <= d4;
        end
    end

endmodule
