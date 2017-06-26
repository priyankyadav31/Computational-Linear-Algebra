Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);


A = Ag(:,[1:c-1])
B = Ag(:,c)
if(~isequal(A,A'))
    display('Not symmetric');
    return;
end

for i=1:r
    v = A(1:i,1:i);
    if(det(v) <= 0)
        display('Not positive definite');
        return;
    end
end

L=zeros(r);
for k=1:r
    temp=0;
    for i=1:k-1
        temp=temp+(L(k,i)*L(k,i));
    end
    L(k,k)=sqrt(A(k,k)-temp);
    for i=k+1:r
        temp=0;
        for j=1:i-1
            temp=temp+(L(k,j)*L(i,j));
        end
        L(i,k) = (A(k,i)-temp)/L(k,k);
    end
end
L

Ag1 = horzcat(L, B);
Y = forward_substitution(Ag1)

Ag2 = horzcat(L', Y');
X_solution = Back_substitution(Ag2)



