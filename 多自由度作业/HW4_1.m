clc;clear;
%第四部分第1题
L=6;E=2.9*10^11;h=0.4;b=0.25;d=2500;
%单位：m,  N/m^2,  m,  m,  kg/m^3
ml=d*b*h;%kg/m
I=1/12*b*h^3;%m^4
% 取振型的数量
n=6;
i=1:n;
% 各阶振型里跨中的位移
phi=sin(i*pi/2);
% 各阶振型的等效质量，这里都一样
M=1/2*ml*L;%kg
% 各阶振型的频率
w=i.^2.*pi^2*sqrt(E*I/ml/L^4);
% 各阶振型的等效刚度
K=w.^2*M;
% 各阶振型的等效荷载
p0=5000;%N/m
P=L*p0/pi./i.*(1-cos(i*pi));
% 0-3s内结构的反应，时间间隔为h
h=0.01;
td=3;
t=0:h:td;
% 一行为一个振型的数据，不同列代表不同时刻
y=zeros(n,length(t));
dy=zeros(n,length(t));
for j=1:n
    y(j,:)=L*p0/j/pi/K(j)*(1-cos(j*pi))*(1-cos(w(j).*t));
    dy(j,:)=L*p0/j/pi/K(j)*(1-cos(j*pi))*sin(w(j).*t)*w(j);%为了最后时刻的速度
end
% 0-3s，总反应：跨中位移
v=zeros(1,length(t));
for j=1:n
    v(1,:)=v(1,:)+phi(j)*y(j,:);
end
% 3s-6s，总反应：跨中位移
t2=td:h:6;
y2=zeros(n,length(t2));
for j=1:n
    y2(j,:)=y(j,td/h+1)*cos(w(j).*t2)+dy(j,td/h+1)/w(j)*sin(w(j).*t2);
end
v2=zeros(1,length(t));
for j=1:n
    v2(1,:)=v2(1,:)+phi(j)*y2(j,:);
end
% % 做图
% plot(t,v(1,:));%0-3s
% hold on
% plot(t2,v2(1,:));%3-6s

% 各阶振型里跨中的曲率
ddphi=-(i*pi/L).^2.*sin(i*pi/2);
% 总反应：跨中弯矩
Mmid=zeros(1,length(t));
for j=1:n
    Mmid(1,:)=Mmid(1,:)+E*I*ddphi(j)*y(j,:);
end
Mmid2=zeros(1,length(t2));
for j=1:n
    Mmid2(1,:)=Mmid2(1,:)+E*I*ddphi(j)*y2(j,:);
end
plot(t,Mmid(1,:));
hold on
plot(t2,Mmid2(1,:));

% 各阶振型里跨中的曲率的导数
% dddphi=-(i*pi/L).^3.*cos(i*pi/2);
% % 总反应：跨中剪力，求出来数量级不对啊，不管了
% Vmid=zeros(1,length(t));
% for j=1:n
%     Vmid(1,:)=Vmid(1,:)+E*I*dddphi(j)*y(j,:);
% end
% % plot(t,Vmid(1,:));
