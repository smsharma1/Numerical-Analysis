fileid=fopen('input.txt','r');
n=fscanf(fileid,'%d',1);
A=zeros(n,n);
b=zeros(n,1);
for i=1:1:n
    for j=1:1:n+1
        if j<=n
            A(i,j)=fscanf(fileid,'%f',1);
        else
            b(i,1)=fscanf(fileid,'%f',1);
        end
    end
end
fclose(fileid);
disp('Please enter the options')
str=input(' a = Gauss elimination (GE; without pivoting) \n b = GE (with pivoting) \n c = GE (with scaling and pivoting) \n d = LU decomposition by using GE (without pivoting) \n e = LU decomposition by using GE (with pivoting) \n f = LU decomposition by using Crout method (without pivoting) \n g = Cholesky decomposition (for symmetric positive definite matrix)\n','s');
if(str == 'a')
    Gauss_without_pivot(A,b)
elseif(str == 'b')
    Gauss_with_pivot(A,b)
elseif(str == 'c')
    Gauss_with_pivot_scaled(A,b)
elseif(str == 'd')
    LU_Gass_nopivot(A,b)
elseif(str == 'e')
    LU_Gauss_pivot(A,b)
elseif(str == 'f')
    LUdecompCrout(A,b)
elseif(str == 'g')
    Cholesky(A,b)
end
    
            
    
    