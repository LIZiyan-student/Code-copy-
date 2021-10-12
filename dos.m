function d=dos(N,m,e)
%能量e是这里唯一没有确定的变量
format long;
in = initial(N);   %不能parfor
N2 = N*N;
for n = 1 : 1 : 4 %前后相关，不能parfor并发
   in = in+initial(N);
end
in = in/5;

%归一化；
H = H_f(N);        %不能parfor,因为这里n增2？ 
S = 4;

dt = 0.0001; %事实证明，只有当时间微元取得足够小时，这个积分才具有一定的精确度
%我他喵是没想到呀，de了两个星期的bug,原来是因为dt不够小。

H_fai = in;
d0 = sum(conj(in).*H_fai)*dt;
H_dtp = H_ddtp(H,m,dt,N2,S);   %也不能parfor,因为涉及迭代

d = 0;
for n = 1 : 1 : 1000000 %这里是迭代，前后相继，不能并发迭代
    H_fai = H_dtp*H_fai;
    media = sum(conj(in).*H_fai)*dt;
    d = d+media*exp(1i*e*n*dt)+conj(media)*exp(1i*e*n*dt);
end

d = d0+d;
% syms x;
% d=int(exp(1i*E*x)*total(in,N,x,m),x,-inf,+inf);
d = d/(2*pi);
d =abs(real(d));
end

