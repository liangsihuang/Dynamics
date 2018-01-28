function [u,v,a]=WilsonTheta(p,t_aim,k,m,c,h)
% ����NewmarkMethod����ı�
gama=1/2;beta=1/6; % ���Լ��ٶȷ��Ĳ�������
theta=1.42;
dt=theta*h;

n=length(p);
nc=t_aim/h;
p_new=p;
if nc>n
    p_new=zeros(1,nc+1);
    for i=1:n
        p_new(i)=p(i)+p_new(i);
    end
end
% ����Ҫ��ǰ�����������ǵģ����Ǿ���洢�ռ��Ǳ仯��,matlab�����ѣ�
% Ԥ�ȷ����ڴ�����������ٶ�
u=zeros(1,nc+1);
v=zeros(1,nc+1);
a=zeros(1,nc+1);

% ��Ҫ������λ�ƺͳ��ٶ�
u(1)=0;
v(1)=0;
% �����ٶȸ����˶�������
a(1)=(p_new(1)-c*v(1)-k*u(1))/m;
% parameters
k_hat=k+gama/beta/dt*c+1/beta/dt^2*m;%u(i+1)ǰϵ��
a1=1/beta/dt^2*m+gama/beta/dt*c;%u(i)ǰϵ��
a2=1/beta/dt*m+(gama/beta-1)*c;%v(i)ǰϵ��
a3=(1/2/beta-1)*m+dt*(gama/2/beta-1)*c;%a(i)ǰϵ��
% calculation for time step i
for i=2:(nc+1)
    % ��������
    p_temp=p_new(i)+(theta-1)*(p_new(i)-p_new(i-1));
    p_hat=p_temp+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u_temp=p_hat/k_hat;
    v_temp=gama/beta/dt*(u_temp-u(i-1))+(1-gama/beta)*v(i-1)...
        +dt*(1-gama/2/beta)*a(i-1);
    %a(i)=1/beta/dt^2*(u(i)-u(i-1))-1/beta/dt*v(i-1)-(1/2/beta-1)*a(i-1);
    %���ٶȲ��õ��ƹ�ʽ�������˶����̷��㣬ǿ�������˶�����
    a_temp=(p_temp-c*v_temp-k*u_temp)/m;
    %�ڲ�����ٶ�
    a(i)=a(i-1)+(a_temp-a(i-1))/theta;
    % �׹�ʽ�����ٶȺ�λ��
    v(i)=v(i-1)+h/2*(a(i)+a(i-1));
    u(i)=u(i-1)+v(i-1)*h+h^2*(1/6*a(i)+1/3*a(i-1));
    
end

end