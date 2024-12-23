import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[5: DATA VALIDATION - AVAIL DATES, BRANCHES, BIRTHAYS]")

### Loading Cleaned Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_standardized_info.parquet")
print("\nSuccessfully Loaded the Data!")

### Removing rows with avail date beyond current date
print("\nRemoving rows with avail date beyond current date...")
df_merged = df_merged[df_merged['avail_date'] < current_date]

### Removing rows with same transaction id and avail date but different branch name
print("Removing rows with same transaction id and avail date but different branch name...")
df_merged = df_merged.drop_duplicates(subset=['txn_id','avail_date','service'], keep ='first')

### Removing same transaction id and names but different birthday keeping only the earlier avail date
print("Removing  same transaction id and names but different birthday keeping only the earlier avail date...")
df_merged['birthday'] = df_merged.sort_values(['txn_id','avail_date'],ascending=False).groupby('txn_id')['birthday'].transform('first')

print("Successfully removed!")

### Saving data
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_date.parquet")
print("\nSuccessfully Saved the Data!")