import MTools
import numpy as np

mt = MTools.MTools()

m1 = 2
n1 = 3
m2 = n1
n2 = 4

m3 = m1
n3 = n2

mat1 = np.random.rand(m1, n1)
mat2 = np.random.rand(m2, n2)
mat3 = np.random.rand(m3, n3)


#mat1 = np.ones((m1, n1))
#mat2 = np.ones((m2, n2))
#mat3 = np.ones((m3, n3))


mt.set_m1(mat1)

mt.set_m2(mat2)
mt.set_m3(mat3)



print(mt.get_m1())
print(mt.get_m2())
print(mt.get_m3())

mt.mm12()

print(mt.get_m3())

print('True m3 is')
print(np.matmul(mat1, mat2))
