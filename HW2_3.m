clc;clear;
%第3题第1小问
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% 特征矩阵
A=inv(m)*k;
[V,D]=eig(A);
%将振型的第一分量设为1
V1=zeros(3,3);
for j = 1:3
    for i = 1:3
        V1(i,j)=V(i,j)/V(1,j);
    end
end


