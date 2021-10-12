function draw_for(N,m,L)
format long;
% 先引入初始的波函数,原始信号
%m是切比雪夫近似中的项数，L是能量的长度。

tic
e = -L: 0.01: L;
DOS = dos(N,m,e);
% 加窗信号
% win = hann(length(e));
% DOS1 = DOS.*win';
% 作图

plot(e,DOS,'b')
t=toc

title('DOS of Graphene');
end