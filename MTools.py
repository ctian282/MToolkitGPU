
import sys
from pathlib import Path
path = Path(__file__).parent 
sys.path.append(str(path.resolve()) + '/obj/')
import MT

import numpy as np
import healpy as hp

import time

import numba
from numba import cuda

class MTools:
    def __init__(self):
        MT.init()
        return

    def set_m1(self, mat):
        mat = np.asfortranarray(mat)
        m = mat.shape[0]
        n = mat.shape[1]
        #print(mat1)
        MT.set_mat1(mat, m, n)
    def set_m2(self, mat):
        mat = np.asfortranarray(mat)
        m = mat.shape[0]
        n = mat.shape[1]
        MT.set_mat2(mat, m, n)
    def set_m3(self, mat):
        mat = np.asfortranarray(mat)
        m = mat.shape[0]
        n = mat.shape[1]
        MT.set_mat3(mat, m, n)

    def get_m1(self):
        m = MT.matrix_data_module.m1
        n = MT.matrix_data_module.n1
        mat1 = np.ones((m, n), order='F')
        MT.get_mat1(mat1, m, n)
        #print(mat1)
        return mat1

    def get_m2(self):
        m = MT.matrix_data_module.m2
        n = MT.matrix_data_module.n2
        mat2 = np.ones((m, n), order='F')
        MT.get_mat2(mat2, m, n)
        #print(mat1)
        return mat2
    
    def get_m3(self):
        m = MT.matrix_data_module.m3
        n = MT.matrix_data_module.n3
        print(m, n)
        #mat3 = np.asfortranarray((m, n), dtype=np.double)
        mat3 = np.ones((m, n), order='F')
        MT.get_mat3(mat3, m, n)
        #print(mat3)
        return mat3

    
    def mm12(self):
        MT.mm12()
        return

