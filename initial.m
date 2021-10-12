function in = initial(N)
format long;
N2 = N*N;
int1 = unifrnd(-1,1,N2,1);%随机生成N2*1矩阵实部
int2 = 1i*unifrnd(-1,1,N2,1);%随机生成N2*1矩阵虚部
in = int1+int2;

%归一化
int2 = in.*in; 
int2 = abs(int2);
S = sum(int2(:));
S = sqrt(S);
in = in/S;
end



