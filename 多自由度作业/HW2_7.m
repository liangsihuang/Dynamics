clc;clear;
y=[1 1;0.75 0.56;0.5 0.25;0.25 0.06];
% syms k1;
% k=k1*[1 -1 0 0;-1 2 -1 0;0 -1 2 -1;0 0 -1 2];
k=[1 -1 0 0;-1 2 -1 0;0 -1 2 -1;0 0 -1 2];
% syms m1;
% m=m1*[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
m=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
k_s=y'*k*y;
m_s=y'*m*y;
A=inv(m_s)*k_s;
[V,D]=eig(A);
w=D.^(1/2);

V1=zeros(2,2);
for j = 1:2
    for i = 1:2
        V1(i,j)=V(i,j)/V(1,j);
    end
end

Y=y*V1;
Y1=zeros(4,2);
for j = 1:2
    for i = 1:4
        Y1(i,j)=Y(i,j)/Y(1,j);
    end
end