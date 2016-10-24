function [ y,lamda ] = Inverse_Power( B , max_iter, max_rel_error )
A=inv(B);
[n m]=size(A);
y=ones(m,1);
lambda=1000000000000;
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
lambda=1/lambda;
fileid=fopen('outputofinverse.txt','w');
fprintf(fileid,'%s\n\n','Inverse Power Method');
fprintf(fileid,'%s\n','Eigenvalue =');
fprintf(fileid,'% .4f\n\n',lambda);
fprintf(fileid,'%s\n','Eigenvector =');
for k=1:1:n
    fprintf(fileid,'% .4f\n',y(k,:));
end
fprintf(fileid,'\n%s\n','Iterations =');
fprintf(fileid,'%d\n\n',i);
fclose(fileid);
type('outputofinverse.txt');
end

