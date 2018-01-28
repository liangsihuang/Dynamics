clc;clear;
%��3���3С��,����������Ӹߵ��͵�˳��������Ƶ�ʺ����ͣ����ݷ�
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% ��3��Ƶ�ʺ�����
%% 

% ��3��Ƶ�ʺ�����
% ��������E
D=inv(k)*m;
E=inv(D);
% ��¼��������
time3=0;
% ���Ʋ���
ep=0.1;
% ��ʼ��������
v0=[1;1;1];
[tv,ti]=max(abs(v0));
lam0=v0(ti);
u0=v0/lam0;
flag=0;
while(flag==0)
    v1=E*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(lam0-lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time3=time3+1;
end
% ��3������Ƶ��
w3=sqrt(lam1);
% ��3�����ͣ���һ����Ϊ1
y3=zeros(3,1);
for i = 1:3
    y3(i,1)=u0(i,1)/u0(1,1);
end
%% 

% ��2��Ƶ�ʺ�����
% ��������E2
M3=y3'*m*y3;
S3=eye(3)-1/M3*(y3*y3')*m;
E2=E*S3;
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
    v1=E2*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(lam0-lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time2=time2+1;
end
% ��2������Ƶ��
w2=sqrt(lam1);
% ��2�����ͣ���һ����Ϊ1
y2=zeros(3,1);
for i = 1:3
    y2(i,1)=u0(i,1)/u0(1,1);
end

%% 

% ��1��Ƶ�ʺ�����
% ��������E1
M2=y2'*m*y2;
S2=S3-1/M2*(y2*y2')*m;
E1=E*S2;
% ��¼��������
time1=0;
% ���Ʋ���
ep=0.01;
% ��ʼ��������
v0=[1;-1;1];

[tv,ti]=max(abs(v0));
lam0=v0(ti);
u0=v0/lam0;
flag=0;
while(flag==0)
    v1=E1*u0;
    [tv,ti]=max(abs(v1));
    lam1=v1(ti);
    u0=v1/lam1;
    err=abs(lam0-lam1);
    if(err<=ep)
        flag=1;
    end
    lam0=lam1;
    time1=time1+1;
end
% ��1������Ƶ��
w1=sqrt(lam1);
% ��1�����ͣ���һ����Ϊ1
y1=zeros(3,1);
for i = 1:3
    y1(i,1)=u0(i,1)/u0(1,1);
end