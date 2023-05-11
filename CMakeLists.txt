project(MTools)
cmake_minimum_required(VERSION 3.16.2)


enable_language (Fortran)

set(CMAKE_Fortran_COMPILER  nvfortran)


file(GLOB MTOOLS_SOURCES src/matrix_data_module.f90 src/matrix_main.f90 src/matrix_ops.f90 src/matrix_data_init.f90 )






message("Will compile with GPU (supported by openacc)")
set(CMAKE_Fortran_FLAGS "-fPIC -O3 -fopenmp -Mcuda -Mcudalib=cublas, cusolver -lcufft -acc -fast -cpp")


add_library(MTools_fort STATIC ${MTOOLS_SOURCES})

#set(CMAKE_VERBOSE_MAKEFILE ON)

