from datetime import datetime
from datetime import timedelta
import pendulum
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
import os
from airflow.configuration import conf
import pandas as pd
import numpy as np
import sqlite3


default_args = {
    'owner': 'user',
    'start_date': datetime.now(),
}


# Define the DAG
dag = DAG(
    'data_pipeline_task',
    default_args=default_args,
    description='Cleaning the Data',
    schedule_interval='@hourly', 
)


# Task 1: Removing Duplicates
def task1_func():

    print("[1: REMOVING DUPLICATES]")
 
    ### Loading Raw data
    df_branch_service = pd.read_json("/opt/airflow/data/branch_service_transaction_info.json")
    df_customer_transaction = pd.read_json("/opt/airflow/data/customer_transaction_info.json")
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
    df_merged.to_parquet("/opt/airflow/parquet/merged_txn_duplicates_removed.parquet")
    print("Successfully Saved the Data!")


task1 = PythonOperator(
    task_id='task1',
    python_callable=task1_func,
    dag=dag,
)



def task2_func():
    current_date = datetime.now()

    print("[2: REMOVING NULL VALUES]")

    ### Loading Duplicates Removed Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_txn_duplicates_removed.parquet")
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
    df_merged.to_parquet("/opt/airflow/parquet/merged_null_removed.parquet")
    print("Successfully Saved the Data!")


task2 = PythonOperator(
    task_id='task2',
    python_callable=task2_func,
    dag=dag,
)



def task3_func():
    current_date = datetime.now()

    print("[3: FIXING STRUCTURAL ERRORS]")

    ### Loading Null Removed Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_null_removed.parquet")
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
    df_merged.to_parquet("/opt/airflow/parquet/merged_name_clean.parquet")
    print("\nSuccessfully Saved the Data!")

task3 = PythonOperator(
    task_id='task3',
    python_callable=task3_func,
    dag=dag,
)



def task4_func():
    current_date = datetime.now()

    print("[4: STANDARDIZING INFORMATION]")

    ### Loading Structual Errors Fixed Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_name_clean.parquet")
    print("\nSuccessfully Loaded the Data!")

    ### Converting Avail Date to Date Time Format
    print("\nConverting avail date to date time format..")
    df_merged['avail_date'] = pd.to_datetime(df_merged['avail_date'])

    ### Converting Birthday to Date Time Format
    print("Converting birthday to date time format..")
    df_merged['birthday'] = pd.to_datetime(df_merged['birthday'])

    print("Successfully converted!")

    ### Saving data
    df_merged.to_parquet("/opt/airflow/parquet/merged_standardized_info.parquet")
    print("\nSuccessfully Saved the Data!")


task4 = PythonOperator(
    task_id='task4',
    python_callable=task4_func,
    dag=dag,
)




def task5_func():
    current_date = datetime.now()

    print("[5: DATA VALIDATION - AVAIL DATES, BRANCHES, BIRTHAYS]")

    ### Loading Cleaned Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_standardized_info.parquet")
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
    df_merged.to_parquet("/opt/airflow/parquet/merged_date.parquet")
    print("\nSuccessfully Saved the Data!")

task5 = PythonOperator(
    task_id='task5',
    python_callable=task5_func,
    dag=dag,
)



def task6_func():
    current_date = datetime.now()

    print("[6: DATA VALIDATION - AGE RESTRICT]")

    ### Loading Validated Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_date.parquet")
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
    df_merged.to_parquet("/opt/airflow/parquet/merged_age_restriction.parquet")
    print("\nSuccessfully Saved the Data!")

task6 = PythonOperator(
    task_id='task6',
    python_callable=task6_func,
    dag=dag,
)



def task7_func():
    current_date = datetime.now()

    print("[7: Ingest the data into a database]")

    ### Loading Validated Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_age_restriction.parquet")
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

task7 = PythonOperator(
    task_id='task7',
    python_callable=task7_func,
    dag=dag,
)



def task8_func():
    current_date = datetime.now()

    print("[8: WEEKLY SALES VIEW PER SERVICE]")

    ### Loading Validated Data
    df_merged = pd.read_parquet("/opt/airflow/parquet/merged_age_restriction.parquet")

    print("\nSuccessfully Loaded the Data!")

    ### Weekly Sales Per Branch
    print("\nGenerating Weekly Sales Per Service...")
    df_merged['avail_date'] = pd.to_datetime(df_merged['avail_date']) 
    df_merged.groupby(['service',df_merged['avail_date'].dt.to_period('W')])['price'].sum().to_frame()

    ### Saving data
    df_merged.to_parquet("/opt/airflow/parquet/merged_weekly_per_service.parquet")
    print("\nSuccessfully Saved the Data!")


task8 = PythonOperator(
    task_id='task8',
    python_callable=task8_func,
    dag=dag,
)


# Set up task dependencies
task1 >> task2
task2 >> task3
task3 >> task4
task4 >> task5
task5 >> task6
task6 >> task7
task7 >> task8