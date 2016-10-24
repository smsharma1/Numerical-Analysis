function x = Gauss_without_pivot(A,b)
[n m]=size(A);
[n1 k]=size(b);
if(n ~= n1)
    printf('Invalid Input');
    return;
else
    for i=1:n-1
        if(A(i,i) == 0)
            printf('Pivoting is needed!');
        end
        pivot=A(i+1:n,i)/A(i,i);
        A(i+1:n,:)=A(i+1:n,:) - pivot*A(i,:);
        b(i+1:n,:)=b(i+1:n,:) - pivot*b(i,:);
    end
    i=n;
    x(n,:)=b(n,:)/A(n,n);
    i=i-1;
    while(i > 0)
        x(i,:) = (b(i,:) - (A(i,i+1:n)*x(i+1:n,:)))/A(i,i);
        i=i-1;
    end
    fileid=fopen('output.txt','w');
     fprintf(fileid,'%s\n','Gauss Elimination without pivoting');
    fprintf(fileid,'%s\n','U =');
    for i=1:1:n
        for j=1:1:n
            fprintf(fileid,'% .4f ',A(i,j));
        end
        fprintf(fileid,'\n');
    end
    fprintf(fileid,'%s\n','X =');
    fprintf(fileid,'% .4f\n',x);
    fclose(fileid);
    type('output.txt');
    
end

