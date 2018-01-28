function [u,v]=ExcitationInterpolationMethod(p,t_aim,w_n,zeta,dt,k)
% t为想要计算到的时刻，因为荷载结束后，还有衰减的自由振动
n=length(p);
nc=t_aim/dt+1;  %Matlab下标从1开始
% 在荷载后面补0
p_new=p;
if nc>n
    p_new=zeros(1,nc);
    for i=1:n
        p_new(i)=p(i)+p_new(i);
    end
end

% 定义初始值，初位移和初速度应为已知值
u=zeros(1,nc);
v=zeros(1,nc);
u(1)=0;
v(1)=0;

% 正式计算
[Au,Bu,Cu,Du,Av,Bv,Cv,Dv]=Parameters(w_n,zeta,dt,k);
for i=1:(nc-1)
    u(i+1)=Au*u(i)+Bu*v(i)+Cu*p_new(i)+Du*p_new(i+1);
    v(i+1)=Av*u(i)+Bv*v(i)+Cv*p_new(i)+Dv*p_new(i+1);
end

end