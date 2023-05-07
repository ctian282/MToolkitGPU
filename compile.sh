#!/bin/bash


echo ${1}
rm -rf obj/

mkdir obj

cp -r src/ obj/

cd obj


export FC=nvfortran

cmake ..

make -j4
    
cp *.mod src/



f90wrap -m MT -k src/kind_map  src/matrix_main.f90 src/matrix_data_init.f90 src/matrix_data_module.f90

LDFLAGS="-cpp -Mcuda -acc -Mcudalib=cublas -fPIC -lcufft -pgf90libs " f2py-f90wrap --fcompiler=nv -c -m _MT f90wrap_*.f90 --f90flags="-cpp -acc -Mcuda -Mcudalib=cublas -pgf90libs" *.a
