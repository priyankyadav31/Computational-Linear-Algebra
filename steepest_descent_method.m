Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);
A=Ag(:,[1:c-1]);
B = Ag(:,c);

Xprev = input('Initial guess : in the form [0; 0; 0] \n');

count = 1;

while(1)
    
    fprintf('Iteration no: %d',count);
    
    G = B - A*Xprev;
    Alpha = (G' * G)/(G'*A*G);
    Xnew = Xprev + (Alpha*G);
    E = abs(Xnew - Xprev);
    Xprev=Xnew;
    if(E < .00001)
        break;
    end
    Xnew
    count=count+1;
    display('------------------------------------------------');
    if(count > 200) 
        display('**** Does not converge ****');
        break;
    end
end
