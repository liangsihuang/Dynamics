clc;
clear;
beta=0:0.01:3;
% ���ٶȷŴ�ϵ����ͼ����λ�ƷŴ�ϵ���Ļ����ϣ�����ֵ���������ȵ�ƽ��
% �� Ra=Rd*(beta)^2

zeta=0.2;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

% ��������
grid on
hold on;

zeta=0.5;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=0.7;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=1;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

zeta=0;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta)*beta(i)^2;
end
plot(beta,R,'r')

% ���������ʾ��Χ
axis([0 3 0 4])


xlabel('\beta=w/w_n');
ylabel('R(t)');
title('Acceleration Magnification Factor');
