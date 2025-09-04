import pandas as pd

def transform_data(df):
    result = df.groupby(['sales_year', 'sales_month']).agg({
        'amount':'sum',
        'payment_method': 'count'
    }).reset_index()

    result.rename(columns ={
        'amount': 'total_sales',
        'payment_method':'number_of_transactions'
    }, inplace = True)

    return result

if __name__ == "__main__":
    from extract import extract_data
    df_raw = extract_data()
    df_transformed = transform_data(df_raw)
    print(df_transformed)