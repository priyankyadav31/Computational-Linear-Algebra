Prompt = 'Enter the Augmented matrix in the form [1 2 3 ;4 2 1; 6 4 3] \n';

Ag=input(Prompt);
[r,c]=size(Ag);

i=1;
j=1;

if(c-1 > r)
        display('Infinitly many solution');
        return
end

for j=1:c-1
    Ag;
    [val,pos]=max(abs((Ag(j:end,j))'));
    pos=pos+j-1;
    if(pos~=j) 
        Ag([pos,j],:)=Ag([j,pos],:);
    end
    for i=j+1:r
        if(Ag(j,j)~=0)
            m=Ag(i,j)/Ag(j,j);
            for k=j:c
                Ag(i,k)=Ag(i,k)-(m*Ag(j,k));
            end
        end
    end
end

for i=c:r
    if(Ag(i,c)~=0)
       disp('No solution u');
       return;
    end
end
r=c-1;
if(Ag(r,c-1)==0)
    if(Ag(r,c)==0)
        display('Infinitly many solutions');
    else display('No solutions');
    end
else
    X=Back_substitution(Ag)
end
