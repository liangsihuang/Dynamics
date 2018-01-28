clc;
clear;
beta=0:0.01:3;
% 位移放大系数的图像，变量为频率比，阻尼比

zeta=0.2;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

% 开启网格
grid on
hold on;

zeta=0.5;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=0.7;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=1;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=0;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

% 坐标轴的显示范围
axis([0 3 0 4])


xlabel('\beta=w/w_n');
ylabel('R(t)');
title('Displacement Magnification Factor');
