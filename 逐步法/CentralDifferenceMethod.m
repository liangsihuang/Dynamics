function [u,v,a]=CentralDifferenceMethod(p,t_aim,k,m,c,dt)
n=length(p);
nc=t_aim/dt+1;
p_new=p;
if nc>n
    p_new=zeros(1,nc);
    for i=1:n
        p_new(i)=p(i)+p_new(i);
    end
end

u=zeros(1,nc);
v=zeros(1,nc);
a=zeros(1,nc);

% 需要给定初位移和初速度
u(1)=0;
v(1)=0;
% intitial calculation
% 初加速度
a(1)=(p_new(1)-c*v(1)-k*u(1))/m;
% u(-1)
u_1=u(1)-dt*v(1)+dt^2/2*a(1);
% 一些parameters
k_hat=m/dt^2+c/2/dt;
A=m/dt^2-c/2/dt;
B=k-2*m/dt^2;
% 由于matlab下标从1开始，需要补充计算一个
p_hat=p_new(1)-A*u_1-B*u(1);
u(2)=p_hat/k_hat;
% calculation for time step i
for i=2:nc
    p_hat=p_new(i)-A*u(i-1)-B*u(i);
    u(i+1)=p_hat/k_hat;
    v(i)=(u(i+1)-u(i-1))/2/dt;
    a(i)=(u(i+1)-2*u(i)+u(i-1))/dt^2;
end

end