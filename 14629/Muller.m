function f =  Muller(f,x0,x1,x2,max_iter,max_rel_err)
h1=x1-x0;
h2=x2-x1;
x=x2;
fx=f(x2);
del1=(f(x1)-f(x0))/h1;
del2=(f(x2)-f(x1))/h2;
d=(del2-del1)/(h2+h1);
i=2;
while(i<=max_iter)
    b=del2+h2*d;
    D=sqrt(b^2 -4*f(x2)*d);
    if(abs(b-D) < abs(b+D))
        E=b+D;
    else
        E=b-D;
    end
    h=-2*f(x2)/E;
    p=x2+h;
    x=[x p];
    fx=[fx f(p)];
    err=abs(100*(p-x2)/p);
    if(err<=max_rel_err)
        saveas(plot(x,fx),'Muller.png');
        f=p;
        break;
    else
        x0=x1;
        x1=x2;
        x2=p;
        h1=x1-x0;
        h2=x2-x1;
        del1=(f(x1)-f(x0))/h1;
        del2=(f(x2)-f(x1))/h2;
        d=(del2-del1)/(h2+h1);
        i=i+1;
    end
end
saveas(plot(x,fx),'Muller.png');
f=p;        
