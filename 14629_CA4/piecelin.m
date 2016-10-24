function  v = piecelin( x,y,u )
delta = diff(y)./diff(x);
n = length(x);
k = ones(size(u));
for j=2:n-1
    k(x(j) <= u) = j;
end
s=u-x(k);
v=y(k) + s.*delta(k);
fileid=fopen('output1.txt','w');
fprintf(fileid,'%s','Interpolated values of y* at given x* ');
fprintf(fileid,'\n');
fprintf(fileid,'%s','Linear Spline: ');
fprintf(fileid,'\n');
for i=1:size(u)
    fprintf(fileid,'%.4f %.4f\n',u(i,1),v(i,1));
end
fclose(fileid);
type('output1.txt');
plot(x,y,'*r');
hold on;
for i=1:n-1
    x1=x(i):0.001:x(i+1);
    s=x1-x(i);
    y1=y(i) + s * delta(i);
    j=plot(x1,y1,'r');
    legend(j,'linear spline');
end
end

