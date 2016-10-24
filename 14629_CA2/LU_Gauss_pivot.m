function x = LU_Gauss_pivot( A,b )
[n m]=size(A);
[n1 k]=size(b);
if(n ~= n1)
   printf('Invalid Input');
    return;
else
    permutation=eye(n);
    for i=1:n-1
        [value,index]=max(A(i:n,i));
        index=index+i-1;
        B=permutation(index,:);
        permutation(index,:)=permutation(i,:);
        permutation(i,:)=B;
        B=b(index,:);
        b(index,:)=b(i,:);
        b(i,:)=B;
    end
    l=eye(n);
    u=A;
    for i=1:n
        l(i+1:n,i)=A(i+1:n,i)./A(i,i);
        pivot=u(i+1:n,i)/u(i,i);
        u(i+1:n,:)=u(i+1:n,:) - pivot*u(i,:);
    end
    y(1,:)= b(1,:);
    for i=2:m
        y(i,:) = b(i,:) - l(i,1:i-1)*y(1:i-1,:);
    end
    x(m,:)=y(m,:)/u(m,m);
    for i=1:n-1
        x(n-i,:)= (y(n-i,:) - u(n-i,n-i+1:n)*x(n-i+1:n,:))/u(n-i,n-i);
    end
    fileid=fopen('output.txt','w');
    fprintf(fileid,'%s\n','LU Decomposition using Gauss with pivoting');
    fprintf(fileid,'%s\n','permutation =');
    for i=1:1:n
        for j=1:1:n
            fprintf(fileid,'% .4f ',permutation(i,j));
        end
        fprintf(fileid,'\n');
    end
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
end

