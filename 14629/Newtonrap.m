function d = Newtonrap(f,x0,max_iter,max_rel_error)
syms t;
fdiff=diff(f(t));
x=x0;
fx=f(x0);
error=[];
iter=[];
N=1;
x1=x0;
while(N<=max_iter)
    t=x0;
    l=subs(fdiff);
    if(l~=0)
        x0=x0 - f(x0)/l;
    end
    x=[x x0];
    fx=[fx f(x0)];
    err=abs(100*(x0-x1)/x0);
    error=[error err];
    iter=[iter N];
    x1=x0;
    if (f(x0)== 0) || (err <= max_rel_error)
        saveas(plot(x,fx),'Newtonrapq_1_1.png');
        saveas(plot(iter,error),'Newtonrapq_1_2.png');
        d=x0;
        break;
    end
    N=N+1;
end
saveas(plot(x,fx),'Newtonrapq_1_1.png');
saveas(plot(iter,error),'Newtonrapq_1_2.png');
d=x0;
end
    