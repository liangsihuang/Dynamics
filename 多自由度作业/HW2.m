% 此题不能求出自振频率的具体值，需符号运算
clear;
clc;
% syms x;
% answer=solve('x^2-168*x+144=0');
syms x;
A=[28-1/3*x -10-1/6*x;-10-1/6*x 4-1/3*x];
eqn= det(A)==0;
answer=solve(eqn,x);