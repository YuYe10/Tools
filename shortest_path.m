disp("����ʹ��gb2312�༭��MATLAB�ļ�")
clear;clc;
% ע��Matlab�е�ͼ�ڵ�Ҫ��1��ʼ���
s = {'v1','v1','v1','v2','v3','v3','v4','v5','v5','v5','v5','v6','v6','v7','v9','v9'}; 
t = {'v2','v3','v4','v5','v2','v4','v6','v4','v6','v7','v8','v5','v7','v8','v5','v8'}; 
weight = [6,3,1,1,2,2,10,6,4,3,6,10,2,4,2,3];
%Ҫ��������ͼ��ֻ��Ҫ��graph��Ϊdigraph������ 
G= digraph(s,t,weight);%����ͼ
myplot = plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);%ͼ����һ������ 
set(gca,'XTick',[],'YTick',[]);
%[p,d] = shortestpath(G,start,end,[��Method��,algorithm])
% ����:����ͼG��start�ڵ㵽end�ڵ�����·��%�������:
% (1)G- ����ͼ (graph ����|digraph ����)
% (2) start ��ʼ�Ľڵ�% 
% (3) end Ŀ��Ľڵ�
% (4)[��Method��,algorithm]�ǿ�ѡ�Ĳ�������ʾ�������·�����㷨��һ����% �ǲ����ֶ����ã�Ĭ��ʹ�õ��ǡ�auto������������õĲ�������һҳ�μ���% �������:
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% (1)P - ���·�������Ľڵ� 
% (2)d - ��̾���
[P,d] = shortestpath(G,'v1','v8')%��v1��v8�����·���;���

%��ͼ�и��������·��
highlight(myplot,P,'EdgeColor','red')