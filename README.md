# RFM Customer Segmentation (SQL + Google BigQuery)

This project builds an end-to-end **RFM (Recency, Frequency, Monetary)** customer segmentation pipeline using **Google BigQuery (Standard SQL)** on retail transaction data.

## BigQuery setup
- **Project**: `rfm-portfolio-2026`
- **Dataset**: `rfm_online_retail`

## Dataset
Online Retail dataset (Kaggle / UCI family).  
The raw data contains invoice-level transactions including customer, date, quantity, and price.

## What I built
1. **Data cleaning & modeling**
   - Standardized data types
   - Created `sales_amount`
   - Flagged cancellations and returns
2. **RFM metrics (customer-level)**
   - Recency (days since last purchase)
   - Frequency (distinct invoices)
   - Monetary (total spend)
3. **RFM scoring**
   - Quantile-based scoring using `NTILE(5)` in BigQuery
   - Created an `rfm_score` (e.g., 555)
4. **Segmentation**
   - Mapped customers into business-friendly segments (Champions, Loyal, At Risk, etc.)

## Tables created in BigQuery
- `raw_online_retail`
- `clean_transactions`
- `rfm_base`
- `rfm_scored`
- `rfm_segmented`

## How to run (in order)
Run scripts in `/sql` in this exact order:
1. `01_create_clean_transactions.sql`
2. `02_create_rfm_base.sql`
3. `03_create_rfm_scored.sql`
4. `04_create_rfm_segmented.sql`

Insight queries:
- `05_segment_overview.sql`
- `06_revenue_share.sql`
- `07_top_customers.sql`
- `08_segment_distribution.sql`

## Key Insights 
- Champions generate the highest revenue despite being a smaller share of customers.
- Loyal Customers show strong repeat buying behavior, creating upsell/cross-sell potential.
- At Risk and Hibernating segments still contribute meaningful revenue, suggesting retention opportunities.

## Tech stack
- Google BigQuery (Standard SQL)
- SQL window functions (`NTILE`)
- GitHub for version control

## Screenshots
Add screenshots in `/assets` (recommended):
- BigQuery tables list
- Segment overview results

