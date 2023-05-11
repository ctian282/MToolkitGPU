


! mat 1 X mat 2 --> mat3
SUBROUTINE mm12()
  use matrix_data_module

  implicit none

  call matrix_mul( handle, mat1, mat2, mat3, m1, n1, n2, 1.d0, 0.d0)
  
end


! mat 1 X mat 2 --> mat3
SUBROUTINE mat1_eigen()
  use matrix_data_module

  implicit none

  call matrix_eigen( cusolver_handle, mat1, m1, W1, devinfo1)
  
end


! mat 1 X mat 2 --> mat3
SUBROUTINE mat1_svd()
  use matrix_data_module

  implicit none

  call matrix_svd( cusolver_handle, mat1, m1, n1, S1, U1, VT1, devinfo1)
  
end
