clc;
clear;
beta=0:0.01:3;
% 加速度放大系数的图像，在位移放大系数的基础上，函数值多乘以阻尼比的平方
% 即 Ra=Rd*(beta)^2

zeta=0.2;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

% 开启网格
grid on
hold on;

zeta=0.5;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=0.7;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=1;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=0;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

% 坐标轴的显示范围
axis([0 3 0 4])


xlabel('\beta=w/w_n');
ylabel('R(t)');
title('Acceleration Magnification Factor');
