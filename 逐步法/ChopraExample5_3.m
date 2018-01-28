% 平均加速度法
clear;
clc;

m=0.2533; %质量，kip*sec^2/in.
k=10; %刚度，kips/in.
c=0.1592;   %直接用阻尼

dt=0.1; %插值时间间隔，sec
t_aim=1.0;  %想要计算到的时刻，可能比荷载持续时间长

p=[0,5,8.66,10,8.66,5,0];
% t=0:dt:t_aim;

gama=1/2;   beta=1/4;
[u,v,a]=NewmarkMethod(gama,beta,p,t_aim,k,m,c,dt);