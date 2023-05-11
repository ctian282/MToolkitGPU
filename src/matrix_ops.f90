  
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

  stat = cublasDgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, mat1(:,1), m, mat2(:,1), k, beta, mat3(:,1), m)
  
  return
end



SUBROUTINE matrix_eigen( handle, A, n, W, devinfo)

  use cusolverDn
  use cudafor
 
  implicit none

  type(cusolverDnHandle), intent(in) :: handle
  integer(4), intent(in)  :: n
  integer(4) :: lwork
  real(8), dimension(1:n, 1:n), device  :: A
  real(8), dimension(1:n), device  :: W

  real(8), dimension(:), allocatable, device   :: work_space

  integer(4), device :: devinfo
  integer                 :: stat

  stat = cusolverDnDsyevd_buffersize(handle, CUSOLVER_EIG_MODE_VECTOR, CUBLAS_FILL_MODE_LOWER, n, A, n, W, lwork)
  allocate( work_space(1:lwork) )
  
  stat = cusolverDnDsyevd(handle, CUSOLVER_EIG_MODE_VECTOR, CUBLAS_FILL_MODE_LOWER, n, A, n, W, work_space, lwork, devinfo)
  return
end



SUBROUTINE matrix_svd( handle, A, m, n, S,U, VT, devinfo)

  use cusolverDn
  use cudafor
 
  implicit none

  type(cusolverDnHandle), intent(in) :: handle
  integer(4), intent(in)  :: m, n
  integer(4) :: lwork
  real(8), dimension(1:m, 1:n), device  :: A
  real(8), dimension(1:m, 1:m), device  :: U
  real(8), dimension(1:n, 1:n), device  :: VT
  real(8), dimension(1:n), device  :: S

  real(8), dimension(:), allocatable, device   :: work_space, rwork

  integer(4), device :: devinfo
  integer                 :: stat

  stat = cusolverDnDgesvd_buffersize(handle, m, n, lwork)
  allocate( work_space(1:lwork) )
  allocate( rwork(1:lwork) )
  
  stat = cusolverDnDgesvd(handle,'A', 'A', m, n, A, m, S, U, m, VT, m, work_space, lwork, rwork, devinfo)
  return
end

