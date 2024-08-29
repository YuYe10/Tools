import numpy as np
import random
from scipy import stats
 
stats.spearmanr([3,5,1,6,7,2,8,9,4], [5,3,2,6,8,1,7,9,4])

rng = np.random.default_rng()
x2n = rng.standard_normal((100, 2))
stats.spearmanr(x2n)

