WITH NullDescription AS (
SELECT *, NULLIF(TRIM(Description),'') AS trimmed_description
FROM Online_Retail_Cleaned orc)
SELECT trimmed_description, SUM(Quantity) AS total_quantities_sold, SUM(LineTotal) AS total_sales
FROM NullDescription 
WHERE TransactionType = 'Regular' AND ProductType = 'Merchandise' AND trimmed_description IS NOT NULL
GROUP BY trimmed_description 
ORDER BY total_quantities_sold DESC
LIMIT 10;