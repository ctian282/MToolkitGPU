
SUBROUTINE init(use_svd_in)
  use matrix_data_module
  use cublas_v2
  use cusolverDn
  implicit none

  integer(4) :: stat, use_svd_in
  stat = cublasCreate(handle)
  stat = cublasSetPointerMode(handle, CUBLAS_POINTER_MODE_DEVICE)

  stat = cusolverDnCreate(cusolver_handle)
  use_svd = use_svd_in
     
end

SUBROUTINE set_mat1(mat1_in, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(in)  :: mat1_in(1:m, 1:n)

  ! (re) allocate matrix array
  if ( (m.ne.m1 .or. n.ne.n1)  ) then
     if (allocated(mat1))  deallocate(mat1)
     
     allocate( mat1(1:m, 1:n) )
     if(m.eq.n) allocate( W1(1:m) )

     if(use_svd .gt. 0) then
        allocate(S1(1:m))
        allocate(U1(1:m, 1:m))
        allocate(VT1(1:n, 1:n))
     end if
  endif
  
  m1 = m
  n1 = n

  mat1 = mat1_in
  
end


SUBROUTINE set_mat2(mat2_in, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(in)  :: mat2_in(1:m, 1:n)

  ! (re) allocate matrix array
  if ( (m.ne.m2 .or. n.ne.n2)  ) then
     if (allocated(mat2))  deallocate(mat2)
     
     allocate( mat2(1:m, 1:n) )
     if(m.eq.n) allocate( W2(1:m) )
     if(use_svd .gt. 0) then
        allocate(S2(1:m))
        allocate(U2(1:m, 1:m))
        allocate(VT2(1:n, 1:n))
     end if

  endif

  
  m2 = m
  n2 = n

  mat2 = mat2_in
  
end

SUBROUTINE set_mat3(mat3_in, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(in)  :: mat3_in(1:m, 1:n)

  ! (re) allocate matrix array
  if ( (m.ne.m3 .or. n.ne.n3)  ) then
     if (allocated(mat3))  deallocate(mat3)
     
     allocate( mat3(1:m, 1:n) )
     if(m.eq.n) allocate( W3(1:m) )
     if(use_svd .gt. 0) then
        allocate(S3(1:m))
        allocate(U3(1:m, 1:m))
        allocate(VT3(1:n, 1:n))
     end if

  endif

  
  m3 = m
  n3 = n

  mat3 = mat3_in
end



SUBROUTINE get_mat1(mat1_out, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(out)  :: mat1_out(1:m, 1:n)

  mat1_out = mat1
  
end

SUBROUTINE get_mat2(mat2_out, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(out)  :: mat2_out(1:m, 1:n)

  mat2_out = mat2
  
end


SUBROUTINE get_mat3(mat3_out, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(out)  :: mat3_out(1:m, 1:n)

  mat3_out = mat3  
end

SUBROUTINE get_w1(W1_out, m)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m
  real(8), intent(out)  :: W1_out(1:m)

  W1_out = W1
end

SUBROUTINE get_w2(W2_out, m)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m
  real(8), intent(out)  :: W2_out(1:m)

  W2_out = W2
end


SUBROUTINE get_w3(W3_out, m)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m
  real(8), intent(out)  :: W3_out(1:m)

  W3_out = W3  
end

SUBROUTINE get_s1(S1_out, m)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m
  real(8), intent(out)  :: S1_out(1:m)

  S1_out = S1
end

SUBROUTINE get_u1(U1_out, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(out)  :: U1_out(1:m, 1:n)

  U1_out = U1
end

SUBROUTINE get_vt1(VT1_out, m, n)
  use matrix_data_module
  implicit none

  integer(4), intent(in)  :: m, n
  real(8), intent(out)  :: VT1_out(1:m, 1:n)

  VT1_out = VT1
end

