-- 08_segment_distribution.sql
SELECT
  segment,
  COUNT(*) AS customers,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_customers
FROM `rfm-portfolio-2026.rfm_online_retail.rfm_segmented`
GROUP BY segment
ORDER BY customers DESC;
