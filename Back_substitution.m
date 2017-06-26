function X=Back_substitution(Ag)
[r,c]=size(Ag);
r=c-1;
X=zeros(1,c-1);
X(c-1)=Ag(r,c)/Ag(r,c-1);
k=c-1;

for i=r-1:-1:1
    temp=0;
    for j=c-1:-1:k
        temp=temp+Ag(i,j)*X(j);
    end
    k=k-1;
    X(k)=(Ag(i,c)-temp)/Ag(i,k);
end

end