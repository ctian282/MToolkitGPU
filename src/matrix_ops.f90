  
SUBROUTINE matrix_mul( handle, mat1, mat2, mat3, m, k, n, alpha, beta)

  use cublas_v2
  use cudafor

  implicit none

  type(cublasHandle), intent(in) :: handle
  integer(4), intent(in)  :: m, k, n
  real(8), intent(in) :: alpha, beta
  real(8), dimension(1:m, 1:k), device  :: mat1
  real(8), dimension(1:k, 1:n), device  :: mat2
  real(8), dimension(1:m, 1:n), device  :: mat3

  integer                 :: stat
  !integer(cuda_stream_kind):: stream

  !stat = cudaStreamCreate(stream)
  !stat = cublasSetStream(handle, stream)

  !write(*, *) m, k, n, alpha, beta
  stat = cudaDeviceSynchronize()
  stat = cublasDgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, mat1(:,1), m, mat2(:,1), k, beta, mat3(:,1), m)
  
  return
end


