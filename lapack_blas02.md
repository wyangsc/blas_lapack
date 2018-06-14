#blas的三级计算

## blas的矩阵运算类型(ex01.f90)

1、vector-vector

2、matrix-vector

3、matrix-matrix



##lapack_blas函数（子程序）命名规则

**XYYZZZ**

The first letter, **X**, indicates the data type as follows:

> | S    | REAL                         |
> | ---- | ---------------------------- |
> | D    | DOUBLE PRECISION             |
> | C    | COMPLEX                      |
> | Z    | COMPLEX*16 or DOUBLE COMPLEX |

**YY**

| BD   | bidiagonal                                                   |
| ---- | ------------------------------------------------------------ |
| DI   | diagonal                                                     |
| GB   | general band                                                 |
| GE   | general (i.e., unsymmetric, in some cases rectangular)       |
| GG   | general matrices, generalized problem (i.e., a pair of general matrices) |
| GT   | general tridiagonal                                          |
| HB   | (complex) Hermitian band                                     |
| HE   | (complex) Hermitian                                          |
| HG   | upper Hessenberg matrix, generalized problem (i.e a Hessenberg and a |
|      | triangular matrix)                                           |
| HP   | (complex) Hermitian, packed storage                          |
| HS   | upper Hessenberg                                             |
| OP   | (real) orthogonal, packed storage                            |
| OR   | (real) orthogonal                                            |
| PB   | symmetric or Hermitian positive definite band                |
| PO   | symmetric or Hermitian positive definite                     |
| PP   | symmetric or Hermitian positive definite, packed storage     |
| PT   | symmetric or Hermitian positive definite tridiagonal         |
| SB   | (real) symmetric band                                        |
| SP   | symmetric, packed storage                                    |
| ST   | (real) symmetric tridiagonal                                 |
| SY   | symmetric                                                    |
| TB   | triangular band                                              |
| TG   | triangular matrices, generalized problem (i.e., a pair of triangular matrices) |
| TP   | triangular, packed storage                                   |
| TR   | triangular (or in some cases quasi-triangular)               |
| TZ   | trapezoidal                                                  |
| UN   | (complex) unitary                                            |
| UP   | (complex) unitary, packed storage                            |

**ZZZ**

V--vector

M--Matrix

MV

MM