function e = secantmet(f,x0,x1,max_iter,max_rel_error)
N=1;
x=x1;
fx=f(x1);
x2=x1 - f(x1)*((x1-x0)/(f(x1)-f(x0)));
x=[x x2];
fx=[fx f(x2)];
x0=x1;
x1=x2;
N=N+1;
while(N<=max_iter)
    x2=x1 - f(x1)*((x1-x0)/(f(x1)-f(x0)));
    x=[x x2];
    fx=[fx f(x2)];
    err=abs(100*(x2-x1)/x2);
    error(N)= err;
    iter(N)=N;
    x0=x1;
    x1=x2;
    if (f(x2)== 0) || (err <= max_rel_error)
        saveas(plot(x,fx),'secantmetq_1_1.png');
        saveas(plot(iter,error),'secantmetq_1_2.png');
        e=x2;
        break;
    end
    N=N+1;
end
saveas(plot(x,fx),'secantmetq_1_1.png');
saveas(plot(iter,error),'secantmetq_1_2.png');
e=x2;
end
