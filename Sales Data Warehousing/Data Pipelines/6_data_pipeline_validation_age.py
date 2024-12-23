import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[6: DATA VALIDATION - AGE RESTRICT]")

### Loading Validated Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLAB3\parquet\merged_date.parquet")
print("\nSuccessfully Loaded the Data!")

print("\nCreating age during avail..")
df_merged['age_during_avail'] = ((df_merged['avail_date'] - df_merged['birthday']).dt.days / 365.25).astype(np.int64)

### Removing ages too young to avail for services
print("\nSetting age restrictions to different services...")
conditions = (
    (df_merged['service'] == 'Manicure') & (df_merged['age_during_avail'] >= 13) |
    (df_merged['service'] == 'Hair Color') & (df_merged['age_during_avail'] >= 16) |
    (df_merged['service'] == 'FootSpa') & (df_merged['age_during_avail'] >= 8) |
    (df_merged['service'] == 'Rebond') & (df_merged['age_during_avail'] >= 16) |
    (df_merged['service'] == 'Haircut') |
    (df_merged['service'] == 'NailColor') & (df_merged['age_during_avail'] >= 13) |
    (df_merged['service'] == 'Pedicure') & (df_merged['age_during_avail'] >= 13)
)
print("\nRemoving ages too young to avail for services...")
df_merged = df_merged[conditions]


print("Successfully removed!")

### Saving data
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLAB3\parquet\merged_age_restriction.parquet")
print("\nSuccessfully Saved the Data!")