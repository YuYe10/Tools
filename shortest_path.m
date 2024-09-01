disp("这是使用gb2312编辑的MATLAB文件")
clear;clc;
% 注意Matlab中的图节点要从1开始编号
s = {'v1','v1','v1','v2','v3','v3','v4','v5','v5','v5','v5','v6','v6','v7','v9','v9'}; 
t = {'v2','v3','v4','v5','v2','v4','v6','v4','v6','v7','v8','v5','v7','v8','v5','v8'}; 
weight = [6,3,1,1,2,2,10,6,4,3,6,10,2,4,2,3];
%要做出有向图，只需要将graph改为digraph就行了 
G= digraph(s,t,weight);%有向图
myplot = plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);%图赋给一个变量 
set(gca,'XTick',[],'YTick',[]);
%[p,d] = shortestpath(G,start,end,[‘Method’,algorithm])
% 功能:返回图G中start节点到end节点的最短路径%输入参数:
% (1)G- 输入图 (graph 对象|digraph 对象)
% (2) start 起始的节点% 
% (3) end 目标的节点
% (4)[‘Method’,algorithm]是可选的参数，表示计算最短路径的算法。一般我% 们不用手动设置，默认使用的是“auto”，具体可设置的参数见下一页课件。% 输出参数:
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% (1)P - 最短路径经过的节点 
% (2)d - 最短距离
[P,d] = shortestpath(G,'v1','v8')%求v1到v8的最短路径和距离

%在图中高亮出最短路径
highlight(myplot,P,'EdgeColor','red')