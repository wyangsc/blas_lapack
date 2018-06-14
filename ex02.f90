!线性方程组的解
program main
use mytest
implicit none
!一般矩阵A1
real::A1(4,4)
data A1 /1,2,3,4,5,6,7,8,9,1,2,3,1,2,3,4/
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
integer::IPIV(4)
real::B(4,2)
data B /1,1,1,1,1,2,3,4/
real::alpha=1.0,beta=0
integer::incA=1,incB=1
integer::info
!SUBROUTINE SGESV( N, NRHS, A, LDA, IPIV, B, LDB, INFO )
call sgesv(4,2,A1,4,IPIV,B,4,info)
write(*,*) 'info=',info
call printMatrix2D(B,4,2)
end program main
