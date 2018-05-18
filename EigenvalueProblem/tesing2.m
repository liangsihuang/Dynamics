% 测试子空间迭代法
clc;clear;
m=[1 0 0;0 1.5 0;0 0 2];
k=600*[1 -1 0;-1 3 -2;0 -2 5];
[selfFrequence,mode]=SubspaceIteration(k,m,3);
% 与matlab自带函数eig对比
% [V,D]=eig(A)返回特征值的对角矩阵D和矩阵V，其列是对应的右特征向量，使得A*V=V*D
[V,D]=eig(m\k);
V=ColumnNormalize(V);
D=sqrt(D);
