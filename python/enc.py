import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

# --- 前処理・学習（先ほどと同様） ---
df = pd.read_csv(
    '/root/university/python/all_data_output.csv',
)
df.columns = (
    df.columns
      .str.strip()
      .str.replace('\n', '', regex=False)
      .str.replace('（', '(', regex=False)
      .str.replace('）', ')', regex=False)
)
y = df['C_2017コミュニティバス運行2017年']\
      .apply(lambda x: 1 if x in [1,'有','Yes','Y','○'] else 0)
X = df[['高齢化率']]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.5, random_state=42, stratify=y
)
scaler = StandardScaler()
X_train_s = scaler.fit_transform(X_train)
X_test_s  = scaler.transform(X_test)

model = LogisticRegression(solver='liblinear')
model.fit(X_train_s, y_train)

# --- 予測確率の取得 ---
# X_test_s は 2D array なので、列 0 が高齢化率
ages = X_test['高齢化率'].values
probs = model.predict_proba(X_test_s)[:, 1]  # 「1」と判定される確率

# --- 散布図＋ロジスティック曲線をプロット ---
# ソートして滑らかな曲線を引く
idx = np.argsort(ages)
ages_sorted = ages[idx]
probs_sorted = probs[idx]

plt.figure(figsize=(6, 4))
# 散布図
plt.scatter(ages, probs, alpha=0.5, label='Probability')
# 曲線
plt.plot(ages_sorted, probs_sorted, '-', linewidth=2, label='Transition of Probability')

plt.xlabel('aging rate')
plt.ylabel('P(community bus)')
plt.title('aging rate vs. P')
plt.legend()
plt.tight_layout()
plt.savefig("2017_community.png")