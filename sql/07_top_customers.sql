-- 07_top_customers.sql
SELECT
  customer_id,
  segment,
  monetary_value,
  frequency_orders,
  recency_days,
  rfm_score
FROM `rfm-portfolio-2026.rfm_online_retail.rfm_segmented`
ORDER BY monetary_value DESC
LIMIT 50;
