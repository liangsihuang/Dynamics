clear;
clc;

m=0.2533; %������kip*sec^2/in.
k=10; %�նȣ�kips/in.
% w_n=sqrt(k/m); %rad/sec
% zeta=0.05; %�����
c=0.1592;   %���Ĳ�ַ���ֱ�������ᣬ���������

dt=0.1; %��ֵʱ������sec
t_aim=1.0;  %��Ҫ���㵽��ʱ�̣����ܱȺ��س���ʱ�䳤

p=[0,5,8.66,10,8.66,5,0];
t=0:dt:t_aim;

[u,v,a]=CentralDifferenceMethod(p,t_aim,k,m,c,dt);