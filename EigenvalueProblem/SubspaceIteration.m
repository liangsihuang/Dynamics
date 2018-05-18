function [selfFrequency,mode]=SubspaceIteration(k,m,p)
% 输入：
% 刚度矩阵 k
% 质量矩阵 m
% 需要求解出前p阶振型，算法求出前q阶
% 输出:
% 自振频率列向量：selfFrequence
% 振型矩阵：mode
q=min(p+8,p*2);
[n,~]=size(k);
if (q>n)
    q=n; % 保证q永远小于n
end
% 初始振型，“伪对角线”为1，其余为0；
mode0=zeros(n,q);
for i=1:q
    for j=1:q
        if(i==j)
            mode0(i,j)=1;
        end
    end
end

D=k\m;
mode1=D*mode0; % 初始必须迭代一次，why???
mode1=ColumnNormalize(mode1);
[k_sub,m_sub]=RayleighRitz(k,m,mode1);
[selfFrequency,mode]=InversePower(k_sub,m_sub);
mode=mode1*mode;
mode=ColumnNormalize(mode);
iter=0;
% 重复代码
while(norm(mode-mode0)>0.001)
    mode0=mode;
    mode1=D*mode0;
    mode1=ColumnNormalize(mode1);
    [k_sub,m_sub]=RayleighRitz(k,m,mode1);
    [selfFrequency,mode]=InversePower(k_sub,m_sub);
    mode=mode1*mode;
    mode=ColumnNormalize(mode);
    iter=iter+1;
    if(iter>10)
        disp('收敛失败');
        break;
    end
end

end

function [k_sub,m_sub,T]=RayleighRitz(k,m,T)
% 输入：
% 刚度矩阵 k
% 质量矩阵 m
% 线性变换矩阵T
% 输出:
% 利用瑞雷利兹法，线性变换成子空间
% 子空间的刚度矩阵：k_sub
% 子空间的质量矩阵：m_sub
% T=rand(n,p);% 算法非常不稳定
% T=[1,0;0,1;0,0];
k_sub=T'*k*T;
m_sub=T'*m*T;
end