
Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);
A=Ag(:,[1:c-1]);
B = Ag(:,c);

L = tril(A, -1)
D = diag(diag(A))
U = triu(A, 1)

Xprev = input('Initial guess : in the form [0 0 0] \n');

count = 1;
I=eye(r);

while(1)
    fprintf('Iteration no: %d',count);
    
    for i=1:r
        temp = 0;
        for j=1:r
            if(i~=j)
            temp = temp + A(i,j)*Xprev(j);
            end
        end
        
        Xnew(i) = (B(i) - temp) / A(i,i);
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
    

    
            
