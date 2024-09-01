disp("This a MATLAB program")
w = [0,7,9,inf,inf,14;
     7,0,10,15,inf,inf;
     9,10,0,11,inf,2;
     inf,15,11,0,6,inf;
     inf,inf,inf,6,0,9;
     14,inf,2,inf,9,0];
 start=1;terminal=5;
[D,path,min,path1]=floyd(w,start,terminal);
D,path,min,path1
