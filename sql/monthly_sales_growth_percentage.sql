WITH sales_date AS (
    SELECT *,
    SUBSTR(InvoiceDate, 7, 4) || '-' ||
    SUBSTR(InvoiceDate, 4, 2) || '-' ||
    SUBSTR(InvoiceDate, 1, 2) AS formatted_date
    FROM Online_Retail_Cleaned), sales_month AS (SELECT STRFTIME('%Y-%m',formatted_date) AS months, 
	SUM(LineTotal) as monthly_sales
	FROM sales_date
	WHERE TransactionType = 'Regular' AND ProductType = 'Merchandise' 
	GROUP BY months
	), previous_month AS (
	SELECT	
	months, monthly_sales ,LAG(monthly_sales) OVER (ORDER BY months) AS previous_month_sales
	FROM sales_month) 
SELECT *, 
CASE WHEN previous_month_sales IS NULL THEN NULL
ELSE ROUND(((monthly_sales - previous_month_sales)/previous_month_sales)*100.0,2) END AS growth_percentage
FROM previous_month 
ORDER BY months ASC;
