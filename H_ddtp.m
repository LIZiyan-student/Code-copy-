function H_dt=H_ddtp(H,m,dt,N2,K)
   format long;
%m是精确度，而不再是所谓的项数。
   H=H/K;
   dt=dt*K;
   I = sparse(eye(N2));
   T0 = I;
   T1 = -1i*H;
   H_dt=besselj(0,dt)*I+2*besselj(1,dt)*(-1i)*H;
   k = 2;
   while besselj(k,dt) > m %也不能parfor,因为这里涉及迭代
        T=T0;
        T0=T1;
        T1=-2i*H*T0+T;
        H_dt=H_dt+2*besselj(k,dt)*T1;
        k=k+1;
   end
end
   