import pandas as pd
import numpy as np
import sqlite3
from datetime import datetime

current_date = datetime.now()


print("[7: Ingest the data into a database]")

### Loading Validated Data
df_merged = pd.read_parquet(r"C:\Users\arian\CSELEC1CLAB3\parquet\merged_age_restriction.parquet")
print("\nSuccessfully Loaded the Data!")

### Ingesting the data into a database
print("\nIngesting the data into a database")

print("\nEstablishing Connection...")
db_connection = sqlite3.connect('clean_data.db')
cursor = db_connection.cursor()
df_merged.to_sql('clean_data', db_connection, index=False, if_exists='replace')

# Commit changes and close the connection
db_connection.commit()

print("\nSuccessfully saved to database!")

db_connection.close()

print("\nClosing Connection...")