clc;
clear;
beta=0:0.01:3;
% 位移放大系数的图像，变量为频率比，阻尼比

zeta=0.2;
TR=zeros(1,length(beta));
for i=1:length(beta)
    TR(i)=Transmissibility(beta(i),zeta);
end
plot(beta,TR)

% 开启网格
grid on
hold on;

zeta=0.5;
TR=zeros(1,length(beta));
for i=1:length(beta)
    TR(i)=Transmissibility(beta(i),zeta);
end
plot(beta,TR)

zeta=0.7;
TR=zeros(1,length(beta));
for i=1:length(beta)
    TR(i)=Transmissibility(beta(i),zeta);
end
plot(beta,TR)

zeta=1;
TR=zeros(1,length(beta));
for i=1:length(beta)
    TR(i)=Transmissibility(beta(i),zeta);
end
plot(beta,TR)

zeta=0;
TR=zeros(1,length(beta));
for i=1:length(beta)
    TR(i)=Transmissibility(beta(i),zeta);
end
plot(beta,TR)

% 坐标轴的显示范围
axis([0 3 0 4])


xlabel('Frequency ratio');
ylabel('TR(t)');
title('Transmissibility');