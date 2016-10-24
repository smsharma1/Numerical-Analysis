function x = cholesky( A,b )
n = length( A );
L = zeros( n,n );
x=zeros(n,1);
for i=1:n
    L(i,i) = sqrt( A(i,i) - L(i,:)*L(i,:)' );

    for j=(i + 1):n
        L(j,i) = ( A(j,i) - L(i,:)*L(j,:)' )/L(i,i);
    end
end
L
U = L';
y = b;
for i=1:n
    y(i) = b(i);
    for k=1:i-1
       y(i)=y(i)-L(i,k)*y(k);
    end;
    y(i) = y(i)/L(i,i); 
 end;
% backward substitutioncfor x
x(n)=y(n)/U(n,n);
for i=n-1:-1:1
    sum=y(i);
    for j=i+1:n
        sum = sum - (U(i,j)*x(j));
    end
% unknown matrix x
    x(i)=sum/U(i,i);
end
    fileid=fopen('output.txt','w');
    fprintf(fileid,'%s\n','Cholesky Method');
    fprintf(fileid,'%s\n','Lc =');
    fprintf(fileid,'% .4f\n',y);
    fprintf(fileid,'%s\n','X =');
    fprintf(fileid,'% .4f\n',x);
    fclose(fileid);
    type('output.txt');
end

