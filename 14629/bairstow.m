function y = bairstow(f,r,s,max_iter,max_rel_error)
N=1;
syms t;
a=sym2poly(f(t));
n=(size(a));
n=n(2);
sol=[];
fz=[];
while(N<=max_iter)
    b(1)=a(1);
    b(2)=r*b(1)+a(2);
    for i=3:n
        b(i)=a(i)+r*b(i-1)+s*b(i-2);
    end
    c(1)=b(1);
    c(2)=b(2)+r*c(1);
    for i=3:n
        c(i)=b(i)+r*c(i-1)+s*c(i-2);
    end
    ds = (b(n)*c(n-2)-b(n-1)*c(n-1))/(c(n-1)*c(n-3)-(c(n-2)^2));
    dr = (-b(n-1)*c(n-2) + c(n-3)*b(n))/(c(n-2)^2 - c(n-1)*c(n-3));
    s=s+ds;
    r=r+dr;
    y = (-2*s)/(r-sqrt(r^2 + 4*s));
    y = [y (-2*s)/(r+sqrt(r^2 + 4*s))];
    sol=[sol y(1)];
    fz=[fz f(y(1))];
    if (100*abs(ds)/abs(s) <= max_rel_error) && (100*abs(dr)/abs(r) <= max_rel_error)        
        saveas(plot(sol,fz),'bairstow.png');
        break;
    end
    N=N+1;
end
 y = (-2*s)/(r-sqrt(r^2 + 4*s));
 y = [y (-2*s)/(r+sqrt(r^2 + 4*s))];
 
end

