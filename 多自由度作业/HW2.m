% ���ⲻ���������Ƶ�ʵľ���ֵ�����������
clear;
clc;
% syms x;
% answer=solve('x^2-168*x+144=0');
syms x;
A=[28-1/3*x -10-1/6*x;-10-1/6*x 4-1/3*x];
eqn= det(A)==0;
answer=solve(eqn,x);