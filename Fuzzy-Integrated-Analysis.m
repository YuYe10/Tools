% 1、一级模糊综合评判
% 影响运行费用的各因素的单因素评价矩阵为：
R23=[0.18 0.14 0.18 0.14 0.13 0.23;
     0.15 0.20 0.15 0.25 0.10 0.15;
     0.25 0.12 0.13 0.12 0.18 0.20;
     0.16 0.15 0.21 0.11 0.20 0.17;
     0.23 0.18 0.17 0.16 0.15 0.11;
     0.19 0.13 0.12 0.12 0.11 0.33;
     0.17 0.16 0.15 0.08 0.25 0.19];
% 权重分配为
A23=[0.20 0.15 0.10 0.10 0.20 0.15 0.10];
% 评价结果
B23=A23*R23

% 2、二级模糊综合评判
% 产品情况的二级评判如下：
R1=[0.12 0.18 0.17 0.23 0.13 0.17;
    0.15 0.13 0.18 0.25 0.12 0.17;
    0.14 0.13 0.16 0.18 0.20 0.19;
    0.12 0.14 0.15 0.17 0.19 0.23;
    0.16 0.12 0.13 0.25 0.18 0.16];
A1=[0.15 0.40 0.25 0.10 0.10];
B1=A1*R1
% 销售能力二级评判如下：
R2=[0.13 0.15 0.14 0.18 0.16 0.25;
    0.12 0.16 0.13 0.17 0.19 0.23;
    B23;
    0.14 0.13 0.15 0.16 0.18 0.24;
    0.16 0.15 0.15 0.17 0.18 0.19];
A2=[0.2 0.15 0.25 0.25 0.15];
B2=A2*R2

% 市场需求的二级评判
R3=[0.15 0.14 0.13 0.18 0.14 0.26;
    0.16 0.15 0.18 0.14 0.16 0.21];
A3=[0.55 0.45];
B3=A3*R3

% 3、三级模糊综合评判
R=[B1;B2;B3]
A=[0.4 0.3 0.3]
B=A*R