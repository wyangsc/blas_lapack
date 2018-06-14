!关于blas矩阵的存储方式
!level 2 B=alpha*A*x+beta*B为例
program main
use mytest
implicit none
!一般矩阵A1
real::A1(4,4)
data A1 /1,2,3,4,5,6,7,8,9,1,2,3,4,5,5,7/
!1 5 9 4
!2 6 1 5
!3 7 2 5
!4 8 3 7
!对称矩阵A2
!real::A2(10)
!data A2 /1,2,3,4,5,6,7,8,9,10/
real::A2(4,4)
data A2 /1,0,0,0,2,5,0,0,3,6,8,0,4,7,9,10/
!1 2 3 4
!2 5 6 7
!3 6 8 9
!4 7 9 10
!三角矩阵
real::A3(4,4)
 data A3 /1,0,0,0,2,5,0,0,3,6,8,0,4,7,9,10/
!1 2 3 4
!0 5 6 7
!0 0 8 9
!0 0 0 10
!带状矩阵
real::A4(3,4)
data A4 /0,1,2,2,5,5,6,8,6,9,10,0/
!1 2 0 0
!2 5 6 0
!0 5 8 9
!0 0 6 10
real::x(4)=(/1,2,3,4/)
real::B(4)=(/1,1,1,1/)
real::alpha=1.0,beta=0
integer::incA=1,incB=1
call sgemv('N',4,4,alpha,A1,4,X,incA,beta,B,incB) 
!M,N确定矩阵本来的样子
call printMatrix1D(B,4)
!SUBROUTINE SGBMV(TRANS,M,N,KL,KU,ALPHA,A,LDA,X,INCX,BETA,Y,INCY) KL KU指定矩阵存储时相对于主对角线的带偏移
call sgbmv('N',4,4,1,1,alpha,A4,3,X,incA,beta,B,incB)
call printMatrix1D(B,4)
!SUBROUTINE SSYMV(UPLO,N,ALPHA,A,LDA,X,INCX,BETA,Y,INCY)
call ssymv('U',4,alpha,A2,4,X,1,beta,B,1)
call printMatrix1D(B,4)
!SUBROUTINE STRMV(UPLO,TRANS,DIAG,N,A,LDA,X,INCX)
call strmv('U','n','n',4,A3,4,X,incA)
call printMatrix1D(X,4)
!stbmv配合band和tri
end program main
