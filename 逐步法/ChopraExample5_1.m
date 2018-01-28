clear;
clc;
m=0.2533; %质量，kip*sec^2/in.
k=10; %刚度，kips/in.
w_n=sqrt(k/m); %rad/sec
zeta=0.05; %阻尼比
dt=0.1; %插值时间间隔，sec
t_aim=1.0;  %想要计算到的时刻，可能比荷载持续时间长

p=[0,5,8.66,10,8.66,5,0];
t=0:dt:t_aim;

[u,v]=ExcitationInterpolationMethod(p,t_aim,w_n,zeta,dt,k);