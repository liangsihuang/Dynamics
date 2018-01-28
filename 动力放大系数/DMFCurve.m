clc;
clear;
beta=0:0.01:3;
% λ�ƷŴ�ϵ����ͼ�񣬱���ΪƵ�ʱȣ������

zeta=0.2;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

% ��������
grid on
hold on;

zeta=0.5;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=0.7;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=1;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

zeta=0;
R=zeros(1,length(beta));
for i=1:length(beta)
    R(i)=MagnificationFactor(beta(i),zeta);
end
plot(beta,R)

% ���������ʾ��Χ
axis([0 3 0 4])


xlabel('\beta=w/w_n');
ylabel('R(t)');
title('Displacement Magnification Factor');
