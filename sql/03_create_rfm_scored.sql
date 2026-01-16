-- 03_create_rfm_scored.sql
-- Score R, F, M into 1–5 using NTILE and create an RFM code

CREATE OR REPLACE TABLE `rfm-portfolio-2026.rfm_online_retail.rfm_scored` AS
WITH scored AS (
  SELECT
    customer_id,
    analysis_date,
    recency_days,
    frequency_orders,
    monetary_value,

    -- Recency: lower is better (invert after tiling)
    NTILE(5) OVER (ORDER BY recency_days DESC) AS r_tile,

    -- Frequency & Monetary: higher is better
    NTILE(5) OVER (ORDER BY frequency_orders) AS f_score,
    NTILE(5) OVER (ORDER BY monetary_value) AS m_score
  FROM `rfm-portfolio-2026.rfm_online_retail.rfm_base`
)
SELECT
  customer_id,
  analysis_date,
  recency_days,
  frequency_orders,
  monetary_value,
  (6 - r_tile) AS r_score,
  f_score,
  m_score,
  CONCAT(CAST((6 - r_tile) AS STRING), CAST(f_score AS STRING), CAST(m_score AS STRING)) AS rfm_score
FROM scored;
