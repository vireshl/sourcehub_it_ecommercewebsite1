import streamlit as st
import pandas as pd
import mysql.connector
import plotly.express as px

st.title("E-Commerce Order Management Dashboard")

#Connect to MySQL
def get_connection():
    return mysql.connector.connect(
        host = "localhost",
        user = "root",
        password = "password",
        database = "ecommerce_db"
    )

#Load Data
def load_data():
    conn = get_connection()
    query = """
    SELECT 
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales,
        COUNT(*) AS transactions
    FROM Orders
    GROUP BY year, month
    ORDER BY year, month;
    """

    def_sales = pd.read_sql(query, conn)

    query_status = """
    SELECT status, COUNT(*) AS count FROM Orders GROUP BY status;
    """
    df_status = pd.read_sql(query_status, conn)

    query_top_products = """
    SELECT p.name, SUM(oi.quantity) AS total_sold
    FROM Order_Items oi
    JOIN Products p on oi.product_id = p.product_id
    GROUP BY p.name
    ORDER BY total_sold DESC
    LIMIT 10;
    """

    df_top = pd.read_sql(query_top_products, conn)

    conn.close()
    return def_sales, df_status, df_top

#Fetch Data
df_sales, df_status, df_top = load_data()

#Monthly Sales Line Chart
st.subheader("Monthly Sales Overview")
fig_sales = px.line(df_sales, x = 'month', y = 'total_sales', title = "Monthly Sales", markers = True)
st.plotly_chart(fig_sales)

#Order Status Bar Chart
st.subheader("Order by Status")
fig_status = px.bar(df_status, x = 'status', y = 'count', title = "Order Status Distribution", color = 'status')
st.plotly_chart(fig_status)

#Top Selling Products
st.subheader("Top Selling Products")
fig_top = px.bar(df_top, x = 'name', y = 'total_sold', title = "Top 10 Products", color = 'total_sold')
st.plotly_chart(fig_top)

#To run this program on Terminal write below command 
#streamlit run dashboard/app.py
















