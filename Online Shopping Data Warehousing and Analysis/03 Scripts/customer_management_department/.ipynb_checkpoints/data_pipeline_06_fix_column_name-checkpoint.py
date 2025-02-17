import pandas as pd
import numpy as np

#load data
df_merged_data=pd.read_parquet("uppercased_info.parquet")
print("Successfully loaded data")

#renaming columns
df_merged_data = df_merged_data.rename(columns={'name':'user_name', 'gender':'user_gender', 'country':'user_addr_country','birthdate':'user_birthdate', 'street':'user_addr_street', 'state':'user_addr_state','city':'user_addr_city','credit_card_number':'user_cc_no', 'issuing_bank':'user_issuing_bank', 'creation_date':'user_creation_date', 'device_address':'user_device_addr', 'job_title':'user_job_title', 'job_level':'user_job_lvl'})

# Uppercase all columns
df_merged_data.columns = df_merged_data.columns.str.upper()
print("Successfully fixed column names")
print(df_merged_data.head())

#save data
df_merged_data.to_parquet("fixed_column_name.parquet")
print("Successfully saved data")