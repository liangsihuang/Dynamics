function [u,v,a]=NewmarkMethod(gama,beta,p,t_aim,k,m,c,dt)
% 输入：
% 算法参数gama, beta，荷载向量p，需要计算到的反应时间点t_aim
% 单质点体系的刚度k，质量m，阻尼c，计算时间间距dt
% 输出：单质点体系的位移，速度，加速度反应向量

% 若荷载持续时间比要计算到的时间短，需要在荷载向量后面补0
n=length(p);
nc=t_aim/dt;
p_new=p;
if nc>n
    p_new=zeros(1,nc+1);
    for i=1:n
        p_new(i)=p(i)+p_new(i);
    end
end
% 不需要提前声明变量吗？是的，但是矩阵存储空间是变化的,matlab会提醒：
% 预先分配内存以提高运算速度
u=zeros(1,nc+1);
v=zeros(1,nc+1);
a=zeros(1,nc+1);

% 需要给定初位移和初速度
u(1)=0;
v(1)=0;
% 初加速度根据运动方程算
a(1)=(p_new(1)-c*v(1)-k*u(1))/m;
% parameters
k_hat=k+gama/beta/dt*c+1/beta/dt^2*m;%u(i+1)前系数
a1=1/beta/dt^2*m+gama/beta/dt*c;%u(i)前系数
a2=1/beta/dt*m+(gama/beta-1)*c;%v(i)前系数
a3=(1/2/beta-1)*m+dt*(gama/2/beta-1)*c;%a(i)前系数
% calculation for time step i
for i=2:(nc+1)
    p_hat=p_new(i)+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u(i)=p_hat/k_hat;
    v(i)=gama/beta/dt*(u(i)-u(i-1))+(1-gama/beta)*v(i-1)...
        +dt*(1-gama/2/beta)*a(i-1);
    %a(i)=1/beta/dt^2*(u(i)-u(i-1))-1/beta/dt*v(i-1)-(1/2/beta-1)*a(i-1);
    %加速度不用递推公式，而用运动方程反算，强行满足运动方程
    a(i)=(p_new(i)-c*v(i)-k*u(i))/m;
end

end