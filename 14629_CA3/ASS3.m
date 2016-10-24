fileid=fopen('input.txt','r');
n=fscanf(fileid,'%d',1);
A=zeros(n,n);
for i=1:1:n
    for j=1:1:n
        A(i,j)=fscanf(fileid,'%f',1);
    end
end
max_iter=fscanf(fileid,'%d',1);
max_rel_error=fscanf(fileid,'%f',1);
shiftvalue=fscanf(fileid,'%d',1);
fclose(fileid);
disp('Please enter the options')
str=input(' a = Direct Power Method \n b = Inverse Power Method \n c = Shifted-power Method \n d = QR Method \n','s');
if(str == 'a')
    Direct_Power(A,max_iter,max_rel_error)
elseif(str == 'b')
    Inverse_Power(A,max_iter,max_rel_error)
elseif(str == 'c')
    Shifted_Inverse(A,max_iter,max_rel_error,shiftvalue)
elseif(str == 'd')
    QR(A,max_iter,max_rel_error);
else
    printf('Invalid Input');
end

            
    
    