function out=H_tp(in,m,dt,N,S)
   dt=S*dt;
   T0 = in;
   T1 = -1i*tran_H(in,N,S);
   out=besselj(0,dt)*T0+2*besselj(1,dt)*T1;
   k = 2;
   while besselj(k,dt) > m
        T=T0;
        T0=T1;
        T1=-2i*tran_H(T0,N,S)+T;
        out=out+2*besselj(k,dt)*T1;
        k=k+1;
   end
end
   