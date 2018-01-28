clc;
clear;

zeta=sym('zeta');
x=sym('x');% 未知数x为\beta
r=((1-x^2)^2+(2*zeta*x)^2)^(-1/2);

% % 求共振（\beta=1）时的放大系数
% r=subs(r,x,1);
% r=simplify(r);

% 求真正的最大值，要求导
r_1=diff(r,x);
root=solve(r_1==0);
% root的结果有三个，只有一个大于0：(1-2*zeta^2)^(1/2)
r_max=subs(r,x,(1-2*zeta^2)^(1/2));
r_max=simplify(r_max);