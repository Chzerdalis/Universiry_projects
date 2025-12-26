module partial_mul #(
    parameter WIDTH = 32,
    parameter PROD = 48
)(
    input                  clock,
    input                  reset,
    input  signed [WIDTH-1:0] A,
    input  signed [WIDTH/2-1:0] B,
    output signed [PROD-1:0] P
);
    reg signed [PROD-1:0] part_low_reg;
    reg signed [PROD-1:0] part_high_reg;

    // Split A into halves
    wire signed [WIDTH/2-1:0] A_low  = A[WIDTH/2-1:0];
    wire signed [WIDTH/2-1:0] A_high = A[WIDTH-1:WIDTH/2];

    // Partial products (sign-extend properly)
    wire signed [PROD-1:0] part_low;
    wire signed [PROD-1:0] part_high;

    assign part_low  = B * A_low;
    assign part_high = B * A_high;

    // Combine with shift and sign extension of the upper partial product
    assign P = part_low_reg + (part_high_reg <<< (WIDTH/2));

    always @(posedge clock or posedge reset) begin
           if (reset) begin
               part_low_reg  <= 0;
               part_high_reg <= 0;
           end else begin
               part_low_reg  <= part_low;
               part_high_reg <= part_high;
           end
    end
endmodule