-- 06_revenue_share.sql
WITH totals AS (
  SELECT SUM(monetary_value) AS total_revenue
  FROM `rfm-portfolio-2026.rfm_online_retail.rfm_segmented`
)
SELECT
  segment,
  ROUND(SUM(monetary_value), 2) AS revenue,
  ROUND(100 * SUM(monetary_value) / (SELECT total_revenue FROM totals), 2) AS pct_revenue
FROM `rfm-portfolio-2026.rfm_online_retail.rfm_segmented`
GROUP BY segment
ORDER BY revenue DESC;
