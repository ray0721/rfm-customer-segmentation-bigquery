-- 01_create_clean_transactions.sql
-- Purpose: Clean raw Online Retail transactions for RFM analysis

CREATE OR REPLACE TABLE `rfm-portfolio-2026.rfm_online_retail.clean_transactions` AS
SELECT
  CAST(Invoice AS STRING) AS invoice_no,
  CAST(StockCode AS STRING) AS stock_code,
  Description AS description,
  CAST(Quantity AS INT64) AS quantity,
  TIMESTAMP(InvoiceDate) AS invoice_ts,
  SAFE_CAST(UnitPrice AS NUMERIC) AS unit_price,
  CAST(CustomerID AS STRING) AS customer_id,
  Country AS country,
  SAFE_CAST(Quantity AS NUMERIC) * SAFE_CAST(UnitPrice AS NUMERIC) AS sales_amount,
  STARTS_WITH(CAST(Invoice AS STRING), 'C') AS is_cancelled
FROM `rfm-portfolio-2026.rfm_online_retail.raw_online_retail`
WHERE CustomerID IS NOT NULL
  AND SAFE_CAST(UnitPrice AS NUMERIC) > 0
  AND SAFE_CAST(Quantity AS INT64) > 0;
