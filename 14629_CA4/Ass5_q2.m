x = [];
y = [];
u = [];
s = [];
fileid=fopen('input1.txt','r');
data = textscan(fileid, '%*s %*s %*s %*s\n');
data = textscan(fileid, '%f %f');
x(1:numel(data{1}), 1) = data{1};
y(1:numel(data{2}), 1) = data{2};
data = textscan(fileid, '%*s %*s %*s %*s %*s %*s %*s %*s\n');
data1 = textscan(fileid, '%f ');
u(1:numel(data1{1}), 1) = data1{1};
data = textscan(fileid, '%*s %*s %*s %*s %*s %*s %*s %*s %*s %*s\n');
data1 = textscan(fileid, '%f ');
s(1:numel(data1{1}), 1) = data1{1};
fclose(fileid);
disp('Please enter the options')
str=input(' a = Linear spline \n b = Quadratic spline \n c = Natural spline \n d = Not-a-knot spline \n e = Periodic spline \n f = Clamped spline \n','s');
if(str == 'a')
    piecelin(x,y,u)
elseif(str == 'b')
    piecequad(x,y,u)
elseif(str == 'c')
    naturalspline(x,y,u)
elseif(str == 'd')
    notaknotspline(x,y,u)
elseif(str == 'e')
    periodicspline(x,y,u)
elseif(str == 'f')
    clampedspline(x,y,u,s)
else
    printf('Invalid Input');
end