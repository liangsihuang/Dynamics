%注意：这是位移的放大系数
function R=MagnificationFactor(beta,zeta)
% beta= w/w_n, frequency of applied loading over natural frequency
% zeta:damping ratio
R=1/(sqrt((1-beta^2)^2+(2*zeta*beta)^2));
end


