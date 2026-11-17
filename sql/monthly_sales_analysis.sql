WITH sales_date AS (
    SELECT LineTotal, TransactionType, ProductType,
    SUBSTR(InvoiceDate, 7, 4) || '-' ||
    SUBSTR(InvoiceDate, 4, 2) || '-' ||
    SUBSTR(InvoiceDate, 1, 2) AS formatted_date
    FROM Online_Retail_Cleaned)
SELECT STRFTIME('%Y-%m',formatted_date) AS months, SUM(LineTotal) as monthly_sales
FROM sales_date 
WHERE TransactionType = 'Regular' AND ProductType = 'Merchandise' 
GROUP BY months
ORDER BY months ASC;
