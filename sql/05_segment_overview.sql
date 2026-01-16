-- 05_segment_overview.sql
SELECT
  segment,
  COUNT(*) AS customers,
  ROUND(SUM(monetary_value), 2) AS revenue,
  ROUND(AVG(monetary_value), 2) AS avg_customer_value,
  ROUND(AVG(recency_days), 1) AS avg_recency_days,
  ROUND(AVG(frequency_orders), 2) AS avg_orders
FROM `rfm-portfolio-2026.rfm_online_retail.rfm_segmented`
GROUP BY segment
ORDER BY revenue DESC;
