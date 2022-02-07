`timescale 1ns/1ps

module halfadder(x, y, s, cout);

    input x, y;
    output s, cout;
    wire s1, s2, s3;

    nand NAND_C(s2, s3, y);
    nand NAND_A(s3, x, y);
    nand NAND_B(s1, x, s3);
    nand NAND_D(s, s1, s2);

    assign cout = ~s3;

endmodule
