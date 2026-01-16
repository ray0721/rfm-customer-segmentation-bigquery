-- Create RFM base table per customer
-- Calculates Recency (days), Frequency (orders), Monetary value (total spend)

CREATE OR REPLACE TABLE `rfm-portfolio-2026.rfm_online_retail.rfm_base` AS
WITH customer_orders AS (
  SELECT
    CustomerID,
    InvoiceNo,
    InvoiceDate,
    Quantity * UnitPrice AS order_value
  FROM `rfm-portfolio-2026.rfm_online_retail.clean_transactions`
  WHERE CustomerID IS NOT NULL
),
order_level AS (
  SELECT
    CustomerID,
    InvoiceNo,
    MAX(InvoiceDate) AS order_date,
    SUM(order_value) AS order_revenue
  FROM customer_orders
  GROUP BY CustomerID, InvoiceNo
),
rfm_metrics AS (
  SELECT
    CustomerID,
    DATE_DIFF(
      (SELECT MAX(order_date) FROM order_level),
      MAX(order_date),
      DAY
    ) AS recency_days,
    COUNT(DISTINCT InvoiceNo) AS frequency_orders,
    ROUND(SUM(order_revenue), 2) AS monetary_value
  FROM order_level
  GROUP BY CustomerID
)

SELECT * FROM rfm_metrics;
