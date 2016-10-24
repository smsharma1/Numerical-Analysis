function x = LU_Gass_nopivot( A,b )
[n m] = size(A);
[n1 k] = size(b);
if(n ~= n1)
    printf('Invalid Input\n');
    return;
end
l=eye(n);
u=A;
for i=1:n
   l(i+1:n,i)=A(i+1:n,i)/A(i,i);
   for j=i+1:n
        A(j,:)=A(j,:)-l(j,i)*A(i,:);
   end
end
u=A;
y(1,:)= b(1,:);
for i=2:m
    y(i,:) = b(i,:) - l(i,1:i-1)*y(1:i-1,:);
end
x(m,:)=y(m,:)/u(m,m);
for i=1:n-1
    x(n-i,:)= (y(n-i,:) - u(n-i,n-i+1:n)*x(n-i+1:n,:))/u(n-i,n-i);
end
    fileid=fopen('output.txt','w');
    fprintf(fileid,'%s\n','LU Decomposition using Gauss without pivoting');
    fprintf(fileid,'%s\n','L =');
    for i=1:1:n
        for j=1:1:n
            fprintf(fileid,'% .4f ',l(i,j));
        end
        fprintf(fileid,'\n');
    end
    fprintf(fileid,'%s\n','U =');
    for i=1:1:n
        for j=1:1:n
            fprintf(fileid,'% .4f ',u(i,j));
        end
        fprintf(fileid,'\n');
    end
    fprintf(fileid,'%s\n','X =');
    fprintf(fileid,'% .4f\n',x);
    fclose(fileid);
    type('output.txt');
end

