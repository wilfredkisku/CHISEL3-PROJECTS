/*
  CHECK FOR THESE NUMEBRS IN THE TEST
  0 01111 0000000000  3C00                   1                   1    1
  0 00101 0000000000  1400        0.0009765625        0.0009765625    eps
  0 01111 0000000001  3C01         1.000976563         1.000976563    1+eps
  1 10000 0000000000  C000                  -2                  -2    -2
  0 11110 1111111111  7BFF               65504               65504    2/r*(2-eps)
  0 00001 0000000000  0400     6.103515625e-05     6.103515625e-05    r
  0 00000 1111111111  03FF     6.097555161e-05     6.097555161e-05    r*(1-eps)
  0 00000 0000000001  0001     5.960464478e-08     5.960464478e-08    r*eps
  0 00000 0000000001  0001     5.960464478e-08     5.960464478e-08    r*eps/2
  0 00000 0000000000  0000                   0                   0    zero
  0 00000 0000000000  0000                   0                   0    -zero
  0 11111 0000000000  7C00                 Inf                 Inf    1/zero
  1 11111 0000000000  FC00                -Inf                -Inf    -1/zero
  1 11111 1111111111  FFFF                 NaN                 NaN    zero/zero
  0 01101 0101010101  3555        0.3333333333        0.3332519531    1/3
 */
class FP16AddTest {

}