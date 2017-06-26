
Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);
A=Ag(:,[1:c-1]);
B = Ag(:,c);

L = tril(A, -1)
D = diag(diag(A))
U = triu(A, 1)

Xprev = input('Initial guess : in the form [1 1 1] \n');
Xnew = Xprev;
count = 1;
I=eye(r);

while(1)
    fprintf('Iteration no: %d',count);
    temp1 = 0;
    temp2 = 0;
    for i=1:r
        temp1 = 0;
        temp2 = 0;
        for j=1:i-1
            temp1 = temp1 + A(i,j)*Xnew(j);
        end
        for j=i+1:r
            temp2 = temp2 + A(i,j)*Xprev(j);
        end
        Xnew(i) = (B(i) - temp1 - temp2) / A(i,i);
    end 
    Xnew
    E = abs(Xnew - Xprev);
    Xprev=Xnew;
    if(E < .00001)
        break;
    end
    count=count+1;
    display('------------------------------------------------');
    if(count > 200) 
        display('**** Does not converge ****');
        break;
    end
    
end
    

    
            
