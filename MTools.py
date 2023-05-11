
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
    def __init__(self, use_svd=False):
        if(use_svd == True):
            MT.init(1)
        else:
            MT.init(0)
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
        #mat3 = np.asfortranarray((m, n), dtype=np.double)
        mat3 = np.ones((m, n), order='F')
        MT.get_mat3(mat3, m, n)
        #print(mat3)
        return mat3


    def get_W1(self):
        m = MT.matrix_data_module.m1
        W1 = np.ones((m), order='F')
        MT.get_w1(W1, m)
        return W1

    def get_U1(self):
        m = MT.matrix_data_module.m1
        #n = MT.matrix_data_module.n1
        U1 = np.ones((m, m), order='F')
        MT.get_u1(U1, m, m)
        return U1
    def get_S1(self):
        n = MT.matrix_data_module.n1
        S1 = np.ones((n), order='F')
        MT.get_s1(S1, n)
        return S1
    def get_VT1(self):
        m = MT.matrix_data_module.m1
        n = MT.matrix_data_module.n1
        VT1 = np.ones((n, n), order='F')
        MT.get_vt1(VT1, n, n)
        return VT1

    
    def mm12(self):
        MT.mm12()
        return

    def m1_eigen(self):

        MT.mat1_eigen()
        return

    def m1_svd(self):

        MT.mat1_svd()
        return

