'''斯皮尔曼相关(Spearman correlation)系数概述及其计算例 https://blog.csdn.net/chenxy_bwave/article/details/121427036'''
import random
import numpy as np
from scipy import stats
 
stats.spearmanr([3,5,1,6,7,2,8,9,4], [5,3,2,6,8,1,7,9,4])

rng = np.random.default_rng()
x2n = rng.standard_normal((100, 2))
stats.spearmanr(x2n)

