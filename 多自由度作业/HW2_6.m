% 此题不能求出自振频率的具体值，需符号运算
clear;
clc;
%% 

syms x;
A=[12-576*x 0 6-22*x 0;
   0 12-156*x -6-13*x -6+22*x;
   6-22*x -6-13*x 8-8*x 2+3*x;
   0 -6+22*x 2+3*x 4-4*x];
eqn= det(A)==0;
answer=solve(eqn,x);
%% 
clear;clc;
syms a b c;
x=5.756;
f1=(12-576*x)*1+(6-22*x)*b;
f2=(12-156*x)*a+(-6-13*x)*b+(-6+22*x)*c;
f3=(6-22*x)*1+(-6-13*x)*a+(8-8*x)*b+(2+3*x)*c;
eqns=[f1==0,f2==0,f3==0];
% vars=[a b c];
[sola,solb,solc]=solve(eqns);