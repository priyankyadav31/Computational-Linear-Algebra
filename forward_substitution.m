function X=forward_substitution(Ag)
[r,c]=size(Ag);
r=c-1;
X=zeros(1,c-1);
X(1)=Ag(1,c)/Ag(1,1);
k=1;

for i=2:r
    temp=0;
    for j=1:k
        temp=temp+Ag(i,j)*X(j);
    end
    k=k+1;
    X(k)=(Ag(i,c)-temp)/Ag(i,k);
end

end