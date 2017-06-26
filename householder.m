Prompt = 'Enter the matrix A in the form [1 2 3 ;4 2 1; 6 4 3] \n';

A=input(Prompt);
[r,c]=size(A);
P0 = eye(r)

temp_A = A;
for i=1:c
    X = temp_A(1:end,1);
    e1 = zeros(size(X,1),1);
    e1(1,1) = 1;
    s = sign(X(1,1));
    if (s==0) 
        s=1;
    end
    V = X + s*norm(X)*e1
    P1 = eye(r);
    P1(i:end,i:end) = eye(size(X,1)) - 2*((V*V')/(V'*V));
    P1
    A = P1 * A;
    Q = P0 * P1;
    temp_A = A(i+1:end,i+1:end);
    P0 = P1;
    disp('....................................................');
end

disp('----------------------------------------------------')
disp('Q Matrix :');
disp(Q);
disp('----------------------------------------------------')
disp('R Matrix :');
disp(A);
disp('----------------------------------------------------')