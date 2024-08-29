import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
sns.set(style="whitegrid")
tips = sns.load_dataset("tips")
sns.relplot(x="total_bill", y="tip", col="time", hue="smoker", size="size", data=tips)
plt.show()