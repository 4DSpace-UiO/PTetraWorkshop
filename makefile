OBJS=	mptetra.o
FLAGS=	-O3 -r8 -warn
FLAGS=	-O0 -g -C -r8 -check -traceback
FLAGS=	-O2 -fdefault-real-8 -fdefault-double-8 -static-libgfortran
FLAGS=	-O0 -fcheck=all -fcheck=bounds -fdefault-real-8 -fdefault-double-8
FLAGS=	-O3 -fdefault-real-8 -fdefault-double-8

SPARSKIT= -L/home/richard/lib/ -lskit
BLAS= -L/home/richard/lib/ -lblas
#BLAS=	-L/opt/intel/mkl/10.0.1.014/lib/32/ -lmkl_core.so -lmkl_blas95.a

#put the libblas.a and libskit files directly in this directory or somehow
#arrange for the linker to know where to find them

#F90=	g95
#F90=	gfortran
F90=	ifort
F90=	openmpiifort
F90=	mpif90
F90=	mpifort

mptetra:	mptetra.o
	$(F90) -o mptetra $(FLAGS) $(OBJS) libskit.a libblas.a
#	$(F90) -o mptetra $(FLAGS) $(OBJS) $(SPARSKIT) $(BLAS)

mptetra.o:	mptetra.f90
	$(F90) -c $(FLAGS) mptetra.f90

clean:
	rm -f mptetra $(OBJS) *.mod *__*
