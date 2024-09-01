'''Person相关分析原理以及python实现 https://blog.csdn.net/qq_46033892/article/details/126877353'''
import numpy as np
import pandas as pd
from scipy.stats import pearsonr
import seaborn as sns
import matplotlib.pyplot as plt
from scipy import stats

# 2.0.1无法读取xlsx文件，降低版本到1.2.0 pip install xlrd==1.2.0
test_data = pd.read_excel(r"八年级女生体测数据.xlsx")
# 数据统计
Desc = test_data.describe()
"""
方式一：
Dataframe.corr()   计算两两之间的相似度，返回Dataframe类型
Series.corr(other)  计算该序列与传入序列相关度，返回一个数值
例如：data['身高'].corr(data['体重'])

DataFrame.corr(method='pearson', min_periods=1)
参数说明：
method：可选值为{‘pearson’, ‘kendall’, ‘spearman’}
Pearson相关系数样本必须是正态分布,衡量两个数据集合是否在一条线上面，即针对线性数据的相关系数计算，针对非线性数据便会有误差。
kendall：用于反映分类变量相关性的指标，即针对无序序列的相关系数，非正太分布的数据
spearman：非线性的，非正太分布的数据的相关系数
min_periods：样本最少的数据量，最少为1
"""
result_1 = test_data.corr(method='pearson')



"""
方式二：
将Dataframe转换为array，array.corrcoef(data),返回相关度二维数组
"""
data = np.array(test_data)
# numpy自带函数,rowvar=False代表以列为变量
result_2 = np.corrcoef(data, rowvar=False)




"""
方式三：
scipy.stats中的pearsonr(X,Y)分析两个变量，无法计算相关矩阵
返回值：
r : float，皮尔逊相关系数，[-1，1]之间。
p-value : float，Two-tailed p-value（双尾P值）。
注：p值越小，表示相关系数越显著，一般p值在500个样本以上时有较高的可靠性。可以理解为显著性水平。
"""
result_3 = pearsonr(test_data['身高'], test_data['体重'])

"""
数据可视化
"""
# 相关性热力图可视化
ax = sns.heatmap(result_1, vmax=1, cmap='RdYlGn', annot=True)
ax.set_xticklabels(list(test_data))
ax.set_yticklabels(list(test_data))
# 设置中文标签显示
plt.rcParams['font.sans-serif'] = ['Kaitt', 'SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.show()
# 生成散点图,可以初步判断正态分布
ax_1 = sns.pairplot(test_data)
plt.show()

for i in list(test_data):
    index_i = list(test_data).index(i)
    plt.subplot(3,2,index_i+1)
    sns.histplot(test_data[i], kde=True)
plt.show()

"""
正态分布KS检验
满足p > 0.05的情况，服从正态分布。
"""
print(Desc)
All_mean = Desc.loc['mean']
All_std = Desc.loc['std']
for i in list(test_data):
    statistic, pvalue = stats.kstest(test_data[i], 'norm', (All_mean.loc[i], All_std.loc[i]))
    print(pvalue)

