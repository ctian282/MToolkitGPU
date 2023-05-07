


! mat 1 X mat 2 --> mat3
SUBROUTINE mm12()
  use matrix_data_module

  use cublas_v2
  use cudafor

  implicit none

  call matrix_mul( handle, mat1, mat2, mat3, m1, n1, n2, 1.0, 0.0)
  
end
