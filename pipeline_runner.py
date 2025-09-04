import schedule
import time
import subprocess

def run_etl():
    print("Running ETL Pipeline...")
    subprocess.run(["python","etl/extract.py"])
    subprocess.run(["python", "etl/transform.py"])
    subprocess.run(["python","etl/load.py"])
    print("ETL pipeline completed")

schedule.every().day.at("10:00").do(run_etl)

print("Scheduler started. Waiting for scheduled time...")

while True:
    schedule.run_pending()
    time.sleep(60)