function output = Obj_fun2(x)
    x1 = x(1);
    x2 = x(2);
    output = (x1.^2+x2.^2-x1.*x2-10*x1-4*x2+60);
end