clc;clear;
%���Ĳ��ֵ�1��
L=6;E=2.9*10^11;h=0.4;b=0.25;d=2500;
%��λ��m,  N/m^2,  m,  m,  kg/m^3
ml=d*b*h;%kg/m
I=1/12*b*h^3;%m^4
% ȡ���͵�����
n=6;
i=1:n;
% ������������е�λ��
phi=sin(i*pi/2);
% �������͵ĵ�Ч���������ﶼһ��
M=1/2*ml*L;%kg
% �������͵�Ƶ��
w=i.^2.*pi^2*sqrt(E*I/ml/L^4);
% �������͵ĵ�Ч�ն�
K=w.^2*M;
% �������͵ĵ�Ч����
p0=5000;%N/m
P=L*p0/pi./i.*(1-cos(i*pi));
% 0-3s�ڽṹ�ķ�Ӧ��ʱ����Ϊh
h=0.01;
t=0:h:0.5;
% һ��Ϊһ�����͵����ݣ���ͬ�д���ͬʱ��
y=zeros(n,length(t));
for j=1:n
    y(j,:)=L*p0/j/pi/K(j)*(1-cos(j*pi))*(1-cos(w(j).*t));
end
% �ܷ�Ӧ������λ��
v=zeros(1,length(t));
for j=1:n
    v(1,:)=v(1,:)+phi(j)*y(j,:);
end

% plot(t,v(1,:));

% ������������е�����
ddphi=-(i*pi/L).^2.*sin(i*pi/2);
% �ܷ�Ӧ���������
Mmid=zeros(1,length(t));
for j=1:n
    Mmid(1,:)=Mmid(1,:)+E*I*ddphi(j)*y(j,:);
end
% plot(t,Mmid(1,:));

% ������������е����ʵĵ���
dddphi=-(i*pi/L).^3.*cos(i*pi/2);
% �ܷ�Ӧ�����м���
Vmid=zeros(1,length(t));
for j=1:n
    Vmid(1,:)=Vmid(1,:)+E*I*dddphi(j)*y(j,:);
end
plot(t,Vmid(1,:));
