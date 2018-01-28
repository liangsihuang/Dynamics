clc;clear;
%第3题第2小问,矩阵迭代，从低到高的顺序求自振频率和振型，反幂法
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
%% 

% 第1阶频率和振型
% 迭代矩阵D
D=inv(k)*m;
% 记录迭代次数
time1=0;
% 控制参数
ep=0.1;
% 初始非零向量
v0=[1;1;1];
[tv,ti]=max(abs(v0));
lam0=v0(ti);
u0=v0/lam0;
flag=0;
while(flag==0)
    v1=D*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(1/lam0-1/lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time1=time1+1;
end
% 第1阶自振频率
w1=1/sqrt(lam1);
% 第1阶振型，第一分量为1
y1=zeros(3,1);
for i = 1:3
    y1(i,1)=u0(i,1)/u0(1,1);
end
%% 

% 第2阶频率和振型
% 迭代矩阵D2
M1=y1'*m*y1;
S1=eye(3)-1/M1*(y1*y1')*m;
D2=D*S1;
% 记录迭代次数
time2=0;
% 控制参数
ep=0.01;
% 初始非零向量
v0=[1;0;-1];

[tv,ti]=max(abs(v0));
lam0=v0(ti);
u0=v0/lam0;
flag=0;
while(flag==0)
    v1=D2*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(1/lam0-1/lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time2=time2+1;
end
% 第2阶自振频率
w2=1/sqrt(lam1);
% 第2阶振型，第一分量为1
y2=zeros(3,1);
for i = 1:3
    y2(i,1)=u0(i,1)/u0(1,1);
end

%% 

% 第3阶频率和振型
% 迭代矩阵D3
M2=y2'*m*y2;
S2=S1-1/M2*(y2*y2')*m;
D3=D*S2;
% 记录迭代次数
time3=0;
% 控制参数
ep=0.01;
% 初始非零向量
v0=[1;-1;1];

[tv,ti]=max(abs(v0));
lam0=v0(ti);
u0=v0/lam0;
flag=0;
while(flag==0)
    v1=D3*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(1/lam0-1/lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time3=time3+1;
end
% 第3阶自振频率
w3=1/sqrt(lam1);
% 第3阶振型，第一分量为1
y3=zeros(3,1);
for i = 1:3
    y3(i,1)=u0(i,1)/u0(1,1);
end