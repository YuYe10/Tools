'''�����б������������MATLAB���룩https://zhuanlan.zhihu.com/p/354427449'''
clear all;;clc;
data=[4,2,2,3,4,9,6,9,8,10;2,4,3,6,4,10,8,5,7,8;1,1,1,1,1,0,0,0,0,0]';
[m,n]=size(data);
for i=1:m
    if data(i,3)==1
        plot(data(i,1),data(i,2),'r.','MarkerSize', 15);%Marker��ͼ�ϻ��ϵ�ĵط����Ϸ���,�����,ʮ��,�Ǻŵȵ�,�����size�������С��
        hold on;
    end
    if data(i,3)==0
        plot(data(i,1),data(i,2),'b.','MarkerSize', 15);
    end
end
new_data=zeros(m,n-1);
cen1=zeros(1,2);%��һ��ľ�ֵ����
cen0=zeros(1,2);%�ڶ���ľ�ֵ����
sum1=zeros(1,2);
sum0=zeros(1,2);
num1=0;num0=0;
for i=1:m
    if data(i,3)==1
        sum1(1,1)=sum1(1,1)+data(i,1);
        sum1(1,2)=sum1(1,1)+data(i,2);
        num1=num1+1;
    end
    if data(i,3)==0
        sum0(1,1)=sum0(1,1)+data(i,1);
        sum0(1,2)=sum0(1,2)+data(i,2);
        num0=num0+1;
    end
end
cen0=sum0/num0;%�����һ��ľ�ֵ����
cen1=sum1/num1;%����ڶ���ľ�ֵ����
%��������ɢ�Ⱦ���Sw
Sw=zeros(2,2);
for i=1:m
    if data(i,3)==1
        Sw=Sw+(data(i,[1 2])-cen1(1,:))'*(data(i,[1 2])-cen1(1,:));
    end
    if data(i,3)==0
        Sw=Sw+(data(i,[1 2])-cen0(1,:))'*(data(i,[1 2])-cen0(1,:));
    end
end
%�������ɢ�Ⱦ���Sb;
Sb=(cen0-cen1)'*(cen0-cen1);
[L,D]=eigs(Sw\Sb,1);%�����������ֵ����������
%��ʾͶӰ��
k=L(1)/L(2);
b=0;
xx=0:10;
yy=k*xx;
plot(xx,yy)
%����ͶӰ�㲢��ʾ
new_data(:,1)=(k*data(:,2)+data(:,1))/(k*k+1);
new_data(:,2)=k*new_data(:,1);
new_data(:,3)=data(:,3);
for i=1:m
    if new_data(i,3)==1
        plot(new_data(i,1),new_data(i,2),'r+','MarkerSize', 7);
    end
    if new_data(i,3)==0
        plot(new_data(i,1),new_data(i,2),'b+','MarkerSize', 7);
    end
end
axis([0 15 0 15])
hold on;