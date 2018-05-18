function AA=ColumnNormalize(A)
[m,n]=size(A);
AA=zeros(m,n);
for i=1:n
   [~,j]=max(abs(A(:,i)));
   AA(:,i)=A(:,i)/A(j,i);
end
end
