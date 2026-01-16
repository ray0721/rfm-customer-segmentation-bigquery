-- 02_create_rfm_base.sql
-- Build customer-level RFM metrics from cleaned transactions
-- Dataset: rfm-portfolio-2026.rfm_online_retail

CREATE OR REPLACE TABLE `rfm-portfolio-2026.rfm_online_retail.rfm_base` AS
WITH tx AS (
  SELECT
    customer_id,
    invoice_no,
    invoice_ts,
    sales_amount
  FROM `rfm-portfolio-2026.rfm_online_retail.clean_transactions`
  WHERE is_cancelled = FALSE
    AND is_return = FALSE
    AND quantity > 0
    AND sales_amount > 0
),
params AS (
  SELECT DATE(MAX(invoice_ts)) + 1 AS analysis_date
  FROM tx
)
SELECT
  tx.customer_id,
  params.analysis_date,
  DATE(MAX(tx.invoice_ts)) AS last_purchase_date,
  DATE_DIFF(params.analysis_date, DATE(MAX(tx.invoice_ts)), DAY) AS recency_days,
  COUNT(DISTINCT tx.invoice_no) AS frequency_orders,
  ROUND(SUM(tx.sales_amount), 2) AS monetary_value
FROM tx
CROSS JOIN params
GROUP BY tx.customer_id, params.analysis_date;

