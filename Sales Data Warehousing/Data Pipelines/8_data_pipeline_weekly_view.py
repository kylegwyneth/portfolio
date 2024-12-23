import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[8: WEEKLY SALES VIEW PER SERVICE]")

### Loading Validated Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_age_restriction.parquet")
print("\nSuccessfully Loaded the Data!")

### Weekly Sales Per Branch
print("\nGenerating Weekly Sales Per Service...")
df_merged['avail_date'] = pd.to_datetime(df_merged['avail_date'])
df_merged.groupby(['service', df_merged['avail_date'].dt.to_period('W')])['price'].sum().to_frame()

### Saving data
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_weekly_per_service.parquet")
print("\nSuccessfully Saved the Data!")