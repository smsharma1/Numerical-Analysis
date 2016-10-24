function a =  bisection(f,xl,xu,max_iter,max_rel_err)
if f(xl)*f(xu) > 0
    fprintf('Invalid Input');
    return
end
xr=(xl+xu)/2;
x=xr;
fx=f(xr);
N=2;
iter=2;
error=[];
x1=xr;
if(f(xr)*f(xl) > 0)
    xl=xr;
else
    xu=xr;
end
if(f(xr)~= 0)
    while(1)
        xr=(xl+xu)/2;
        x=[x xr];
        fx=[fx f(xr)];
        err=abs(100*(xr - x1)/xr);
        error=[error err];
        x1=xr;
        if (f(xr)==0) || ( err < max_rel_err) || (N == max_iter)
            saveas(plot(x,fx),'bisectionq_1_1.png');
            saveas(plot(iter,error),'bisectionq_1_2.png');
            a=xr;
            break;
        end
        N=N+1;
        iter=[iter N];
        if(f(xr)*f(xl)<0)
            xu=xr;
        else
            xl=xr;
        end
    end
end
saveas(plot(x,fx),'bisectionq_1_1.png');
saveas(plot(iter,error),'bisectionq_1_2.png');
a=xr;
end
