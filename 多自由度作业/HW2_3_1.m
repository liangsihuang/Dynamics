clc;clear;
%第3题第1小问,手算的符号推导
syms x;
A=[5-x -2 0;-2 3-x -1;0 -1 1-x/2];
eqn= det(A)==0;
answer=solve(eqn,x);


