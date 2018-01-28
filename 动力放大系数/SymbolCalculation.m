clc;
clear;

zeta=sym('zeta');
x=sym('x');% δ֪��xΪ\beta
r=((1-x^2)^2+(2*zeta*x)^2)^(-1/2);

% % ����\beta=1��ʱ�ķŴ�ϵ��
% r=subs(r,x,1);
% r=simplify(r);

% �����������ֵ��Ҫ��
r_1=diff(r,x);
root=solve(r_1==0);
% root�Ľ����������ֻ��һ������0��(1-2*zeta^2)^(1/2)
r_max=subs(r,x,(1-2*zeta^2)^(1/2));
r_max=simplify(r_max);