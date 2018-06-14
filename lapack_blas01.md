# lapack的矩阵存储方式

### 常规矩阵存储

$$A=\left( \begin{array}{ccccc} a_{11} & a_{12} & a_{13}& \cdots  &a_{1n} \newline a_{21} & a_{22} & a_{23} & \cdots & a_{2n} \newline \vdots & \vdots &   \vdots &\ddots & \vdots \newline a_{m1} & a_{m2} & a_{m3} &\cdots &a_{mn} \end{array}\right)$$

对于形如A的矩阵在内存中采取按列存储。A={$$a_{11}$$,$$a_{21}$$$$a_{31}$$,$$\cdots$$,$$a_{m1}$$,$$a_{12}$$,$$\cdots$$}

如果我们在参数UPLO设置U or L ，blas函数会直接假设参数矩阵为上或下三角矩阵，例如指定U，对于n级矩阵A,（*号表示设置与否均无任何效果，矩阵计算时自动认为$$a_{ij}=a_{ji},i\geq j​$$）

$$A=\left( \begin{array}{ccccc} a_{11} & a_{12} & a_{13}& \cdots  &a_{1n} \newline * & a_{22} & a_{23} & \cdots & a_{2n} \newline \vdots & \vdots &   \vdots &\ddots & \vdots \newline * & * & * &\cdots &a_{nn} \end{array}\right)$$

### 三角矩阵存储

对于(复)对称、或者三角矩阵，可以进一步减少占用内存空间

例如对于一个形如Upper的矩阵

$$Upper=\left( \begin{array}{ccccc} a_{11} & a_{12} & a_{13}& \cdots  &a_{1n} \newline 0& a_{22} & a_{23} & \cdots & a_{2n} \newline 0& 0 & a_{33} & \cdots & a_{3n}  \newline \vdots & \vdots &   \vdots &\ddots & \vdots \newline 0 & 0 & 0 &\cdots &0 \end{array}\right)$$
可以考虑存储为Upper={$$ \underbrace {a_{11}}$$,$$\underbrace {a_{12} a_{22}},$$ $$\underbrace {a_{13} a_{23} a_{33} }$$,$$\cdots$$,$$\underbrace{a_{1n} a_{2n}\cdots a_{nn}}$$}

###带状矩阵存储

$$B=\left( \begin{array}{ccccc} a_{11} & a_{12} & 0 & 0 & \cdots  & 0 \newline 0 & a_{22} & a_{23} & 0 & \cdots & 0 \newline \vdots & \vdots &   \vdots &\ddots & \vdots \newline 0 & 0 & 0 &0 &\cdots &a_{n-1,n} \newline 0 & 0 & 0 &0 &\cdots &a_{nn} \end{array}\right)$$

对于形如B的矩阵我们可以看作如下结构存储在内存中

$$\left( \begin{array}{ccccc} 0 & a_{12} & a_{23} & a_{34} & \cdots  & a_{n-1n} \newline a_{11} & a_{22} & a_{33} & a_{44} & \cdots& a_{nn}\end{array}　\right)$$

当然可以和三角矩阵的存储结合起来。

### 对角矩阵

直接存储为数组（数量阵可以通过参数指定）

###Matrix types in the LAPACK naming scheme

| BD   | bidiagonal                                                   |
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

