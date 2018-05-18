function [selfFrequency,mode]=InversePower(k,m)
% 反幂法：从最小的特征值求起
% 输入：
% 刚度矩阵 k
% 质量矩阵 m
% 输出:
% 自振频率列向量：selfFrequence
% 振型矩阵：mode
[n,~]=size(k);
selfFrequency=zeros(n,1);
mode=zeros(n,n);

D=k\m;
v0=ones(n,1);
v1_temp=D*v0; %需要保留中间值，最后用来求特征值（频率^2)
[~,nmax]=max(abs(v1_temp)); % 正确做法：先求出绝对值最大的值的位置
v1=v1_temp/v1_temp(nmax);
w=sqrt(1/v1_temp(nmax)); % 自振频率标量
% v1=v1./max(abs(v1)); 算法错误：不是除以最大值的绝对值，而是除以绝对值最大的值
iter=0;
while (norm(v1-v0)>0.001)
    v0=v1;
    v1_temp=D*v0;
    [~,nmax]=max(abs(v1_temp)); 
    v1=v1_temp/v1_temp(nmax);
    w=sqrt(1/v1_temp(nmax));
    iter=+1;
    if(iter>100)
        disp('收敛失败');
        break;
    end
end
selfFrequency(1)=w;
mode(:,1)=v1;

for i=2:n
    M=v1'*m*v1;
    S=eye(n)-1/M*(v1*v1')*m; %sweeping matrix
    D=D*S;
% 重复代码
    v0=ones(n,1);
    v1_temp=D*v0;
    [~,nmax]=max(abs(v1_temp));
    v1=v1_temp/v1_temp(nmax);
    w=sqrt(1/v1_temp(nmax)); 
    iter=0;
    while (norm(v1-v0)>0.001)
        v0=v1;
        v1_temp=D*v0;
        [~,nmax]=max(abs(v1_temp)); 
        v1=v1_temp/v1_temp(nmax);
        w=sqrt(1/v1_temp(nmax));
        iter=iter+1;
        if(iter>100)
            disp('收敛失败');
            break;
        end
    end 
    selfFrequency(i)=w;
    mode(:,i)=v1;
end

end