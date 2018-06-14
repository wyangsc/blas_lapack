!最小二乘法
program main
use mytest
implicit none
real::A(5,4)
data A /1,2,3,4,4,3,2,1,3,4,5,6,3,4,5,6,7,12,3,4/
real::B(5,1)
data B /2,3,4,3,0/
integer::info
real::work(40)
integer::lwork=40
call sgels ('N',5,4,1,A,5,B,5,work,lwork,info)
call printMatrix1D(B,4)
!SUBROUTINE SGELS( TRANS, M, N, NRHS, A, LDA, B, LDB, WORK, LWORK,INFO )

end program main
