CC=gcc
CXX=g++
FC=gfortran
CFLAGS=-fpic -c 
LDFLAGS=-L. -lmytest liblapack.a  librefblas.a  libtmglib.a
lib=libmytest.so
MAIN:=main
OBJLIB=printmatrix.o
	
all:$(MAIN)
$(MAIN):  $(lib) $(FILE)
	$(FC) $(FILE) -g -o main $(LDFLAGS)

$(lib) : $(OBJLIB)
	$(FC) -shared $^ -o $@
$(OBJLIB):%.o:%.f90
	@$(FC) $(CFLAGS) $<  -o $@ 
.PHONY:clean
clean:
	-rm *.o
	-rm main $(lib)
