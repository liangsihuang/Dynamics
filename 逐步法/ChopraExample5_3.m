% ƽ�����ٶȷ�
clear;
clc;

m=0.2533; %������kip*sec^2/in.
k=10; %�նȣ�kips/in.
c=0.1592;   %ֱ��������

dt=0.1; %��ֵʱ������sec
t_aim=1.0;  %��Ҫ���㵽��ʱ�̣����ܱȺ��س���ʱ�䳤

p=[0,5,8.66,10,8.66,5,0];
% t=0:dt:t_aim;

gama=1/2;   beta=1/4;
[u,v,a]=NewmarkMethod(gama,beta,p,t_aim,k,m,c,dt);