DELIMITER $$

CREATE PROCEDURE generate_monthly_sales()
BEGIN
	SELECT 
		YEAR(payment_date) AS sales_year,
        MONTH(payment_date) AS sales_month,
        SUM(amount) AS total_sales,
        COUNT(*) AS number_of_transactions
	FROM Payments
    WHERE payment_status = 'Completed'
    GROUP BY YEAR(payment_date), MONTH(payment_date)
    ORDER BY sales_year DESC, sales_month DESC;
END $$

DELIMITER ;