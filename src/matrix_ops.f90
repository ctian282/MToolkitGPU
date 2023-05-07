
SUBROUTINE matrix_mul( handle, mat1, mat2, mat3, m, k, n, alpha, beta)
  ! use matrix_data_module
  use cublas_v2
  use cudafor

  implicit none

  type(cublasHandle), intent(in) :: handle
  integer(4), intent(in)  :: m, k, n
  real(8), intent(in), device :: alpha, beta
  !real(8), device  :: mat1(0:m-1, 0:k-1), mat2(0:k-1, 0:n-1),   mat3(0:m-1, 0:n-1)
  real(8), device  :: mat1(1:m, 1:k), mat2(1:k, 1:n),   mat3(1:m, 1:n)

  integer                 :: stat
  integer(cuda_stream_kind):: stream
  real(8)  :: tmp3(1:m, 1:n), tmp1(1:m, 1:k), tmp2(1:k, 1:n)
  
  !stat = cublasSetStream(handle, stream)

  mat3 = 0
  !write(*, *) m, n, k
  !stat = cublasDgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, mat1(:,1), m, mat2(:,1), k, beta, mat3(:,1), m)
  stat = cublasDgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, mat1, m, mat2, k, beta, mat3, m)

  stat = cudaDeviceSynchronize()
  !tmp1 = mat1
  !tmp2 = mat2
  tmp3 = mat3
  
  
  return
end


SUBROUTINE mm_12()
  use matrix_data_module
  implicit none

  call matrix_mul(handle, mat1, mat2, mat3, m1, n1, n2, 1, 0)
  
end
