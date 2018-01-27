% 此题不能求出自振频率的具体值，需符号运算
clear;
clc;
% syms x;
% answer=solve('x^2-168*x+144=0');
% syms x;
% A=[42/5-5*x 9/5 -9/5;9/5 21/10-x 9/10;-9/5 9/10 21/10-x];
% eqn= det(A)==0;
% answer=solve(eqn,x);

syms a b;
y=[a;1;b];
% B=[-6.6 1.8 -1.8;1.8 -0.9 0.9;-1.8 0.9 0.9];
B=[-6.6 1.8 -1.8;1.8 -0.9 0.9];
eqn = B*y==0;
vars=[a b];
[sola,solb]=solve(eqn,vars)