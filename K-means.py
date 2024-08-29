from sklearn.cluster import KMeans  
import numpy as np  
import matplotlib.pyplot as plt  
  
# 假设我们有一些二维数据  
data = np.array([[1, 2], [1, 4], [1, 0], [4, 2], [4, 4], [4, 0]])  
  
# 设置聚类数K  
K = 4
  
# 初始化KMeans对象  
kmeans = KMeans(n_clusters=K, random_state=0)  
  
# 对数据进行拟合和预测  
kmeans.fit(data)  
labels = kmeans.predict(data)  
centroids = kmeans.cluster_centers_  
  
# 打印聚类中心和标签  
print("Cluster centers:")  
print(centroids)  
print("Labels:")  
print(labels)  
 
# 可视化结果  
plt.scatter(data[:, 0], data[:, 1], c=labels, cmap='viridis')  
plt.scatter(centroids[:, 0], centroids[:, 1], c='red', s=300, alpha=0.5)  
plt.title('K-means Clustering')  
plt.xlabel('Feature 1')  
plt.ylabel('Feature 2')  
plt.show()
