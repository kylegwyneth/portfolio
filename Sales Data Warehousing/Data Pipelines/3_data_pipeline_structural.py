import pandas as pd
import numpy as np
from datetime import datetime

current_date = datetime.now()

print("[3: FIXING STRUCTURAL ERRORS]")

### Loading Null Removed Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_null_removed.parquet")
print("\nSuccessfully Loaded the Data!")

### Remove unnecessary symbols from last name and first name
print("\nRemoving unnecessary symbols in names...")
df_merged['last_name'] = df_merged['last_name'].str.replace(',', '')
print("Successfully removed comma from last name!")
df_merged['first_name'] = df_merged['first_name'].str.replace('.', '')
print("Successfully removed dots from first name!")

### Making Both First name and last name upper case
print("\nFixing Capitalization of names...")
df_merged['last_name'] = df_merged['last_name'].str.upper()
df_merged['first_name'] = df_merged['first_name'].str.upper()
print("Successfully fixed!")

### Saving data
df_merged.to_parquet(r"C:\Users\arian\CSELEC1CLab3\parquet\merged_name_clean.parquet")
print("\nSuccessfully Saved the Data!")