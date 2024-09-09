from sklearn.cluster import KMeans  
import numpy as np  
import pandas as pd
import matplotlib.pyplot as plt  

# 设置中文字体  
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用黑体  
plt.rcParams['axes.unicode_minus'] = False    # 解决负号显示问题    
# 读取xlsx文件  
data = pd.read_excel('data.xlsx',sheet_name='Sheet2',usecols=['作物编号','每亩利润'],engine='openpyxl')  
df = data.values
# 查看数据  
print(df)
# 设置聚类数K  
K = 4
  
# 初始化KMeans对象  
kmeans = KMeans(n_clusters=K, random_state=0)  
  
# 对数据进行拟合和预测  
kmeans.fit(df)  
labels = kmeans.predict(df)  
centroids = kmeans.cluster_centers_  
  
# 打印聚类中心和标签  
print("Cluster centers:")  
print(centroids)  
print("Labels:")  
print(labels)  
 
# 可视化结果  
plt.scatter(data['作物编号'],data['每亩利润'],c=labels, cmap='viridis')
plt.scatter(centroids[:, 0], centroids[:, 1], c='red', s=300, alpha=0.5)  
plt.title('K-means Clustering')  
plt.xlabel('编号')  
plt.ylabel('每亩售价')  
plt.show()
