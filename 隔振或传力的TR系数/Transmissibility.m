% 传递率，不管是设备传给基础的力，还是基础传给设备的位移（加速度）
function TR=Transmissibility(beta,zeta)
% beta= w/w_n, frequency of applied loading over natural frequency
% zeta:damping ratio
TR=sqrt(1+(2*zeta*beta)^2)/(sqrt((1-beta^2)^2+(2*zeta*beta)^2));
end