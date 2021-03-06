clc;clear;
%第3题第5小问
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% 振型矩阵
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
% 自振频率
wn=[37.61;81.09;119.8];
M=A'*m*A;
K=A'*k*A;
p=[10;15;20];
P=A'*p;

% 相对频率 w=2*pi/wn
w_c=2*pi./wn;
% 放大系数
D=1./(1-w_c.^2);
%% 

% 作图:第一个质量
t=0:0.01:3;
% 广义坐标
y1=-0.2*sin(37.61*t)+1.19*sin(2*pi*t);
y2=-0.072*sin(81.09*t)-0.093*sin(2*pi*t);
y3=0.0024*sin(119.8*t)+0.0458*sin(2*pi*t);
% 振型矩阵
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
v11=A(1,1)*y1;%第一振型
v12=A(2,1)*y2;%第二振型
v13=A(3,1)*y3;%第三振型
v1=v11+v12+v13;%第一个质量的总反应

plot(t,v11)
hold on;
plot(t,v12,'--')
plot(t,v13,':')
plot(t,v1,':.')
legend('第一振型','第二振型','第三振型','总反应')
xlabel('时间（s)');
ylabel('侧移（mm）');
title('底层质量振动曲线');

%% 
clc;clear;
% 作图:第二个质量
t=0:0.01:5;
% 广义坐标
y1=-0.2*sin(37.61*t)+1.19*sin(2*pi*t);
y2=-0.072*sin(81.09*t)-0.093*sin(2*pi*t);
y3=0.0024*sin(119.8*t)+0.0458*sin(2*pi*t);
% 振型矩阵
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
v21=A(1,2)*y1;%第一振型
v22=A(2,2)*y2;%第二振型
v23=A(3,2)*y3;%第三振型
v2=v21+v22+v23;%第二个质量的总反应
plot(t,v21)
hold on;
plot(t,v22,'--')
plot(t,v23,':')
plot(t,v2,':.')
legend('第一振型','第二振型','第三振型','总反应')
xlabel('时间（s)');
ylabel('侧移（mm）');
title('二层质量振动曲线');
%% 
clc;clear;
% 作图:第三个质量
t=0:0.01:5;
% 广义坐标
y1=-0.2*sin(37.61*t)+1.19*sin(2*pi*t);
y2=-0.072*sin(81.09*t)-0.093*sin(2*pi*t);
y3=0.0024*sin(119.8*t)+0.0458*sin(2*pi*t);
% 振型矩阵
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
v31=A(1,3)*y1;%第一振型
v32=A(2,3)*y2;%第二振型
v33=A(3,3)*y3;%第三振型
v3=v31+v32+v33;%第三个质量的总反应
plot(t,v31)
hold on;
plot(t,v32,'--')
plot(t,v33,':')
plot(t,v3,':.')
legend('第一振型','第二振型','第三振型','总反应')

xlabel('时间（s)');
ylabel('侧移（mm）');
title('三层质量振动曲线');