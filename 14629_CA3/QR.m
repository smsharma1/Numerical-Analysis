function qrans = QR(A , max_iter, max_rel_error)
[n  m]=size(A);
if(n ~= m)
    printf('Error in input');
    return;
end
for k=1:max_iter
    Q=zeros(n,n);
    R=zeros(n,n);
    for j=1:n
        v=A(:,j);
        for(i=1:j-1)
            R(i,j)=Q(:,i)'*A(:,j);
            v=v-R(i,j)*Q(:,i);
        end
        R(j,j)=norm(v);
        Q(:,j)=v/R(j,j);
    end
    B=R*Q;
    flag=1;
    for i=1:m
        e=(100*(abs(max(B(:,i)))-abs(max(A(:,i)))))/abs(max(B(:,i)));
        if(e > max_rel_error)
            flag=0;
            break;
        end
    end        
    if(flag ~= 0)
        A=B;
        break;
    end
    A=B;
end
for i=1:n
    lambda(i)=norm(A(:,i));
    A(:,i)=A(:,i)/lambda(i);
end
fileid=fopen('outputofQR.txt','w');
fprintf(fileid,'%s\n\n','QR Method');
fprintf(fileid,'%s\n','Eigenvalue =');
for l=1:n
    fprintf(fileid,'% .4f\n',lambda(l));
end
fprintf(fileid,'\n%s\n','Iterations =');
fprintf(fileid,'%d\n\n',k);
fclose(fileid);
type('outputofQR.txt');
end
