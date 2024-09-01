'''【Python・统计学】单因素方差分析（简单原理及代码）https://blog.csdn.net/TUTO_TUTO/article/details/137249825'''
import pandas as pd
import pingouin as pg
from tabulate import tabulate
 
# 创建示例数据
data = pd.DataFrame({
    'Group': ['A', 'A', 'A', 'A', 'B', 'B', 'B', 'B', 'C', 'C', 'C', 'C'],
    'Score': [10, 12, 8, 15, 20, 18, 22, 19, 9, 7, 11, 8]
})
 
# 方差齐性检验（Levene检验）
levene_result = pg.homoscedasticity(data, dv='Score', group='Group', method='levene')
print("Levene's test for equality of variances:")
print(tabulate(levene_result, headers='keys', tablefmt='grid'))
 
# 单因素方差分析
anova_result = pg.anova(data, dv='Score', between='Group', detailed=True)
print("\nOne-way ANOVA:")
print(tabulate(anova_result, headers='keys', tablefmt='grid'))
 
# 事后检验（Tukey HSD检验）
posthoc_result = pg.pairwise_tukey(data, dv='Score', between='Group')
print("\nPost-hoc tests (Tukey HSD):")
print(tabulate(posthoc_result, headers='keys', tablefmt='grid'))

#效应量
# 单因素方差分析
anova_result = pg.anova(data, dv='Score', between='Group', detailed=True)
print("One-way ANOVA:")
print(tabulate(anova_result, headers='keys', tablefmt='grid'))
 
# 计算η²
eta_squared = anova_result['SS'][0] / anova_result['SS'].sum()
print(f"η² (Eta-squared): {eta_squared:.3f}")
 
# 计算partial η²
partial_eta_squared = anova_result['SS'][0] / (anova_result['SS'][0] + anova_result['SS'][1])
print(f"Partial η² (Partial Eta-squared): {partial_eta_squared:.3f}")