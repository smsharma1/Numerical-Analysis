function x = LUdecompCrout( A , b )
[n m] = size(A);
[n1 k] = size(b);
if(n ~= n1)
    printf('Invalid Input\n');
end
for i = 1:n
    l(i,1)=A(i,1);
    u(i,i)=1;
end
for i = 2:m
    u(1,i) = A(1,i)/l(1,1);
end
for i = 2:n
    for j=2:i
        l(i,j) = A(i,j) - l(i,1:j-1)*u(1:j-1,j);
    end
    for j=i+1:m
        u(i,j) = (A(i,j) - l(i,1:i-1)*u(1:i-1,j))/l(i,i);
    end
end
if(l*u ~= A)
    printf('Method is Incorrect');
end
y(1,:) = b(1,:)./l(1,1);
for i = 2:m
    y(i,:) = (b(i,:) - l(i,1:i-1)*y(1:i-1,:))./l(i,i);
end
x(n,:)=y(n,:);
for i=1:n-1
    x(n-i,:) = y(n-i,:) - u(n-i,n-i+1:m)*x(n-i+1:n,:);
end
    fileid=fopen('output.txt','w');
    fprintf(fileid,'%s\n','LU Decomposition using Crout');
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

