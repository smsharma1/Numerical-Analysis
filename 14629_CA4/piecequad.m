function  v = piecequad( x,y,u )
N=length(x);
n=N-1;
hori=zeros(2*n-2,3*n);
kori=zeros(2*n-2,1);
for l=2:N-1
    j=l-1;
    i=2*(l-2)+1;
    hori(i,j)=x(l)^2;
    hori(i+1,j+1)=x(l)^2;
    hori(i,j+n)=x(l);
    hori(i+1,j+1+n)=x(l);
    hori(i,j+2*n)=1;
    hori(i+1,j+1+2*n)=1;
    kori(i)=y(l);
    kori(i+1)=y(l);
end
hori1=zeros(2,3*n);
kori1=zeros(2,1);
hori1(1,1)=x(1)^2;
hori1(1,n+1)=x(1);
hori1(1,2*n+1)=1;
hori1(2,n)=x(N)^2;
hori1(2,2*n)=x(end);
hori1(2,3*n)=1;
kori1(1,1)=y(1);
kori1(2,1)=y(end);

hori2=zeros(n-1,3*n);
kori2=zeros(n-1,1);

for l=2:N-1
    hori2(l-1,l-1)=2*x(l);
    hori2(l-1,l)=-2*x(l);
    hori2(l-1,l-1+n)=1;
    hori2(l-1,l+n)=-1;
    kori2(l-1,1)=0;
end

H=[hori;hori1;hori2];
K=[kori;kori1;kori2];

H=H(:,2:end);

coefficients=inv(H)*K;

A=[0;coefficients(1:n-1)];
B=[coefficients(n:2*n-1)];
C=[coefficients(2*n:end)];

k = ones(size(u));
for j=1:n
    k(x(j) <= u) = j;
end
v = (A(k).*(u.^2)) + (B(k).*u) + C(k);
fileid=fopen('output2.txt','w');
fprintf(fileid,'%s','Interpolated values of y* at given x* ');
fprintf(fileid,'\n');
fprintf(fileid,'%s','Quadratic Spline: ');
fprintf(fileid,'\n');
for i=1:size(u)
    fprintf(fileid,'%.4f %.4f\n',u(i,1),v(i,1));
end
fclose(fileid);
type('output2.txt');
plot(x,y,'m');
hold on;
for i=1:N-1
    x1=x(i):0.001:x(i+1);
    y1= (A(i).*(x1.^2)) + (B(i).*x1) + C(i);
    j=plot(x1,y1,'m');
    legend(j,'Quadratic Spline');
end
end



