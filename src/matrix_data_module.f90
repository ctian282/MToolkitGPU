module matrix_data_module
  use cublas_v2
  use cudafor

  implicit none

  real(8),    save, public                                :: pi=3.1415926535897932384626433833

  integer(4), save, public                                :: n1, m1, n2, m2, n3, m3

  real(8),    save, public, dimension(:,:), allocatable, device   :: mat1, mat2, mat3

  type(cublasHandle) :: handle
  !integer(cuda_stream_kind), dimension(:), allocatable :: cu_streams

  
end module matrix_data_module
