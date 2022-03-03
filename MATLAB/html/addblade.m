function B=addblade(A,m)
[p,n]=size(A);
v=[1,zeros(1,m-2),1]';
C=zeros(m,m);
for j=1:m-1
    C(j,j+1)=1;
end
C=C+C';
B=[A,[v';zeros(n-1,m)];v,zeros(m,n-1),C];