while(1)
    f=input('Please enter the  non linear function\n');
    disp('Please enter the options')
    str=input(' a = Muller \n b = Bairstow \n','s');
    if(str=='a')
        x0=input('Enter x0\n');
        x1=input('Enter x1\n');
        x2=input('Enter x2\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        Muller(f,x0,x1,x2,max_iter,max_rel_error)
    elseif(str=='b')
        r=input('Enter r\n');
        s=input('Enter s\n');
        max_iter=input('Enter Max_iteration\n');
        max_rel_error=input('Enter Max_relative error\n');
        bairstow(f,r,s,max_iter,max_rel_error)
    else
        fprintf('Invalid Input\n');
    end
end
    
    
