-- 04_create_rfm_segmented.sql
-- Map RFM scores into business-friendly customer segments

CREATE OR REPLACE TABLE `rfm-portfolio-2026.rfm_online_retail.rfm_segmented` AS
SELECT
  customer_id,
  analysis_date,
  recency_days,
  frequency_orders,
  monetary_value,
  r_score,
  f_score,
  m_score,
  rfm_score,

  CASE
    WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
    WHEN r_score >= 4 AND f_score >= 4 THEN 'Loyal Customers'
    WHEN r_score = 5 AND f_score <= 2 THEN 'New Customers'
    WHEN r_score >= 4 AND f_score = 3 THEN 'Potential Loyalists'
    WHEN r_score = 3 AND f_score = 3 THEN 'Need Attention'
    WHEN r_score <= 2 AND f_score >= 4 THEN 'At Risk'
    WHEN r_score <= 2 AND f_score <= 2 THEN 'Hibernating'
    WHEN r_score = 1 AND f_score = 1 THEN 'Lost'
    ELSE 'Others'
  END AS segment
FROM `rfm-portfolio-2026.rfm_online_retail.rfm_scored`;
