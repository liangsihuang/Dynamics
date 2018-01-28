function [u,v]=ExcitationInterpolationMethod(p,t_aim,w_n,zeta,dt,k)
% tΪ��Ҫ���㵽��ʱ�̣���Ϊ���ؽ����󣬻���˥����������
n=length(p);
nc=t_aim/dt+1;  %Matlab�±��1��ʼ
% �ں��غ��油0
p_new=p;
if nc>n
    p_new=zeros(1,nc);
    for i=1:n
        p_new(i)=p(i)+p_new(i);
    end
end

% �����ʼֵ����λ�ƺͳ��ٶ�ӦΪ��ֵ֪
u=zeros(1,nc);
v=zeros(1,nc);
u(1)=0;
v(1)=0;

% ��ʽ����
[Au,Bu,Cu,Du,Av,Bv,Cv,Dv]=Parameters(w_n,zeta,dt,k);
for i=1:(nc-1)
    u(i+1)=Au*u(i)+Bu*v(i)+Cu*p_new(i)+Du*p_new(i+1);
    v(i+1)=Av*u(i)+Bv*v(i)+Cv*p_new(i)+Dv*p_new(i+1);
end

end