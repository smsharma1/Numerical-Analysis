function y = Direct_Power( A,max_iter,max_rel_error )
[n m]=size(A);
y=rand(m,1);
y=y/norm(y);
y=ones(m,1);
lambda=1;
for i=1:max_iter
    y1=A*y;
    [lambda1 index]=max(abs(y1));
    if(y1(index) < 0)
        lambda1=-1*lambda1;
    end
    y=y1/lambda1;
    p=abs(((abs(lambda1)-abs(lambda))/abs(lambda1))*100);
    if( p < max_rel_error)
        lambda=lambda1;
        break;
    end
    lambda=lambda1;
end
y=y/norm(y);
fileid=fopen('outputofdirect.txt','w');
fprintf(fileid,'%s\n\n','Direct Power Method');
fprintf(fileid,'%s\n','Eigenvalue =');
fprintf(fileid,'% .4f\n\n',lambda);
fprintf(fileid,'%s\n','Eigenvector =');
for k=1:1:n
    fprintf(fileid,'% .4f\n',y(k,:));
end
fprintf(fileid,'\n%s\n','Iterations =');
fprintf(fileid,'%d\n\n',i);
fclose(fileid);
type('outputofdirect.txt');
end

