function  v = periodicspline( x,y,u )
n=length(x);

h=zeros(n,1);
for i=2:n
    h(i)=x(i)-x(i-1);
end

H=zeros(n);
H(1,1)=2*h(2);
H(1,2)=h(2);
H(1,n-1)=h(n);
H(1,n)=2*h(n);
H(n,1)=1;
H(n,n)=-1;
for i=2:n-1
    H(i,i-1)=h(i);
    H(i,i)=2*(h(i)+h(i+1));
    H(i,i+1)=h(i+1);
end
G=zeros(n,1);

for i=2:n-1
    G(i) = ((6/h(i+1))*(y(i+1)-y(i))) - ((6/h(i))*(y(i)-y(i-1)));
end
G(1)=-6*((y(n)-y(n-1))/h(n)) + (6*(y(2) - (y(1)))/h(2));
sigma=inv(H)*G;
A=zeros(n-1,1);
B=zeros(n-1,1);
C=zeros(n-1,1);
D=zeros(n-1,1);
for i=1:n-1
    A(i)=sigma(i+1)/(6*h(i+1));
    B(i)=sigma(i)/(6*h(i+1));
    C(i)=(y(i+1)/h(i+1))-(sigma(i+1)*h(i+1)/6);
    D(i)=(y(i)/h(i+1))-(sigma(i)*h(i+1)/6);
end
k = ones(size(u));
for j=1:n
    k(x(j) <= u) = j;
end
v=A(k).*((u-x(k)).^3)-B(k).*((u-x(k+1)).^3)+C(k).*(u-x(k))-D(k).*(u-x(k+1));
fileid=fopen('output5.txt','w');
fprintf(fileid,'%s','Interpolated values of y* at given x* ');
fprintf(fileid,'\n');
fprintf(fileid,'%s','Periodic spline: ');
fprintf(fileid,'\n');
for i=1:size(u)
    fprintf(fileid,'%.4f %.4f\n',u(i,1),v(i,1));
end
fclose(fileid);
type('output5.txt');
plot(x,y,'xg');
hold on;
for i=1:n-1
    x1=x(i):0.001:x(i+1);
    y1= A(i).*((x1-x(i)).^3)-B(i).*((x1-x(i+1)).^3)+C(i).*(x1-x(i))-D(i).*(x1-x(i+1));    
    j=plot(x1,y1,'g');
    legend(j,'Periodic Spline');
end
end


