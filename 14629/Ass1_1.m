while(1)
    f=input('Please enter the  non linear function\n');
    disp('Please enter the options')
    str=input(' a = Bracketing Method \n b = False-position \n c = Modified false-position \n d = Newton-Raphson \n e = Secant \n','s');
    if(str=='a')
        xl=input('Enter xl\n');
        xu=input('Enter xu\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        bisection(f,xl,xu,max_iter,max_rel_error)
    elseif(str=='b')
        xl=input('Enter xl\n');
        xu=input('Enter xu\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        falsepos(f,xl,xu,max_iter,max_rel_error)
    elseif(str=='c')
        xl=input('Enter xl\n');
        xu=input('Enter xu\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        modifiedfalsepos(f,xl,xu,max_iter,max_rel_error)
    elseif(str=='d')
        x0=input('Enter x0\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        Newtonrap(f,x0,max_iter,max_rel_error)
    elseif(str=='e')
        x0=input('Enter x-1\n');
        x1=input('Enter x0\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        secantmet(f,x0,x1,max_iter,max_rel_error)
    else
        fprintf('Invalid Input\n');
    end
end
    
    
