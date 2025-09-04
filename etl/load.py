import pandas as pd
import os

def load_to_csv(df):
    base_dir = os.path.dirname(os.path.abspath(__file__))
    reports_dir = os.path.join(base_dir, "..","reports")
    os.makedirs(reports_dir, exist_ok = True)

    file_path  = os.path.join(reports_dir, "monthly_sales.csv")
    df.to_csv(file_path , index = False)

if __name__ == "__main__":
    from extract import extract_data
    from transform import transform_data

    df_raw = extract_data()
    df_transformed = transform_data(df_raw)
    load_to_csv(df_transformed)