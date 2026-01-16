## SQL Execution Order

Run the scripts in the following order in Google BigQuery:

1. `01_create_clean_transactions.sql` – Clean and standardize raw retail transactions  
2. `02_create_rfm_base.sql` – Build customer-level RFM metrics  
3. `03_create_rfm_scored.sql` – Assign R, F, M scores using NTILE  
4. `04_create_rfm_segmented.sql` – Map scores to business segments  
5. `05_segment_overview.sql` – Segment performance summary  
6. `06_revenue_share.sql` – Revenue contribution by segment  
7. `07_top_customers.sql` – Identify top-value customers  
8. `08_segment_distribution.sql` – Customer distribution across segments

