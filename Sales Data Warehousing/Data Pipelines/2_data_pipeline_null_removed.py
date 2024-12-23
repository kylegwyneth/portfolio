import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[2: REMOVING NULL VALUES]")

### Loading Duplicates Removed Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_txn_duplicates_removed.parquet")
print("\nSuccessfully Loaded the Data!")

### Converting empty cells to NaN
print("\nConverting empty cells to NAN...")
df_merged.replace('', np.nan, inplace=True)

### Removing NaN Values
print("Removing NAN values...")
print(df_merged.shape)
df_merged = df_merged.dropna()
print(df_merged.shape)

### Remove N/A from branch name
print("Removing N/A from branch name...")
df_merged = df_merged[df_merged['branch_name'].str.contains('N/A')==False]

### Remove rows with 0 price
print("Removing rows with price at 0...")
df_merged = df_merged[df_merged['price'] != 0]

print("Successfully removed null data!")

### Saving data
print("\nSaving data...")
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_null_removed.parquet")
print("Successfully Saved the Data!")
