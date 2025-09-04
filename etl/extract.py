import pymysql
import pandas as pd

def extract_data():
    #Connect to MySQL
    conn = pymysql.connect(
        host = 'localhost',
        user = 'root',
        password = 'password',
        database = 'ecommerce_db'
    )

    #Query to get completed payments
    query = """
    SELECT 
        YEAR(payment_date) AS sales_year,
        MONTH(payment_date) AS sales_month,
        amount,
        payment_method
    FROM Payments
    WHERE payment_status = 'Completed';
    """
    df = pd.read_sql(query, conn)
    conn.close()
    return df

if __name__ == "__main__":
    df = extract_data()
    print(df.head())
