import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[1: REMOVING DUPLICATES]")

### Loading Raw data
df_branch_service = pd.read_json(r"C:\Users\arian\CSELEC1CLab3\branch_service_transaction_info.json")
df_customer_transaction = pd.read_json(r"C:\Users\arian\CSELEC1CLab3\customer_transaction_info.json")
print("\nSuccessfully Loaded the Data!")

### Merging data
df_merged = pd.merge(df_customer_transaction, df_branch_service)
print("Successfully Merged the Data!")

### Dropping duplicates
print("\nDropping Duplicates...")
print(df_merged.shape)
df_merged = df_merged.drop_duplicates()
print(df_merged.shape)
print("Successfully dropped duplicates!")

### Saving data
print("\nSaving data...")
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_txn_duplicates_removed.parquet")
print("Successfully Saved the Data!")