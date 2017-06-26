Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);

A=Ag(:,[1:c-1])
B = Ag(:,c)
P = eye(r);  %Initializing permutation matrix to keep the track of row operations

for j=1:c-1
    [val,pos]=max(abs((A(j:end,j))'));
    pos=pos+j-1;
    if(pos~=j) 
        A([pos,j],:)=A([j,pos],:);
        P([pos,j],:) = P([j,pos],:);
        
    end
    for i=j+1:r
        if(A(j,j)~=0)
            m=A(i,j)/A(j,j);
            A(i,j) = m;
            for k=j+1:c-1
                A(i,k)=A(i,k)-(m*A(j,k));
            end
        end
    end
end

L = tril(A, -1);
U = triu(A, 1);

for i=1:r
    L(i,i) = 1;
    U(i,i) = A(i,i);
end

L
U
P

Ag1 = horzcat(L, P*B);
Y = forward_substitution(Ag1)

Ag2 = horzcat(U, Y');
X_solution = Back_substitution(Ag2)
