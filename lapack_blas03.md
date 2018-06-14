# 线性方程组的解

## 矩阵的运算$Ax=B$(ex02.f90)

| Type of matrix                     |   Operation   | Single precision | Double precision |        |         |
| ---------------------------------- | :-----------: | :--------------: | :--------------: | :----: | :-----: |
| and storage scheme                 |               |       real       |     complex      |  real  | complex |
| general                            | simple driver |      SGESV       |      CGESV       | DGESV  |  ZGESV  |
|                                    | expert driver |      SGESVX      |      CGESVX      | DGESVX | ZGESVX  |
| general band                       | simple driver |      SGBSV       |      CGBSV       | DGBSV  |  ZGBSV  |
|                                    | expert driver |      SGBSVX      |      CGBSVX      | DGBSVX | ZGBSVX  |
| general tridiagonal                | simple driver |      SGTSV       |      CGTSV       | DGTSV  |  ZGTSV  |
|                                    | expert driver |      SGTSVX      |      CGTSVX      | DGTSVX | ZGTSVX  |
| symmetric/Hermitian                | simple driver |      SPOSV       |      CPOSV       | DPOSV  |  ZPOSV  |
| positive definite                  | expert driver |      SPOSVX      |      CPOSVX      | DPOSVX | ZPOSVX  |
| symmetric/Hermitian                | simple driver |      SPPSV       |      CPPSV       | DPPSV  |  ZPPSV  |
| positive definite (packed storage) | expert driver |      SPPSVX      |      CPPSVX      | DPPSVX | ZPPSVX  |
| symmetric/Hermitian                | simple driver |      SPBSV       |      CPBSV       | DPBSV  |  ZPBSV  |
| positive definite band             | expert driver |      SPBSVX      |      CPBSVX      | DPBSVX | ZPBSVX  |
| symmetric/Hermitian                | simple driver |      SPTSV       |      CPTSV       | DPTSV  |  ZPTSV  |
| positive definite tridiagonal      | expert driver |      SPTSVX      |      CPTSVX      | DPTSVX | ZPTSVX  |
| symmetric/Hermitian                | simple driver |      SSYSV       |      CHESV       | DSYSV  |  ZHESV  |
| indefinite                         | expert driver |      SSYSVX      |      CHESVX      | DSYSVX | ZHESVX  |
| complex symmetric                  | simple driver |                  |      CSYSV       |        |  ZSYSV  |
|                                    | expert driver |                  |      CSYSVX      |        | ZSYSVX  |
| symmetric/Hermitian                | simple driver |      SSPSV       |      CHPSV       | DSPSV  |  ZHPSV  |
| indefinite (packed storage)        | expert driver |      SSPSVX      |      CHPSVX      | DSPSVX | ZHPSVX  |
| complex symmetric                  | simple driver |                  |      CSPSV       |        |  ZSPSV  |
| (packed storage)                   | expert driver |                  |      CSPSVX      |        | ZSPSVX  |

### sgesv为例

解形如$$A_{n}*X_{n,m}=B_{n,m}$$的方程:

由代数学定理，如果$$\det(A)\neq 0 $$　则存在一个置换方阵$$P_n$$，使得$$A_n=P_n*L_n*U_n$$,其中$$L_n$$是下三角矩阵，$$U_n$$是一个上三角矩阵，这样我们可以通过解$$P_nZ=B => L_n*Y=Z=>U_n*X=Y$$

解得X。

当$$\det(A) =0 $$如果B的列向量不全在A的列向量张成的空间中，方程将无解，反之无穷解。这时候sgesv会设置info参数来告知。(info!=0,说明计算失败)







