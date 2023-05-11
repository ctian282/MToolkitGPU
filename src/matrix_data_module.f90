module matrix_data_module
  use cublas_v2
  use cudafor
  use cusolverDn
  implicit none

  real(8),    save, public                                :: pi=3.1415926535897932384626433833

  integer(4), save, public                                :: n1, m1, n2, m2, n3, m3

  real(8),    save, public, dimension(:,:), allocatable, device   :: mat1, mat2, mat3

  ! eigen vectors
  real(8),    save, public, dimension(:), allocatable, device   :: W1, W2, W3

  real(4),    save, public :: use_svd
  real(8),    save, public, dimension(:), allocatable, device   :: S1, S2, S3
  real(8),    save, public, dimension(:,:), allocatable, device   :: U1, U2, U3
  real(8),    save, public, dimension(:,:), allocatable, device   :: VT1, VT2, VT3
  

  integer(4), device :: devinfo1, devinfo2, devinfo3
  
  type(cublasHandle) :: handle
  type(cusolverDnHandle) :: cusolver_handle
  !integer(cuda_stream_kind), dimension(:), allocatable :: cu_streams

  
end module matrix_data_module
