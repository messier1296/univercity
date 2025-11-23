import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix

# 1. データ読み込み
df = pd.read_csv(
    '/root/university/python/all_data_output.csv',
)

# 2. 列名の正規化（改行を除去、全角括弧→半角括弧、前後空白除去）
df.columns = (
    df.columns
      .str.strip()
      .str.replace('\n', '', regex=False)
      .str.replace('（', '(', regex=False)
      .str.replace('）', ')', regex=False)
)

pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)



print(">>> 正規化後の列名")
print(df.columns.tolist())

print("df.shape[0]")
print(df.shape[0])

# 3. 目的変数・説明変数の指定
target_col = 'C_2011コミュニティバス運行2011年'
features = [
    #'人口密度(人/km2)',
    #'面積(km2)',
    #'軽自動車率',
    #'15歳未満人口比率',
    '高齢化率',
    #'自家用車利用率'
]


data = df[[target_col] + features]

# 5. 目的変数を 0/1 に変換
y = data[target_col].apply(lambda x: 1 if x in [1, '有', 'Yes', 'Y', '○'] else 0)
X = data[features]

# 6. 訓練／テスト分割
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42, stratify=y
)

# 7. 標準化
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled  = scaler.transform(X_test)

# 8. モデル学習
model = LogisticRegression(solver='liblinear')
model.fit(X_train_scaled, y_train)


# 9. 評価
y_pred = model.predict(X_test_scaled)
print("\n=== Classification Report ===")
print(classification_report(y_test, y_pred, digits=4))
print("\n=== Confusion Matrix ===")
print(confusion_matrix(y_test, y_pred))
