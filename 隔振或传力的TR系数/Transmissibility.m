% �����ʣ��������豸�����������������ǻ��������豸��λ�ƣ����ٶȣ�
function TR=Transmissibility(beta,zeta)
% beta= w/w_n, frequency of applied loading over natural frequency
% zeta:damping ratio
TR=sqrt(1+(2*zeta*beta)^2)/(sqrt((1-beta^2)^2+(2*zeta*beta)^2));
end