


! mat 1 X mat 2 --> mat3
SUBROUTINE mm12()
  use matrix_data_module

  implicit none

  call matrix_mul( handle, mat1, mat2, mat3, m1, n1, n2, 1.d0, 0.d0)
  
end
