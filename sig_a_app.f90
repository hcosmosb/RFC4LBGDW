!f2py -c sig_a_app.f90 -m sig_a_app
!CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
!CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
!CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
double precision function sig_a_app(dl_a_Angst,T_in)
 implicit none
 double precision, intent(IN) :: dl_a_Angst, T_in
 double precision :: x,x2,z,q, a_V, phi_app, dnu_a, Delnu_D, l_a_Angst=1216d0
 real :: c_sl = 2.99792e10, k_boltz = 1.380648e-16, m_p = 1.6726219e-24,&
  pi=3.141592

 a_V = 4.7d-4*(T_in/1d4)**(-0.5d0)
 dnu_a = c_sl/((dl_a_Angst+l_a_Angst)*1d-8) - c_sl/(l_a_Angst*1d-8)
 Delnu_D=2.46d15*(2d0*k_boltz*T_in/(m_p*c_sl**2))**0.5
 x=abs(dnu_a/Delnu_D);x2=x**2
 z=(x2-0.855)/(x2+3.42)
 if(z.le.0)  then
  q=0d0
 else
  q=z*(1.+21./x2)*a_V/pi/(x2+1)*(0.1117+z*(4.421+z*(-9.207+5.674*z)))
 endif
 phi_app=(q+exp(-x2)/1.77245385)*sqrt(pi)
 !phi_app=(q+exp(-x2))
 sig_a_app = phi_app*5.889d-14*(T_in/1d4)**(-0.5)
end function sig_a_app
