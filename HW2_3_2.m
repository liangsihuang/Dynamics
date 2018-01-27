clc;clear;
%��3���2С��,����������ӵ͵��ߵ�˳��������Ƶ�ʺ����ͣ����ݷ�
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
%% 

% ��1��Ƶ�ʺ�����
% ��������D
D=inv(k)*m;
% ��¼��������
time1=0;
% ���Ʋ���
ep=0.1;
% ��ʼ��������
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
% ��1������Ƶ��
w1=1/sqrt(lam1);
% ��1�����ͣ���һ����Ϊ1
y1=zeros(3,1);
for i = 1:3
    y1(i,1)=u0(i,1)/u0(1,1);
end
%% 

% ��2��Ƶ�ʺ�����
% ��������D2
M1=y1'*m*y1;
S1=eye(3)-1/M1*(y1*y1')*m;
D2=D*S1;
% ��¼��������
time2=0;
% ���Ʋ���
ep=0.01;
% ��ʼ��������
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
% ��2������Ƶ��
w2=1/sqrt(lam1);
% ��2�����ͣ���һ����Ϊ1
y2=zeros(3,1);
for i = 1:3
    y2(i,1)=u0(i,1)/u0(1,1);
end

%% 

% ��3��Ƶ�ʺ�����
% ��������D3
M2=y2'*m*y2;
S2=S1-1/M2*(y2*y2')*m;
D3=D*S2;
% ��¼��������
time3=0;
% ���Ʋ���
ep=0.01;
% ��ʼ��������
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
% ��3������Ƶ��
w3=1/sqrt(lam1);
% ��3�����ͣ���һ����Ϊ1
y3=zeros(3,1);
for i = 1:3
    y3(i,1)=u0(i,1)/u0(1,1);
end