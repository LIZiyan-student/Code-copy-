function H=H_f(N)
%稀疏矩阵的绘制
N2 = N*N;
H = zeros(N2,N2);

%处理第一行
%parfor处理的必须是consecutive(连续的),正的整数，再加上其实赋值只是小运算，所以其实不用parfor更快一点
H(1,2)=-1; H(1,N+1)=-1; H(1,N)=-1;
for n = 3:2:N
    H(n,n-1)=-1;H(n,n+1)=-1;H(n,n+N)=-1;
end
for n = 2:2:N-1
    H(n,n-1)=-1;H(n,n+1)=-1;H(n,N*(N-1)+n)=-1;
end
H(N,N-1)=-1;H(N,N2)=-1;H(N,1)=-1;

%处理最后一行
H(N*(N-1)+1,N*(N-1)+1-N)=-1;H(N*(N-1)+1,N*(N-1)+2)=-1;H(N*(N-1)+1,N2)=-1;
for n = 3:2:N
    H(N*(N-1)+n,N*(N-1)+n-1)=-1;H(N*(N-1)+n,N*(N-1)+n+1)=-1;H(N*(N-1)+n,N*(N-1)+n-N);
end
for n = 2:2:N-1
    H(N*(N-1)+n,N*(N-1)+n-1)=-1;H(N*(N-1)+n,N*(N-1)+n+1)=-1;H(N*(N-1)+n,n);
end
H(N2,N2-1)=-1;H(N2,N2-N+1)=-1;H(N2,N)=-1;
%处理奇数行
for m = 3:2:N
    H((m-1)*N+1,(m-1)*N+2)=-1;H((m-1)*N+1,m*N+1)=-1;H((m-1)*N+1,m*N)=-1;
    H(m*N,m*N-1)=-1; H(m*N,m*N-N)=-1; H(m*N,(m-1)*N+1)=-1;
    for n = 3:2:N
        H((m-1)*N+n,(m-1)*N+n-1)=-1; H((m-1)*N+n,(m-1)*N+n+1)=-1; H((m-1)*N+n,(m-1)*N+n+N)=-1;
    end
end
for m = 3:2:N
    for n = 2:2:N-1
        H((m-1)*N+n,(m-1)*N+n-1)=-1; H((m-1)*N+n,(m-1)*N+n+1)=-1; H((m-1)*N+n,(m-1)*N+n-N)=-1;
    end
end
%处理偶数行
for m = 2:2:N-1
    H((m-1)*N+1,(m-1)*N+2)=-1; H((m-1)*N+1,(m-2)*N+1)=-1; H((m-1)*N+1,m*N)=-1;
    H(m*N,m*N-1)=-1;H(m*N,m*N+N)=-1;H(m*N,(m-1)*N+1)=-1; 
    for n = 3:2:N
        H((m-1)*N+n,(m-1)*N+n-1)=-1;  H((m-1)*N+n,(m-1)*N+n+1)=-1;  H((m-1)*N+n,(m-1)*N+n-N)=-1;
    end
end 
for m = 2:2:N-1
    for n = 2:2:N-1
        H((m-1)*N+n,(m-1)*N+n-1)=-1;H((m-1)*N+n,(m-1)*N+n+1)=-1;H((m-1)*N+n,(m-1)*N+n+N)=-1;
    end
end
H = H/3;
% H = sparse(H);
end
