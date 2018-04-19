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

function [Au,Bu,Cu,Du,Av,Bv,Cv,Dv]=Parameters(w_n,z,dt,k)
% z为阻尼比，dt为时间间距，w_n为natural frequency，w_d为damping frequency
w_d=w_n*sqrt(1-z^2);
% 定义几个计算的系数，方便程序编写
e=exp(-z*w_n*dt);
s=sin(w_d*dt);
c=cos(w_d*dt);
ze=z/sqrt(1-z^2);
% 套公式计算出系数，下表u表示位移，v表示速度
Au=e*(ze*s+c);
Bu=e*(1/w_d*s);
Cu=1/k*(2*z/w_n/dt+e*(((1-2*z^2)/w_d/dt-ze)*s-(1+2*z/w_n/dt)*c));
Du=1/k*(1-2*z/w_n/dt+e*((2*z^2-1)/w_d/dt*s+2*z/w_n/dt*c));
Av=-e*(w_n/sqrt(1-z^2)*s);
Bv=e*c-ze*s;
Cv=1/k*(-1/dt+e*((w_n*ze/z+ze/dt)*s+1/dt*c));
Dv=1/k/dt*(1-e*(ze*s+c));
end