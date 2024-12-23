import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[4: STANDARDIZING INFORMATION]")

### Loading Structural Errors Fixed Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_name_clean.parquet")
print("\nSuccessfully Loaded the Data!")

### Converting Avail Date to Date Time Format
print("\nConverting avail date to date time format..")
df_merged['avail_date'] = pd.to_datetime(df_merged['avail_date'])

### Converting Birthday to Date Time Format
print("Converting birthday to date time format..")
df_merged['birthday'] = pd.to_datetime(df_merged['birthday'])

print("Successfully converted!")

### Saving data
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_standardized_info.parquet")
print("\nSuccessfully Saved the Data!")