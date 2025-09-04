#  E-commerce Order Management - Data Engineering Project

This project demonstrates a complete **ETL pipeline and dashboard** for an e-commerce order management system using MySQL, Python, and Streamlit. It simulates real-world data engineering tasks like data extraction, transformation, loading, and reporting via a user-friendly dashboard.

---

##  Project Features

- 💾 **ETL Pipeline**
  - Extracts data from MySQL database
  - Transforms sales and order data for analysis
  - Loads the result to a CSV report

- 📊 **Streamlit Dashboard**
  - Monthly sales summary
  - Order status distribution
  - Top selling products
  - Total number of customers

- 🛠️ **Modular ETL design**
  - Separate `extract.py`, `transform.py`, and `load.py` files for reusability

---

##  Tech Stack

- **Database:** MySQL  
- **Language:** Python  
- **Libraries:**  
  - `pandas`, `mysql-connector-python`  
  - `streamlit`, `schedule`, `datetime`  
- **Visualization:** Streamlit

---

## 📁 Folder Structure

Ecommerce_Order_Management/ ├── etl/ │ ├── extract.py │ ├── transform.py │ └── load.py 

├── reports/ │ └── monthly_sales.csv 

├── dashboard/ │ └── streamlit_dashboard.py 

├── pipeline_runner.py 

├── README.md 

└── requirements.txt


##  How to Run

###  1. Clone the repo

git clone https://github.com/your-username/ecommerce-order-management.git
cd ecommerce-order-management

---



##  2. Set up virtual environment  
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate


---



*** Configure MySQL ***
Create the MySQL database and tables. Load sample data provided in the project.

*** Run the ETL Pipeline ***

python pipeline_runner.py

***  Launch the Dashboard***

streamlit run dashboard/streamlit_dashboard.py

 ## Author
 
Tilottama Shinde

Data Engineering Enthusiast 
