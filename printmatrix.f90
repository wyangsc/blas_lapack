module mytest

contains
subroutine printMatrix1D(M,c)
    implicit none
    integer c
    real:: M(c)
    integer::j
    character(len=20)::format
    write(format,'(A1,i4,A6,A1)') '(',c,'f10.3',')'
    write(*,format) (M(j),j=1,c)
end subroutine printMatrix1D

subroutine printMatrix2D(M,c,r)
    implicit none
    integer c,r
    real:: M(:,:)
    integer::i,j
    character(len=20)::format
    write(format,'(A1,i4,A6,A1)') '(',r,'f10.3',')'
    do i=1,c
    write(*,format) (M(i,j),j=1,r)
    end do
end subroutine printMatrix2D

end module mytest
