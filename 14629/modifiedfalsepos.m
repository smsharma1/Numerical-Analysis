function c = modifiedfalsepos(f,xl,xu,max_iter,max_rel_err)
if(f(xl)*f(xu)>0)
    fprintf('Invalid Input\n');
    return;
end 
xr=(xl+xu)/2;
x(1)=xr;
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
        xr = xu + (-f(xu))*((xu-xl)/(f(xu)-f(xl)));
        x(N)=xr;
        fx=[fx f(xr)];
        err=abs(100*(xr - x(N-1))/xr);
        error=[error err];
        x1=xr;
        if (f(xr)==0) || ( err < max_rel_err) || (N == max_iter)
            saveas(plot(x,fx),'modfalsepos_1_1.png');
            saveas(plot(iter,error),'modfalsepos_1_2.png');
            c=xr;
            break;
        end
        iter=[iter N];
        N=N+1;
        if(f(xr)*f(xl)<0)
            xu=xr;
            xl=(xr+xl)/2;
        else
            xl=xr;
            xu=(xu+xr)/2;
        end
    end
end
saveas(plot(x,fx),'modfalseposq_1_1.png');
saveas(plot(iter,error),'modfalsepos_1_2.png');
c=xr;
end

