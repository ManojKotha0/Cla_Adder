module cla_adder (
    input wire [3:0] q1,          
    input wire [3:0] q2,          
    input wire Cin,               
    output wire [3:0] q3,        
    output wire q4              
);

    wire [3:0] G;               
    wire [3:0] P;               
    wire [3:1] C;              

    and(G[0],q1[0],q2[0]);
    and(G[1],q1[1],q2[1]);
    and(G[2],q1[2],q2[2]);
    and(G[3],q1[3],q2[3]);          
    xor(P[0],q1[0],q2[0]);
    xor(P[1],q1[1],q2[1]);
    xor(P[2],q1[2],q2[2]);          
    xor(P[3],q1[3],q2[3]);
    
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign q4 = G[3] | (P[3] & C[3]); 

    xor(q3[0],P[0],Cin);
    xor(q3[1],P[1],C[1]);
    xor(q3[2],P[2],C[2]);
    xor(q3[3],P[3],C[3]);
    
endmodule
