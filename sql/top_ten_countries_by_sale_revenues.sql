SELECT Country, COUNT(DISTINCT InvoiceNo) AS total_invoices, SUM(LineTotal) AS total_sales
FROM Online_Retail_Cleaned orc
WHERE TransactionType = 'Regular' AND ProductType ='Merchandise'
GROUP BY Country
ORDER BY total_sales DESC
Limit 10;