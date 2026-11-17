WITH NullCustomerID AS (
SELECT *,
NULLIF(TRIM(CustomerID),'') AS trimmed_customerid
FROM Online_Retail_Cleaned)
SELECT Distinct trimmed_customerid as unique_customerid, COUNT(InvoiceNo) AS total_invoice, sum(LineTotal) AS total_spent
FROM NullCustomerID
WHERE trimmed_customerid is not NULL AND TransactionType = 'Regular' AND ProductType = 'Merchandise'
GROUP BY trimmed_customerid  
ORDER BY total_spent DESC
LIMIT 10;