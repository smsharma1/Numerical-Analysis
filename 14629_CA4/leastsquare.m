function o = leastsquare( x,y,m )
n=size(x);
if n < m+1
    printf('Incorrect Input');
else
    for i = 1:m+1
        for j=1:i
            k=i+j-2;
            sum=0;
            for l=1:n
                sum=sum+(x(l)^k);
            end
            a(i,j)=sum;
            a(j,i)=sum;
        end
        sum=0;
        for l=1:n
            sum=sum+y(l)*(x(l)^(i-1));
        end
        b(i)=sum;
    end            
end
l=plot(x,y,'*');
legend(l,'Data');
hold on
t=[floor(min(x)):0.0001:ceil(max(x))];
b=b';
o=inv(a)*b;
sum=o(1);
for i= 2:length(o)
    sum=sum+o(i)*(t.^(i-1));
end
if(m==1)
    l=plot(t,sum,'r');
    legend(l,'Linear');
elseif(m==2)
    l=plot(t,sum,'c');
    legend(l,'Quadratic');
elseif(m==3)
    l=plot(t,sum,'g');
    legend(l,'Cubic');
elseif(m==4)
    l=plot(t,sum,'k');
    legend(l,'Quartic');
else
    plot(t,sum)
end
hold on
sum = o(1);
for i= 2:length(o)
    sum=sum+o(i)*(x.^(i-1));
end
s0=0;
mean=b(1)/n(1);
s1=0;
for i =1:n
    s0=s0+(y(i)-mean)^2;
    s1=s1+(y(i)-sum(i))^2;
end
rsq=1-(s1/s0);
fileid=fopen('output1_1.txt','w');
fprintf(fileid,'%s','coefficients  ');
for i=1:m+1
    fprintf(fileid,'%.3f ',o(i));
end
fprintf(fileid,'\n%s','R-sq ');
fprintf(fileid,'%.4f\n',rsq);
fclose(fileid);
type('output1_1.txt');
end

